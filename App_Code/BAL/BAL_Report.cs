using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for BAL_Emp
/// </summary>
public class BAL_Report
{
    public BAL_Report()
    {
        //
        // TODO: Add constructor logic here
        //
    }


    public static DataSet dis_user_summary(string ward_no)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "dis_user_summary_sp";
        parameter param = new parameter();
        cmd.Parameters.Add(param.intparam("@ward_no", ward_no));
        return command.ExtQueryDS(cmd);
    }

    public static DataSet dis_admin_dash()
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "dis_admin_dash_sp";
        return command.ExtQueryDS(cmd);
    }

    public static DataSet dis_zone_wise_user_summany()
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "dis_zone_wise_user_summany_sp";
        return command.ExtQueryDS(cmd);
    }


    public static DataSet dis_survey_report()
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "dis_survey_report_sp";
        return command.ExtQueryDS(cmd);
    }

    public static DataSet booth_pramukh_creation_summary()
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "booth_pramukh_creation_summary_sp";
        return command.ExtQueryDS(cmd);
    }

    public static DataSet dis_ward_wise_booth_pramukh(string ward_no)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "dis_ward_wise_booth_pramukh_sp";
        parameter param = new parameter();
        cmd.Parameters.Add(param.intparam("@ward_no", ward_no));
        return command.ExtQueryDS(cmd);
    }
}

