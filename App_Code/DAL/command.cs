using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

using System.Web;

/// <summary>
/// Summary description for command
/// </summary>
public class command
{
	public command()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public static int ExtQuery(SqlCommand cmd)
    {
        try
        {
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = connection.open_connection();
            return cmd.ExecuteNonQuery();
        }
        finally
        {
            connection.close_connection();

        }
    }
    
    public static DataTable ExtQueryDT(SqlCommand cmd)
    {
        try
        {
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = connection.open_connection();

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }
        finally
        {
            connection.close_connection();
        }
    }

    public static DataSet ExtQueryDS(SqlCommand cmd)
    {
        try
        {
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = connection.open_connection();
            
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds;
        }
        finally
        {
            connection.close_connection();
        }
    }
}