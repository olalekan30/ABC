<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MRNEdit.aspx.cs" Inherits=" Parts_MRNEdit" %>
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
            width: 79%;
        }
        .auto-style20 {
            width: 72%;
            height: 72px;
        }
        .auto-style22 {
            width: 1291px;
        }
        .auto-style23 {
            width: 1213px;
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
        .auto-style38 {
            width: 1246px;
        }
        .auto-style39 {
            color: #800000;
        }
        .auto-style40 {
            color: #993333;
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
    <form id="form1" runat="server" class="auto-style38">
       
           <div>
    
  
        <table cellpadding="0" cellspacing="0" class="auto-style23">
            <tr>
                <td class="auto-style22">
    
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;<asp:Label ID="Label3" runat="server" Text="Updating Material Reciept Note" Width="312px" CssClass="auto-style9"></asp:Label>
    
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    
                </td>
            </tr>
            <tr>
                <td class="auto-style22">
    
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:ImageButton ID="ImageButton1" runat="server" Height="30px" ImageUrl="~/images/report.png" OnClick="ImageButton1_Click" ToolTip="Generate Material Reciept Note " Width="46px" />
                    &nbsp;<span class="auto-style40">Print</span> <span class="auto-style39">MRN</span>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style22">     
             
                    

                       
                    <table id="lcpurchase" runat="server"  cellpadding="2" cellspacing="2" class="auto-style16">
                        <tr>
                            <td>
                                <table cellpadding="2" cellspacing="2" border="1" class="auto-style20">
                                    <tr>
                                        <td class="auto-style25">
                    <asp:Label ID="Label6" runat="server" Text="Vendor Name:" Width="99px" CssClass="auto-style10"></asp:Label>
                                        </td>
                                        <td class="auto-style24">
                                            <telerik:RadTextBox ID="txtVendor" Runat="server"  LabelWidth="64px"  Resize="None" Width="250px"  >
                                            </telerik:RadTextBox>
                                        </td>
                                        <td class="auto-style30">
                    <asp:Label ID="Label16" runat="server" Text="Reciept No:" Width="87px" CssClass="auto-style10"></asp:Label>
                                        </td>
                                        <td class="auto-style36">
                                            <telerik:RadTextBox ID="txtRecNo" Runat="server" LabelWidth="64px"  Resize="None" Width="160px" >
                                            </telerik:RadTextBox>
                    
                                        </td>
                                        <td class="auto-style34">
                    <asp:Label ID="Label17" runat="server" Text="Reciept Date :" Width="92px" CssClass="auto-style10"></asp:Label>
                                        </td>
                                        <td>
                    <telerik:RadDatePicker ID="RadRecDate" Runat="server" Culture="en-US" RenderMode="Auto" ShowPopupOnFocus="True">
<Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;" RenderMode="Auto"></Calendar>

<DateInput DisplayDateFormat="dd/MM/yyyy" DateFormat="dd/MM/yyyy" LabelWidth="40%" RenderMode="Auto">
<EmptyMessageStyle Resize="None"></EmptyMessageStyle>

<ReadOnlyStyle Resize="None"></ReadOnlyStyle>

<FocusedStyle Resize="None"></FocusedStyle>

<DisabledStyle Resize="None"></DisabledStyle>

<InvalidStyle Resize="None"></InvalidStyle>

<HoveredStyle Resize="None"></HoveredStyle>

<EnabledStyle Resize="None"></EnabledStyle>
</DateInput>

<DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
                    </telerik:RadDatePicker>
                    
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style29">
                    <asp:Label ID="Label7" runat="server" Text="Part Number:" Width="87px" CssClass="auto-style10"></asp:Label>
                                        </td>
                                        <td class="auto-style27">
                                            <telerik:RadTextBox ID="txtPartNo" Runat="server" AutoPostBack="True" LabelWidth="64px"  Resize="None" Width="250px" OnTextChanged="txtPartNo_TextChanged" >
                                            </telerik:RadTextBox>
                                        </td>
                                        <td class="auto-style31">
                    <asp:Label ID="Label8" runat="server" Text="Part Name:" Width="76px" CssClass="auto-style10"></asp:Label>
                                        </td>
                                        <td class="auto-style37">
                                            <telerik:RadTextBox ID="txtPartname" Width="250px" Runat="server" ReadOnly="True">
                                            </telerik:RadTextBox>
                                        </td>
                                        <td class="auto-style35">
                    <asp:Label ID="Label12" runat="server" Text="Tax Form:" Width="87px" CssClass="auto-style10"></asp:Label>
                                        </td>
                                        <td class="auto-style28">
                                            <telerik:RadTextBox ID="txtform" Runat="server">
                                            </telerik:RadTextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style29">
                    <asp:Label ID="Label14" runat="server" Text="Qty:" Width="48px" CssClass="auto-style10"></asp:Label>
                                        </td>
                                        <td class="auto-style27">
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
                                        <td class="auto-style31">
                    <asp:Label ID="Label11" runat="server" Text="Qty Recieved:" Width="93px" CssClass="auto-style10"></asp:Label>
                                        </td>
                                        <td class="auto-style37">
                                            <telerik:RadNumericTextBox ID="txtQtyRec" Runat="server" DataType="System.Int32" EnableViewState="False">
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
                    <asp:Label ID="Label15" runat="server" Text="Amount:" Width="57px" CssClass="auto-style10"></asp:Label>
                                        </td>
                                        <td class="auto-style28">
                                            <telerik:RadNumericTextBox ID="txtamt" Runat="server" DataType="System.Decimal" EnableViewState="False">
                                            </telerik:RadNumericTextBox>
                                        </td>
                                    </tr>
                                    <%--<tr>--%>
                                    <tr>
                                        <td class="auto-style29">
                    <asp:Label ID="Label9" runat="server" Text="Flag:" Width="87px" CssClass="auto-style10"></asp:Label>
                                        </td>
                                        <td class="auto-style27">
                                            <telerik:RadComboBox ID="cmbFlag" Runat="server">
                                                   <Items>
                                                    <telerik:RadComboBoxItem runat="server" Text="PL-1" Value="PL-1" />
                                                    <telerik:RadComboBoxItem runat="server" Text="PL-2" Value="PL-2" />
                                                    <telerik:RadComboBoxItem runat="server" Text="Running Repair" Value="Running Repair" />
                                                </Items>
                                            </telerik:RadComboBox>
                                        </td>
                                        <td class="auto-style31">
                    <asp:Label ID="Label18" runat="server" Text="Procured By:" Width="93px" CssClass="auto-style10"></asp:Label>
                                        </td>
                                        <td class="auto-style37">
                                            <telerik:RadTextBox ID="txtProcby" Width="250px" Runat="server">
                                            </telerik:RadTextBox>
                                        </td>
                                        <td class="auto-style35">
                                            &nbsp;</td>
                                        <td class="auto-style28">
                                            &nbsp;</td>
                                    </tr>
                                        <td colspan="6">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnAdd" runat="server" OnClientClick="ShowReport();" Text="Save" Width="112px" OnClick="btnAdd_Click"  />
                    <asp:Button ID="btndelete" runat="server"  OnClientClick="return ConfirmOnDelete();"  Text="Delete" Width="112px" OnClick="btndelete_Click"  />
                    <asp:Button ID="btnClear" runat="server" Text="Clear" Width="112px" OnClick="btnClear_Click" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                         
                        </tr>
                    </table>
   
            </div>       
 
                   
                   
		        <cc1:msgBox ID="msgBox2" runat="server" />

                     
                   
                                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    
                     
                   
                                <cc1:msgBox ID="msgBox1" runat="server" />
    
                     
                   
                              
  
        
  
    </form>
</body>
</html>

