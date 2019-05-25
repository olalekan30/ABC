using Microsoft.VisualBasic;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.IO;
using System.Xml;
using System.Text;
using System.Security.Cryptography;
using System.Data.SqlClient;
using System.Globalization;
using System.Threading;
using System.Configuration;

/// <summary>
/// Summary description for smartcon
/// </summary>
public class smartcon
{
    public static string connstrSql = ConfigurationManager.AppSettings["IIPLReports"];
        public string constsql2 = ConfigurationManager.AppSettings["AutoEnhancerConnectionString2"].ToString();
    public DataSet ds;
     public DataSet ds2;
    private static SqlConnection theCons2 = new SqlConnection();
    SqlCommand cmd;
    SqlDataReader reader1;
    public SqlDataReader reader;
	public smartcon()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    //public string Getconn(string SqlString)
    //{




    //    return ds2;
    //}
    public void insertError(string msg)
    {
        string ErrorLog, filename;
        StreamWriter strWriterlog;
        ErrorLog = ConfigurationManager.AppSettings["ErrorLog"];
        if (!System.IO.Directory.Exists(ErrorLog))
        {
            System.IO.Directory.CreateDirectory(ErrorLog);
        }

        filename = "Log" + DateTime.Now.ToString("ddMMyyyy") + ".err";
        filename = string.Concat(ErrorLog, "\\", filename);
        strWriterlog = new StreamWriter(filename, true);
        strWriterlog.WriteLine(msg + "   " + DateTime.Now.ToString("dd/MM/yyyy hh:mm:ss tt"));
        strWriterlog.Close();

    }
    public DataSet SqlDs(string SqlString, int conid)
    {
        if (conid == 1)
        {
            //Sybase()
            using (SqlConnection theCons2 = new SqlConnection(connstrSql))
            {
                theCons2.Open();
                //Dim tran As SqlTransaction = theCons.BeginTransaction
                //Try
                cmd = new SqlCommand(SqlString, theCons2);
                reader1 = cmd.ExecuteReader();
                ds2 = new DataSet();
                ds2.Load(reader1, LoadOption.OverwriteChanges, "Result");
                //'tran.Commit()        
                reader1.Close();
                theCons2.Close();
                //Catch ex As SqlException

                //End Try
                return ds2;
            }
        }
        else
        {
            using (SqlConnection theCons2 = new SqlConnection(constsql2))
            {
                theCons2.Open();
                //Dim tran As SqlTransaction = theCons.BeginTransaction
                //Try
                cmd = new SqlCommand(SqlString, theCons2);
                reader1 = cmd.ExecuteReader();
                ds2 = new DataSet();
                ds2.Load(reader1, LoadOption.OverwriteChanges, "Result");
                //'tran.Commit()        
                reader1.Close();
                theCons2.Close();
                //Catch ex As SqlException

                //End Try
                return ds2;
            }
        }

    }
    
}