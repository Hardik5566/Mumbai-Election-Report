using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;

public partial class Zone_Wise_User_Summary : System.Web.UI.Page
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
            DataSet ds = BAL_Report.dis_zone_wise_user_summany();
            if (ds.Tables.Count > 0)
            {
                grid_user_summary.DataSource = ds.Tables[0];
                grid_user_summary.DataBind();
            }
        }
        catch (Exception)
        {

            throw;
        }
    }

    protected void btn_export_Click(object sender, EventArgs e)
    {
        Response.Clear();
        Response.Buffer = true;
        Response.AddHeader("content-disposition", "attachment;filename=UserSummary.xls");
        Response.Charset = "";
        Response.ContentType = "application/vnd.ms-excel";

        System.IO.StringWriter sw = new System.IO.StringWriter();
        HtmlTextWriter hw = new HtmlTextWriter(sw);

        // Apply style to GridView
        grid_user_summary.HeaderRow.Style.Add("background-color", "#f2f2f2");
        foreach (TableCell cell in grid_user_summary.HeaderRow.Cells)
        {
            cell.Style["background-color"] = "#4CAF50";
            cell.Style["color"] = "white";
        }

        foreach (GridViewRow row in grid_user_summary.Rows)
        {
            row.BackColor = System.Drawing.Color.White;
            foreach (TableCell cell in row.Cells)
            {
                if (row.RowIndex % 2 == 0)
                {
                    cell.Style["background-color"] = "#C2D69B"; // Alternate row color
                }
                else
                {
                    cell.Style["background-color"] = "#E2EFDA";
                }
            }
        }

        grid_user_summary.RenderControl(hw);

        Response.Output.Write(sw.ToString());
        Response.Flush();
        Response.End();
    }

    // Required override to allow rendering
    public override void VerifyRenderingInServerForm(Control control)
    {
        // Confirms that an HtmlForm control is rendered for the GridView
    }




}