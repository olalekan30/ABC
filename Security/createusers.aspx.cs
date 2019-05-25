using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Data.SqlClient;
using Telerik.Web.UI.GridExcelBuilder;
using System.Globalization;

public partial class Security_createusers : System.Web.UI.Page
{
    public string constsql = ConfigurationManager.AppSettings["IIPLReports"].ToString();
    string selectQuery2, IsActionOwnerChkss,qry, qrys, qry2, passwords;
    smartcon con = new smartcon();
    SqlConnection Cn;
    SqlDataAdapter myda, myda2;
    DataSet ds, ds2;
    protected void Page_Load(object sender, EventArgs e)
    {


        if (!IsPostBack)
        {
            LoadDataForRadGrid1();
            RadGrid1.SelectedIndexes.Add(0);

        }


    }
    private void LoadDataForRadGrid1()
    {
        RadGrid1.DataSource = GetDataTableDT();

    }

    public DataTable GetDataTableDT()
    {
        string query = "SELECT        USERS.USER_NAME, USERS.FULL_NAME, BRANCH.BranchName, DEPARTMENT.DepartmentName,IsActionOwner FROM USERS INNER JOIN DEPARTMENT ON USERS.BRANCHID = DEPARTMENT.DepartmentID INNER JOIN BRANCH ON USERS.BRANCHID = BRANCH.BranchID";

        SqlConnection conn = new SqlConnection(constsql);
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



    protected void RadDataForm1_ItemCreated(object sender, Telerik.Web.UI.RadDataFormItemEventArgs e)
    {
        if (e.Item is RadDataFormDataItem && !(e.Item.IsInEditMode))
        {
            RadDataFormDataItem item = e.Item as RadDataFormDataItem;
            RadComboBox RadItemDpdBrch1 = (RadComboBox)item.FindControl("RadItemDpdBrch1");
            qry = "Execute PROC_GET_BRANCH";
            Cn = new SqlConnection(constsql);
            myda = new SqlDataAdapter(qry, Cn);
            ds = new DataSet();
            myda.Fill(ds);
            RadItemDpdBrch1.DataSource = ds.Tables[0];
            RadItemDpdBrch1.DataTextField = ds.Tables[0].Columns["BranchName"].ColumnName.ToString();
            RadItemDpdBrch1.DataValueField = ds.Tables[0].Columns["BRANCHID"].ColumnName.ToString();
            RadItemDpdBrch1.DataBind();

            RadDataFormDataItem items = e.Item as RadDataFormDataItem;
            RadComboBox RadItemDpdDpt1 = (RadComboBox)items.FindControl("RadItemDpdDpt1");
            qry2 = "SELECT DepartmentID,DepartmentName FROM Department";
            myda2 = new SqlDataAdapter(qry2, Cn);
            ds2 = new DataSet();
            myda2.Fill(ds2);
            RadItemDpdDpt1.DataSource = ds2.Tables[0];
            RadItemDpdDpt1.DataTextField = ds2.Tables[0].Columns["DepartmentName"].ColumnName.ToString();
            RadItemDpdDpt1.DataValueField = ds2.Tables[0].Columns["DepartmentID"].ColumnName.ToString();
            RadItemDpdDpt1.DataBind();
        }
        else if (e.Item.IsInEditMode && (e.Item is RadDataFormInsertItem))
        {
            // edit template control

            RadDataFormEditableItem item = e.Item as RadDataFormEditableItem;
            RadComboBox RadItemDpdBrch3 = (RadComboBox)item.FindControl("RadItemDpdBrch3");
            qry = "Execute PROC_GET_BRANCH";
            Cn = new SqlConnection(constsql);
            myda = new SqlDataAdapter(qry, Cn);
            ds = new DataSet();
            myda.Fill(ds);
            RadItemDpdBrch3.DataSource = ds.Tables[0];
            RadItemDpdBrch3.DataTextField = ds.Tables[0].Columns["BranchName"].ColumnName.ToString();
            RadItemDpdBrch3.DataValueField = ds.Tables[0].Columns["BRANCHID"].ColumnName.ToString();
            RadItemDpdBrch3.DataBind();

            RadDataFormDataItem items = e.Item as RadDataFormDataItem;
            RadComboBox RadItemDpdDpt3 = (RadComboBox)items.FindControl("RadItemDpdDpt3");
            qry2 = "SELECT DepartmentID,DepartmentName FROM Department";
            myda2 = new SqlDataAdapter(qry2, Cn);
            ds2 = new DataSet();
            myda2.Fill(ds2);
            RadItemDpdDpt3.DataSource = ds2.Tables[0];
            RadItemDpdDpt3.DataTextField = ds2.Tables[0].Columns["DepartmentName"].ColumnName.ToString();
            RadItemDpdDpt3.DataValueField = ds2.Tables[0].Columns["DepartmentID"].ColumnName.ToString();
            RadItemDpdDpt3.DataBind();

        }
        else if (e.Item.IsInEditMode || (e.Item is RadDataFormEditableItem))
        {
            // edit template control

            RadDataFormEditableItem item = e.Item as RadDataFormEditableItem;
            RadComboBox RadItemDpdBrch2 = (RadComboBox)item.FindControl("RadItemDpdBrch2");
            qry = "Execute PROC_GET_BRANCH";
            Cn = new SqlConnection(constsql);
            myda = new SqlDataAdapter(qry, Cn);
            ds = new DataSet();
            myda.Fill(ds);
            RadItemDpdBrch2.DataSource = ds.Tables[0];
            RadItemDpdBrch2.DataTextField = ds.Tables[0].Columns["BranchName"].ColumnName.ToString();
            RadItemDpdBrch2.DataValueField = ds.Tables[0].Columns["BRANCHID"].ColumnName.ToString();
            RadItemDpdBrch2.DataBind();

            RadDataFormDataItem items = e.Item as RadDataFormDataItem;
            RadComboBox RadItemDpdDpt2 = (RadComboBox)items.FindControl("RadItemDpdDpt2");
            qry2 = "SELECT DepartmentID,DepartmentName FROM Department";
            myda2 = new SqlDataAdapter(qry2, Cn);
            ds2 = new DataSet();
            myda2.Fill(ds2);
            RadItemDpdDpt2.DataSource = ds2.Tables[0];
            RadItemDpdDpt2.DataTextField = ds2.Tables[0].Columns["DepartmentName"].ColumnName.ToString();
            RadItemDpdDpt2.DataValueField = ds2.Tables[0].Columns["DepartmentID"].ColumnName.ToString();
            RadItemDpdDpt2.DataBind();

        }
    }

    protected void RadDataForm1_NeedDataSource(object sender, Telerik.Web.UI.RadDataFormNeedDataSourceEventArgs e)
    {

        (sender as RadDataForm).DataSource = SourceDataTable;
        if (RadGrid1.SelectedItems.Count > 0)
        {
            Session["USER_NAME"] = null;
            Session["USER_NAME"] = RadGrid1.SelectedValue.ToString();
            DataTable sourceDataTable2;
            using (SqlConnection sqlConnection11 = new SqlConnection(constsql))
            {
                sourceDataTable2 = new DataTable();
                selectQuery2 = "SELECT USERS.USERID,USERS.USER_NAME,FIRSTNAME,LASTNAME,EMAIL,BRANCH.BranchName,USERS.BRANCHID,DEPARTMENT.DepartmentName,USERS.DEPARTMENTID,IsActionOwner FROM USERS INNER JOIN DEPARTMENT ON USERS.BRANCHID = DEPARTMENT.DepartmentID INNER JOIN BRANCH ON USERS.BRANCHID = BRANCH.BranchID Where USERS.USER_NAME='" + Session["USER_NAME"].ToString() + "'";
                using (SqlDataAdapter sqlDataAdapter2 = new SqlDataAdapter())
                {
                    sqlDataAdapter2.SelectCommand = new SqlCommand(selectQuery2, sqlConnection11);
                    sqlDataAdapter2.Fill(sourceDataTable2);
                }
            }

        }
        RadDataForm1.DataSource = SourceDataTable2;
    }
    protected void RadGrid1_PageSizeChanged(object sender, GridPageSizeChangedEventArgs e)
    {

        LoadDataForRadGrid1();
        RadGrid1.DataBind();
    }

    protected void RadGrid1_PageIndexChanged(object sender, Telerik.Web.UI.GridPageChangedEventArgs e)
    {
        LoadDataForRadGrid1();
        RadGrid1.DataBind();
    }

    protected void RadGrid1_SortCommand(object sender, Telerik.Web.UI.GridSortCommandEventArgs e)
    {
        LoadDataForRadGrid1();
        RadGrid1.DataBind();
    }


    public static string PropCase(string strText)
    {
        return new CultureInfo("en").TextInfo.ToTitleCase(strText);
    }


    protected void RadGrid1_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
    {
        if (e.CommandName == Telerik.Web.UI.RadGrid.ExportToExcelCommandName)
        {
            RadGrid1.ExportSettings.Excel.Format = (GridExcelExportFormat)Enum.Parse(typeof(GridExcelExportFormat), "Xlsx");
            RadGrid1.ExportSettings.ExportOnlyData=true;
            RadGrid1.ExportSettings.IgnorePaging = true;
            RadGrid1.ExportSettings.OpenInNewWindow = true;
            RadGrid1.ExportSettings.UseItemStyles = true;
            RadGrid1.MasterTableView.ExportToExcel();
            LoadDataForRadGrid1();
            RadGrid1.DataBind();
        }
    }

    protected void RadGrid1_ExcelMLWorkBookCreated(object sender, GridExcelMLWorkBookCreatedEventArgs e)
    {

            foreach (RowElement row in e.WorkBook.Worksheets[0].Table.Rows)
            {
                row.Cells[0].StyleValue = "Style1";
            }

            StyleElement style = new StyleElement("Style1");
            style.InteriorStyle.Pattern = InteriorPatternType.Solid;
            style.InteriorStyle.Color = System.Drawing.Color.LightGray;
            e.WorkBook.Styles.Add(style);
        
    }

    protected void RadGrid1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (RadGrid1.SelectedItems.Count > 0)
        {
            Session["USER_NAME"] = RadGrid1.SelectedValue.ToString();
            DataTable sourceDataTable2;
            using (SqlConnection sqlConnection11 = new SqlConnection(constsql))
            {
                sourceDataTable2 = new DataTable();
                selectQuery2 = "SELECT USERS.USERID,USERS.USER_NAME,FIRSTNAME,LASTNAME,EMAIL,BRANCH.BranchName,USERS.BRANCHID,DEPARTMENT.DepartmentName,USERS.DEPARTMENTID,IsActionOwner FROM USERS INNER JOIN DEPARTMENT ON USERS.BRANCHID = DEPARTMENT.DepartmentID INNER JOIN BRANCH ON USERS.BRANCHID = BRANCH.BranchID Where USERS.USER_NAME='" + Session["USER_NAME"].ToString() + "'";
                using (SqlDataAdapter sqlDataAdapter2 = new SqlDataAdapter())
                {
                    sqlDataAdapter2.SelectCommand = new SqlCommand(selectQuery2, sqlConnection11);
                    sqlDataAdapter2.Fill(sourceDataTable2);
                }
            }

        }
        RadDataForm1.DataSource = SourceDataTable2;

        RadDataForm1.Rebind();
    }

    protected void RadDataForm1_ItemUpdated(object sender, RadDataFormUpdatedEventArgs e)
    {
        LoadDataForRadGrid1();
        RadDataForm1.DataSource = SourceDataTable2;
        RadGrid1.DataBind();

    }



    protected void RadDataForm1_ItemInserting(object sender, Telerik.Web.UI.RadDataFormCommandEventArgs e)
    {
        RadDataFormEditableItem insertedItem = e.DataFormItem as RadDataFormEditableItem;
        Hashtable newValues = new Hashtable();
        insertedItem.ExtractValues(newValues);


        try
        {
            RadComboBox RadItemDpdDpt3 = (RadComboBox)insertedItem.FindControl("RadItemDpdDpt3");
            RadComboBox RadItemDpdBrch3 = (RadComboBox)insertedItem.FindControl("RadItemDpdBrch3");
            CheckBox IsActionOwnerChk2s = (CheckBox)insertedItem.FindControl("IsActionOwnerChk2");
            string email = newValues["EMAIL"].ToString();
            string lastname = PropCase(newValues["LastName"].ToString());
            string username = newValues["USER_NAME"].ToString();
            string FirstName = PropCase(newValues["FirstName"].ToString());

            int deptid = Convert.ToInt32(RadItemDpdDpt3.SelectedValue);
            int brchid = Convert.ToInt32(RadItemDpdBrch3.SelectedValue);
            bool IsActionOwnerChk2 = IsActionOwnerChk2s.Checked;
            if (IsActionOwnerChk2 == true)
            {
                IsActionOwnerChkss = "Yes";
            }
            else
            {
                IsActionOwnerChkss = "No";

            }

                qry = "INSERT INTO USERS(DEPARTMENTID,BRANCHID,USER_NAME,EMAIL,LASTNAME,FIRSTNAME,IsActionOwner)VALUES(" + Convert.ToInt32(RadItemDpdDpt3.SelectedValue) + ", " + Convert.ToInt32(RadItemDpdBrch3.SelectedValue) + ",'" + newValues["USER_NAME"].ToString() + "','" + newValues["EMAIL"].ToString() + "','" + PropCase(newValues["LastName"].ToString()) + "','" + PropCase(newValues["FirstName"].ToString()) + "','" + IsActionOwnerChkss + "')";
                con.SqlDs(qry, 1);
            

        }
        catch (Exception ex)
        {
            con.insertError(ex.Message);
            e.Canceled = true;
        }
        LoadDataForRadGrid1();
        RadGrid1.DataBind();
    }
    protected void RadDataForm1_ItemUpdating(object sender, Telerik.Web.UI.RadDataFormCommandEventArgs e)
    {

        RadDataFormEditableItem editedItem = e.DataFormItem as RadDataFormEditableItem;
        Hashtable newValues = new Hashtable();
        editedItem.ExtractValues(newValues);

        DataTable productsTable = SourceDataTable;

        DataRow[] changedRows = productsTable.Select("USER_NAME = '" + editedItem.GetDataKeyValue("USER_NAME") + "'");

        if (changedRows.Length != 1)
        {
            e.Canceled = true;
            return;
        }
        try
        {
            RadComboBox RadItemDpdDpt2 = (RadComboBox)editedItem.FindControl("RadItemDpdDpt2");
            RadComboBox RadItemDpdBrch2 = (RadComboBox)editedItem.FindControl("RadItemDpdBrch2");
            CheckBox ResetPassCheckBox = (CheckBox)editedItem.FindControl("ResetPassCheckBox1");
            CheckBox IsActionOwnerChk = (CheckBox)editedItem.FindControl("IsActionOwnerChk1");
            string email = newValues["EMAIL"].ToString();
            string lastname = newValues["LastName"].ToString();
            string username = newValues["USER_NAME"].ToString();
            string FirstName = newValues["FirstName"].ToString();
            int id = Convert.ToInt32(newValues["USERID"]);
            int deptid = Convert.ToInt32(RadItemDpdDpt2.SelectedValue);
            int brchid = Convert.ToInt32(RadItemDpdBrch2.SelectedValue);
            bool chkedpass = ResetPassCheckBox.Checked;
            bool IsActionOwnerChks = IsActionOwnerChk.Checked;
            if (IsActionOwnerChks == true)
            {
                IsActionOwnerChkss = "Yes";
            }
            else
            {
                IsActionOwnerChkss = "No";

            }
                if (chkedpass==true)
            {
                passwords = Users.Users.Encrypt("123456", true);
                foreach (DictionaryEntry entry in newValues)
                {
                    qrys = "UPDATE USERS SET IsActionOwner='" + IsActionOwnerChkss + "',PASSWORD='" + passwords + "', DEPARTMENTID=" + Convert.ToInt32(RadItemDpdDpt2.SelectedValue) + ",  BRANCHID=" + Convert.ToInt32(RadItemDpdBrch2.SelectedValue) + ", USER_NAME=  '" + newValues["USER_NAME"].ToString() + "',EMAIL= '" + newValues["EMAIL"].ToString() + "',LASTNAME= '" + PropCase(newValues["LastName"].ToString()) + "',FIRSTNAME= '" + PropCase(newValues["FirstName"].ToString()) + "' WHERE USERID=" + Convert.ToInt32(newValues["USERID"]) + "";
                    con.SqlDs(qrys, 1);
                }
            }
            else
            {

                foreach (DictionaryEntry entry in newValues)
                {
                    qrys = "UPDATE USERS SET IsActionOwner='" + IsActionOwnerChkss + "',DEPARTMENTID=" + Convert.ToInt32(RadItemDpdDpt2.SelectedValue) + ",  BRANCHID=" + Convert.ToInt32(RadItemDpdBrch2.SelectedValue) + ", USER_NAME=  '" + newValues["USER_NAME"].ToString() + "',EMAIL= '" + newValues["EMAIL"].ToString() + "',LASTNAME= '" + PropCase(newValues["LastName"].ToString()) + "',FIRSTNAME= '" + PropCase(newValues["FirstName"].ToString()) + "' WHERE USERID=" + Convert.ToInt32(newValues["USERID"]) + "";
                    con.SqlDs(qrys, 1);
                }

            }

           
        }
        catch (Exception ex)
        {
            con.insertError(ex.Message);
            changedRows[0].CancelEdit();
            e.Canceled = true;
        }
        LoadDataForRadGrid1();
        RadGrid1.DataBind();
    }
    protected void RadDataForm1_ItemDeleting(object sender, Telerik.Web.UI.RadDataFormCommandEventArgs e)
    {
        try
        {
            DataTable productsTable = this.SourceDataTable;

            DataColumn pk = productsTable.Columns["USER_NAME"];
            DataColumn[] pkeys = new DataColumn[1];
            pkeys[0] = pk;
            productsTable.PrimaryKey = pkeys;

            string usersid = e.CommandArgument.ToString();
            qry = "DELETE FROM USERS WHERE USER_NAME='" + usersid + "'";
            con.SqlDs(qry, 1);

        }

        catch (Exception ex)
        {
            con.insertError(ex.Message);
            e.Canceled = true;
        }
        LoadDataForRadGrid1();
        RadGrid1.DataBind();

    }
    private DataTable SourceDataTable
    {

        get
        {
            string selectQuery;
            Object obj = ViewState["SourceDataTable"];
            if (obj != null)
            {
                return (DataTable)obj;
            }
            else
            {
                DataTable sourceDataTable;
            using (SqlConnection sqlConnection1 = new SqlConnection(constsql))
            {
                sourceDataTable = new DataTable();
                if (Session["USER_NAME"] == null)
                {
                    selectQuery = "SELECT  USERS.USERID,USERS.USER_NAME,FIRSTNAME,LASTNAME,EMAIL,BRANCH.BranchName, DEPARTMENT.DepartmentName,USERS.BRANCHID,USERS.DepartmentID FROM USERS INNER JOIN DEPARTMENT ON USERS.BRANCHID = DEPARTMENT.DepartmentID INNER JOIN BRANCH ON USERS.BRANCHID = BRANCH.BranchID";

                }
                else
                {

                    selectQuery = "SELECT    USERS.USERID, USERS.USER_NAME,FIRSTNAME,LASTNAME,EMAIL,BRANCH.BranchName, DEPARTMENT.DepartmentName,USERS.BRANCHID,USERS.DepartmentID FROM USERS INNER JOIN DEPARTMENT ON USERS.BRANCHID = DEPARTMENT.DepartmentID INNER JOIN BRANCH ON USERS.BRANCHID = BRANCH.BranchID Where USERS.USER_NAME='" + Session["USER_NAME"].ToString() + "'";
                }
                using (SqlDataAdapter sqlDataAdapter = new SqlDataAdapter())
                {
                    sqlDataAdapter.SelectCommand = new SqlCommand(selectQuery, sqlConnection1);
                    sqlDataAdapter.Fill(sourceDataTable);
                }
            }
            //ViewState["SourceDataTable"] = sourceDataTable;
            return sourceDataTable;
            }
        }
    }
    private DataTable SourceDataTable2
    {
        get
        {
            Object obj = ViewState["SourceDataTable2"];
            if (obj != null)
            {
                return (DataTable)obj;
            }
            else
            {
                DataTable sourceDataTable2;
                using (SqlConnection sqlConnection11 = new SqlConnection(constsql))
                {
                    sourceDataTable2 = new DataTable();
                    if (Session["USER_NAME"] == null)
                    {
                        selectQuery2 = "SELECT  USERS.USERID,USERS.USER_NAME,FIRSTNAME,LASTNAME,EMAIL,BRANCH.BranchName, DEPARTMENT.DepartmentName,USERS.BRANCHID,USERS.DepartmentID FROM USERS INNER JOIN DEPARTMENT ON USERS.BRANCHID = DEPARTMENT.DepartmentID INNER JOIN BRANCH ON USERS.BRANCHID = BRANCH.BranchID";

                    }
                    else
                    {

                        selectQuery2 = "SELECT    USERS.USERID, USERS.USER_NAME,FIRSTNAME,LASTNAME,EMAIL,BRANCH.BranchName, DEPARTMENT.DepartmentName,USERS.BRANCHID,USERS.DepartmentID FROM USERS INNER JOIN DEPARTMENT ON USERS.BRANCHID = DEPARTMENT.DepartmentID INNER JOIN BRANCH ON USERS.BRANCHID = BRANCH.BranchID Where USERS.USER_NAME='" + Session["USER_NAME"].ToString() + "'";
                    }
                    using (SqlDataAdapter sqlDataAdapter2 = new SqlDataAdapter())
                    {
                        sqlDataAdapter2.SelectCommand = new SqlCommand(selectQuery2, sqlConnection11);
                        sqlDataAdapter2.Fill(sourceDataTable2);
                    }
                }
                //ViewState["SourceDataTable2"] = sourceDataTable2;
                Session["USER_NAME"] = null;
                return sourceDataTable2;
            }
        }
    }
}

