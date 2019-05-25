<%@ Page Language="C#" AutoEventWireup="true" CodeFile="localpurchase.aspx.cs" Inherits=" Parts_localpurchase" %>
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
        .auto-style12 {
            height: 0px;
            width: 1005px;
        }
        .auto-style10 {
            color: #000066;
            margin-top: 0px;
        }
        .auto-style14 {
            width: 64px;
        }
        .auto-style16 {
            width: 82%;
        }
        .auto-style17 {
            position: absolute;
            width: 546px;
            height: 72px;
            top: 290px;
            left: 341px;
        }
        .auto-style18 {
            position: absolute;
            width: 546px;
            height: 72px;
            top: 293px;
            left: 336px;
        }
        .auto-style19 {
            width: 84px;
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
        .auto-style32 {
            width: 129px;
            text-align: right;
        }
        .auto-style33 {
            width: 9px;
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
    <form id="form1" runat="server">
       
           <div>
    
  
        <table cellpadding="0" cellspacing="0" class="auto-style23">
            <tr>
                <td class="auto-style22">
    
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;<asp:Label ID="Label3" runat="server" Text="Local Purchase Order " Width="216px" CssClass="auto-style9"></asp:Label>
    
                </td>
            </tr>
            <tr>
                <td class="auto-style22">
    
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:ImageButton ID="ImageButton1" runat="server" Height="34px" ImageUrl="~/images/report.png" OnClick="ImageButton1_Click" Width="45px" ToolTip="Genetate Local Purchase Order" />
    
                    <span class="auto-style38">Print LPO</span></td>
            </tr>
            <tr>
                <td class="auto-style22">     
             
                    

                       
        <table runat="server" id="TblDates" class="auto-style12" >
            <tr>
                
                <td class="auto-style32">
                    <asp:Label ID="Label1" runat="server" Text="Req Date From:" Width="114px" CssClass="auto-style10"></asp:Label>
                </td>
                <td class="auto-style19">
                    <telerik:RadDatePicker ID="RadDateFrom" Runat="server" Culture="en-US" RenderMode="Auto" ShowPopupOnFocus="True">
<Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;" RenderMode="Auto"></Calendar>

<DateInput DisplayDateFormat="dd/MM/yyyy" DateFormat="dd/MM/yyyy" LabelWidth="40%" RenderMode="Auto" >
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
                <td class="auto-style33">
                    <asp:Label ID="Label2" runat="server" Text="To:" CssClass="auto-style10"></asp:Label>
                </td>
                <td class="auto-style14" >
                    <telerik:RadDatePicker ID="RadDateTo" Runat="server" Culture="en-US" RenderMode="Auto" ShowPopupOnFocus="True">
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
                <td>
                    <asp:Button ID="Button1" runat="server" OnClientClick="ShowReport();" Text="Search" Width="112px" OnClick="Button1_Click"  />
                </td>
            </tr>
        </table>
    
    </td>
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
                                            <telerik:RadTextBox ID="txtJobcarno" Runat="server" AutoPostBack="True" LabelWidth="64px" OnTextChanged="txtJobcarno_TextChanged" Resize="None" Width="160px" >
                                            </telerik:RadTextBox>
                                        </td>
                                        <td class="auto-style30">
                    <asp:Label ID="Label16" runat="server" Text="Group" Width="87px" CssClass="auto-style10"></asp:Label>
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
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnAdd" runat="server" OnClientClick="ShowReport();" Text="Add" Width="112px" OnClick="btnAdd_Click"  />
                    <asp:Button ID="btnClear" runat="server" Text="Clear" Width="112px" OnClick="btnClear_Click" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                         
                        </tr>
                    </table>
   
            <tr>
                <td class="auto-style22" >     
                    <%--<oajax:CallbackPanel runat="server" ID="postbackPanel2">
 <content style="width:145px;height:139px">	--%>                       
 <%--</content>
 </oajax:CallbackPanel>--%>         
    
                      <div id="ReportIsLoading" runat="server" 
                    
                    
                    style="display: block; padding-left: 50px; padding-right: 12px; line-height: 40px; border: 1px solid #CCCCCC; color: #000000; font-family: verdana; font-size: 12px; background-color: #ffffff; background-position: 100px center; background-repeat: no-repeat; " class="auto-style18">
                    <img align="bottom" alt="" src="../images/1.gif" 
                        style="height: 27px; width: 137px; margin-top: 17px;" title="Loading..." />
                    <asp:Label ID="Label4" runat="server" 
                        Text="Processing please wait............"></asp:Label>
                </div>
                        
                        <div id="pageIsLoading" runat="server" 
                    
                    
                    style="display: block; padding-left: 50px; padding-right: 12px; line-height: 40px; border: 1px solid #CCCCCC; color: #000000; font-family: verdana; font-size: 12px; background-color: #ffffff; background-position: 100px center; background-repeat: no-repeat; " class="auto-style17">
                    <img align="bottom" alt="" src="../images/processing.gif" 
                        style="height: 27px; width: 137px; margin-top: 17px;" title="Loading..." />
                    <asp:Label ID="Label5" runat="server" 
                        Text="Please wait............."></asp:Label>
                </div>                                   
                    

                       
                    <obout:Grid ID="grid1" runat="server" Width="1300px" Height="370px" CallbackMode="true" FolderStyle="../styles/premiere_blue"
                        Serialize="false" ShowFooter="true"   PageSize="10"  AllowPageSizeSelection="false"
                            AutoGenerateColumns="False" KeepSelectedRecords="true" AllowAddingRecords="False"  AutoPostBackOnSelect="True" ShowLoadingMessage="False">
                    
                       <%-- <obout:Grid id="grid1" runat="server"  Width="2800px" Height="696px"  AutoPostBackOnSelect="True" FolderStyle="../styles/premiere_blue" CallbackMode="true" Serialize="true" AutoGenerateColumns="false" AllowAddingRecords="false"
			AllowFiltering="true" ShowLoadingMessage="false" AllowPageSizeSelection="false">--%>

                        
                        <Columns>
                         <obout:Column DataField="" ReadOnly="true" HeaderText="No." Width="50" runat="server">
                                 <TemplateSettings GroupHeaderTemplateId="GroupTemplate" />
                    <TemplateSettings TemplateId="tplNumbering"/>
                </obout:Column>
                         <obout:Column ID="Column9" DataField="LCID" HeaderText="LCID" ShowFilterCriterias="false" Visible="false"  Width="80" runat="server" />
                     <obout:Column ID="Column1" DataField="reqdate" HeaderText="Requisition Date"  ShowFilterCriterias="true" Width="160" runat="server" >
                            <TemplateSettings FilterTemplateId="reqdateFilter" />
                    <FilterOptions>
                        <obout:FilterOption IsDefault="true" Type="Contains" />
                    </FilterOptions>
                          </obout:Column>
                     <obout:Column ID="Column5" DataField="JobNo" HeaderText="Job Card No"  ShowFilterCriterias="true" Width="130" runat="server" >
                            <TemplateSettings FilterTemplateId="JobNoFilter" />
                    <FilterOptions>
                        <obout:FilterOption IsDefault="true" Type="Contains" />
                    </FilterOptions>
                          </obout:Column>
                        <obout:Column ID="Column6" DataField="Partno" HeaderText="Part No" ShowFilterCriterias="true" Width="130" runat="server">
                          <TemplateSettings FilterTemplateId="PartnoFilter" />
                    <FilterOptions>
                        <obout:FilterOption IsDefault="true" Type="Contains" />
                    </FilterOptions>
                          </obout:Column>
                <obout:Column ID="Column2" DataField="partname" ReadOnly="true" HeaderText="Part Name" ShowFilterCriterias="true" Width="300" runat="server">	
                           <TemplateSettings FilterTemplateId="partnameFilter" />
                    <FilterOptions>
                        <obout:FilterOption IsDefault="true" Type="Contains"  />
                    </FilterOptions>
                          </obout:Column>	
                            <obout:Column ID="Column4" DataField="VIN" ReadOnly="true" HeaderText="VIN" ShowFilterCriterias="true" Width="200" runat="server">
                            <TemplateSettings FilterTemplateId="chassisnoFilter" />
                    <FilterOptions>
                        <obout:FilterOption IsDefault="true" Type="Contains" />
                    </FilterOptions>
                          </obout:Column>
                          <obout:Column ID="Column13" DataField="model" HeaderText="model" ShowFilterCriterias="true" Width="100" runat="server" >
                        <TemplateSettings FilterTemplateId="modelFilter" />
                    <FilterOptions>
                        <obout:FilterOption IsDefault="true" Type="Contains" />
                    </FilterOptions>
                          </obout:Column> 
                <obout:Column ID="Column12" DataField="Amounts" HeaderText="Amount" ShowFilterCriterias="true" Width="120" runat="server" >     
                        	<TemplateSettings FilterTemplateId="AmountFilter" />
                    <FilterOptions>
                        <obout:FilterOption IsDefault="true" Type="Contains" />
                    </FilterOptions>
                          </obout:Column>
			</Columns>
                            <FilteringSettings InitialState="Visible" FilterPosition="Top" />
                        <Templates>
                <obout:GridTemplate runat="server" ID="tplNumbering">
                    <Template>
                        <b><%# (Container.RecordIndex + 1) %>.</b>
                    </Template>
                </obout:GridTemplate>
         <obout:GridTemplate runat="server" ID="GroupTemplate">
          <Template>
			            <u><%# Container.Column.HeaderText %></u> : <i><%# Container.Value %></i> (<%# Container.Group.PageRecordsCount %><%# Container.Group.PageRecordsCount > 1 ? "records" : "record" %>)
			        </Template>
        </obout:GridTemplate>                         
 <obout:GridTemplate runat="server" ID="reqdateFilter" ControlID="reqdates">
                    <Template>
                        <obout:OboutTextBox runat="server" ID="reqdates" Height="24px" Width="100%">
                            <ClientSideEvents OnKeyUp="applyFilter"/>
                        </obout:OboutTextBox>
                    </Template>
                </obout:GridTemplate>
                             <obout:GridTemplate runat="server" ID="JobNoFilter" ControlID="JobNos">
                    <Template>
                        <obout:OboutTextBox runat="server" ID="JobNos" Height="24px" Width="100%">
                            <ClientSideEvents OnKeyUp="applyFilter"/>
                        </obout:OboutTextBox>
                    </Template>
                </obout:GridTemplate>
                <obout:GridTemplate runat="server" ID="PartnoFilter" ControlID="Partnos">
                    <Template>
                        <obout:OboutTextBox runat="server" ID="Partnos" Height="24px"  Width="100%">
                            <ClientSideEvents OnKeyUp="applyFilter" />
                        </obout:OboutTextBox>
                    </Template>
                </obout:GridTemplate>
                <obout:GridTemplate runat="server" ID="chassisnoFilter" ControlID="chassisnos">
                    <Template>
                        <obout:OboutTextBox runat="server" ID="chassisnos" Height="24px"  Width="100%">
                            <ClientSideEvents OnKeyUp="applyFilter" />
                        </obout:OboutTextBox>
                    </Template>
                </obout:GridTemplate>
                <obout:GridTemplate runat="server" ID="modelFilter" ControlID="models">
                    <Template>
                        <obout:OboutTextBox runat="server" ID="models" Height="24px" Width="100%">
                            <ClientSideEvents OnKeyUp="applyFilter" />
                        </obout:OboutTextBox>
                    </Template>
                </obout:GridTemplate>
                              <obout:GridTemplate runat="server" ID="AmountFilter" ControlID="Amountss">
                    <Template>
                        <obout:OboutTextBox runat="server" ID="Amountss" Height="24px" Width="100%">
                            <ClientSideEvents OnKeyUp="applyFilter" />
                        </obout:OboutTextBox>
                    </Template>
                </obout:GridTemplate>
                            <obout:GridTemplate runat="server" ID="partnameFilter" ControlID="partnames">
                    <Template>
                        <obout:OboutTextBox runat="server" ID="partnames" Height="24px"  Width="100%">
                            <ClientSideEvents OnKeyUp="applyFilter" />
                        </obout:OboutTextBox>
                    </Template>
                </obout:GridTemplate>
                                       </Templates> 
             <ScrollingSettings ScrollHeight="370"/>
	
                    </obout:Grid> 

    </td>
            </tr>
          </div>       
 
                   
                   
		        <cc1:msgBox ID="msgBox2" runat="server" />

                     
                   
                                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    
                     
                   
                                <cc1:msgBox ID="msgBox1" runat="server" />
    
                     
                   
                              
  
        
  
    </form>
</body>
</html>

