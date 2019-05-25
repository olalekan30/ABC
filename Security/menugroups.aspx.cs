using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class Security_menugroups : System.Web.UI.Page
{
    string qry;
    int userid;
    string sConnectionString = System.Configuration.ConfigurationManager.AppSettings["IIPLReports"].ToString();
    smartcon con = new smartcon();
   SqlConnection Cn;
   SqlDataAdapter myda;
    DataSet ds;
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (Session["Userid"] == null)
        //{
        //    Response.Write("<script>top.location='../logout.aspx'</script>");
        //}
        if (!Page.IsPostBack)
        {

            populateusers();
            populatemodules();

        }
    }
    public void populatemodules()
    {
        qry = "Execute [PROC_GETADMINMENU]";
     
        Cn = new SqlConnection(sConnectionString);
        myda = new SqlDataAdapter(qry, Cn);
        ds = new DataSet();
        myda.Fill(ds);
        chkavailablemenu.DataSource = ds.Tables[0];
        chkavailablemenu.DataTextField = ds.Tables[0].Columns["TEXT"].ToString();
        chkavailablemenu.DataValueField = ds.Tables[0].Columns["ID"].ToString();
        chkavailablemenu.DataBind();

    }
    public void populateusers()
    {
        qry = "Execute [proc_getusers]";
        Cn = new SqlConnection(sConnectionString);
        myda = new SqlDataAdapter(qry, Cn);
        ds = new DataSet();
        myda.Fill(ds);
        RadListBox1.DataSource = ds.Tables[0];
        RadListBox1.DataTextField = ds.Tables[0].Columns["FULL_NAME"].ToString();
        RadListBox1.DataValueField = ds.Tables[0].Columns["USERID"].ToString();
        RadListBox1.DataBind();

    }

    protected void RadListBox1_SelectedIndexChanged(object sender, EventArgs e)
    {
        populateassinedmenus();
    }
    public void populateassinedmenus()
    {
        qry = "Execute [PROC_GETADMINMENU]";
        Cn = new SqlConnection(sConnectionString);
        Cn.Open();
        myda = new SqlDataAdapter(qry, Cn);
        ds = new DataSet();
        myda.Fill(ds);
        chkavailablemenu.DataSource = ds.Tables[0];
        chkavailablemenu.DataTextField = ds.Tables[0].Columns["TEXT"].ColumnName.ToString();
        chkavailablemenu.DataValueField = ds.Tables[0].Columns["ID"].ColumnName.ToString();
        chkavailablemenu.DataBind();
        Cn.Close();
        userid = Convert.ToInt32(RadListBox1.SelectedItem.Value);
        qry = "Execute [PROC_GETADMINMENUDETAILS] " + userid + "";
        foreach (DataRow dr in con.SqlDs(qry, 1).Tables[0].Rows)
        {
            ListItem realmenu = chkavailablemenu.Items.FindByText(dr[1].ToString());
            if (realmenu != null)
            {
                realmenu.Selected = true;
            }
        }

    }



    protected void RadButton1_Click(object sender, EventArgs e)
    {
        //if (Session["Userid"] == null)
        //{
        //    Response.Write("<script>top.location='../logout.aspx'</script>");
        //}
        if (RadListBox1.SelectedIndex == -1)
        {
            msgBox1.alert("Please Select a User to continue!");
            return;
        }

        if (chkavailablemenu.SelectedIndex == -1)
        {
            msgBox1.alert("Please select a menu to continue!");
            return;
        }
        try
        {
            userid = Convert.ToInt32(RadListBox1.SelectedItem.Value);

            qry = "DELETE FROM MENU_RIGHTS WHERE USERID=" + userid + "";
            con.SqlDs(qry, 1);
            foreach (ListItem item in chkavailablemenu.Items)
            {
                if (item.Selected == true)
                {
                    qry = "insert into MENU_RIGHTS(MENUIDS,USERID)VALUES(" + item.Value + "," + userid + ")";
                    con.SqlDs(qry, 1);
                }

            }
        }
        catch (Exception ex)
        {
            msgBox1.alert(ex.Message);
            return;
        }

        //lblmessage.Text = "Menu Saved Sucessfully for user " + userid;
        msgBox1.alert("Menu saved sucessfully for user " + RadListBox1.SelectedItem.Text);
        populateassinedmenus();

    }
 




    protected void RadButton2_Click(object sender, EventArgs e)
    {
        foreach (ListItem li in chkavailablemenu.Items)
        {
            li.Selected = true;
        }
    }

    protected void RadButton3_Click(object sender, EventArgs e)
    {
        foreach (ListItem li in chkavailablemenu.Items)
        {
            li.Selected = false;
        }
    }
}

