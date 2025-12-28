using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Booth_Pramukh_List : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                bind_date();
            }
        }
        catch (Exception)
        {

            throw;
        }
    }


    public void bind_date()
    {
        try
        {
            if (Request.QueryString["w"] != null)
            {
                DataSet ds = BAL_Report.dis_ward_wise_booth_pramukh(Request.QueryString["w"].ToString());
                if (ds.Tables.Count > 0)
                {
                    list_booth_pramukh.DataSource = ds.Tables[0];
                    list_booth_pramukh.DataBind();
                }
            }

        }
        catch (Exception)
        {

            throw;
        }
    }

    protected void btn_export_Click(object sender, EventArgs e)
    {

    }

    public string get_photo_url(string photo_name)
    {
        string url = "";

        url = "http://mumbai" + Request.QueryString["w"].ToString() + ".mhbjplok.com/img/admin/" + photo_name;

        return url;
    }
}