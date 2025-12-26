using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;

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
            if (ds.Tables.Count > 0)
            {
                grid_user_summary.DataSource = ds.Tables[0];
                grid_user_summary.DataBind();
                ViewState["data"] = ds.Tables[0];
            }
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
        DataTable dt = (DataTable)ViewState["data"]; // from sp_get_user_summary

        if (!string.IsNullOrEmpty(sortExpression))
        {
            dt.DefaultView.Sort = sortExpression + " " + sortDirection;
            dt = dt.DefaultView.ToTable();
        }

        grid_user_summary.DataSource = dt;
        grid_user_summary.DataBind();
    }

}