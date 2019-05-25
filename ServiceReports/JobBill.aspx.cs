using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.Grid;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;


public partial class ServiceReports_JobBill : System.Web.UI.Page
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
    SqlDataAdapter adp = new SqlDataAdapter();
    SqlDataAdapter adpsub = new SqlDataAdapter();
    smartcon Con = new smartcon();
    string exittype, qry;
    string pin, BILLID, strUid, stateid, strPwd, statename;
    //MemoryStream oStream = new MemoryStream();
    Dictionary<int, double> bookingtime = new Dictionary<int, double>();
    Dictionary<int, GridRow> lastGroupHeaders = new Dictionary<int, GridRow>();
    int bookingCount = 0;
    ArrayList serviceNames = new ArrayList();
    ArrayList serviceCount = new ArrayList();
    ArrayList statusNames = new ArrayList();
    ArrayList statusCount = new ArrayList();
    Dictionary<int, int> rowbookingCount = new Dictionary<int, int>();
    int cnt = 0;
    int cntPaid = 0;
    int cntStatus = 0;

    int cntFree = 0;
    int cntRunn = 0;
    int index = 0;
    int indexStatus = 0;
    int indexPaid = 0;
    int indexFree = 0;
    int indexRunn = 0;
    string service = string.Empty;
    Dictionary<int, int> rowCounter = new Dictionary<int, int>();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["BILLID"] != null)
        {
            Session.Remove("BILLID");
        }

        //TblDates.Visible = false;
        if (!IsPostBack)
        {
       
       
            grid1.SelectedRecords = null;
            RadDateFrom.SelectedDate = DateTime.Now;
            RadDateTo.SelectedDate = DateTime.Now;
             LoadDataForRadGrid1();
            grid1.DataBind();
        }
        else
        {
         


            if (grid1.SelectedRecords != null)
            {
                if (HttpContext.Current == null)
                    return;
                if (HttpContext.Current.CurrentHandler == null)
                    return;
                if (!(HttpContext.Current.CurrentHandler is System.Web.UI.Page))
                    return;
                if (((System.Web.UI.Page)HttpContext.Current.CurrentHandler).IsCallback)
                    return;
                foreach (Hashtable oRecord in grid1.SelectedRecords)
                {
                    Session["BILLID"] = oRecord["billno"].ToString();
                    BILLID = oRecord["billno"].ToString();
                }
                //oRecord["billno"] = null;
                Response.Write("<script>window.open('Invoice.aspx','_blank');</script>");
                //Response.Write("<script>window.open('Invoice.aspx?BILLID=" + BILLID + ",'_blank');</script>");
                //Response.Write("<script language='javascript'> window.open('Invoice.aspx?BILLID=" + BILLID + ", 'Google', 'width=1000, height=1000, menubar=yes, resizable=yes')" + "</script>");
            }

        }

    }
    public object ChkNull(object val)
    {
        if (val == System.DBNull.Value == true)
        {
            return "";
        }

        return val;
    }

    private void LoadDataForRadGrid1()
    {
        grid1.DataSource = GetDataTableDT();

    }
    public DataTable GetDataTableDT()
    {

        string datefroms = String.Format("{0:MM/dd/yyyy}", RadDateFrom.SelectedDate);
        string datetos = String.Format("{0:MM/dd/yyyy}", RadDateTo.SelectedDate);
        qry = "SELECT Job.billno, Job.job, Job.RegistrationNo, CONVERT(varchar, Job.billdt, 103) AS BillDate, Job.model, Job.ChassisNo, Customer.customer, Customer.salutation + '' + Customer.custnamefirst + ' ' + Customer.custnamemiddle + ' ' + Customer.custnamelast AS 'CustomerName', CASE WHEN RIGHT('0' + CAST(ISNULL(mobileno, '') AS VARCHAR(11)), 11) = '0' THEN '' ELSE RIGHT('0' + CAST(ISNULL(mobileno, '') AS VARCHAR(11)), 11) END + ' ' + CASE WHEN RIGHT('0' + CAST(ISNULL(custphone1, '') AS VARCHAR(11)), 11) = '0' THEN '' ELSE RIGHT('0' + CAST(ISNULL(custphone1,'') AS VARCHAR(11)), 11) END + ' ' + CASE WHEN RIGHT('0' + CAST(ISNULL(custphone2, '') AS VARCHAR(11)), 11) = '0' THEN '' ELSE RIGHT('0' + CAST(ISNULL(custphone2, '') AS VARCHAR(11)), 11) END + ' ' + CASE WHEN RIGHT('0' + CAST(ISNULL(offphone1, '') AS VARCHAR(11)), 11) = '0' THEN '' ELSE RIGHT('0' + CAST(ISNULL(offphone1, '') AS VARCHAR(11)), 11) END + ' ' + CASE WHEN RIGHT('0' + CAST(ISNULL(offphone2, '') AS VARCHAR(11)), 11) = '0' THEN '' ELSE RIGHT('0' + CAST(ISNULL(offphone2, '') AS VARCHAR(11)), 11) END AS 'PhoneNumbers', Job.Mileage,servhead.servicedesc, Round(Job.totalamount - jobbill.RoundOff,2) as BillAmt FROM Customer INNER JOIN city ON Customer.city = city.citycode INNER JOIN vehiclemaster ON Customer.customer = vehiclemaster.custcode INNER JOIN Job ON vehiclemaster.ChassisNO = Job.ChassisNo AND vehiclemaster.RegistrationNo = Job.RegistrationNo INNER JOIN servhead ON Job.service = servhead.service INNER JOIN jobbill ON Job.billno = jobbill.bill where billdt >= CONVERT(DATETIME, '" + datefroms + "') AND billdt <= CONVERT(DATETIME, '" + datetos + "') ORDER BY billno desc";

        //qry = "SELECT billno,Job, job.RegistrationNo,CONVERT(varchar, billdt, 103) AS BillDate, job.model, job.chassisno, Customer.customer,Customer.salutation + '' + Customer.custnamefirst + ' ' + Customer.custnamemiddle + ' ' + Customer.custnamelast AS 'CustomerName', CASE WHEN RIGHT('0' + CAST(ISNULL(mobileno, '') AS VARCHAR(11)), 11) = '0' THEN '' ELSE RIGHT('0' + CAST(ISNULL(mobileno, '') AS VARCHAR(11)), 11) END + ' ' + CASE WHEN RIGHT('0' + CAST(ISNULL(custphone1, '') AS VARCHAR(11)), 11) = '0' THEN '' ELSE RIGHT('0' + CAST(ISNULL(custphone1, '') AS VARCHAR(11)), 11) END + ' ' + CASE WHEN RIGHT('0' + CAST(ISNULL(custphone2, '') AS VARCHAR(11)), 11) = '0' THEN '' ELSE RIGHT('0' + CAST(ISNULL(custphone2, '') AS VARCHAR(11)), 11) END + ' ' + CASE WHEN RIGHT('0' + CAST(ISNULL(offphone1, '') AS VARCHAR(11)), 11) = '0' THEN '' ELSE RIGHT('0' + CAST(ISNULL(offphone1,'') AS VARCHAR(11)), 11) END + ' ' + CASE WHEN RIGHT('0' + CAST(ISNULL(offphone2, '') AS VARCHAR(11)), 11) = '0' THEN '' ELSE RIGHT('0' + CAST(ISNULL(offphone2, '') AS VARCHAR(11)), 11) END AS 'PhoneNumbers', job.Mileage, servhead.servicedesc FROM Customer INNER JOIN city ON Customer.city = city.citycode  INNER JOIN vehiclemaster ON Customer.customer = vehiclemaster.custcode INNER JOIN job ON vehiclemaster.ChassisNO = job.ChassisNo AND vehiclemaster.RegistrationNo = job.RegistrationNo INNER JOIN  servhead ON job.service = servhead.service where billdt >= CONVERT(DATETIME, '" + datefroms + "') AND billdt <= CONVERT(DATETIME, '" + datetos + "') ORDER BY billno desc";


        SqlConnection conn = new SqlConnection(strCon);
        SqlDataAdapter adapter = new SqlDataAdapter();
        adapter.SelectCommand = new SqlCommand(qry, conn);

        DataTable myDataTable = new DataTable();
        try
        {
            conn.Open();

            adapter.Fill(myDataTable);
        }
        catch (Exception ex)
        {
            msgBox1.alert(ex.Message);
            conn.Close();
            Con.insertError(ex.Message);
        }

        return myDataTable;
    }

    public DataTable GetDataTable(string query)
    {
        String ConnString = ConfigurationManager.ConnectionStrings["AutoEnhancerConnectionString"].ConnectionString;
        SqlConnection conn = new SqlConnection(strCon);
        SqlDataAdapter adapter = new SqlDataAdapter();
        adapter.SelectCommand = new SqlCommand(query, conn);

        DataTable myDataTable = new DataTable();

        conn.Open();
        try
        {
            adapter.Fill(myDataTable);
        }
        catch (Exception ex)
        {
            msgBox1.alert(ex.Message);
            conn.Close();
            Con.insertError(ex.Message);
        }

        return myDataTable;
    }




    protected void Button1_Click(object sender, EventArgs e)
    {
        grid1.SelectedRecords = null;
        string datefroms = String.Format("{0:MM/dd/yyyy}", RadDateFrom.SelectedDate);
        string datetos = String.Format("{0:MM/dd/yyyy}", RadDateTo.SelectedDate);
        if (datefroms == string.Empty)
        {
            msgBox1.alert("Please enter Date from");
            return;

        }
        else if (datetos == string.Empty)
        {

            msgBox1.alert("Please enter Date to");
            return;
        }



        try
        {


            qry = "SELECT Job.billno, Job.job, Job.RegistrationNo, CONVERT(varchar, Job.billdt, 103) AS BillDate, Job.model, Job.ChassisNo, Customer.customer, Customer.salutation + '' + Customer.custnamefirst + ' ' + Customer.custnamemiddle + ' ' + Customer.custnamelast AS 'CustomerName', CASE WHEN RIGHT('0' + CAST(ISNULL(mobileno, '') AS VARCHAR(11)), 11) = '0' THEN '' ELSE RIGHT('0' + CAST(ISNULL(mobileno, '') AS VARCHAR(11)), 11) END + ' ' + CASE WHEN RIGHT('0' + CAST(ISNULL(custphone1, '') AS VARCHAR(11)), 11) = '0' THEN '' ELSE RIGHT('0' + CAST(ISNULL(custphone1,'') AS VARCHAR(11)), 11) END + ' ' + CASE WHEN RIGHT('0' + CAST(ISNULL(custphone2, '') AS VARCHAR(11)), 11) = '0' THEN '' ELSE RIGHT('0' + CAST(ISNULL(custphone2, '') AS VARCHAR(11)), 11) END + ' ' + CASE WHEN RIGHT('0' + CAST(ISNULL(offphone1, '') AS VARCHAR(11)), 11) = '0' THEN '' ELSE RIGHT('0' + CAST(ISNULL(offphone1, '') AS VARCHAR(11)), 11) END + ' ' + CASE WHEN RIGHT('0' + CAST(ISNULL(offphone2, '') AS VARCHAR(11)), 11) = '0' THEN '' ELSE RIGHT('0' + CAST(ISNULL(offphone2, '') AS VARCHAR(11)), 11) END AS 'PhoneNumbers', Job.Mileage,servhead.servicedesc, Round(Job.totalamount - jobbill.RoundOff,2) as BillAmt  FROM Customer INNER JOIN city ON Customer.city = city.citycode INNER JOIN vehiclemaster ON Customer.customer = vehiclemaster.custcode INNER JOIN Job ON vehiclemaster.ChassisNO = Job.ChassisNo AND vehiclemaster.RegistrationNo = Job.RegistrationNo INNER JOIN servhead ON Job.service = servhead.service INNER JOIN jobbill ON Job.billno = jobbill.bill where billdt >= CONVERT(DATETIME, '" + datefroms + "') AND billdt <= CONVERT(DATETIME, '" + datetos + "') ORDER BY billno desc";
            String ConnString = ConfigurationManager.ConnectionStrings["AutoEnhancerConnectionString"].ConnectionString;

            SqlConnection myConn = new SqlConnection(ConnString);
            myConn.Open();
            SqlCommand cmd = new SqlCommand(qry, myConn);
            cmd.CommandType = CommandType.Text;
            cmd.CommandTimeout = 90000000;
            SqlDataAdapter DA = new SqlDataAdapter(cmd);
            DA.SelectCommand = cmd;
            DataSet DS = new DataSet();
            DA.Fill(DS, "employee");
            if (DS.Tables[0].Rows.Count == 0)
            {
                grid1.DataSource = null;
                msgBox1.alert("No record exist");
                grid1.DataSource = null;
            }
            else
            {
                LoadDataForRadGrid1();
                grid1.DataBind();
            }
        }
        catch (SqlException ex)
        {
            msgBox1.alert(ex.Message);
        }
    }
}