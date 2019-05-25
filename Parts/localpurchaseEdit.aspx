<%@ Page Language="C#" AutoEventWireup="true" CodeFile="localpurchaseEdit.aspx.cs" Inherits=" Parts_localpurchaseEdit" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<%@ Register assembly="msgBox" namespace="BunnyBear" tagprefix="cc1" %>
<%@ Register TagPrefix="oajax" Namespace="OboutInc" Assembly="obout_AJAXPage" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register assembly="msgBox" namespace="BunnyBear" tagprefix="cc1" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">

        .auto-style9 {
            font-size: x-large;
            color: #000066;
        }
        .auto-style10 {
            color: #000066;
            margin-top: 0px;
        }
        .auto-style16 {
            width: 73%;
        }
        .auto-style20 {
            width: 72%;
            height: 72px;
        }
        .auto-style22 {
            width: 1361px;
        }
        .auto-style23 {
            width: 1292px;
            height: 198px;
        }
        .auto-style24 {
            width: 129px;
        }
        .auto-style25 {
            width: 146px;
            text-align: right;
        }
        .auto-style27 {
            width: 129px;
            height: 19px;
        }
        .auto-style28 {
            height: 19px;
        }
        .auto-style29 {
            width: 146px;
            height: 19px;
            text-align: right;
        }
        .auto-style30 {
            text-align: right;
        }
        .auto-style31 {
            height: 19px;
            text-align: right;
        }
        .auto-style34 {
            text-align: right;
            width: 114px;
        }
        .auto-style35 {
            height: 19px;
            text-align: right;
            width: 114px;
        }
        .auto-style36 {
            width: 145px;
        }
        .auto-style37 {
            height: 19px;
            width: 145px;
        }
        </style>
       <script language="javascript"   type="text/javascript">
         function exportToExcel() {

             grid1.exportToExcel('test', false, false, true, true)
         }
         function showLoadingMessage() {
             document.getElementById('loadingContainer').style.display = '';
         }

         function hideLoadingMessage() {
             document.getElementById('loadingContainer').style.display = 'none';
         }
         function hideLoading() {
             document.getElementById('pageIsLoading').style.display = 'none'; // DOM3 (IE5, NS6) only
         }
         function ShowLoading() {
             document.getElementById('pageIsLoading').style.display = 'Block'; // DOM3 (IE5, NS6) only
         }
         function hideReport() {
             document.getElementById('ReportIsLoading').style.display = 'none'; // DOM3 (IE5, NS6) only
         }
         function ShowReport() {
             document.getElementById('ReportIsLoading').style.display = 'Block'; // DOM3 (IE5, NS6) only
         }
		</script>
     <script type="text/javascript">
        var applyFilterTimeout = null;

        function applyFilter() {
            if (applyFilterTimeout) {
                window.clearTimeout(applyFilterTimeout);
            }

            applyFilterTimeout = window.setTimeout(doFiltering, 1000);
        }

        function doFiltering() {
            grid1.filter();
        }
	</script>
     <script type="text/javascript">
         function ConfirmOnDelete() {
             var Ok = confirm('Are you sure want to delete this record?');
             if (Ok)
                 return true;
             else
                 return false;
         }
    </script>
</head>
<body onload="hideLoading();hideReport();">
    <form id="form1" runat="server">
       
                    

                       
                                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    
                     
                   
           <div>
    
  
        <table cellpadding="0" cellspacing="0" class="auto-style23">
            <tr>
                <td class="auto-style22">
    
                    &nbsp;<asp:Label ID="Label18" runat="server" Text="Requsition Date:" Width="108px" CssClass="auto-style10"></asp:Label>
                    <asp:Label ID="RadDateReq" runat="server" Width="144px" CssClass="auto-style10"></asp:Label>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:Label ID="Label3" runat="server" Text="Updating Local Purchase Order" Width="306px" CssClass="auto-style9"></asp:Label>
    
                </td>
            </tr>
            <tr>
                <td class="auto-style22">
    
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:ImageButton ID="ImageButton1" runat="server" Height="35px" ImageUrl="~/images/report.png" OnClick="ImageButton1_Click" Width="48px" ToolTip="Genetate Local Purchase Order" />
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style22">     
             
                    

                       
                    <table id="lcpurchase" runat="server"  cellpadding="2" cellspacing="2" class="auto-style16">
                        <tr>
                            <td>
                                <table cellpadding="2" cellspacing="2" border="1" class="auto-style20">
                                    <tr>
                                        <td class="auto-style25">
                    <asp:Label ID="Label6" runat="server" Text="Job Card No:" Width="92px" CssClass="auto-style10"></asp:Label>
                                        </td>
                                        <td class="auto-style24">
                    <asp:Label ID="txtJobcarno" runat="server" Width="155px" CssClass="auto-style10"></asp:Label>
                                        </td>
                                        <td class="auto-style30">
                    <asp:Label ID="Label16" runat="server" Text="Group:" Width="87px" CssClass="auto-style10"></asp:Label>
                                        </td>
                                        <td class="auto-style36">
                                            <telerik:RadComboBox ID="cmbLabour" Runat="server">
                                                <Items>
                                                    <telerik:RadComboBoxItem runat="server" Text="PL-1" Value="PL-1" />
                                                    <telerik:RadComboBoxItem runat="server" Text="PL-2" Value="PL-2" />
                                                    <telerik:RadComboBoxItem runat="server" Text="REPAIRS" Value="REPAIRS" />
                                                </Items>
                                            </telerik:RadComboBox>
                    
                                        </td>
                                        <td class="auto-style34">
                    <asp:Label ID="Label7" runat="server" Text="Part Number:" Width="87px" CssClass="auto-style10"></asp:Label>
                                        </td>
                                        <td>
                                            <telerik:RadTextBox ID="txtPartNo" Runat="server" AutoPostBack="True" LabelWidth="64px"  Resize="None" Width="250px" OnTextChanged="txtPartNo_TextChanged" >
                                            </telerik:RadTextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style29">
                    <asp:Label ID="Label9" runat="server" Text="Model:" Width="87px" CssClass="auto-style10"></asp:Label>
                                        </td>
                                        <td class="auto-style27">
                                            <telerik:RadTextBox ID="txtModel" Runat="server" ReadOnly="True">
                                            </telerik:RadTextBox>
                                        </td>
                                        <td class="auto-style31">
                    <asp:Label ID="Label10" runat="server" Text="Vin No:" Width="87px" CssClass="auto-style10"></asp:Label>
                                        </td>
                                        <td class="auto-style37">
                                            <telerik:RadTextBox ID="txtVin" Runat="server" Width="250px" ReadOnly="True">
                                            </telerik:RadTextBox>
                                        </td>
                                        <td class="auto-style35">
                    <asp:Label ID="Label8" runat="server" Text="Part Name:" Width="76px" CssClass="auto-style10"></asp:Label>
                                        </td>
                                        <td class="auto-style28">
                                            <telerik:RadTextBox ID="txtPartname" Width="250px" Runat="server" ReadOnly="True">
                                            </telerik:RadTextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style29">
                    <asp:Label ID="Label12" runat="server" Text="Technician:" Width="87px" CssClass="auto-style10"></asp:Label>
                                        </td>
                                        <td class="auto-style27">
                                            <telerik:RadTextBox ID="txttech" Runat="server">
                                            </telerik:RadTextBox>
                                        </td>
                                        <td class="auto-style31">
                    <asp:Label ID="Label13" runat="server" Text="Serv Eng:" Width="87px" CssClass="auto-style10"></asp:Label>
                                        </td>
                                        <td class="auto-style37">
                                            <telerik:RadComboBox ID="cmbServEng" Runat="server">
                                          <Items>
                                                    <telerik:RadComboBoxItem runat="server" Text="Dipin Nair" Value="Dipin Nair" />
                                                    <telerik:RadComboBoxItem runat="server" Text="Micheal Falusi" Value="Micheal Falusi" />
                                                    <telerik:RadComboBoxItem runat="server" Text="Isiaka Kamorudeen" Value="Isiaka Kamorudeen" />
                                                </Items>
                                            </telerik:RadComboBox>
                                        </td>
                                        <td class="auto-style35">
                    <asp:Label ID="Label11" runat="server" Text="Reg No:" Width="76px" CssClass="auto-style10"></asp:Label>
                                        </td>
                                        <td class="auto-style28">
                                            <telerik:RadTextBox ID="txtRegno" Width="250px" Runat="server" ReadOnly="True">
                                            </telerik:RadTextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style29">
                    <asp:Label ID="Label15" runat="server" Text="Amount:" Width="57px" CssClass="auto-style10"></asp:Label>
                                        </td>
                                        <td class="auto-style27">
                                            <telerik:RadNumericTextBox ID="txtamt" Runat="server" DataType="System.Decimal" EnableViewState="False">
                                            </telerik:RadNumericTextBox>
                                        </td>
                                        <td class="auto-style31">
                    <asp:Label ID="Label14" runat="server" Text="Qty:" Width="48px" CssClass="auto-style10"></asp:Label>
                                        </td>
                                        <td class="auto-style37">
                                            <telerik:RadNumericTextBox ID="txtQty" Runat="server" DataType="System.Int32" EnableViewState="False">
<NegativeStyle Resize="None"></NegativeStyle>

<NumberFormat ZeroPattern="n" DecimalDigits="0"></NumberFormat>

<EmptyMessageStyle Resize="None"></EmptyMessageStyle>

<ReadOnlyStyle Resize="None"></ReadOnlyStyle>

<FocusedStyle Resize="None"></FocusedStyle>

<DisabledStyle Resize="None"></DisabledStyle>

<InvalidStyle Resize="None"></InvalidStyle>

<HoveredStyle Resize="None"></HoveredStyle>

<EnabledStyle Resize="None"></EnabledStyle>
                                            </telerik:RadNumericTextBox>
                                        </td>
                                        <td class="auto-style35">
                    <asp:Label ID="Label17" runat="server" Text="Customer Name:" Width="113px" CssClass="auto-style10"></asp:Label>
                                        </td>
                                        <td class="auto-style28">
                                            <telerik:RadTextBox ID="txtCust" Runat="server" Width="250px" ReadOnly="True">
                                            </telerik:RadTextBox>
                                        </td>
                                    </tr>
                                    <%--<tr>--%>
                                        <td colspan="6">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnUpdate" runat="server" OnClientClick="ShowReport();" Text="Update" Width="112px" OnClick="btnUpdate_Click" />
                    <asp:Button ID="btndelete" runat="server"  OnClientClick="return ConfirmOnDelete();"  Text="Delete" Width="112px" OnClick="btndelete_Click"  />
                    <asp:Button ID="btncancel" runat="server"    Text="Cancel" Width="112px" OnClick="btncancel_Click"   />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                         
                        </tr>
                    </table>
   
            </div>       
 
                     
                   
		        <td>     
             
                    

                       
                                &nbsp;<td>     
             
                    

                       
  
        
  
    </form>
           </div>
           <p>
    
                     
                   
                                <cc1:msgBox ID="msgBox1" runat="server" />
    
                     
                   
                              
  
        
  
                </p>
</body>
</html>

