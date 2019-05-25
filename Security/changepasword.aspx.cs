using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;

public partial class changepasword : System.Web.UI.Page
{
    smartcon con = new smartcon();
    string qry, passwords;
    public int passtype;

    protected void Page_Load(object sender, EventArgs e)
    {
        lblwelcome.Text = "Please change your password";
        if (Session["Userid"] == null)
        {
            Response.Write("<script>top.location='../logout.aspx'</script>");
        }
       

    }



    protected void RadButton1_Click(object sender, EventArgs e)
    {
        if (Session["Userid"] == null)
        {
            Response.Write("<script>top.location='../logout.aspx'</script>");
        }
        try
        {
            if (txtPassword1.Text.Length < 4 | txtPassword2.Text.Length < 4)
            {
                msgBox1.alert("Password cannot be less than 4 Characters");
                LblPasswordStrength.Text = "Password cannot be less than 4 Characters";
                return;
            }
            //passtype = 0;
            //if (passtype==1)
            //{
            //  bool matched = (Regex.IsMatch(txtPassword1.Text, "[a-zA-Z]") && Regex.IsMatch(txtPassword1.Text, "[0-9]"));
            //   if (matched==false)
            //            {
            //                msgBox1.alert("Please enter an alphanumeric password");
            //                LblPasswordStrength.Text = "Please enter an alphanumeric password";
            //                return;
            //            }
            //}
            passwords = Users.Users.Encrypt(txtPassword1.Text.Trim(), true);
            qry = "UPDATE USERS SET PASSWORD= '" + passwords + "' WHERE USER_NAME='" + Session["Userid"].ToString() + "'";
            con.SqlDs(qry, 1);
        }
        catch (Exception ex)
        {
            msgBox1.alert(ex.Message);
        }
        msgBox1.alert("Password updated");
        lblwelcome.Text = "Password updated";
        Response.Write("<script>top.location='../main.aspx'</script>");
    }
}