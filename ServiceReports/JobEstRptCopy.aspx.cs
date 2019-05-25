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

public partial class ServiceReports_JobEstRptCopy : System.Web.UI.Page
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
            //PDFExport();
            BindReport();

        }
    }

    private void BindReport()
    {
        try
        {
            ESTIMATEID = Convert.ToString(Session["ESTIMATEID"]);

            strUid = Session["strUid"].ToString();
            strPwd = Session["strPwd"].ToString();
            strServer = Session["strServer"].ToString();
            strDatabase = Session["strDatabase"].ToString();
                    rd.Load(this.Page.MapPath("JobEstimateRpt.rpt"));
            rd.DataSourceConnections[0].IntegratedSecurity = false;

            rd.DataSourceConnections[0].SetConnection(strServer, strDatabase, strUid, strPwd);
            rd.SetDataSource(ds);
            rd.SetParameterValue("@ESTIMATEID", ESTIMATEID);

            qry1 = "execute PROC_GETPARTSDETAILS2 '" + ESTIMATEID + "'";
            con.SqlDs(qry1, 1);

            qry2 = "execute PROC_GETLABOURDETAILS2 '" + ESTIMATEID + "'";
            con.SqlDs(qry2, 1);

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




    protected void getreport()
    {
        //LocalReport rep = ReportViewer1.LocalReport;
        //rep.ReportPath = @"ServiceReports\JobEstimateRpt.rdlc";
        ////Session["ESTIMATEID"] = 2004000006;
        //qry1 = "exec [PROC_GETCUSTOMERDETAILS] " + int.Parse(Session["ESTIMATEID"].ToString()) + "";
        //SqlDataSource1.ConnectionString = System.Configuration.ConfigurationManager.AppSettings["AutoEnhancerConnectionString"].ToString();
        //SqlDataSource1.SelectCommandType = SqlDataSourceCommandType.Text;
        //SqlDataSource1.SelectCommand = qry1;
        //SqlDataSource1.DataBind();
        //qry2 = "exec [PROC_GETPARTSDETAILS] " + int.Parse(Session["ESTIMATEID"].ToString()) + "";
        //SqlDataSource2.ConnectionString = System.Configuration.ConfigurationManager.AppSettings["AutoEnhancerConnectionString"].ToString();
        //SqlDataSource2.SelectCommandType = SqlDataSourceCommandType.Text;
        //SqlDataSource2.SelectCommand = qry2;
        //SqlDataSource2.DataBind();
        //qry3 = "exec [PROC_GETLABOURDETAILS] " + int.Parse(Session["ESTIMATEID"].ToString()) + "";
        //SqlDataSource3.ConnectionString = System.Configuration.ConfigurationManager.AppSettings["AutoEnhancerConnectionString"].ToString();
        //SqlDataSource3.SelectCommandType = SqlDataSourceCommandType.Text;
        //SqlDataSource3.SelectCommand = qry3;
        //SqlDataSource3.DataBind();
        ////ReportViewer1.LocalReport.DataSources.Clear();
        //rds1 = new ReportDataSource("JobEstCustDetailsDs", SqlDataSource1);
        //rds2 = new ReportDataSource("JobEstLabDetailsDs", SqlDataSource2);
        //rds3 = new ReportDataSource("JobEstPartDetails", SqlDataSource3);
        ////rds1.Value = SqlDataSource1;
        ////rds2.Value = SqlDataSource2;
        ////rds3.Value = SqlDataSource3;
        //ReportViewer1.LocalReport.DataSources.Add(rds1);
        //ReportViewer1.LocalReport.DataSources.Add(rds2);
        //ReportViewer1.LocalReport.DataSources.Add(rds3);
        //ReportViewer1.LocalReport.Refresh();
        //bytes = ReportViewer1.LocalReport.Render(strFormat, strDeviceInfo, out strMimeType, out strEncoding, out strExtension, out strStreams, out warnings);
        ////Byte[] mybytes = report.Render("PDF");
        ////using (FileStream fs = File.Create(@"C:\SalSlip.pdf"))
        ////{
        ////fs.Write(bytes, 0, bytes.Length);        
        ////fs.Close();
        ////}
        //Response.Buffer = true;
        //Response.Clear();
        //Response.ContentType = strMimeType;
        //Response.AddHeader("content-disposition", "attachment; filename=" + strNomFichier + "." + strFormat);
        //Response.BinaryWrite(bytes); // create the file
        //Response.Flush();

    }
}