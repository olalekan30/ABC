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

public partial class Parts_LPO : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection();
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
    string exittype, BranchNames, qry;
    string LCID;
    string pin, strUid, strPwd, strServer, strDatabase, Qtrmonth;
    string filepath;
    System.IO.Stream oStream = null;
    byte[] byteArray = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        BindReport();

    }
    private void BindReport()
    {
        try
        {
            LCID = Convert.ToString(Session["LCID"]);
            //BILLID = Convert.ToString(Request.QueryString["BILLID"]);
            strUid = Session["strUid"].ToString();
            strPwd = Session["strPwd"].ToString();
            strServer = Session["strServer"].ToString();
            strDatabase = Session["strDatabase"].ToString();

            BranchNames = Session["BranchNames"].ToString();
            switch (BranchNames)
            {
                case "KP1":
                    rd.Load(this.Page.MapPath("LPO.rpt"));
                    break;
                //case "KP2":
                //    rd.Load(this.Page.MapPath("InvoiceKP2.rpt"));
                //    break;
                //case "Abuja":
                //    rd.Load(this.Page.MapPath("InvoiceAbuja.rpt"));
                //    break;
                //case "PHC":
                //    rd.Load(this.Page.MapPath("InvoicePHC.rpt"));
                //    break;
                //case "Kano":
                //    rd.Load(this.Page.MapPath("InvoiceKano.rpt"));
                //    break;
                //case "KP2BackUp":
                //    rd.Load(this.Page.MapPath("InvoiceKP2BackUp.rpt"));
                //    break;
            }

            rd.DataSourceConnections[0].IntegratedSecurity = false;

            rd.DataSourceConnections[0].SetConnection(strServer, strDatabase, strUid, strPwd);
            rd.SetDataSource(ds);
            rd.SetParameterValue("@BILLID", LCID);
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