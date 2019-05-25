using System;
using Telerik.Web.UI;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using Telerik.Web.UI.GridExcelBuilder;
using System.Globalization;
using System.Collections;
using Obout.Grid;

public partial class Parts_localpurchase : System.Web.UI.Page
{
    public string strCon = ConfigurationManager.AppSettings["AutoEnhancerConnectionString2"].ToString();
    string selectQuery2, Userid, qry3, qry4, qry2, qry1, qry5,LCID, customerss, IsActionOwnerChkss,qry, qrys, passwords;
    smartcon con = new smartcon();
    SqlConnection Cn;
    SqlDataAdapter myda, myda2;
    DataSet ds, ds2;
    int countJ, countP;
    protected void Page_Load(object sender, EventArgs e)
    {


        if (!IsPostBack)
        {
            Userid = Session["Userid"].ToString();
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
                LCID = oRecord["LCID"].ToString();
                Session["LCID"] = oRecord["LCID"].ToString();
                LCID= Session["LCID"].ToString();
            }
            Response.Redirect("localpurchaseEdit.aspx?LCID="+LCID);
        }


    }

    public DataTable GetDataTablebydateJB()
    {

        string datefroms = String.Format("{0:dd/MM/yyyy}", RadDateFrom.SelectedDate);
        string datetos = String.Format("{0:dd/MM/yyyy}", RadDateTo.SelectedDate);
        qry5 = "SELECT LCID,PartNo,Model,Vin,Partname,Technician,ServEng,Regno,Amounts,Qty,CONVERT(varchar,reqdate, 103) reqdate,JobNo FROM dbo.LOCALPURCHASE WHERE CONVERT(varchar, reqdate,103) >= '" + datefroms + "' AND CONVERT(varchar, reqdate,103) <= '" + datetos + "' and  JobNo='" + txtJobcarno.Text + "' ORDER BY reqdate";


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
        qry5 = "SELECT LCID,PartNo,Model,Vin,Partname,Technician,ServEng,Regno,Amounts,Qty,CONVERT(varchar,reqdate, 103) reqdate,JobNo FROM dbo.LOCALPURCHASE WHERE CONVERT(varchar, reqdate,103) >= '" + datefroms + "' AND CONVERT(varchar, reqdate,103) <= '" + datetos + "' ORDER BY reqdate";


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
        qry4 = "SELECT PartNo,Model,Vin,Partname,Technician,ServEng,Regno,Amounts,Qty,CONVERT(varchar,reqdate, 103),JobNo,customers FROM dbo.LOCALPURCHASE WHERE LCID <= '" + LCID + "' ORDER BY reqdate";

        foreach (DataRow dr in con.SqlDs(qry4, 2).Tables[0].Rows)
        {
            
            txtPartNo.Text = dr[0].ToString();
            txtModel.Text = dr[1].ToString();
            txtVin.Text = dr[2].ToString();
            txtPartname.Text = dr[3].ToString();
            txttech.Text = dr[4].ToString();
            cmbServEng.Text = dr[5].ToString();
            txtRegno.Text = dr[6].ToString();
            txtamt.Text = dr[7].ToString();
            txtQty.Text = dr[8].ToString();
            //RadDateReq. = dr[9].ToString();
            txtJobcarno.Text = dr[10].ToString();
            txtCust.Text = dr[11].ToString();
        }

    }

    public DataTable GetDataTablejobDT()
    {
        string query = "select model,ChassisNo,RegistrationNo from job where job='" + txtJobcarno.Text + "'";

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

   
    protected void txtJobcarno_TextChanged(object sender, EventArgs e)
    {
        qrys = "SELECT Job.model, Job.ChassisNo, Job.RegistrationNo, dbo.ProperCase(Customer.custnamefirst + ' ' + Customer.custnamemiddle + ' ' + Customer.custnamelast),CASE WHEN RIGHT('0' + CAST(ISNULL(mobileno, '') AS VARCHAR(11)), 11) = '0' THEN '' ELSE RIGHT('0' + CAST(ISNULL(mobileno, '') AS VARCHAR(11)), 11) END + ' ' + CASE WHEN RIGHT('0' + CAST(ISNULL(custphone1, '') AS VARCHAR(11)), 11) = '0' THEN '' ELSE RIGHT('0' + CAST(ISNULL(custphone1, '') AS VARCHAR(11)), 11)  END + ' ' + CASE WHEN RIGHT('0' + CAST(ISNULL(custphone2, '') AS VARCHAR(11)), 11) = '0' THEN '' ELSE RIGHT('0' + CAST(ISNULL(custphone2, '') AS VARCHAR(11)), 11) END + ' ' + CASE WHEN RIGHT('0' + CAST(ISNULL(offphone1, '') AS VARCHAR(11)), 11) = '0' THEN '' ELSE RIGHT('0' + CAST(ISNULL(offphone1, '') AS VARCHAR(11)), 11) END + ' ' + CASE WHEN RIGHT('0' + CAST(ISNULL(offphone2, '') AS VARCHAR(11)), 11) = '0' THEN '' ELSE RIGHT('0' + CAST(ISNULL(offphone2, '') AS VARCHAR(11)), 11) END FROM  Job INNER JOIN Customer ON Job.customer = Customer.customer where job='" + txtJobcarno.Text + "'";
        //select* from Job where SUBSTRING(job, 5, 7) = '006896'

        countJ = con.SqlDs(qrys, 2).Tables[0].Rows.Count;
        if (countJ==0)
        {
            msgBox1.alert("No such job card number exist!");
            return;

        }
        foreach (DataRow dr in con.SqlDs(qrys, 2).Tables[0].Rows)
        {
            txtModel.Text = dr[0].ToString();
            txtVin.Text = dr[1].ToString();
            txtRegno.Text = dr[2].ToString();
            txtCust.Text = dr[3].ToString();
        }
    }

    protected void txtPartNo_TextChanged(object sender, EventArgs e)
    {
        qry3 = "select partdesc,dlrrate from [dbo].[partmast] where part='" + txtPartNo.Text + "'";
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

        if (txtJobcarno.Text != "")
        {
            GetDataTablebydateJB();


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
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (txtJobcarno.Text == "")
        {
            msgBox1.alert("Please enter job card number!");
            return;
        }
        else if (txtPartNo.Text == "")
        {
            txtPartNo.Focus();
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
            txtCust.Focus();
            msgBox1.alert("Please enter customer name");
            return;
        }

        else if (txtModel.Text == "")
        {
            txtModel.Focus();
            msgBox1.alert("Please enter car model!");
            return;
        }
        else if (txtVin.Text == "")
        {
            txtVin.Focus();
            msgBox1.alert("Please enter car VIN no!");
            return;
        }
        else if (cmbLabour.Text == "")
        {
            msgBox1.alert("Please enter group name");
            return;
        }

        else if (txttech.Text == "")
        {
            txttech.Focus();
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
            msgBox1.alert("Please enter amount");
            return;
        }
        else if (txtQty.Text == "")
        {
            txtQty.Focus();
            msgBox1.alert("Please enter quantity!");
            return;
        }

        qry = "insert into LOCALPURCHASE(groupname,customers,JobNo,PartNo,Model,Vin,Partname,Technician,ServEng,Regno,Amounts,Qty) VALUES('" + cmbLabour.Text + "','" + txtCust.Text + "','" + txtJobcarno.Text + "','" + txtPartNo.Text + "','" + txtModel.Text + "','" + txtVin.Text + "','" + txtPartname.Text + "','" + txttech.Text + "','" + cmbServEng.Text + "','" + txtRegno.Text + "','" + txtamt.Text + "','" + txtQty.Text + "')";
        con.SqlDs(qry, 2);
        grid1.DataSource = GetDataTablebydateJB();
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
        Response.Redirect("LPORep.aspx");
    }
}

