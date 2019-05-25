using System;
using Telerik.Web.UI;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using Telerik.Web.UI.GridExcelBuilder;
using System.Globalization;
using System.Collections;
using Obout.Grid;

public partial class Parts_localpurchaseEdit : System.Web.UI.Page
{
    public string strCon = ConfigurationManager.AppSettings["AutoEnhancerConnectionString2"].ToString();
    string selectQuery2, Userid, qry3, qry4, qry2, qry1, qry5,LCID, customerss, IsActionOwnerChkss,qry, qrys, passwords;
    smartcon con = new smartcon();
    SqlConnection Cn;
    SqlDataAdapter myda, myda2;
    DataSet ds, ds2;
    int countP;
    protected void Page_Load(object sender, EventArgs e)
    {


        if (!IsPostBack)
        {
            Userid = Session["Userid"].ToString();
            LCID =Session["LCID"].ToString();
            LCID = Request.QueryString["LCID"];
            GetDataTableDT2();
        }
      

    }
    public void GetDataTableDT2()
    {
        qry4 = "SELECT PartNo,Model,Vin,Partname,Technician,ServEng,Regno,Amounts,Qty,CONVERT(varchar,reqdate, 103),JobNo,customers,groupname FROM dbo.LOCALPURCHASE WHERE LCID <= '" + Session["LCID"].ToString() + "' ORDER BY reqdate";
        foreach (DataRow dr in con.SqlDs(qry4, 2).Tables[0].Rows)
        {
            txtPartNo.Text = dr[0].ToString();
            txtModel.Text = dr[1].ToString();
            txtVin.Text = dr[2].ToString();
            txtPartname.Text = dr[3].ToString();
            txttech.Text = dr[4].ToString();
            cmbServEng.Text= dr[5].ToString();
            txtRegno.Text = dr[6].ToString();
            txtamt.Text = dr[7].ToString();
            txtQty.Text = dr[8].ToString();
            RadDateReq.Text = dr[9].ToString();
            txtJobcarno.Text = dr[10].ToString();
            txtCust.Text = dr[11].ToString();
            cmbLabour.Text = dr[12].ToString();
        }

    }

    public DataTable GetDataTablejobDT()
    {
        string query = "select model,ChassisNo,RegistrationNo from job where job='" + txtJobcarno.Text.Trim() + "'";

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
        qry3 = "select partdesc,dlrrate from [dbo].[partmast] where part='" + txtPartNo.Text.Trim() + "'";
        countP = con.SqlDs(qry3, 2).Tables[0].Rows.Count;
        if (countP == 0)
        {
            msgBox1.alert("No such part number exist!");
            return;

        }
        foreach (DataRow dr in con.SqlDs(qry3, 2).Tables[0].Rows)
        {
            txtPartname.Text = dr[0].ToString();
            Decimal amts = Convert.ToDecimal(dr[1]) * 2;
            //Decimal amtss = amts * 2;
            txtamt.Text = amts.ToString();
        }
    }
    protected void clear()
    {

        txtPartNo.Text = "";
        txtModel.Text = "";
        txtVin.Text = "";
        txtPartname.Text = "";
        txttech.Text = "";
        cmbServEng.Text = "";
        txtRegno.Text = "";
        txtamt.Text = "";
        txtJobcarno.Text = "";
        txtCust.Text = "";
        txtQty.Text = "";
    }


    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        if (txtJobcarno.Text == "")
        {
            msgBox1.alert("Please enter job card number!");
            return;
        }
        else if (txtPartNo.Text == "")
        {
            msgBox1.alert("Please enter Part No!");
            return;
        }
        else if (txtPartname.Text == "")
        {
            msgBox1.alert("Please enter part name!");
            return;
        }
        else if (txtCust.Text == "")
        {
            txtQty.Focus();
            msgBox1.alert("Please enter customer name");
            return;
        }

        else if (cmbLabour.Text == "")
        {
            msgBox1.alert("Please enter group name");
            return;
        }
        else if (txtModel.Text == "")
        {
            msgBox1.alert("Please enter car model!");
            return;
        }
        else if (txtVin.Text == "")
        {
            msgBox1.alert("Please enter car VIN no!");
            return;
        }

        else if (txttech.Text == "")
        {
            msgBox1.alert("Please select a technician!");
            return;
        }
        else if (cmbServEng.Text == "")
        {
            msgBox1.alert("Please select a service engineer!");
            return;
        }
        else if (txtRegno.Text == "")
        {
            msgBox1.alert("Please select car registration number!");
            return;
        }
        else if (txtamt.Text == "")
        {
            txtamt.Focus();
            msgBox1.alert("Please enter amount!");
            return;
        }
        else if (txtQty.Text == "")
        {
            txtQty.Focus();
            msgBox1.alert("Please enter quantity!");
            return;
        }
        

        qry1 = "UPDATE LOCALPURCHASE SET groupname = '" + cmbLabour.Text + "',customers = '" + txtCust.Text.Trim() + "', Partname = '" + txtPartname.Text + "', Technician = '" + txttech.Text.Trim() + "', ServEng = '" + cmbServEng.Text + "', Regno ='" + txtRegno.Text + "', Amounts ='" + txtamt.Text + "', Qty = '" + txtQty.Text + "' WHERE LCID=" + Convert.ToInt32(Session["LCID"].ToString()) + "";
        con.SqlDs(qry1, 2);
        Response.Redirect("localpurchase.aspx");
    }

    protected void btndelete_Click(object sender, EventArgs e)
    {
        qry2 = "DELETE FROM LOCALPURCHASE WHERE JobNo='" + txtJobcarno.Text + "' AND reqdate='" + RadDateReq.Text + "'";
        con.SqlDs(qry2, 2);
        Response.Redirect("localpurchase.aspx");
    }

    protected void btncancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("localpurchase.aspx");
    }

    protected void ImageButton1_Click(object sender, System.Web.UI.ImageClickEventArgs e)
    {
        Response.Redirect("LPORep.aspx");
    }
}

