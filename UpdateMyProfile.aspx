<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UpdateMyProfile.aspx.cs" Inherits="UpdateMyProfile" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link href="css/Styles.css" rel="stylesheet" />
      <script type="text/javascript" src="scripts.js"></script>
    <style type="text/css">
        .auto-style4 {
            width: 859px;
            height: 349px;
            margin-bottom: 0px;
        }
        .auto-style5 {
            width: 853px;
            height: 347px;
        }
    </style>
</head>
<body style="height: 437px; width: 892px">
    <form id="form1" runat="server">
 <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
        <telerik:RadFormDecorator RenderMode="Lightweight" Skin="Office2010Blue" ID="FormDecorator1" runat="server" DecoratedControls="All" ControlsToSkip="Zone" />
    <div class="auto-style4" id="DemoContainer" runat="server">
                <fieldset class="auto-style5" >
        <telerik:RadAjaxPanel runat="server" EnableAJAX="true" ID="RadAjaxPanel1" LoadingPanelID="RadAjaxLoadingPanel1" CssClass="demo-container no-bg" Height="320px" Width="863px"  >
 
                    <telerik:RadDataForm ID="RadDataForm1" runat="server" DataKeyNames="USER_NAME" OnItemCreated="RadDataForm1_ItemCreated"  OnItemUpdated="RadDataForm1_ItemUpdated" OnItemUpdating="RadDataForm1_ItemUpdating" OnNeedDataSource="RadDataForm1_NeedDataSource" RenderMode="Lightweight" Skin="Office2010Blue">
                        <LayoutTemplate>
                            <asp:PlaceHolder ID="itemPlaceholder" runat="server"></asp:PlaceHolder>
                        </LayoutTemplate>
                        <ItemTemplate>
                            <fieldset class="rdfFieldset rdfBorders">
                                  <img src="../images/profileImg.png" alt="Profile image" class="profile-img" />
                                <legend class="rdfLegend">
                                    <div class="rdfHeaderInner">
                                        Update My Profile</div>
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
                                    <telerik:RadButton ID="ButtonEdit" Enabled="false" runat="server" CommandName="Edit" RenderMode="Lightweight" Text="Edit" />
                                </div>
                            </fieldset>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <fieldset class="rdfFieldset rdfBorders">
                                   <img src="../images/profileImg.png" alt="Profile image" class="profile-img" />
                                <legend class="rdfLegend">Update My Profile</legend>
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
                                    <telerik:RadButton ID="ButtonUpdate" Enabled="false" runat="server" CommandName="Update" RenderMode="Lightweight" Text="Update" />
                                </div>
                            </fieldset>
                        </EditItemTemplate>
                        
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
