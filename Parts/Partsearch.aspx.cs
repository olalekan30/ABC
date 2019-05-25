using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;
using System.IO;
using System.Text;
using System.Globalization;
using Telerik.Web.UI;
using OboutInc.EasyMenu_Pro;
using System.Collections.Generic;
using System.Net;
using System.Net.Mail;
public partial class Partsearch : System.Web.UI.Page
{
    public string str, sqls, Qtrid6yearname6, qtrname, sql, enddates, cyptarget, userid, cyptarget2, cypsales, cypsales2, bar_blue, Qtrid6yearname7, todaysdate, SQL, branchname, months, monthname, years;
    public string constsql = ConfigurationManager.AppSettings["AutoEnhancerConnectionString2"].ToString();
    public string constsql1 = ConfigurationManager.AppSettings["IIPLReports"].ToString();
    smartcon con = new smartcon();
    int userids;
    int dayclosed, qtrid;
    SqlDataReader oReader;
    public SqlDataReader reader;
    SqlCommand cmd;
    SqlConnection conn;
    private Boolean hasrows;
    DateTime dt11, dt22;
    TimeSpan ts;
    public int dayDif;
    string qry, email, firstname, username, host, bodi, subject, SqlLogin, passwordss, locked, pass, password, passwords;
    public int Count, port;
    string _key = "THEREISNOOTHERNAMELIKETHENAMEOFJESUSHEISWORTHOFGLORYANDHONOURANDPRAISE";
    util Utility = new util();
    string partid = string.Empty;
    string partdesc = string.Empty;
    string likeCondition, likeConditions;
    public void Page_Load(object sender, System.EventArgs e)
    {
        grid1.Visible = false;
    }





    protected void Button1_Click(object sender, EventArgs e)
    {
        SendMail("smaharana@kiamotorsnigeria.com", txtemail.Text.Trim(), "service@kiamotorsnigeria.com", "DML Online Parts Enquiry", txtbody.Text.Trim());
        //smaharana@kiamotorsnigeria.com
        //oifakande@kiamotorsnigeria.com
        //olalekan30@yahoo.com
    }


    public string SendMail(string toList, string from, string ccList, string subject, string body)
    {

        MailMessage message = new MailMessage();
        SmtpClient smtpClient = new SmtpClient();
        string msg = string.Empty;
        try
        {
            MailAddress fromAddress = new MailAddress(from);
            message.From = fromAddress;
            message.To.Add(toList);
            if (ccList != null && ccList != string.Empty)
                message.CC.Add(ccList);
            message.Subject = subject;
            message.IsBodyHtml = true;
            message.Body = body;
            smtpClient.Host = "smtp.gmail.com";   // We use gmail as our smtp client
            smtpClient.Port = 587;
            smtpClient.EnableSsl = true;
            smtpClient.UseDefaultCredentials = false;
            smtpClient.Credentials = new System.Net.NetworkCredential("olalekan30@gmail.com", "muyiwaa12");
            smtpClient.Send(message);
            lblmsg.Text = "Message sent,thank you will get back to you soon.";
            msgBox1.alert("Message sent,thank you will get back to you soon.");
        }
        catch (Exception ex)
        {
            //lblmsg.Text = "Message sent,thank you will get back to you soon.";
            //msgBox1.alert("Message sent,thank you will get back to you soon.");
        }
        return msg;
    }


    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {
       sql = "SELECT count(*) FROM [PartEnq] WHERE PART LIKE '%" + TextBox1.Text.Trim() + "%' OR PARTDESC LIKE '%" + TextBox1.Text.Trim() + "%'";
        conn = new SqlConnection(constsql);
        conn.Open();
        cmd = new SqlCommand(sql, conn);
        int counts = Convert.ToInt32(cmd.ExecuteScalar());
        if (counts == 0)
        {
            Label1.CssClass = "gridLabel";
            Label1.Text = "No record found!";
            grid1.DataSource = null;
            grid1.Visible = false;
        }
        else
        {
        sqls = "SELECT [part], [partdesc], MAXQTY" + "  FROM [PartEnq] WHERE PART LIKE '%" + TextBox1.Text.Trim() + "%' OR PARTDESC LIKE '%" + TextBox1.Text.Trim() + "%'";
        cmd = new SqlCommand(sqls, conn);
        SqlDataReader myReader = cmd.ExecuteReader();
        grid1.DataSource = myReader;
        grid1.DataBind();
        grid1.Visible = true;
        Label1.CssClass = "gridLabel";
        Label1.Text = "See below a list of parts available:";
        }
        conn.Close();

    }

}