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

public partial class ListofJobCardOpen : System.Web.UI.Page
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
    //Staticcolor Staticcolorss = new Staticcolor();
    MemoryStream oStream;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //RadPivotGrid1.OlapSettings.XmlaConnectionSettings.Encoding = System.Text.Encoding.UTF8;
            RadDateFrom.SelectedDate = DateTime.Now;
            RadDateTo.SelectedDate = DateTime.Now;
            LoadDataForRadGrid1();
            RadGrid1.DataBind();
            foreach (GridDataItem item in RadGrid1.MasterTableView.Items)
            {
                RadHtmlChart chart = item["ChartColumn"].FindControl("RadHtmlChart1") as RadHtmlChart;
                SqlDataSource2.SelectParameters[0].DefaultValue = item.GetDataKeyValue("customer").ToString();
                chart.DataSource = SqlDataSource2.Select(DataSourceSelectArguments.Empty);
                chart.DataBind();
         
            //for (int i = 0; i < 2; i++)
            //{
            //    BarSeries bs = new BarSeries();
            //        bs.Appearance.FillStyle.BackgroundColor = Staticcolor.StaticColor.GetColor(i);
            //        chart.PlotArea.Series.Add(bs);
            //        for (int j = 1; j < 2; j++)
            //        {
            //            CategorySeriesItem si = new CategorySeriesItem();
            //            si.Y = j;
            //            bs.SeriesItems.Add(si);
            //        }
            //    }
            }
        }
    }
    protected void RadGrid1_ItemDataBound(object sender, GridItemEventArgs e)
    {
        if (e.Item.ItemType == GridItemType.Item || e.Item.ItemType == GridItemType.AlternatingItem)
        {
            GridDataItem item = e.Item as GridDataItem;
            RadHtmlChart chart = item["ChartColumn"].FindControl("RadHtmlChart1") as RadHtmlChart;
            SqlDataSource2.SelectParameters[0].DefaultValue = item.GetDataKeyValue("customer").ToString();
            chart.DataSource = SqlDataSource2.Select(DataSourceSelectArguments.Empty);
            if ((chart.DataSource as DataView).Count > 0)
            {
                chart.DataBind();
            }
            else
            {
                chart.Visible = false;
                item["ChartColumn"].Controls.Add(new LiteralControl("This Job Card has no record."));
            }
        }
    }
    protected void RadGrid1_ExcelMLWorkBookCreated(object sender, GridExcelMLWorkBookCreatedEventArgs e)
    {

        foreach (RowElement row in e.WorkBook.Worksheets[0].Table.Rows)
        {
            row.Cells[0].StyleValue = "Style1";
        }

        StyleElement style = new StyleElement("Style1");
        style.InteriorStyle.Pattern = InteriorPatternType.Solid;
        style.InteriorStyle.Color = System.Drawing.Color.LightGray;
        e.WorkBook.Styles.Add(style);

    }
    private void LoadDataForRadGrid1()
    {
        RadGrid1.DataSource = GetDataTableDT();

    }
    public DataTable GetDataTableDT()
    {
    
        string datefroms = String.Format("{0:MM/dd/yyyy}", RadDateFrom.SelectedDate);
        string datetos = String.Format("{0:MM/dd/yyyy}", RadDateTo.SelectedDate);
        qry = "SELECT customer.customer,Job.job, Job.RegistrationNo, Job.model, Job.ChassisNo AS VIN, servhead.servicedesc, Job.Mileage, CONVERT(varchar, Job.jobdate, 103) AS 'JobDate', Customer.salutation + '' + Customer.custnamefirst + ' ' + Customer.custnamemiddle + ' ' + Customer.custnamelast AS 'CustomerName', CASE WHEN RIGHT('0' + CAST(ISNULL(mobileno, '') AS VARCHAR(11)), 11) = '0' THEN '' ELSE RIGHT('0' + CAST(ISNULL(mobileno, '') AS VARCHAR(11)), 11) END + ' ' + CASE WHEN RIGHT('0' + CAST(ISNULL(custphone1, '') AS VARCHAR(11)), 11) = '0' THEN '' ELSE RIGHT('0' + CAST(ISNULL(custphone1,'') AS VARCHAR(11)), 11) END + ' ' + CASE WHEN RIGHT('0' + CAST(ISNULL(custphone2, '') AS VARCHAR(11)), 11) = '0' THEN '' ELSE RIGHT('0' + CAST(ISNULL(custphone2, '') AS VARCHAR(11)), 11) END + ' ' + CASE WHEN RIGHT('0' + CAST(ISNULL(offphone1, '') AS VARCHAR(11)), 11) = '0' THEN '' ELSE RIGHT('0' + CAST(ISNULL(offphone1, '') AS VARCHAR(11)), 11) END + ' ' + CASE WHEN RIGHT('0' + CAST(ISNULL(offphone2, '') AS VARCHAR(11)), 11) = '0' THEN '' ELSE RIGHT('0' + CAST(ISNULL(offphone2, '') AS VARCHAR(11)), 11) END AS 'PhoneNumbers',Employee.name AS 'ServiceAdvisor' FROM Job INNER JOIN  Customer ON Job.customer = Customer.customer INNER JOIN Employee ON Job.supervisoratt = Employee.employee INNER JOIN servhead ON Job.service = servhead.service WHERE (Job.jobdate >= CONVERT(DATETIME, '" + datefroms + "')) AND (Job.jobdate <= CONVERT(DATETIME, '" + datetos + "'))";
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
    protected void RadGrid1_PageSizeChanged(object sender, GridPageSizeChangedEventArgs e)
    {

        LoadDataForRadGrid1();
        RadGrid1.DataBind();
    }

    protected void RadGrid1_PageIndexChanged(object sender, Telerik.Web.UI.GridPageChangedEventArgs e)
    {
        LoadDataForRadGrid1();
        RadGrid1.DataBind();
    }
   
    protected void RadGrid1_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
    {
        if (e.CommandName == RadGrid.ExportToExcelCommandName)
        {
            RadGrid1.ExportSettings.Excel.Format = GridExcelExportFormat.Xlsx;
            RadGrid1.ExportSettings.ExportOnlyData = true;
            RadGrid1.ExportSettings.OpenInNewWindow = true;
        }
        LoadDataForRadGrid1();
        RadGrid1.DataBind();
    }


    protected void RadGrid1_SortCommand(object sender, Telerik.Web.UI.GridSortCommandEventArgs e)
    {
        GridTableView tableView = e.Item.OwnerTableView;
        
            e.Canceled = true;
            GridSortExpression expression = new GridSortExpression();
            expression.FieldName = "Customer";
            if (tableView.SortExpressions.Count == 0 || tableView.SortExpressions[0].FieldName != "Customer")
            {
                expression.SortOrder = GridSortOrder.Descending;
            }
            else if (tableView.SortExpressions[0].SortOrder == GridSortOrder.Descending)
            {
                expression.SortOrder = GridSortOrder.Ascending;
            }
            else if (tableView.SortExpressions[0].SortOrder == GridSortOrder.Ascending)
            {
                expression.SortOrder = GridSortOrder.None;
            }
            tableView.SortExpressions.AddSortExpression(expression);
            tableView.Rebind();

        LoadDataForRadGrid1();
        RadGrid1.DataBind();
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
        LoadDataForRadGrid1();
        RadGrid1.DataBind();
    }

    protected void ImgExp_Click(object sender, ImageClickEventArgs e)
    {
        string alternateText = (sender as ImageButton).AlternateText;
        RadGrid1.ExportSettings.Excel.Format = (GridExcelExportFormat)Enum.Parse(typeof(GridExcelExportFormat), alternateText);
        RadGrid1.ExportSettings.ExportOnlyData = true;
        RadGrid1.ExportSettings.OpenInNewWindow = true;
        RadGrid1.MasterTableView.ExportToExcel();
    }
}
