using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;
using CrystalDecisions.CrystalReports.Engine;
using System.IO;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using CrystalDecisions.Shared;
using System.Globalization;
using System.Web.Profile;


public partial class ServiceReports_JobEstRpt : System.Web.UI.Page
{
    smartcon con = new smartcon();
    SqlDataAdapter da = new SqlDataAdapter();
    DataSet ds = new DataSet();
    DataSet dssub = new DataSet();
    DataSet dsText = new DataSet();
    SqlCommand com = new SqlCommand();
    SqlCommand comsub = new SqlCommand();
    DataTable dt = new DataTable();
    string strCon = ConfigurationManager.AppSettings["AutoEnhancerConnectionString"].ToString();
    ConnectionInfo crConnectionInfo = new ConnectionInfo();
    ReportDocument rd = new ReportDocument();
    SqlDataAdapter adp = new SqlDataAdapter();
    SqlDataAdapter adpsub = new SqlDataAdapter();
    smartcon Con = new smartcon();
    string exittype, BranchNames, qry, qry1, qry2;
    string ESTIMATEID;
    string pin, strUid, strPwd, strServer, strDatabase, Qtrmonth;
    string filepath;
    System.IO.Stream oStream = null;
    byte[] byteArray = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
        BindReport();
        }
    }

    private void BindReport()
    {
        try
        {
            ESTIMATEID = Convert.ToString(Session["ESTIMATEID"]);
            
            BranchNames = Session["BranchNames"].ToString();
            switch (BranchNames)
            {
                case "KP1":
                    if (Session["COMEST"].ToString() != "")
                    {
                        rd.Load(this.Page.MapPath("JobEstimateRpComEst.rpt"));
                        break;
                    }
                    else
                    {

                        rd.Load(this.Page.MapPath("JobEstimateRpt.rpt"));
                        break;
                    }                  
                case "KP2":
                    rd.Load(this.Page.MapPath("JobEstimateRptVI.rpt"));
                    break;
                case "Abuja":
                    if (Session["COMEST"].ToString() != "")
                    {
                        rd.Load(this.Page.MapPath("JobEstimateRptAbjComEst.rpt"));
                        break;
                    }
                    else
                    {
                        rd.Load(this.Page.MapPath("JobEstimateRptAbj.rpt"));
                        break;
                    }
                case "PHC":
                    rd.Load(this.Page.MapPath("JobEstimateRptPHC.rpt"));
                    break;
                case "Kano":
                    rd.Load(this.Page.MapPath("JobEstimateRptKano.rpt"));
                    break;
            }
            strUid = Session["strUid"].ToString();
            strPwd = Session["strPwd"].ToString();
            strServer = Session["strServer"].ToString();
            strDatabase = Session["strDatabase"].ToString();
            rd.DataSourceConnections[0].IntegratedSecurity = false;
            rd.DataSourceConnections[0].SetConnection(strServer, strDatabase, strUid, strPwd);
            rd.SetDataSource(ds);
            rd.SetParameterValue("@ESTIMATEID", ESTIMATEID);
            qry1 = "execute PROC_GETPARTSDETAILS2 '" + ESTIMATEID + "'";
            con.SqlDs(qry1, 2);
            qry2 = "execute PROC_GETLABOURDETAILS2 '" + ESTIMATEID + "'";
            con.SqlDs(qry2, 2);

            CrystalReportViewer1.ReportSource = rd;
            oStream = (System.IO.Stream)rd.ExportToStream(ExportFormatType.PortableDocFormat);
            byteArray = new byte[oStream.Length];
            oStream.Read(byteArray, 0, Convert.ToInt32(oStream.Length - 1));
            Response.ClearContent();
            Response.ClearHeaders();
            Response.ContentType = "application/pdf";
            Response.BinaryWrite(byteArray);
            Response.Flush();
        }

        catch (Exception ex)
        {
            msgBox1.alert(ex.Message);
        }

    }
}