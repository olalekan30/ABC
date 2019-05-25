<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ServiceBookingsRpt.aspx.cs" Inherits="ServiceBookingsRptss" EnableViewStateMac ="false" EnableSessionState="True" EnableEventValidation ="false" ValidateRequest ="false" ViewStateEncryptionMode ="Never"  %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
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
        window.onload = function () {
            oboutGrid.prototype.resizeColumnOld = oboutGrid.prototype.resizeColumn;
            oboutGrid.prototype.resizeColumn = function (param1, param2, param3) {
                this.resizeColumnOld(param1, param2, param3);

                updateGroupTotalsWidths();                
            }
        }

        function updateGroupTotalsWidths() {
            var elements = document.getElementsByTagName('DIV');
            for (var i = 0; i < elements.length; i++) {
                if (elements[i].className == 'ob_gRGHC') {

                    var marginIndent = 0;
                    var tempElement = elements[i];
                    while (tempElement && tempElement.previousSibling) {
                        marginIndent -= tempElement.previousSibling.offsetWidth;
                        tempElement = tempElement.previousSibling;
                    }

                    var indent = -3;

                    for (var j = 0; j < 4; j++) {
                        elements[i].childNodes[j].style.marginLeft = (j > 0 ? indent : 0) + 'px';
                        elements[i].childNodes[j].style.width = (grid1.ColumnsCollection[j + 2].Width + (j == 0 ? marginIndent : -20)) + 'px';
                        indent += grid1.ColumnsCollection[j + 2].Width + (j == 0 ? marginIndent + 20 : 0);
                    }
                }
            }
        }
    </script>
</head>
<body onload="hideLoading();hideReport();">
    <form id="form1" runat="server">
    <div>
    
        <table cellpadding="0" cellspacing="0" class="auto-style6">
            <tr>
                <td>
    
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    
                    <asp:Label ID="Label3" runat="server" Text="Service Booking Report" Width="306px" CssClass="auto-style9"></asp:Label>
    
                </td>
            </tr>
            <tr>
                <td> 
    
        <table cellspacing="1" class="auto-style12" border="1">
            <tr>
                
                <td class="auto-style7">
                    <asp:Label ID="Label1" runat="server" Text="Booking Date From:" Width="136px" CssClass="auto-style10"></asp:Label>
                </td>
                <td class="auto-style11">
                    <telerik:RadDatePicker ID="RadDateFrom" Runat="server" Culture="en-US" RenderMode="Auto" ShowPopupOnFocus="True"  SelectedDate="2018-01-01">
<Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;" RenderMode="Auto" EnableKeyboardNavigation="True"></Calendar>

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
                <td class="auto-style8">
                    <asp:Label ID="Label2" runat="server" Text="To" CssClass="auto-style10"></asp:Label>
                </td>
                <td >
                    <telerik:RadDatePicker ID="RadDateTo" Runat="server" Culture="en-US" RenderMode="Auto" ShowPopupOnFocus="True">
<Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;" RenderMode="Auto" EnableKeyboardNavigation="True"></Calendar>

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
                    <asp:Button ID="Button1" runat="server" OnClientClick="ShowReport();" Text="Show Report" OnClick="Button1_Click" Width="112px"  />
                </td>
            </tr>
        </table>
    
    </td>
            </tr>
            <tr>
                <td>     
                    
                     <img 
                    alt="" src="../images/excel.jpg" onclick="exportToExcel()" 
                                                                        
                    style="height: 29px; width: 34px" />
                    
                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                </td>
            </tr>
            <tr>
                <td>     
             
                    
                    <div class="demo-container size-custom">
                       
                    <obout:Grid ID="grid1" runat="server" Width="2800px" Height="696px" CallbackMode="true" FolderStyle="../styles/premiere_blue"
                        Serialize="true" ShowColumnsFooter="true"   OnRowDataBound="RowDataBound" GroupBy="UserID" ShowFooter="true" ShowMultiPageGroupsInfo="True" AllowFiltering="True" 
                        AllowGrouping="True"  PageSize="100" ShowGroupFooter="true" PageSizeOptions="1000,5000" 
                            AutoGenerateColumns="False" KeepSelectedRecords="False" AllowAddingRecords="False">
                        <%--<ClientSideEvents OnClientCallback="updateGroupTotalsWidths" />--%>
                    <Columns>
                         <obout:Column DataField="" ReadOnly="true" HeaderText="No." Width="250" runat="server">
                                 <TemplateSettings GroupHeaderTemplateId="GroupTemplate" />
                    <TemplateSettings TemplateId="tplNumbering"/>
                </obout:Column>
                  <obout:Column ID="Column1" DataField="CallDate" HeaderText="Call Date"  Width="130" runat="server" />
                 <obout:Column ID="Column13" DataField="bookedfordate" HeaderText="Booking Date"  Width="130" runat="server" />
                <obout:Column ID="Column12" DataField="BookingTime" HeaderText="Booking Time"  Width="140" runat="server" /> 
			   <obout:Column ID="Column2" DataField="RegistrationNo" ReadOnly="true" HeaderText="Regn. No" Width="200" runat="server"/>	
                <obout:Column ID="Column3"  DataField="model" HeaderText="Model" Width="125" runat="server" />
				<obout:Column ID="Column4" DataField="ChassisNo" HeaderText="VIN" Width="200" runat="server" />
				<obout:Column ID="Column5" DataField="Service" HeaderText="Service" Width="125" runat="server" />
				 <obout:Column ID="Column6" DataField="CustomerName" HeaderText="Customer Name" Width="400" runat="server" />
                <obout:Column ID="Column7" DataField="PhoneNumbers" HeaderText="Phone Numbers"  Width="400" runat="server" />
                <obout:Column ID="Column66" DataField="Status" HeaderText="Status" Width="150" runat="server" />
     
                     <obout:Column ID="Column14" DataField="UserID" HeaderText="Booked by"  Width="150" runat="server" /> 
                        	
			</Columns>
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
            </Templates> 
             <ScrollingSettings ScrollHeight="400" ScrollWidth="1350"/>
	
                    </obout:Grid>
                    
                    
                    
                    
                    
                      <div id="ReportIsLoading" runat="server" 
                    
                    
                    style="position: absolute; display: block; padding-left: 50px; padding-right: 12px; width: 546px; height: 72px; line-height: 40px; border: 1px solid #CCCCCC; color: #000000; font-family: verdana; font-size: 12px; background-color: #ffffff; background-position: 100px center; background-repeat: no-repeat; top: 402px; left: 362px; ">
                    <img align="bottom" alt="" src="../images/1.gif" 
                        style="height: 27px; width: 137px; margin-top: 17px;" title="Loading..." />
                    <asp:Label ID="Label4" runat="server" 
                        Text="Searching please wait............"></asp:Label>
                </div>
                        
                        <div id="pageIsLoading" runat="server" 
                    
                    
                    style="position: absolute; display: block; padding-left: 50px; padding-right: 12px; width: 546px; height: 72px; line-height: 40px; border: 1px solid #CCCCCC; color: #000000; font-family: verdana; font-size: 12px; background-color: #ffffff; background-position: 100px center; background-repeat: no-repeat; top: 402px; left: 362px; ">
                    <img align="bottom" alt="" src="../images/processing.gif" 
                        style="height: 27px; width: 137px; margin-top: 17px;" title="Loading..." />
                    <asp:Label ID="Label5" runat="server" 
                        Text="Please wait while records are being downloaded............."></asp:Label>
                </div>
                    
                    
                    
                    </div>
                
    </td>
            </tr>
        </table>
 
    </div>
        <p>
		        <%--<obout:msgBox ID="msgBox1" runat="server" />--%>
    
                     
                   
                                <cc1:msgBox ID="msgBox1" runat="server" />
    
                     
                   
                                </p>
  
        
  
    </form>
</body>
</html>
