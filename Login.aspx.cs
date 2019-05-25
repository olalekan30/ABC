using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.IO;
using System.Net;
using System.Web;
using System.Web.SessionState;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Globalization;
using System.Web.Profile;
using System.Text.RegularExpressions;
using System.Net.Security;
using System.Security.Cryptography.X509Certificates;
using System.Web.Configuration;
using System.Collections.Specialized;
//using ConnectLibrary;

public partial class Login : System.Web.UI.Page
{

    public string locked,constrings, enddates, BranchNames,pass, DptName, sConnectionString, SqlLogin, tiffpath1, tiffpath2, tiffpath3, todaysdate, futuredate, passwords, ls_attempt, ls_comment;
    public SqlCommand cmd, cmd1;
    int Count, passtype;
    public string passes,servernames;
    public string nameP = "dbpassword";
    public string nameS = "dbServer";
    public string constsql = ConfigurationManager.AppSettings["IIPLReports"].ToString();
    public string PenComWebserviceLog, filename, localComputerName, localcomputeripaddress, qry;
    util Utility = new util();
    //Users Pass = new Users();
    smartcon con = new smartcon();
    SqlConnection Cn;
    SqlDataAdapter myda, myda2;
    DataSet ds;
    private object webConfigApp;

    protected void Page_Load(object sender, EventArgs e)
    {
        Session["BranchNames"] = null;
        Session["BILLID"] = null;
         Session["strUid"] = null;
        Session["strPwd"] = null;
        Session["strServer"] = null;
        Session["strDatabase"] = null;
        Session["Userid"] = null;
        //Configuration webConfigApp = WebConfigurationManager.OpenWebConfiguration("~");
        //todaysdate = DateTime.Now.ToString("dd/MM/yyyy");
        //passwords = Users.Users.Encrypt("123456", true);
        //enddates = Users.Users.Encrypt("02/08/2019", true);


    }
    private void LoadDataDept()
    {
        qry = "SELECT DepartmentID,DepartmentName from Department";
        Cn = new SqlConnection(constsql);
        myda = new SqlDataAdapter(qry, Cn);
        ds = new DataSet();
        myda.Fill(ds);
        RadLocation.DataSource = ds.Tables[0];
        RadLocation.DataTextField = ds.Tables[0].Columns["DepartmentName"].ColumnName.ToString();
        RadLocation.DataValueField = ds.Tables[0].Columns["DepartmentID"].ColumnName.ToString();
        RadLocation.DataBind();
    }


    protected void btnLogin_Click(object sender, EventArgs e)
    {
        try
        {
            string Key_c = "AutoEnhancerConnectionString";
            string name = "AutoEnhancerConnectionString";
            string Value_c = RadLocation.SelectedValue;
            Session["BranchNames"] = RadLocation.SelectedItem.Text;
             BranchNames = Session["BranchNames"].ToString();
       
            Configuration webConfigApp = WebConfigurationManager.OpenWebConfiguration("~");
            webConfigApp.AppSettings.Settings[Key_c].Value = Value_c;
            webConfigApp.Save();


            Configuration webConfigApps = WebConfigurationManager.OpenWebConfiguration("~");
            webConfigApps.ConnectionStrings.ConnectionStrings[name].ConnectionString = Value_c;
            webConfigApps.Save();

            switch (BranchNames)
            {
                case "KP1":
                    passes = "9SA27052009KP1";
                    servernames = "10.3.0.15";
                    //constrings = "";
                    break;
                case "KP2":
                    passes = "9SA27052009KP2$";
                    servernames = "10.100.11.10";
                    break;
                case "Abuja":
                    passes = "9SA03082009ABJ$";
                    servernames = "10.100.15.10";
                    break;
                case "PHC":
                    passes = "9SA04112009PHC$";
                    servernames = "10.100.12.10";
                    break;
                case "Kano":
                    passes = "9SA08092009KAN$";
                    servernames = "10.100.16.9";
                    break;
                case "KP2BackUp":
                    passes = "9SA27052009KP2$";
                    servernames = "10.3.0.15\\KP2_AE";
                    break;
            }

            Configuration webConfigAppss = WebConfigurationManager.OpenWebConfiguration("~");
            webConfigAppss.AppSettings.Settings[nameP].Value = passes;
            webConfigAppss.Save();

            Configuration webConfigAppServ = WebConfigurationManager.OpenWebConfiguration("~");
            webConfigAppServ.AppSettings.Settings[nameS].Value = servernames;
            webConfigAppServ.Save();


    }
        catch (Exception ex)
        {
            msgBox1.alert(ex.Message);
            Utility.insertError(ex.Message);
        }
        Session["Userid"] =txtUsername.Text;
        passwords = Users.Users.Encrypt(txtPassword.Text, true);
        SqlLogin = "exec proc_getuserlogin '" + txtUsername.Text + "', '" + passwords + "'";
        try
        {
            passtype = 0;
            if (passtype != 0)
            {

                bool matched = (Regex.IsMatch(txtPassword.Text, "[a-zA-Z]") && Regex.IsMatch(txtPassword.Text, "[0-9]"));

                if (matched == false)
                {
                    msgBox1.alert("Please enter an alphanumeric password");
                    return;
                }
            }
            Count = con.SqlDs(SqlLogin, 1).Tables[0].Rows.Count;
            if (Count <= 0)
            {
                msgBox1.alert("Either your username or password is not correct.");
                return;
            }
            else
            {
                foreach (DataRow dr in con.SqlDs(SqlLogin, 1).Tables[0].Rows)
                {

                    Session["fullname"] = dr[1].ToString();
               
                    Session["Userid"] = dr[2].ToString();
                 
                    locked = dr[4].ToString().Trim();

                    pass = dr[5].ToString();
    
                    Session["DptName"] = dr[6].ToString();
                    Session["GroupName"] = dr[7].ToString();
                    Session["ActionOwner"] = dr[8].ToString();
                    Session["Userids"] = dr[10].ToString();

                    Session["strUid"] = System.Configuration.ConfigurationManager.AppSettings["dbusername"].ToString();
                    Session["strPwd"] = System.Configuration.ConfigurationManager.AppSettings["dbpassword"].ToString();
                    Session["strServer"] = System.Configuration.ConfigurationManager.AppSettings["dbServer"].ToString();
                    Session["strDatabase"] = System.Configuration.ConfigurationManager.AppSettings["dbDatabase"].ToString();

                    if (locked == "T")
                    {
                        msgBox1.alert("This account is currently locked please contact your System Adminitrator");
                        return;
                    }
                    pass = Users.Users.Decrypt(pass.Trim(),true);
                    if (pass == "123456")
                    {
                   
                        Response.Redirect("./Security/changepasword.aspx");
                    }

                }


              

                Response.Redirect("main.aspx");
        }
    }
            catch (Exception ex)
            {
                msgBox1.alert(ex.Message);
                Utility.insertError(ex.Message);
            }
    }

        
    }
