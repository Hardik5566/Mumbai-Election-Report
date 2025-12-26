using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;

using System.Web;

/// <summary>
/// Summary description for connection
/// </summary>

public class connection
{
	public connection()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public static SqlConnection open_connection()
    {
        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["myConnectionString"].ToString());
        cn.Open();
        return cn;
    }

  
    public static void close_connection()
    {
        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["myConnectionString"].ToString());
        cn.Close();
        cn.Dispose();

    }
}