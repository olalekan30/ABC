<%@ Page Language="C#" AutoEventWireup="true" CodeFile="JobEstimate.aspx.cs" Inherits="ServiceReports_JobEstimate" %>
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
        .auto-style16 {
            width: 404px;
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
    
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label3" runat="server" Text="Job Estimate Report " Width="203px" CssClass="auto-style9"></asp:Label>
    
                </td>
            </tr>
            <tr>
                <td valign="top">     
             
                    

                       
                    <table id="TblDates" runat="server" border="1" cellspacing="1" class="auto-style12">
                        <tr>
                            <td class="auto-style18">
                                <asp:Label ID="Label1" runat="server" CssClass="auto-style10" Text="Estimate Date From:" Width="153px"></asp:Label>
                            </td>
                            <td class="auto-style11">
                                <telerik:RadDatePicker ID="RadDateFrom" Runat="server" Culture="en-US" RenderMode="Auto" SelectedDate="01/06/2018" ShowPopupOnFocus="True">
                                    <Calendar EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;" RenderMode="Auto" UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False">
                                    </Calendar>
                                    <DateInput DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy" DisplayText="01/06/2018" LabelWidth="40%" RenderMode="Auto" SelectedDate="01/06/2018" value="01/06/2018">
                                        <EmptyMessageStyle Resize="None" />
                                        <ReadOnlyStyle Resize="None" />
                                        <FocusedStyle Resize="None" />
                                        <DisabledStyle Resize="None" />
                                        <InvalidStyle Resize="None" />
                                        <HoveredStyle Resize="None" />
                                        <EnabledStyle Resize="None" />
                                    </DateInput>
                                    <DatePopupButton HoverImageUrl="" ImageUrl="" />
                                </telerik:RadDatePicker>
                            </td>
                            <td class="auto-style8">
                                <asp:Label ID="Label2" runat="server" CssClass="auto-style10" Text="To"></asp:Label>
                            </td>
                            <td>
                                <telerik:RadDatePicker ID="RadDateTo" Runat="server" Culture="en-US" RenderMode="Auto" ShowPopupOnFocus="True">
                                    <Calendar EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;" RenderMode="Auto" UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False">
                                    </Calendar>
                                    <DateInput DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy" LabelWidth="40%" RenderMode="Auto">
                                        <EmptyMessageStyle Resize="None" />
                                        <ReadOnlyStyle Resize="None" />
                                        <FocusedStyle Resize="None" />
                                        <DisabledStyle Resize="None" />
                                        <InvalidStyle Resize="None" />
                                        <HoveredStyle Resize="None" />
                                        <EnabledStyle Resize="None" />
                                    </DateInput>
                                    <DatePopupButton HoverImageUrl="" ImageUrl="" />
                                </telerik:RadDatePicker>
                            </td>
                            <td class="auto-style17">
                                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" OnClientClick="ShowReport();" Text="Search" Width="112px" />
                            </td>
                            <td class="auto-style16">
                                <asp:CheckBox ID="chkcomest" runat="server" ForeColor="#990033" Text="Print Estimate With Complete Details" Width="263px" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td valign="top">     
             
                    
                    <div id="pageIsLoading" runat="server" 
                    
                    
                    style="position: absolute; display: block; padding-left: 50px; padding-right: 12px; width: 546px; height: 72px; line-height: 40px; border: 1px solid #CCCCCC; color: #000000; font-family: verdana; font-size: 12px; background-color: #ffffff; background-position: 100px center; background-repeat: no-repeat; top: 402px; left: 362px; ">
                    <img align="bottom" alt="" src="../images/processing.gif" 
                        style="height: 27px; width: 137px; margin-top: 17px;" title="Loading..." />
                    <asp:Label ID="Label5" runat="server" 
                        Text="Please wait............."></asp:Label>
                </div>
                       
                    <obout:Grid ID="grid1" runat="server" Width="2800px" Height="540px" CallbackMode="true" FolderStyle="../styles/premiere_blue"
                        Serialize="true"   ShowFooter="true"  AllowFiltering="True" PageSize="50"  PageSizeOptions="500,1000" AllowPageSizeSelection="true"
                            AutoGenerateColumns="False" KeepSelectedRecords="False" AllowAddingRecords="False"  AutoPostBackOnSelect="True" ShowLoadingMessage="False">
                    
                       <%-- <obout:Grid id="grid1" runat="server"  Width="2800px" Height="696px"  AutoPostBackOnSelect="True" FolderStyle="../styles/premiere_blue" CallbackMode="true" Serialize="true" AutoGenerateColumns="false" AllowAddingRecords="false"
			AllowFiltering="true" ShowLoadingMessage="false" AllowPageSizeSelection="false">--%>

                        
                        <Columns>
                         <obout:Column DataField="" ReadOnly="true" HeaderText="No." Width="80" runat="server">
                                 <TemplateSettings GroupHeaderTemplateId="GroupTemplate" />
                    <TemplateSettings TemplateId="tplNumbering"/>
                </obout:Column>
                         <obout:Column ID="Column9" DataField="estimate" HeaderText="Est No" ShowFilterCriterias="false"  Width="120" runat="server" />
                     <obout:Column ID="Column1" DataField="estimatedate" HeaderText="Estimated Date"  ShowFilterCriterias="false" Width="150" runat="server" >
                            <TemplateSettings FilterTemplateId="estimatedateFilter" />
                    <FilterOptions>
                        <obout:FilterOption IsDefault="true" Type="Contains" />
                    </FilterOptions>
                          </obout:Column>
                        <obout:Column ID="Column6" DataField="CustomerName" HeaderText="Customer Name" ShowFilterCriterias="false" Width="400" runat="server">
                          <TemplateSettings FilterTemplateId="CustomerNameFilter" />
                    <FilterOptions>
                        <obout:FilterOption IsDefault="true" Type="Contains" />
                    </FilterOptions>
                          </obout:Column>
                <obout:Column ID="Column2" DataField="RegistrationNo" ReadOnly="true" HeaderText="Regn. No" ShowFilterCriterias="false" Width="150" runat="server">	
                           <TemplateSettings FilterTemplateId="RegistrationNoFilter" />
                    <FilterOptions>
                        <obout:FilterOption IsDefault="true" Type="Contains"  />
                    </FilterOptions>
                          </obout:Column>	
                            <obout:Column ID="Column4" DataField="chassisno" ReadOnly="true" HeaderText="VIN" ShowFilterCriterias="false" Width="200" runat="server">
                            <TemplateSettings FilterTemplateId="chassisnoFilter" />
                    <FilterOptions>
                        <obout:FilterOption IsDefault="true" Type="Contains" />
                    </FilterOptions>
                          </obout:Column>
                          <obout:Column ID="Column13" DataField="model" HeaderText="model" ShowFilterCriterias="false" Width="130" runat="server" >
                        <TemplateSettings FilterTemplateId="modelFilter" />
                    <FilterOptions>
                        <obout:FilterOption IsDefault="true" Type="Contains" />
                    </FilterOptions>
                          </obout:Column>
       <obout:Column ID="Column10" DataField="mileage" HeaderText="mileage"  Width="130" ShowFilterCriterias="false" runat="server" />
     <obout:Column ID="Column5" DataField="servicedesc" HeaderText="Repair Type" Width="200" ShowFilterCriterias="false" runat="server" >
                                       <templatesettings filtertemplateid="servicedescFilter" />
               <filteroptions>
                        <obout:FilterOption IsDefault="true" Type="StartsWith" />
                    </filteroptions>
           </obout:Column>  
                <obout:Column ID="Column12" DataField="spareamt" HeaderText="Total Part Amt" ShowFilterCriterias="false" Width="150" runat="server" /> 
			
                <obout:Column ID="Column3"  DataField="laboramt" HeaderText="Total Lab Amt" ShowFilterCriterias="false" Width="150" runat="server" />
		
     
                        	
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
                             <obout:GridTemplate runat="server" ID="CustomerNameFilter" ControlID="CustomerNames">
                    <Template>
                        <obout:OboutTextBox runat="server" ID="CustomerNames" Height="24px"  Width="100%">
                            <ClientSideEvents OnKeyUp="applyFilter" />
                        </obout:OboutTextBox>
                    </Template>
                </obout:GridTemplate>

 <obout:GridTemplate runat="server" ID="estimatedateFilter" ControlID="estimatedates">
                    <Template>
                        <obout:OboutTextBox runat="server" ID="estimatedates" Height="24px" Width="100%">
                            <ClientSideEvents OnKeyUp="applyFilter"/>
                        </obout:OboutTextBox>
                    </Template>
                </obout:GridTemplate>
                <obout:GridTemplate runat="server" ID="RegistrationNoFilter" ControlID="RegistrationNos">
                    <Template>
                        <obout:OboutTextBox runat="server" ID="RegistrationNos" Height="24px"  Width="100%">
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

                            <obout:GridTemplate runat="server" ID="servicedescFilter" ControlID="servicedescs">
                    <Template>
                        <obout:OboutTextBox runat="server" ID="servicedescs" Height="24px"  Width="100%">
                            <ClientSideEvents OnKeyUp="applyFilter" />
                        </obout:OboutTextBox>
                    </Template>
                </obout:GridTemplate>
                                       </Templates> 
             <ScrollingSettings ScrollHeight="540" ScrollWidth="1550"/>
	
                    </obout:Grid>           
                      <br />
                    <asp:Literal runat="server" id="divSelectedRecords" EnableViewState="false"  />
    
       
                      <div id="ReportIsLoading" runat="server" 
                    
                    
                    style="position: absolute; display: block; padding-left: 50px; padding-right: 12px; width: 546px; height: 72px; line-height: 40px; border: 1px solid #CCCCCC; color: #000000; font-family: verdana; font-size: 12px; background-color: #ffffff; background-position: 100px center; background-repeat: no-repeat; top: 402px; left: 362px; ">
                    <img align="bottom" alt="" src="../images/1.gif" 
                        style="height: 27px; width: 137px; margin-top: 17px;" title="Loading..." />
                    <asp:Label ID="Label4" runat="server" 
                        Text="Loading Job Estimate please wait............"></asp:Label>
                </div>
                        
                                                           
    </td>
            </tr>
            <tr>
                <td class="auto-style15">     
             
                    

                       
                    &nbsp;</td>
            </tr>
        </table>
 
    </div>
        <p>
                <%-- <obout:Grid id="grid1" runat="server"  Width="2800px" Height="696px"  AutoPostBackOnSelect="True" FolderStyle="../styles/premiere_blue" CallbackMode="true" Serialize="true" AutoGenerateColumns="false" AllowAddingRecords="false"
			AllowFiltering="true" ShowLoadingMessage="false" AllowPageSizeSelection="false">--%>
    
                     
                   
                                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    
                     
                   
                                <cc1:msgBox ID="msgBox1" runat="server" />
    
                     
                   
                                </p>
  
        
  
    </form>
</body>
</html>
