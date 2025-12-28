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
        Response.Clear();
        Response.Buffer = true;
        Response.AddHeader("content-disposition", "attachment;filename=UserSummary.xls");
        Response.Charset = "";
        Response.ContentType = "application/vnd.ms-excel";

        grid_user_summary.AllowPaging = false;

        bind_data(); // ✅ MUST CALL AGAIN

        using (System.IO.StringWriter sw = new System.IO.StringWriter())
        {
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            grid_user_summary.RenderControl(hw);
            Response.Output.Write(sw.ToString());
        }

        Response.Flush();
        Response.End();
    }

    public override void VerifyRenderingInServerForm(Control control)
    {
        // required
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