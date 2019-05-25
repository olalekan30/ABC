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
using System.Net;
public partial class logout : System.Web.UI.Page
{
    smartcon con = new smartcon();
    //Utility Util = new Utility();
    protected void Page_Load(object sender, EventArgs e)
    {

        //error = Profile.error;
        //qry = "Insert into S_USER_TRAIL(COMPUTERIPADDRESS,COMPUTERNAME,USER_ID,DATE_OUT,COMMENTS)VALUES('" + Util.GetLocalIP() + "','" + Dns.GetHostName() + "','" + Profile.Userid + "','" + String.Format("{0:MM/dd/yyyy}", DateTime.Now) + "','LOGGED OUT')";
        //con.SqlDs(qry, 1);
       
        Session["Userid"] = null;
        Session["BranchNames"] = null;
        Session["BILLID"] = null;
        Session["strUid"] = null;
        Session["strPwd"] = null;
        Session["strServer"] = null;
        Session["strDatabase"] = null;
        Session.Clear();
        Session.Abandon();
        Response.Write("<script>top.location='Login.aspx'</script>");




    }
}
