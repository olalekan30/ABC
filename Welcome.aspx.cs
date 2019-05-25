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
using System.Collections.Generic;
using System.Net;
using System.Net.Mail;


public partial class Welcome : System.Web.UI.Page
{

    int dayclosed;
    string months, years, str,monthname, qry, firstname, email, username, bodi, password;
    smartcon con = new smartcon();
    util Utility = new util();

    protected void Page_Load(object sender, EventArgs e)
    {
        //if (!Page.IsPostBack)
        //{
        //    Calendar1.SelectedDate = DateTime.Today;
        //}
        //a = Convert.ToInt32((Application["TotalOnlineUsers"]));
        //lblvisitors.Text = "Number of users online now is  " + Convert.ToString(a);
        //if (a < 10)
        //    lblvisitors.Text = lblvisitors.Text;
        //else if (a < 100)
        //    lblvisitors.Text = lblvisitors.Text;
        //else if (a < 1000)
        // //sendemailalerts();    
        //lblvisitors.Text = lblvisitors.Text;
       

    }


    public void sendemailalerts()
    {

        months = "";
        years = "";
        //Label1.Text = "";
        str = "select DATEPART(mm,CLOSINGDATE) as monthh,DATEPART(yy,CLOSINGDATE) as yearr, DATEDIFF(dd,getdate(),closingdate) as dayclosed,DTENTRYSTATUS  from YEARQTR where status=1";
        foreach (DataRow drow in con.SqlDs(str, 1).Tables[0].Rows)
        {

            months = drow[0].ToString();
            years = drow[1].ToString();
            dayclosed = Convert.ToInt32(drow[2]);
        }
        if (months != "" | months != string.Empty | years != "" | years != string.Empty | dayclosed != 0)
        {

            switch (months)
            {
                case "1":
                    monthname = "January";
                    break;
                case "2":
                    monthname = "February";
                    break;
                case "3":
                    monthname = "March";
                    break;
                case "4":
                    monthname = "April";
                    break;
                case "5":
                    monthname = "May";
                    break;
                case "6":
                    monthname = "June";
                    break;
                case "7":
                    monthname = "July";
                    break;
                case "8":
                    monthname = "August";
                    break;
                case "9":
                    monthname = "September";
                    break;
                case "10":
                    monthname = "October";
                    break;
                case "11":
                    monthname = "November";
                    break;
                case "12":
                    monthname = "December";
                    break;
            }
        }

        if (dayclosed <= 7)
        {
            qry = "SELECT FIRSTNAME,USERS.EMAIL,USERS.USER_NAME FROM USERS";
        foreach (DataRow drow in con.SqlDs(qry, 1).Tables[0].Rows)
        {
           

            firstname = drow[0].ToString();
            email = drow[1].ToString();
            username = drow[2].ToString();
            MailMessage mail = new MailMessage();
            username = "olalekan30@gmail.com";
            password = "muyiwaa12";
            mail.To.Add(email);
            mail.From = new MailAddress("olalekan30@gmail.com");
            mail.Subject = "Submission of Risk Report for the month of " + monthname + "," + years;
            bodi = "<html><head></head><body><Table><tr><td width = '1000'>Dear " + firstname + ",</td></tr></table> <td rowspan = '6'><tr><td>Please note that data entry and report submision for the month of " + monthname + "," + years + " is ending in <font color = 'red'> " + dayclosed + " days!</font> Your username is " + username + " and if you are a first time user your default password is 123456.For technical issues kindly contact oifakande@yahoo.com.<br />Please click on <a href='http://localhost/RiskMgr.Net/'>Risk Manager.Net </a> to log on and submit your reports if you have not done so.<br /> Regards,<br /> Risk & Compliance Mgmt Dept<br /></body></html>";
            bodi = string.Format(bodi);
            mail.Body = bodi;
            mail.IsBodyHtml = true;
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com"; //Or Your SMTP Server Address
                smtp.Port = 587;
            smtp.Credentials = new System.Net.NetworkCredential
                 (username, password);
                smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
            //Or your Smtp Email ID and Password
            smtp.EnableSsl = true;

            try
            {
                smtp.Send(mail);
                //Label1.Text = "e-Mail notification sent sucessfully to " + email;

            }
            catch (Exception exp)
            {
                    Utility.insertError(exp.Message);
                    //Label1.Text = exp.Message;
                    msgBox1.alert(exp.Message);

            }
            }
        }

    }



}
