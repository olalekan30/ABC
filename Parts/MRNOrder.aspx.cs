using System;
using Telerik.Web.UI;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using Telerik.Web.UI.GridExcelBuilder;
using System.Globalization;
using System.Collections;
using Obout.Grid;

public partial class Parts_MRNOrder : System.Web.UI.Page
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
            RadRecDate.SelectedDate = DateTime.Now;
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
            Response.Redirect("MRNEdit.aspx?MRNNo=" + MRNNo);
        }


    }


    public DataTable GetDataTablebydateVD()
    {

        string datefroms = String.Format("{0:dd/MM/yyyy}", RadDateFrom.SelectedDate);
        string datetos = String.Format("{0:dd/MM/yyyy}", RadDateTo.SelectedDate);
        qry5 = "SELECT MRNNo,Vendor,RecieptNo,Flag,PartNo,Partname,TaxForm,Qty,QtyRecieved,Amt,CONVERT(varchar, MRNDate,103) as MRNDate FROM dbo.MRN WHERE CONVERT(varchar, MRNDate,103) >= '" + datefroms + "' AND CONVERT(varchar, MRNDate,103) <= '" + datetos + "' AND Vendor='" + txtVendor.Text + "' ORDER BY MRNDate";


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
    public void GetDataTableDT2()
    {
        qry4 = "SELECT Vendor,RecieptNo,Flag,PartNo,Partname,TaxForm,Qty,QtyRecieved,Amt,CONVERT(varchar, MRNDate,103) as MRNDate,procuredby FROM dbo.MRN WHERE MRNNo <= '" + MRNNo + "'";

        foreach (DataRow dr in con.SqlDs(qry4, 2).Tables[0].Rows)
        {

            txtVendor.Text = dr[0].ToString();
            txtRecNo.Text = dr[1].ToString();
            cmbFlag.Text = dr[2].ToString();
            txtPartNo.Text = dr[3].ToString();
            txtPartname.Text = dr[4].ToString();
            txtform.Text = dr[5].ToString();
            txtQty.Text = dr[6].ToString();
            txtQtyRec.Text = dr[7].ToString();
            txtamt.Text = dr[8].ToString();
            //RadRecDate.SelectedDate = dr[9].ToString();
            txtProcby.Text = dr[10].ToString();
        }

    }

    public DataTable GetDataTablejobDT()
    {
        string query = "select model,ChassisNo,RegistrationNo from job where job='" + txtRecNo.Text.Trim() + "'";

        SqlConnection conn = new SqlConnection(strCon);
        SqlDataAdapter adapter = new SqlDataAdapter();
        adapter.SelectCommand = new SqlCommand(query, conn);

        DataTable myDataTable = new DataTable();

        conn.Open();
        try
        {
            adapter.Fill(myDataTable);
        }
        finally
        {
            conn.Close();
        }

        return myDataTable;
    }
 
    public static string PropCase(string strText)
    {
        return new CultureInfo("en").TextInfo.ToTitleCase(strText);
    }

    protected void txtPartNo_TextChanged(object sender, EventArgs e)
    {
        qry3 = "select partdesc from [dbo].[partmast] where part='" + txtPartNo.Text.Trim() + "'";
        countP = con.SqlDs(qry3, 2).Tables[0].Rows.Count;
        if (countP == 0)
        {
            msgBox1.alert("No such part number exist!");
            return;

        }
        foreach (DataRow dr in con.SqlDs(qry3, 2).Tables[0].Rows)
        {
            txtPartname.Text = dr[0].ToString();
        }
        if (txtVendor.Text!="")
        {
            GetDataTablebydateVD();


        }

    }
    protected void clear()
    {

        txtPartNo.Text = "";
        txtPartname.Text = "";
        txtform.Text = "";
        cmbFlag.Text = "";
        txtamt.Text = "";
        txtRecNo.Text = "";
        txtQty.Text = "";
        txtVendor.Text = "";
        txtQtyRec.Text = "";
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (txtRecNo.Text == "")
        {
            msgBox1.alert("Please enter reciept number!");
            txtRecNo.Focus();
            return;
        }
        else if (txtPartNo.Text == "")
        {
            msgBox1.alert("Please enter part no!");
            txtPartNo.Focus();
            return;
        }
        else if (txtProcby.Text == "")
        {
            msgBox1.alert("Please enter name of procurement officer!");
            txtProcby.Focus();
            return;
        }
        else if (RadRecDate.SelectedDate ==null)
        {
            msgBox1.alert("Please reciept date!");
            RadRecDate.Focus();
            return;
        }
        else if (txtPartname.Text == "")
        {
            msgBox1.alert("Please enter part name!");
            return;
        }
        else if (txtVendor.Text == "")
        {
            msgBox1.alert("Please enter vendor name");
            return;
        }


        else if (txtform.Text == "")
        {
            txtform.Focus();
            msgBox1.alert("Please select a tax form!");
            return;
        }
        else if (cmbFlag.Text == "")
        {
            msgBox1.alert("Please select a flag!");
            return;
        }
        else if (txtQtyRec.Text == "")
        {
            txtQtyRec.Focus();
            msgBox1.alert("Please select quantity recieved!");
            return;
        }
        else if (txtamt.Text == "")
        {
            txtamt.Focus();
            msgBox1.alert("Please enter amount");
            return;
        }
        else if (txtQty.Text == "")
        {
            txtQty.Focus();
            msgBox1.alert("Please enter quantity!");
            return;
        }

        qry = "insert into MRN(Vendor,RecieptNo,Flag,PartNo,Partname,TaxForm,Qty,QtyRecieved,Amt,RecieptDate,procuredby) VALUES('" + txtVendor.Text.Trim() + "','" + txtRecNo.Text.Trim() + "','" + cmbFlag.Text + "','" + txtPartNo.Text.Trim() + "','" + txtPartname.Text.Trim() + "','" + txtform.Text.Trim() + "','" + txtQty.Text + "','" + txtQtyRec.Text + "','" + txtamt.Text + "','" + String.Format("{0:MM/dd/yyyy}", RadRecDate.SelectedDate) + "','" + txtProcby.Text.Trim() + "')";
        con.SqlDs(qry, 2);
        grid1.DataSource = GetDataTablebydate();
        grid1.DataBind();
        clear();


    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        grid1.DataSource = GetDataTablebydate();
        grid1.DataBind();
        grid1.Visible = true;
        clear();

    }

    protected void btnClear_Click(object sender, EventArgs e)
    {
        clear();
    }

    protected void ImageButton1_Click(object sender, System.Web.UI.ImageClickEventArgs e)
    {
        Response.Redirect("MRNRep.aspx");
    }
}

