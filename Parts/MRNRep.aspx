<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MRNRep.aspx.cs" Inherits=" Parts_MRNRep" %>
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

        .auto-style12 {
            height: 0px;
            width: 1216px;
        }
        .auto-style10 {
            color: #000066;
            margin-top: 0px;
        }
        .auto-style14 {
            width: 64px;
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
            top: 278px;
            left: 351px;
        }
        .auto-style19 {
            width: 84px;
        }
        .auto-style22 {
            width: 1291px;
        }
        .auto-style23 {
            width: 1213px;
            height: 198px;
        }
        .auto-style32 {
            width: 129px;
            text-align: right;
        }
        .auto-style33 {
            width: 9px;
        }
        
        .auto-style9 {
            font-size: x-large;
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
    
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label3" runat="server" Text="Generate Material Reciept Note Report" Width="385px" CssClass="auto-style9"></asp:Label>
    
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style22">     
             
                    

                       
        <table runat="server" id="TblDates" class="auto-style12" >
            <tr>
                
                <td class="auto-style32">
                    <asp:Label ID="Label1" runat="server" Text="MRN Date From:" Width="114px" CssClass="auto-style10"></asp:Label>
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
                <td class="auto-style22" >     
                    <%--<oajax:CallbackPanel runat="server" ID="postbackPanel2">
 <content style="width:145px;height:139px">	--%> <%--</content>
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
                         <obout:Column ID="Column9" DataField="MRNNo" HeaderText="MRN No" ShowFilterCriterias="false" Visible="true"  Width="100" runat="server" />
                     <obout:Column ID="Column1" DataField="Vendor" HeaderText="Vendor"  ShowFilterCriterias="true" Width="250" runat="server" >
                            <TemplateSettings FilterTemplateId="reqdateFilter" />
                    <FilterOptions>
                        <obout:FilterOption IsDefault="true" Type="Contains" />
                    </FilterOptions>
                          </obout:Column>
                     <obout:Column ID="Column5" DataField="RecieptNo" HeaderText="Reciept No"  ShowFilterCriterias="true" Width="130" runat="server" >
                            <TemplateSettings FilterTemplateId="JobNoFilter" />
                    <FilterOptions>
                        <obout:FilterOption IsDefault="true" Type="Contains" />
                    </FilterOptions>
                          </obout:Column>
                        <obout:Column ID="Column6" DataField="Partname" HeaderText="Part Name" ShowFilterCriterias="true" Width="300" runat="server">
                          <TemplateSettings FilterTemplateId="PartnoFilter" />
                    <FilterOptions>
                        <obout:FilterOption IsDefault="true" Type="Contains" />
                    </FilterOptions>
                          </obout:Column>
               
                            <obout:Column ID="Column4" DataField="MRNDate" ReadOnly="true" HeaderText="MRNDate" ShowFilterCriterias="true" Width="150" runat="server">
                            <TemplateSettings FilterTemplateId="chassisnoFilter" />
                    <FilterOptions>
                        <obout:FilterOption IsDefault="true" Type="Contains" />
                    </FilterOptions>
                          </obout:Column>
                          <obout:Column ID="Column13" DataField="QtyRecieved" HeaderText="QtyRecieved" ShowFilterCriterias="true" Width="120" runat="server" >
                        <TemplateSettings FilterTemplateId="modelFilter" />
                    <FilterOptions>
                        <obout:FilterOption IsDefault="true" Type="Contains" />
                    </FilterOptions>
                          </obout:Column> 
                <obout:Column ID="Column12" DataField="Amt" HeaderText="Amount" ShowFilterCriterias="true" Width="120" runat="server" >     
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

