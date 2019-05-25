using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;
using System.Data.SqlClient;
using System.Data;
using System.Net.Mail;

public partial class SendPasbyMail : System.Web.UI.Page
{
    smartcon con = new smartcon();
    int   Count;
    string  qry, firstname, email, bodi, password;
    util Utility = new util();
    protected void Page_Load(object sender, EventArgs e)
    {
       
        try
        {
            //Lblmsg.Text = "Please change your password";
        }
        catch (SqlException ex)
        {
            Response.Redirect("logout.aspx");
        }
        //lblwelcome.Text = "Welcome," + Profile.fullname.ToString() + ".Please change your password before you proceed";
       //passtype= Convert.ToInt32(Profile.passtype);

    }
 
    protected void BtnUpdate_Click(object sender, EventArgs e)
    {
        if (txtUsername.Text.Length <= 1)
        {
            msgBox1.alert("Field cannot be empty!");
            LblPasswordStrength.Text = "Please enter username,field cannot be empty!";
            return;
        }
        qry = "SELECT USER_NAME FROM USERS WHERE USER_NAME='" + txtUsername.Text.Trim() + "'";
        Count = con.SqlDs(qry, 1).Tables[0].Rows.Count;
        if (Count <= 0)
        {
            msgBox1.alert("Username is not correct.");
            return;
        }
        else
        {
            sendemailalerts(txtUsername.Text.Trim());


        }
        LblPasswordStrength.Text = "";
    }


    public void sendemailalerts(string username)
    {

       
            qry = "SELECT FIRSTNAME,USERS.EMAIL,USERS.USER_NAME,PASSWORD FROM USERS WHERE USER_NAME='" + username +"'";
            foreach (DataRow drow in con.SqlDs(qry, 1).Tables[0].Rows)
            {


                firstname = drow[0].ToString();
                email = drow[1].ToString();
                username = drow[2].ToString();
                 password = Users.Users.Decrypt(drow[3].ToString(), true);
                  MailMessage mail = new MailMessage();
                username = "olalekan30@gmail.com";
                password = "muyiwaa12";
                mail.To.Add(email);
                mail.From = new MailAddress("olalekan30@gmail.com");
                mail.Subject = "Your RiskMgr.Net Password";
                bodi = "<html><head></head><body><Table><tr><td width = '1000'>Dear " + firstname + ",</td></tr></table> <td rowspan = '6'><tr><td>Your RiskMgr.net password is " + password + ".For technical issues kindly contact oifakande@yahoo.com.<br />Please click on <a href='http://localhost/RiskMgr.Net/'>Risk Manager.Net </a> to log on and submit your reports if you have not done so.<br /> Regards,<br /> Risk & Compliance Mgmt Dept<br /></body></html>";
                bodi = string.Format(bodi);
                mail.Body = bodi;
                mail.IsBodyHtml = true;
                SmtpClient smtp = new SmtpClient();
                smtp.Host = "smtp.gmail.com"; //Or Your SMTP Server Address
                smtp.Port = 587;
                smtp.Credentials = new System.Net.NetworkCredential(username, password);
                smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                smtp.EnableSsl = true;

                try
                {
                    smtp.Send(mail);
                    Lblmsg.Text = "Password sent sucessfully to your email " + email;

                }
                catch (Exception exp)
                {
                    Utility.insertError(exp.Message);
                Lblmsg.Text = exp.Message;
                    msgBox1.alert(exp.Message);

                }
            }
        }

   
    protected void lklogin_Click(object sender, EventArgs e)
    {
        Response.Redirect("login.aspx");
    }
}