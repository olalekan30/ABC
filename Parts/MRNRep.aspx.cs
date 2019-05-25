using System;
using Telerik.Web.UI;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using Telerik.Web.UI.GridExcelBuilder;
using System.Globalization;
using System.Collections;
using Obout.Grid;

public partial class Parts_MRNRep : System.Web.UI.Page
{
    public string strCon = ConfigurationManager.AppSettings["AutoEnhancerConnectionString2"].ToString();
    string selectQuery2, qry3, qry4, qry2, qry1, qry5, MRNNo, customerss, IsActionOwnerChkss,qry, qrys, passwords;
    smartcon con = new smartcon();
    SqlConnection Cn;
    SqlDataAdapter myda, myda2;
    DataSet ds, ds2;
    int countJ, countP;
    protected void Page_Load(object sender, EventArgs e)
    {


        if (!IsPostBack)
        {
            RadDateFrom.SelectedDate = DateTime.Now;
            RadDateTo.SelectedDate = DateTime.Now;
            grid1.DataSource = GetDataTablebydate();
            grid1.DataBind();
            grid1.Visible = true;
        }
        if (grid1.SelectedRecords != null)
        {
            foreach (Hashtable oRecord in grid1.SelectedRecords)
            {
                MRNNo = oRecord["MRNNo"].ToString();
                Session["MRNNo"] = oRecord["MRNNo"].ToString();
                MRNNo = Session["MRNNo"].ToString();
            }
            Response.Redirect("MRN.aspx?MRNNo=" + MRNNo);
        }


    }

    public DataTable GetDataTablebydate()
    {

        string datefroms = String.Format("{0:dd/MM/yyyy}", RadDateFrom.SelectedDate);
        string datetos = String.Format("{0:dd/MM/yyyy}", RadDateTo.SelectedDate);
        qry5 = "SELECT MRNNo,Vendor,RecieptNo,Flag,PartNo,Partname,TaxForm,Qty,QtyRecieved,Amt,CONVERT(varchar, MRNDate,103) as MRNDate FROM dbo.MRN WHERE CONVERT(varchar, MRNDate,103) >= '" + datefroms + "' AND CONVERT(varchar, MRNDate,103) <= '" + datetos + "'  ORDER BY MRNDate";


        SqlConnection conn = new SqlConnection(strCon);
        SqlDataAdapter adapter = new SqlDataAdapter();
        adapter.SelectCommand = new SqlCommand(qry5, conn);

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
        }

        return myDataTable;
    }
   
 
    public static string PropCase(string strText)
    {
        return new CultureInfo("en").TextInfo.ToTitleCase(strText);
    }
      protected void Button1_Click(object sender, EventArgs e)
    {
        grid1.DataSource = GetDataTablebydate();
        grid1.DataBind();
        grid1.Visible = true;
    }
    protected void ImageButton1_Click(object sender, System.Web.UI.ImageClickEventArgs e)
    {
        Response.Redirect("MRNRep.aspx");
    }
}

