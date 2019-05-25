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
public partial class main : System.Web.UI.Page
{
    public string str,Qtrid6yearname6, qtrname, sql,enddates, cyptarget, userid, cyptarget2,cypsales, cypsales2, bar_blue, Qtrid6yearname7, todaysdate, SQL, branchname, months, monthname, years;
    public string constsql = ConfigurationManager.AppSettings["AutoEnhancerConnectionString2"].ToString();
    public string constsql1 = ConfigurationManager.AppSettings["IIPLReports"].ToString();
    smartcon con = new smartcon();
    int userids;
    int dayclosed, qtrid;
    SqlDataReader oReader;
    public SqlDataReader reader;
    private Boolean hasrows;
    DateTime dt11, dt22;
    TimeSpan ts;
    public int dayDif;
    util Utility= new util();
    public void Page_Load(object sender, System.EventArgs e)
    {
        if (Session["Userid"] == null)
        {
            Response.Write("<script>top.location='logout.aspx'</script>");
        }
        SqlCommand cmd = new SqlCommand();
        SqlConnection conn = new SqlConnection();
        try
        {

            conn.ConnectionString = constsql;
            sql = "select edate from LDATE";
            cmd.CommandText = sql;
            cmd.Connection = conn;
            conn.Open();
            reader = cmd.ExecuteReader();
            hasrows = false;
            while (reader.Read())
            {
                hasrows = true;
                dt11 = DateTime.ParseExact(DateTime.Now.ToString("dd/MM/yyyy"), @"dd/MM/yyyy", CultureInfo.InvariantCulture);
            enddates = Users.Users.Decrypt(reader["edate"].ToString().Trim(), true);
            dt22 = DateTime.ParseExact(enddates, @"dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture);
                ts = dt22 - dt11;
                dayDif = Convert.ToInt32(ts.TotalDays);
                if (dt11 >= dt22 | dayDif <= 0)
                {
                Response.Redirect("logout.aspx");
            }
            }
            if (hasrows == false)
            {
            Response.Redirect("logout.aspx");
             }
        conn.Close();
    }
        catch (Exception ex)
        {
            conn.Close();
            Response.Redirect("logout.aspx");
        }

        if (!Page.IsPostBack)
        {
            Bind();
            bindprofmenu();
        }


        try
        {


            string BranchNames = "You are currently viewing " + Session["BranchNames"].ToString() + " data";

lblbranch.Text = BranchNames;
            lblDept.Text =Session["DptName"].ToString() + " dept";
            lblwelcome.Text = " Welcome " + Session["fullname"].ToString();

        }
        catch (Exception ex)
        {
            Server.Transfer("logout.aspx");
        }


    }

    protected void RadPanelBar1_ItemDataBound(object sender, Telerik.Web.UI.RadPanelBarEventArgs e)
    {
        e.Item.Target = "myiframe";
    }



    void bindprofmenu()
    {
        try
        {
            SqlConnection Cn = new SqlConnection(constsql1);
            SQL = "SELECT  PROFILEMENUITEMS.MENUID, MENUS.ATTACHTO, PROFILEMENUITEMS.ITEMTYPE, PROFILEMENUITEMS.IDS, MENUS.STYLE, MENUS.ID, PROFILEMENUITEMS.HTML, PROFILEMENUITEMS.ICON,PROFILEMENUITEMS.URL, PROFILEMENUITEMS.URLTARGET, PROFILEMENUITEMS.ONCLIENTCLICK FROM PROFILEMENUITEMS INNER JOIN MENUS ON PROFILEMENUITEMS.MENUID = MENUS.ID ORDER BY ID, ATTACHTO,  ORDERS";
            SqlCommand Com = new SqlCommand(SQL, Cn);
            Cn.Open();
            oReader = Com.ExecuteReader();
            string lastMenuId = "";
            EasyMenu oem = null;
            while (oReader.Read())
            {
                if (oReader.GetString(oReader.GetOrdinal("menuID")) != lastMenuId)
                {
                    oem = new EasyMenu();
                    oem.ID = oReader.GetString(oReader.GetOrdinal("menuid"));
                    oem.Position = MenuPosition.Horizontal;
                    oem.Width = "60";
                    oem.UseIcons = true;
                    oem.Align = OboutInc.EasyMenu_Pro.MenuAlign.Under;
                    oem.IconsFolder = "Icons";
                    oem.CSSMenu = "ParentMenu";
                    oem.CSSMenuItemContainer = "ParentItemContainer";
                    CSSClasses MenuItemCssClasses = oem.CSSClassesCollection[oem.CSSClassesCollection.Add(new CSSClasses(typeof(OboutInc.EasyMenu_Pro.MenuItem)))];
                    MenuItemCssClasses.ComponentSubMenuCellOver = "ParentItemSubMenuCellOver";
                    MenuItemCssClasses.ComponentContentCell = "ParentItemContentCell";
                    MenuItemCssClasses.Component = "ParentItem";
                    MenuItemCssClasses.ComponentSubMenuCell = "ParentItemSubMenuCell";
                    MenuItemCssClasses.ComponentIconCellOver = "ParentItemIconCellOver";
                    MenuItemCssClasses.ComponentIconCell = "ParentItemIconCell";
                    MenuItemCssClasses.ComponentOver = "ParentItemOver";
                    MenuItemCssClasses.ComponentContentCellOver = "ParentItemContentCellOver";
                    oem.CSSClassesCollection.Add(MenuItemCssClasses);

                   CSSClasses MenuSeparatorCssClasses = oem.CSSClassesCollection[oem.CSSClassesCollection.Add(new CSSClasses(typeof(MenuSeparator)))];
                   MenuSeparatorCssClasses.ComponentSubMenuCellOver = "ParentSeparatorSubMenuCellOver";
                    MenuSeparatorCssClasses.ComponentContentCell = "ParentSeparatorContentCell";
                    MenuSeparatorCssClasses.Component = "ParentSeparator";
                    MenuSeparatorCssClasses.ComponentSubMenuCell = "ParentSeparatorSubMenuCell";
                    MenuSeparatorCssClasses.ComponentIconCellOver = "ParentSeparatorIconCellOver";
                    MenuSeparatorCssClasses.ComponentIconCell = "ParentSeparatorIconCell";
                    MenuSeparatorCssClasses.ComponentOver = "ParentSeparatorOver";
                    MenuSeparatorCssClasses.ComponentContentCellOver = "ParentSeparatorContentCellOver";
                    oem.CSSClassesCollection.Add(MenuSeparatorCssClasses);

                    oem.StyleFolder = oReader.GetString(oReader.GetOrdinal("style"));
                    if (!oReader.IsDBNull(oReader.GetOrdinal("attachto")))
                    {
                        oem.AttachTo = oReader.GetString(oReader.GetOrdinal("attachto"));
                        oem.ShowEvent = MenuShowEvent.MouseOver;
                        oem.Align = MenuAlign.Under;
                        oem.UseIcons = true;
                        oem.IconsFolder = "Icons";
                        placeHolder1.Controls.Add(oem);
                    }
                    else
                    {
                        oem.UseIcons = true;
                        oem.IconsFolder = "Icons";
                        oem.ShowEvent = MenuShowEvent.Always;
                        oem.Align = MenuAlign.Under;
                        placeHolder1.Controls.Add(oem);
                    }
                }
                if (oReader.GetString(oReader.GetOrdinal("ITEMTYPE")) == "S")
                    oem.AddSeparator(oReader.GetString(oReader.GetOrdinal("b.ID")), oReader.IsDBNull(oReader.GetOrdinal("HTML")) ? "" : oReader.GetString(oReader.GetOrdinal("HTML")));
                else if (oReader.GetString(oReader.GetOrdinal("ITEMTYPE")) == "I")
                    oem.AddMenuItem(oReader.GetString(oReader.GetOrdinal("IDS")), oReader.IsDBNull(oReader.GetOrdinal("HTML")) ? "" : oReader.GetString(oReader.GetOrdinal("HTML")), oReader.IsDBNull(oReader.GetOrdinal("ICON")) ? "" : oReader.GetString(oReader.GetOrdinal("ICON")), oReader.IsDBNull(oReader.GetOrdinal("URL")) ? "" : oReader.GetString(oReader.GetOrdinal("URL")), oReader.IsDBNull(oReader.GetOrdinal("URLTARGET")) ? "" : oReader.GetString(oReader.GetOrdinal("URLTARGET")), oReader.IsDBNull(oReader.GetOrdinal("ONCLIENTCLICK")) ? "" : oReader.GetString(oReader.GetOrdinal("ONCLIENTCLICK")));

                lastMenuId = oReader.GetString(oReader.GetOrdinal("menuID"));
            }

            oReader.Close();
            Cn.Close();
        }


        catch (Exception ex)
        {
            Utility.insertError(ex.Message);
            Response.Write("<script>top.location='logout.aspx'</script>");
        }
    }




    void Bind()
    {

        try
        {
            SqlConnection Cn = new SqlConnection(constsql1);
            userid = Session["Userid"].ToString();
            userids = Convert.ToInt32(Session["Userids"]);
            SQL = "SELECT        MENUITEMS.PARENTID, MENUITEMS.ID, MENUITEMS.TEXT, MENUITEMS.URL, MENUITEMS.URLTARGET FROM  MENUITEMS INNER JOIN MENU_RIGHTS ON MENUITEMS.ID = MENU_RIGHTS.Menuids  WHERE MENU_RIGHTS.USERID=" + userids + " ORDER BY MENUITEMS.ID";
            Cn.Open();
            SqlDataAdapter adapter = new SqlDataAdapter(SQL, Cn);
            DataSet dsMenus = new DataSet("Menus");
            adapter.Fill(dsMenus);
            RadPanelBar1.DataSource = dsMenus;
            RadPanelBar1.DataFieldID = "ID";
            RadPanelBar1.DataFieldParentID = "PARENTID";
            RadPanelBar1.DataTextField = "Text";
            RadPanelBar1.DataValueField = "ID";
            RadPanelBar1.DataNavigateUrlField = "URL";
            RadPanelBar1.ExpandMode = PanelBarExpandMode.MultipleExpandedItems;
            RadPanelBar1.DataBind();

        }


        catch (Exception ex)
        {
            Utility.insertError(ex.Message);
            Response.Write("<script>top.location='logout.aspx'</script>");

        }

    }







}
