using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Survey_Summary_Chart : System.Web.UI.Page
{
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
            DataSet ds = BAL_Report.dis_survey_report();
            if (ds.Tables.Count > 0)
            {
                rptWards.DataSource = ds.Tables[0];
                rptWards.DataBind();
            }
        }
        catch (Exception)
        {

            throw;
        }
    }
}