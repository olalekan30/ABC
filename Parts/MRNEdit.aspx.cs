using System;
using Telerik.Web.UI;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using Telerik.Web.UI.GridExcelBuilder;
using System.Globalization;
using System.Collections;
using Obout.Grid;

public partial class Parts_MRNEdit : System.Web.UI.Page
{
    public string strCon = ConfigurationManager.AppSettings["AutoEnhancerConnectionString2"].ToString();
    string Userid,selectQuery2, qry3, qry4, qry2, qry1, qry5, MRNNo, customerss, IsActionOwnerChkss,qry, qrys, passwords;
    smartcon con = new smartcon();
    SqlConnection Cn;
    SqlDataAdapter myda, myda2;
    DataSet ds, ds2;
    int countJ, countP;
    protected void Page_Load(object sender, EventArgs e)
    {


        if (!IsPostBack)
        {
            Userid= Session["Userid"].ToString();
            MRNNo = Session["MRNNo"].ToString();
            MRNNo = Request.QueryString["MRNNo"];
            GetDataTableDT2();
        }
       }
    public void GetDataTableDT2()
    {
        qry4 = "SELECT Vendor,RecieptNo,Flag,PartNo,Partname,TaxForm,Qty,QtyRecieved,Amt,CONVERT(varchar, MRNDate,101) as MRNDate,procuredby FROM dbo.MRN WHERE MRNNo <= '" + MRNNo + "'";

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
            RadRecDate.SelectedDate = Convert.ToDateTime(dr[9].ToString());
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
        txtProcby.Text = "";
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
            msgBox1.alert("Please enter Part No!");
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

        qry = "UPDATE MRN SET procuredby = '" + txtProcby.Text.Trim() + "',Vendor = '" + txtVendor.Text.Trim() + "',RecieptNo = '" + txtRecNo.Text + "',Flag = '" + cmbFlag.Text + "',PartNo = '" + txtPartNo.Text.Trim() + "', Partname = '" + txtPartname.Text.Trim() + "', TaxForm = '" + txtform.Text.Trim() + "', Qty = '" + txtQty.Text + "', QtyRecieved ='" + txtQtyRec.Text + "', Amt ='" + txtamt.Text + "', RecieptDate = '" + String.Format("{0:MM/dd/yyyy}", RadRecDate.SelectedDate) + "' WHERE MRNNo=" + Convert.ToInt32(Session["MRNNo"].ToString()) + "";
        con.SqlDs(qry, 2);
        Response.Redirect("MRNOrder.aspx");


    }

    protected void btnClear_Click(object sender, EventArgs e)
    {
        clear();
    }

    protected void btndelete_Click(object sender, EventArgs e)
    {

        qry2 = "DELETE FROM MRN WHERE MRNNo=" + Convert.ToInt32(Session["MRNNo"].ToString()) + "";
        con.SqlDs(qry2, 2);
        Response.Redirect("MRNOrder.aspx");

    }

    protected void ImageButton1_Click(object sender, System.Web.UI.ImageClickEventArgs e)
    {
        Response.Redirect("MRNRep.aspx");
    }
}

