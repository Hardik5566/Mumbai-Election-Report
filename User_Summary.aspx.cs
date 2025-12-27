using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using ClosedXML.Excel;

public partial class User_Summary : System.Web.UI.Page
{
    public enum MessageType { Success, Error, Info, Warning };
    protected void ShowMessage(string Message, MessageType type)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "ShowMessage('" + Message + "','" + type + "');", true);
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                ViewState["SortDirection"] = "ASC";
                bind_data();
            }
        }
        catch (Exception)
        {

            throw;
        }
    }



    public void bind_data()
    {
        try
        {
            DataSet ds = BAL_Report.dis_user_summary("0");
            if (ds.Tables.Count == 0) return;
            ViewState["data"] = ds.Tables[0];

            DataTable dt = ds.Tables[0];
            if (!string.IsNullOrWhiteSpace(ddl_district.SelectedValue))
            {
                var wardList = ddl_district.SelectedValue
                    .Split(',')
                    .Select(x => int.Parse(x.Trim()))
                    .ToList();

                var rows = dt.AsEnumerable()
                             .Where(r => wardList.Contains(r.Field<int>("ward_no")));

                dt = rows.Any() ? rows.CopyToDataTable() : dt.Clone();
            }
            grid_user_summary.DataSource = dt;
            grid_user_summary.DataBind();
            ViewState["filtered_data"] = dt;

        }
        catch (Exception)
        {

            throw;
        }
    }


    protected void grid_user_summary_Sorting(object sender, GridViewSortEventArgs e)
    {
        string sortDirection = ViewState["SortDirection"] as string == "ASC" ? "DESC" : "ASC";
        ViewState["SortDirection"] = sortDirection;
        ViewState["SortExpression"] = e.SortExpression;

        BindGrid(e.SortExpression, sortDirection);
    }

    private void BindGrid(string sortExpression = "", string sortDirection = "ASC")
    {
        DataTable dt = (DataTable)ViewState["data"];

        if (!string.IsNullOrEmpty(sortExpression))
        {
            dt.DefaultView.Sort = sortExpression + " " + sortDirection;
            dt = dt.DefaultView.ToTable();
        }

        grid_user_summary.DataSource = dt;
        grid_user_summary.DataBind();
    }
    protected void btn_export_Click(object sender, EventArgs e)
    {
        if (ViewState["filtered_data"] != null)
        {
            DataTable dt = ViewState["filtered_data"] as DataTable;

            if (dt != null && dt.Rows.Count > 0)
            {
                DataTable exportDt = new DataTable();
                exportDt.Columns.Add("Ward", typeof(string));
                exportDt.Columns.Add("Total User", typeof(int));
                exportDt.Columns.Add("Active User", typeof(int));
                exportDt.Columns.Add("Inactive User", typeof(int));
                exportDt.Columns.Add("Admin", typeof(int));
                exportDt.Columns.Add("Sub Admin", typeof(int));
                exportDt.Columns.Add("Sakti", typeof(int));
                exportDt.Columns.Add("Booth Pramukh", typeof(int));
                exportDt.Columns.Add("Sah Sakti", typeof(int));
                exportDt.Columns.Add("Sah Booth Pramukh", typeof(int));
                exportDt.Columns.Add("Karykarta", typeof(int));
                exportDt.Columns.Add("Phonebook User", typeof(int));
                exportDt.Columns.Add("Phonebook Voter", typeof(int));
                foreach (DataRow row in dt.Rows)
                {
                    exportDt.Rows.Add(
                        row["ward_no"], row["total_user"], row["total_active_user"], row["total_inactive_user"], row["admin"], row["sub_admin"], row["sakti"], row["booth_pramukh"], row["sah_sakti"], row["sah_booth_pramukh"], row["karykarta"], row["phonebook_match_user"], row["phonebook_match_voter"]
                    );
                }
                DataRow totalRow = exportDt.NewRow();
                totalRow["Ward"] = "Total";

                foreach (DataColumn col in exportDt.Columns)
                {
                    if (col.ColumnName != "Ward")
                    {
                        int sum = 0;
                        foreach (DataRow row in exportDt.Rows)
                        {
                            if (row[col] != DBNull.Value)
                                sum += Convert.ToInt32(row[col]);
                        }
                        totalRow[col] = sum;
                    }
                }
                exportDt.Rows.Add(totalRow);

                using (var wb = new ClosedXML.Excel.XLWorkbook())
                {
                    var ws = wb.Worksheets.Add("FilteredData");
                    int currentCol = 1;
                    foreach (DataColumn col in exportDt.Columns)
                    {
                        var headerCell = ws.Cell(1, currentCol);
                        headerCell.Value = col.ColumnName;
                        headerCell.Style.Font.Bold = true;
                        headerCell.Style.Font.FontColor = XLColor.Black;
                        headerCell.Style.Fill.BackgroundColor = XLColor.White;
                        headerCell.Style.Alignment.Horizontal = XLAlignmentHorizontalValues.Center;
                        headerCell.Style.Alignment.Vertical = XLAlignmentVerticalValues.Center;
                        headerCell.Style.Border.OutsideBorder = XLBorderStyleValues.Thin;
                        if (col.ColumnName == "Active User")
                        {
                            headerCell.Style.Font.FontColor = XLColor.White;
                            headerCell.Style.Fill.BackgroundColor = XLColor.FromHtml("#3cae4d"); // green
                        }
                        else if (col.ColumnName == "Inactive User")
                        {
                            headerCell.Style.Font.FontColor = XLColor.White;
                            headerCell.Style.Fill.BackgroundColor = XLColor.FromHtml("#f11702"); // red
                        }
                        else if (col.ColumnName == "Phonebook User" || col.ColumnName == "Phonebook Voter")
                        {
                            headerCell.Style.Font.FontColor = XLColor.White;
                            headerCell.Style.Fill.BackgroundColor = XLColor.FromHtml("#4f74c5"); // blue
                        }
                        else
                            headerCell.Style.Fill.BackgroundColor = XLColor.FromHtml("#eeeeee");

                        currentCol++;
                    }
                    int currentRow = 2;
                    foreach (DataRow row in exportDt.Rows)
                    {
                        currentCol = 1;
                        foreach (DataColumn col in exportDt.Columns)
                        {
                            var cell = ws.Cell(currentRow, currentCol);
                            cell.Value = row[col.ColumnName];
                            cell.Style.Font.FontName = "Calibri";
                            cell.Style.Font.FontSize = 11;
                            cell.Style.Alignment.Horizontal = XLAlignmentHorizontalValues.Center;
                            cell.Style.Alignment.Vertical = XLAlignmentVerticalValues.Center;
                            cell.Style.Border.OutsideBorder = XLBorderStyleValues.Thin;
                            if (row["Ward"].ToString() == "Total")
                            {
                                cell.Style.Fill.BackgroundColor = XLColor.Black;
                                cell.Style.Font.FontColor = XLColor.White;
                                cell.Style.Font.Bold = true;
                            }
                            else if (col.ColumnName == "Active User")
                                cell.Style.Fill.BackgroundColor = XLColor.FromHtml("#e3efda");
                            else if (col.ColumnName == "Inactive User")
                                cell.Style.Fill.BackgroundColor = XLColor.FromHtml("#f9e4d6");
                            else if (col.ColumnName == "Phonebook User" || col.ColumnName == "Phonebook Voter")
                                cell.Style.Fill.BackgroundColor = XLColor.FromHtml("#dfebf7");
                            else
                                cell.Style.Fill.BackgroundColor = XLColor.White;

                            currentCol++;
                        }
                        currentRow++;
                    }
                    ws.Columns().AdjustToContents();
                    foreach (var col in ws.Columns())
                    {
                        if (col.Width < 10)
                            col.Width = 10;
                    }
                    ws.Range(1, 1, 1, exportDt.Columns.Count).SetAutoFilter();
                    Response.Clear();
                    Response.Buffer = true;
                    string date = DateTime.UtcNow.ToString("yyyyMMdd_HHmm");
                    Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                    Response.AddHeader("content-disposition", "attachment;filename=Report_" + date + ".xlsx");
                    using (var ms = new System.IO.MemoryStream())
                    {
                        wb.SaveAs(ms);
                        ms.WriteTo(Response.OutputStream);
                    }
                    Response.Flush();
                    HttpContext.Current.ApplicationInstance.CompleteRequest();
                }
            }
        }


    }

    protected void ddl_district_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataTable dt = ViewState["data"] as DataTable;
        if (dt != null)
        {
            DataTable filteredDt;
            if (!string.IsNullOrWhiteSpace(ddl_district.SelectedValue))
            {
                List<int> wardList = ddl_district.SelectedValue
                    .Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries)
                    .Select(x => int.Parse(x.Trim()))
                    .ToList();
                var filteredRows = dt.AsEnumerable()
                                                   .Where(row => wardList.Contains(row.Field<int>("ward_no")));
                filteredDt = filteredRows.Any()
                                   ? filteredRows.CopyToDataTable()
                                   : dt.Clone();
            }
            else
            {
                filteredDt = dt.Copy();
            }
            grid_user_summary.DataSource = filteredDt;
            grid_user_summary.DataBind();
            ViewState["filtered_data"] = filteredDt;
        }
    }
}