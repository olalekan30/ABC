using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;
using System.IO;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Web.Profile;
using Telerik.Web.UI;
using Telerik.Web.UI.GridExcelBuilder;
using Obout.Grid;
using System.Collections;

public partial class ServiceBookingsRptss : System.Web.UI.Page
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
    string pin, strUid, stateid, strPwd, statename;
    //MemoryStream oStream = new MemoryStream();
    MemoryStream oStream;
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
        if (!IsPostBack)
        {
            RadDateFrom.SelectedDate = DateTime.Now;
            RadDateTo.SelectedDate = DateTime.Now;
            LoadDataForRadGrid1();
            grid1.DataBind();
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
    public void RowDataBound(object sender, GridRowEventArgs e)
    {

        if (e.Row.RowType == GridRowType.DataRow)
        {
            bookingCount++;
            if (!serviceNames.Contains(e.Row.Cells[7].Text))
            {
                serviceNames.Add(e.Row.Cells[7].Text);
                serviceCount.Add(1);
            }
            else
            {
                service = e.Row.Cells[7].Text;
                index = serviceNames.IndexOf(service);
                cnt = int.Parse(serviceCount[index].ToString());
                serviceCount.RemoveAt(index);
                serviceCount.Insert(index, cnt + 1);

                indexPaid = serviceNames.IndexOf("PAS");
                cntPaid = int.Parse(serviceCount[indexPaid].ToString());
                serviceCount.RemoveAt(indexPaid);
                serviceCount.Insert(indexPaid, cntPaid + 1);
            }

            if (!statusNames.Contains(ChkNull(e.Row.Cells[10].Text)))
            {
                statusNames.Add(ChkNull(e.Row.Cells[10].Text));
                statusCount.Add(1);
            }
            else
            {
                indexStatus = statusNames.IndexOf(statusNames);
                if (indexStatus==-1)
                {
                    indexStatus = 0;
                }
                cntStatus = int.Parse(statusCount[indexStatus].ToString());
                statusCount.RemoveAt(indexStatus);
                statusCount.Insert(indexStatus, cntStatus + 1);
            }




        }
        else if (e.Row.RowType == GridRowType.ColumnFooter)
        {
            int large = 0;
            for (int i = 0; i < serviceCount.Count; i++)
            {
                if (large < int.Parse(serviceCount[i].ToString()))
                {
                    large = int.Parse(serviceCount[i].ToString());
                }
            }
            int indx = serviceCount.IndexOf(large);
            int indxPaid = serviceCount.IndexOf(large);

            e.Row.Cells[0].Text = @"Most Service Booked: " + serviceNames[indx].ToString();
                  //@"Free Service(s): " + 0 + "<br>" +
            //    @"Paid Service(s): " + cntPaid + "<br>" +
            //e.Row.Cells[0].Text = @"Most Service Booked: " + serviceNames[indx].ToString() + "<br>" +
            //      @"Free Service(s): " + 0 + "<br>" +
            //    @"Paid Service(s): " + cntPaid + "<br>" +
            //@"Running Repair(s): " + cntPaid + "<br>" +
            // @"Cancelled: " + cntStatus;
            cntPaid = 0;

        }
        else if (e.Row.RowType == GridRowType.GroupFooter)
        {
            if (e.Row.GroupLevel > 0)
            {
                for (int level = e.Row.GroupLevel - 1; level >= 0; level--)
                {
                    if (!bookingtime.ContainsKey(level))
                    {

                        rowbookingCount.Add(level, 0);

                    }
                    rowbookingCount[level] += bookingCount;
                }
            }

            int rowCounterToDisplay = 0;
            if (bookingtime.ContainsKey(e.Row.GroupLevel))
            {

                rowCounterToDisplay = rowbookingCount[e.Row.GroupLevel];
                rowbookingCount[e.Row.GroupLevel] = 0;

            }
            else
            {
                rowCounterToDisplay = bookingCount;

            }
            e.Row.Cells[0].Text = "Total (" + rowCounterToDisplay.ToString() + " Booking " + (rowCounterToDisplay > 1 ? "" : "") + "):";
            rowCounterToDisplay = 0;
            bookingCount = 0;
        }





    }
    private void LoadDataForRadGrid1()
    {
        grid1.DataSource = GetDataTableDT();

    }
    public DataTable GetDataTableDT()
    {
    
            string datefroms = String.Format("{0:MM/dd/yyyy}", RadDateFrom.SelectedDate);
        string datetos = String.Format("{0:MM/dd/yyyy}", RadDateTo.SelectedDate);
        qry = "select  convert(varchar,bookingdate,103) as 'CallDate',servbook.UserID,ISNULL(booking,'') as Booking, RegistrationNo,model,ChassisNo,product as Service,salutation+ '' + custnamefirst + ' ' + custnamemiddle + ' ' + custnamelast as 'CustomerName',CASE WHEN RIGHT('0'+CAST(ISNULL(mobileno,'') AS VARCHAR(11)),11) = '0' THEN '' ELSE RIGHT('0'+CAST(ISNULL(mobileno,'') AS VARCHAR(11)),11) END + ' ' +  CASE WHEN RIGHT('0'+CAST(ISNULL(custphone1,'') AS VARCHAR(11)),11) = '0' THEN '' ELSE RIGHT('0'+CAST(ISNULL(custphone1,'') AS VARCHAR(11)),11) END+ ' ' +  CASE WHEN RIGHT('0'+CAST(ISNULL(custphone2,'') AS VARCHAR(11)),11) = '0' THEN '' ELSE RIGHT('0'+CAST(ISNULL(custphone2,'') AS VARCHAR(11)),11) END  + ' ' +  CASE WHEN RIGHT('0'+CAST(ISNULL(offphone1,'') AS VARCHAR(11)),11) = '0' THEN '' ELSE RIGHT('0'+CAST(ISNULL(offphone1,'') AS VARCHAR(11)),11) END  + ' ' +  CASE WHEN RIGHT('0'+CAST(ISNULL(offphone2,'') AS VARCHAR(11)),11) = '0' THEN '' ELSE RIGHT('0'+CAST(ISNULL(offphone2,'') AS VARCHAR(11)),11) END AS 'PhoneNumbers', convert(varchar,bookedfordate,103) as 'bookedfordate',CONVERT(VARCHAR(5), bookingtime, 114) AS 'BookingTime',CASE bookingstatus WHEN 'C' THEN ' ***CANCELLED*** ' WHEN '' THEN '' END as 'Status' FROM  servbook INNER JOIN Customer ON servbook.Customer = Customer.customer where  bookedfordate >= CONVERT(DATETIME, '" + datefroms + "') AND bookedfordate <= CONVERT(DATETIME, '" + datetos + "') ORDER BY booking";
        
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
            //msgBox1.alert(ex.Message);
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
        string datefroms = String.Format("{0:MM/dd/yyyy}", RadDateFrom.SelectedDate);
        string datetos = String.Format("{0:MM/dd/yyyy}", RadDateTo.SelectedDate);
        if (datefroms==string.Empty)
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


            qry = "select  convert(varchar,bookedfordate,103) as bookedfordate,servbook.UserID,ISNULL(booking,'') as Booking, RegistrationNo,model,ChassisNo,product as Service,salutation+ '' + custnamefirst + ' ' + custnamemiddle + ' ' + custnamelast as 'CustomerName',CASE WHEN RIGHT('0'+CAST(ISNULL(mobileno,'') AS VARCHAR(11)),11) = '0' THEN '' ELSE RIGHT('0'+CAST(ISNULL(mobileno,'') AS VARCHAR(11)),11) END + ' ' +  CASE WHEN RIGHT('0'+CAST(ISNULL(custphone1,'') AS VARCHAR(11)),11) = '0' THEN '' ELSE RIGHT('0'+CAST(ISNULL(custphone1,'') AS VARCHAR(11)),11) END+ ' ' +  CASE WHEN RIGHT('0'+CAST(ISNULL(custphone2,'') AS VARCHAR(11)),11) = '0' THEN '' ELSE RIGHT('0'+CAST(ISNULL(custphone2,'') AS VARCHAR(11)),11) END  + ' ' +  CASE WHEN RIGHT('0'+CAST(ISNULL(offphone1,'') AS VARCHAR(11)),11) = '0' THEN '' ELSE RIGHT('0'+CAST(ISNULL(offphone1,'') AS VARCHAR(11)),11) END  + ' ' +  CASE WHEN RIGHT('0'+CAST(ISNULL(offphone2,'') AS VARCHAR(11)),11) = '0' THEN '' ELSE RIGHT('0'+CAST(ISNULL(offphone2,'') AS VARCHAR(11)),11) END AS 'PhoneNumbers', convert(varchar,bookingdate,103) as 'CallDate',CONVERT(VARCHAR(5), bookingtime, 114) AS 'BookingTime',CASE bookingstatus WHEN 'C' THEN ' ***CANCELLED*** ' WHEN '' THEN '' END as 'Status ' FROM  servbook INNER JOIN Customer ON servbook.Customer = Customer.customer where  bookedfordate >= CONVERT(DATETIME, '" + datefroms + "') AND bookedfordate <= CONVERT(DATETIME, '" + datetos + "') ORDER BY booking";
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
