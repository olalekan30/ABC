<%@ Page Language="C#" AutoEventWireup="true" CodeFile="createusers.aspx.cs" Inherits="Security_createusers" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link href="css/Styles.css" rel="stylesheet" />
      <script type="text/javascript" src="scripts.js"></script>
    <style type="text/css">
        .auto-style4 {
            width: 1179px;
            height: 568px;
        }
        .auto-style5 {
            width: 1177px;
            height: 520px;
        }
    
        .auto-style9 {
            font-size: x-large;
            color: #000066;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
 <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
        <telerik:RadFormDecorator RenderMode="Lightweight" Skin="Office2010Blue" ID="FormDecorator1" runat="server" DecoratedControls="All" ControlsToSkip="Zone" />
    <div class="auto-style4" id="DemoContainer" runat="server">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    
                    <asp:Label ID="Label9" runat="server" Text="User Management" Width="182px" CssClass="auto-style9"></asp:Label>
    
                <fieldset class="auto-style5" >
        <telerik:RadAjaxPanel runat="server" EnableAJAX="true" ID="RadAjaxPanel1" LoadingPanelID="RadAjaxLoadingPanel1" CssClass="demo-container no-bg" Height="311px" Width="1172px"  >
 
            <telerik:RadGrid RenderMode="Lightweight" ID="RadGrid1" runat="server"  
               EnableHeaderContextMenu="True"  AllowAutomaticUpdates="True" AllowAutomaticInserts="True"
            AllowAutomaticDeletes="true" AllowSorting="true"
                EnableHeaderContextFilterMenu="True" PagerStyle-AlwaysVisible="true" 
              
                 Width="547px" OnExcelMLWorkBookCreated="RadGrid1_ExcelMLWorkBookCreated"
                OnSelectedIndexChanged="RadGrid1_SelectedIndexChanged" OnItemCommand="RadGrid1_ItemCommand" 
                 OnSortCommand="RadGrid1_SortCommand" OnPageIndexChanged="RadGrid1_PageIndexChanged" OnPageSizeChanged="RadGrid1_PageSizeChanged"
                 AllowPaging="True" AutoGenerateColumns="False" Skin="Office2010Blue"  GroupPanelPosition="Top" Height="508px">
                <ExportSettings HideStructureColumns="true">
            </ExportSettings>
                <MasterTableView
                    DataKeyNames="USER_NAME" Width="100%" CommandItemDisplay="Top" >
                <CommandItemSettings ShowExportToExcelButton="true"  ShowAddNewRecordButton="false" ShowRefreshButton="false"/>
                <PagerStyle Mode="NextPrevNumericAndAdvanced"></PagerStyle>
                    <Columns>
                         <telerik:GridTemplateColumn HeaderText="#">
                        <ItemTemplate>
                            <%# Container.DataSetIndex+1 %>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                        <telerik:GridBoundColumn DataField="USER_NAME" HeaderText="User Name"      HeaderStyle-Width="300px" ItemStyle-Width="300px"   SortExpression="USER_NAME"
                            UniqueName="USER_NAME" Display="true">
<HeaderStyle Width="300px"></HeaderStyle>

<ItemStyle Width="300px"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="FULL_NAME" HeaderText="Full Name"      HeaderStyle-Width="300px" ItemStyle-Width="300px"   SortExpression="FULL_NAME"
                            UniqueName="FirstName">
<HeaderStyle Width="300px"></HeaderStyle>

<ItemStyle Width="300px"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="DepartmentName"      HeaderStyle-Width="300px" ItemStyle-Width="300px"  HeaderText="Department" SortExpression="DepartmentName"
                            UniqueName="DepartmentName">
<HeaderStyle Width="300px"></HeaderStyle>

<ItemStyle Width="300px"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="BranchName" HeaderText="Branch"      HeaderStyle-Width="300px" ItemStyle-Width="300px"  SortExpression="BranchName"
                            UniqueName="BranchName">
<HeaderStyle Width="300px"></HeaderStyle>

<ItemStyle Width="300px"></ItemStyle>
                        </telerik:GridBoundColumn>
                           <telerik:GridBoundColumn DataField="IsActionOwner" HeaderText="Is Action Owner?"      HeaderStyle-Width="100px" ItemStyle-Width="300px"  SortExpression="IsActionOwner"
                            UniqueName="IsActionOwner">
<HeaderStyle Width="300px"></HeaderStyle>

<ItemStyle Width="300px"></ItemStyle>
                        </telerik:GridBoundColumn>
                    </Columns>
                    <EditFormSettings>
                        <EditColumn ButtonType="ImageButton" />
                    </EditFormSettings>
                </MasterTableView>
                
                <ClientSettings EnablePostBackOnRowClick="true" Selecting-AllowRowSelect="true">
                    <Selecting AllowRowSelect="True" />
                </ClientSettings>
                <PagerStyle AlwaysVisible="True" />
                <FilterMenu RenderMode="Lightweight">
                </FilterMenu>
                <HeaderContextMenu RenderMode="Lightweight">
                </HeaderContextMenu>
            </telerik:RadGrid> 
    
                    <telerik:RadDataForm ID="RadDataForm1" runat="server" DataKeyNames="USER_NAME" OnItemCreated="RadDataForm1_ItemCreated" OnItemDeleting="RadDataForm1_ItemDeleting" OnItemInserting="RadDataForm1_ItemInserting" OnItemUpdated="RadDataForm1_ItemUpdated" OnItemUpdating="RadDataForm1_ItemUpdating" OnNeedDataSource="RadDataForm1_NeedDataSource" RenderMode="Lightweight" Skin="Office2010Blue">
                        <LayoutTemplate>
                            <asp:PlaceHolder ID="itemPlaceholder" runat="server"></asp:PlaceHolder>
                        </LayoutTemplate>
                        <ItemTemplate>
                            <fieldset class="rdfFieldset rdfBorders">
                                  <img src="../images/profileImg.png" alt="Profile image" class="profile-img" />
                                <legend class="rdfLegend">
                                    <div class="rdfHeaderInner">
                                        User Details</div>
                                </legend>
                                <telerik:RadTextBox ID="RadTextBox3" runat="server" RenderMode="Lightweight" Text='<%# Bind("USERID") %>' Visible="false" WrapperCssClass="rdfFieldValue" />
                                  <div class="rdfRow">
                                <asp:Label ID="Label1" runat="server" CssClass="rdfLabel" Text="User Name:"></asp:Label>
                               &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<telerik:RadTextBox ID="RadTextBox1" runat="server" Enabled="false" RenderMode="Lightweight" Text='<%# Eval("USER_NAME") %>' WrapperCssClass="rdfFieldValue" />
                                       </div>
                                <div class="rdfRow">
                                    <asp:Label ID="FirstNameLabel2" runat="server" CssClass="rdfLabel" Text="First Name:"></asp:Label>
                                   &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<telerik:RadTextBox ID="FirstNameTextBox1" runat="server" Enabled="false" RenderMode="Lightweight" Text='<%# Eval("FirstName") %>' WrapperCssClass="rdfFieldValue" />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="LastNameLabel2" runat="server" CssClass="rdfLabel" Text="Last Name:"></asp:Label>
                                    &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<telerik:RadTextBox ID="LastNameTextBox1" runat="server" Enabled="false" RenderMode="Lightweight" Text='<%# Eval("LastName") %>' WrapperCssClass="rdfFieldValue" />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="HomePhoneLabel2" runat="server" CssClass="rdfLabel" Text="Home Phone:"></asp:Label>
                                   &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<telerik:RadTextBox ID="HomePhoneTextBox1" runat="server" Enabled="false" RenderMode="Lightweight" Text='<%# Eval("EMAIL") %>' WrapperCssClass="rdfFieldValue" />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="ExtensionLabel2" runat="server" CssClass="rdfLabel rdfBlock" Text="Branch:"></asp:Label>
                                     &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
                                    <telerik:RadComboBox ID="RadItemDpdBrch1" Skin="Office2010Blue" runat="server" Enabled="false" RenderMode="Lightweight" Width="300px">
                                    </telerik:RadComboBox>
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="Label3" runat="server" CssClass="rdfLabel rdfBlock" Text="Department:"></asp:Label>
                                    &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                                    <telerik:RadComboBox ID="RadItemDpdDpt1" Skin="Office2010Blue" runat="server" Enabled="false" RenderMode="Lightweight" Width="300px">
                                    </telerik:RadComboBox>
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="ResetPasss" runat="server" CssClass="rdfLabel" Text="Reset Password:"></asp:Label>
                                    &nbsp; &nbsp; &nbsp;&nbsp; <asp:CheckBox ID="ResetPassCheckBox" runat="server" Enabled="false" />
                                </div>
                                 <div class="rdfRow">
                                    <asp:Label ID="Label8" runat="server" CssClass="rdfLabel" Text="Is Action Owner?:"></asp:Label>
                                    &nbsp; &nbsp; <asp:CheckBox ID="IsActionOwnerChk"   runat="server" Enabled="false" />
                                </div>
                                <div>
                                    <hr class="rdfHr" />
                                   &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <telerik:RadButton ID="InitInsertButton" runat="server" CausesValidation="False" CommandName="InitInsert" RenderMode="Lightweight" Text="Add New" ToolTip="Insert" />
                                    <telerik:RadButton ID="ButtonEdit" runat="server" CommandName="Edit" RenderMode="Lightweight" Text="Edit" />
                                    <telerik:RadButton ID="DeleteButton" runat="server" ButtonType="SkinnedButton" CausesValidation="False" CommandArgument='<%#Eval("USER_NAME") %>' CommandName="Delete" OnClientClicking="function(sender, args){args.set_cancel(!window.confirm(&quot;Are you sure you want to delete this record?&quot;));}" RenderMode="Lightweight" Text="Delete" ToolTip="Delete" />
                                </div>
                            </fieldset>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <fieldset class="rdfFieldset rdfBorders">
                                   <img src="../images/profileImg.png" alt="Profile image" class="profile-img" />
                                <legend class="rdfLegend">Edit User Details</legend>
                                <telerik:RadTextBox ID="RadTextBox4" runat="server" RenderMode="Lightweight" Text='<%# Bind("USERID") %>' Visible="false" WrapperCssClass="rdfFieldValue" />
                                <div class="rdfRow">
                                    <asp:Label ID="Label2" runat="server" CssClass="rdfLabel rdfBlock" Text="User Name:"></asp:Label>
                                   &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<telerik:RadTextBox ID="RadTextBox2" runat="server" RenderMode="Lightweight" Text='<%# Bind("USER_NAME") %>' WrapperCssClass="rdfFieldValue" />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="FirstNameLabel3" runat="server" CssClass="rdfLabel rdfBlock" Text="First Name:"></asp:Label>
                                   &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<telerik:RadTextBox ID="FirstNameTextBox2" runat="server" RenderMode="Lightweight" Text='<%# Bind("FirstName") %>' WrapperCssClass="rdfFieldValue" />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="LastNameLabel3" runat="server" CssClass="rdfLabel rdfBlock" Text="Last Name:"></asp:Label>
                                    &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                                    <telerik:RadTextBox ID="LastNameTextBox2" runat="server" RenderMode="Lightweight" Text='<%# Bind("LastName") %>' WrapperCssClass="rdfFieldValue" />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="HomePhoneLabel3" runat="server" CssClass="rdfLabel rdfBlock" Text="eMail:"></asp:Label>
                                   &nbsp; &nbsp;&nbsp;  &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;<telerik:RadTextBox ID="emailTextBox2" runat="server" RenderMode="Lightweight" Text='<%# Bind("EMAIL") %>' WrapperCssClass="rdfFieldValue" />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="ExtensionLabel3" runat="server" CssClass="rdfLabel rdfBlock" Text="Branch:"></asp:Label>
                                    &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<telerik:RadComboBox ID="RadItemDpdBrch2" Skin="Office2010Blue"  runat="server" RenderMode="Lightweight" Width="300px">
                                    </telerik:RadComboBox>
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="Label4" runat="server" CssClass="rdfLabel rdfBlock" Text="Department:"></asp:Label>
                                 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<telerik:RadComboBox ID="RadItemDpdDpt2" Skin="Office2010Blue" runat="server" RenderMode="Lightweight" Width="300px">
                                    </telerik:RadComboBox>
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="ResetPass" runat="server" CssClass="rdfLabel" Text="Reset Password:"></asp:Label>
                                   &nbsp; &nbsp;&nbsp; <asp:CheckBox ID="ResetPassCheckBox1" runat="server" Enabled="true" />
                                </div>
                                    <div class="rdfRow">
                                    <asp:Label ID="Label7" runat="server" CssClass="rdfLabel" Text="Is Action Owner?:"></asp:Label>
                                     &nbsp;  <asp:CheckBox ID="IsActionOwnerChk1"  runat="server" Enabled="true" />
                                </div>
                                   <hr class="rdfHr" />
                                <div class="rdfRow">
                               
                                     &nbsp; &nbsp;&nbsp;   &nbsp; &nbsp;&nbsp;    &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                                    <telerik:RadButton ID="ButtonUpdate" runat="server" CommandName="Update" RenderMode="Lightweight" Text="Update" />
                                    <telerik:RadButton ID="CancelButton" runat="server" CommandName="Cancel" RenderMode="Lightweight" Text="Cancel" />
                                </div>
                            </fieldset>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <fieldset class="rdfFieldset rdfBorders">
                                   <img src="../images/profileImg.png" alt="Profile image" class="profile-img" />
                                <legend class="rdfLegend">Add New User Details</legend>
                                <div class="rdfRow">
                                    <asp:Label ID="Label5" runat="server" CssClass="rdfLabel rdfBlock" Text="User Name:"></asp:Label>
                                   &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                                    <telerik:RadTextBox ID="RadTextBox5" runat="server" RenderMode="Lightweight" Text='<%# Bind("USER_NAME") %>' WrapperCssClass="rdfFieldValue" />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="FirstNameLabel4" runat="server" CssClass="rdfLabel rdfBlock" Text="First Name:"></asp:Label>
                                   &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                                    <telerik:RadTextBox ID="FirstNameTextBox3" runat="server" RenderMode="Lightweight" Text='<%# Bind("FirstName") %>' WrapperCssClass="rdfFieldValue" />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="LastNameLabel4" runat="server" CssClass="rdfLabel rdfBlock" Text="Last Name:"></asp:Label>
                                    &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                                    <telerik:RadTextBox ID="LastNameTextBox3" runat="server" RenderMode="Lightweight" Text='<%# Bind("LastName") %>' WrapperCssClass="rdfFieldValue" />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="HomePhoneLabel4" runat="server" CssClass="rdfLabel rdfBlock" Text="eMail:"></asp:Label>
                                  &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                                    <telerik:RadTextBox ID="emailTextBox3" runat="server" RenderMode="Lightweight" Text='<%# Bind("EMAIL") %>' WrapperCssClass="rdfFieldValue" />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="ExtensionLabel4" runat="server" CssClass="rdfLabel rdfBlock" Text="Branch:"></asp:Label>
                                     &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<telerik:RadComboBox ID="RadItemDpdBrch3" runat="server" Skin="Office2010Blue" RenderMode="Lightweight" Width="300px">
                                    </telerik:RadComboBox>
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="Label6" runat="server" CssClass="rdfLabel rdfBlock" Text="Department:"></asp:Label>
                                     &nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<telerik:RadComboBox ID="RadItemDpdDpt3" Skin="Office2010Blue"  runat="server" RenderMode="Lightweight" Width="300px">
                                    </telerik:RadComboBox>
                                </div>
                                    <div class="rdfRow">
                                    <asp:Label ID="Label7" runat="server" CssClass="rdfLabel" Text="Is Action Owner?:"></asp:Label>
                                   &nbsp; &nbsp;&nbsp; <asp:CheckBox ID="IsActionOwnerChk2" Checked='<%# Bind("IsActionOwner") %>' runat="server" Enabled="true" />
                                </div>
                                   <hr class="rdfHr" />
                                <div class="rdfCommandButtons">
                             
                                 &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;  &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <telerik:RadButton ID="PerformInsertButton" runat="server" ButtonType="SkinnedButton" CommandName="PerformInsert" RenderMode="Lightweight" Text="Save" ToolTip="Save" />
                                    <telerik:RadButton ID="CancelButton" runat="server" ButtonType="SkinnedButton" CommandName="Cancel" RenderMode="Lightweight" Text="Cancel" ToolTip="Cancel" />
                                </div>
                            </fieldset>
                        </InsertItemTemplate>
                        <EmptyDataTemplate>
                            <div>
                                <div class="rdfEmpty">
                                    There are no records to be displayed.
                                </div>
                            </div>
                        </EmptyDataTemplate>
                    </telerik:RadDataForm>
                </fieldset></telerik:RadAjaxPanel></div>
             

    </form>

</body>
</html>
