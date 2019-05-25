<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ListofJobCardOpen.aspx.cs" Inherits="ListofJobCardOpen" %>
<%@ Register assembly="msgBox" namespace="BunnyBear" tagprefix="cc1" %>

<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

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
</head>
<body>
    <form id="form1" runat="server">
    
        <table cellpadding="0" cellspacing="0" class="auto-style6">
            <tr>
                <td>
    
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    
                    <asp:Label ID="Label3" runat="server" Text="List of Job Cards Open" Width="229px" CssClass="auto-style9"></asp:Label>
    
                </td>
            </tr>
            <tr>
                <td> 
    
        <table cellspacing="1" class="auto-style12" border="1">
            <tr>
                
                <td class="auto-style7">
                    <asp:Label ID="Label1" runat="server" Text="Job Date:" Width="74px" CssClass="auto-style10"></asp:Label>
                </td>
                <td class="auto-style11">
                    <telerik:RadDatePicker ID="RadDateFrom" Runat="server" Culture="en-US" RenderMode="Auto" ShowPopupOnFocus="True">
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
                <td class="auto-style8">
                    <asp:Label ID="Label2" runat="server" Text="To" CssClass="auto-style10"></asp:Label>
                </td>
                <td >
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
                    <asp:Button ID="Button1" runat="server" Text="Show Report" OnClick="Button1_Click" Width="112px"  />
                </td>
            </tr>
        </table>
    
    </td>
            </tr>
            <tr>
                <td>     
                    
                    
                    
                  <asp:ImageButton ID="ImgExp" runat="server" ImageUrl="~/images/excel.jpg"
            AlternateText="xlsx" Height="30px" OnClick="ImgExp_Click" Width="34px" /></td>
            </tr>
            <tr>
                <td>     <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
                        <telerik:RadFormDecorator RenderMode="Lightweight" ID="RadFormDecorator1" runat="server" Skin="Silk" EnableRoundedCorners="False" DecorationZoneID="GridZone"  />
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" UpdateInitiatorPanelsOnly="true">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="RadGrid1">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="RadGrid1" LoadingPanelID="RadAjaxLoadingPanel1" />
                    <telerik:AjaxUpdatedControl ControlID="ConfiguratorPanel" />
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="ConfiguratorPanel">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="RadGrid1" LoadingPanelID="RadAjaxLoadingPanel1" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>
    <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server">
    </telerik:RadAjaxLoadingPanel>  
                    
                    
                    <div class="demo-container size-custom">
                        <fieldset class="auto-style5" >
        
   
             <telerik:radgrid RenderMode="Lightweight" ID="RadGrid1" runat="server"  
               EnableHeaderContextMenu="True"   AllowSorting="True" 
                EnableHeaderContextFilterMenu="True" PagerStyle-AlwaysVisible="true"               
                 Width="1765px" OnExcelMLWorkBookCreated="RadGrid1_ExcelMLWorkBookCreated"
                 OnItemCommand="RadGrid1_ItemCommand" 
                 OnSortCommand="RadGrid1_SortCommand"  OnPageSizeChanged="RadGrid1_PageSizeChanged"
                 AllowPaging="True" AutoGenerateColumns="False"  GroupPanelPosition="Top" Height="2000px" PageSize="15" CellPadding="0" Font-Size="Large">
                <ExportSettings HideStructureColumns="true">
            </ExportSettings>
                <MasterTableView DataKeyNames="customer" Width="100%" CommandItemDisplay="Top" >
                <CommandItemSettings ShowExportToExcelButton="true"  ShowAddNewRecordButton="false" ShowRefreshButton="false"/>
                <PagerStyle Mode="NextPrevNumericAndAdvanced"></PagerStyle>
                 <Columns>
                     <telerik:gridTemplateColumn HeaderText="#">
                        <ItemTemplate>
                            <%# Container.DataSetIndex+1 %>
                        </ItemTemplate>
                    </telerik:gridTemplateColumn>
                                <telerik:gridboundcolumn DataField="JobDate" HeaderText="Job Date"  Visible="true"     HeaderStyle-Width="20px" ItemStyle-Width="20px"   SortExpression="CallDate"
                            UniqueName="CallDate" Display="true">
<HeaderStyle Width="100px"></HeaderStyle>

<ItemStyle Width="100px"></ItemStyle>
                        </telerik:gridboundcolumn>

                       <telerik:gridboundcolumn DataField="RegistrationNo" HeaderText="Regn. No"  Visible="true"     HeaderStyle-Width="10px" ItemStyle-Width="10px"   SortExpression="Booking"
                            UniqueName="RegistrationNo" Display="true">
<HeaderStyle Width="100px"></HeaderStyle>

<ItemStyle Width="100px"></ItemStyle>
                        </telerik:gridboundcolumn>

                      <telerik:gridboundcolumn DataField="model" HeaderText="Model"  Visible="true"     HeaderStyle-Width="10px" ItemStyle-Width="10px"   SortExpression="model"
                            UniqueName="model" Display="true">
<HeaderStyle Width="70px"></HeaderStyle>

<ItemStyle Width="70px"></ItemStyle>
                        </telerik:gridboundcolumn>

                           <telerik:gridboundcolumn DataField="VIN" HeaderText="VIN"  Visible="true"     HeaderStyle-Width="10px" ItemStyle-Width="10px"   SortExpression="ChassisNo"
                            UniqueName="VIN" Display="true">
<HeaderStyle Width="150px"></HeaderStyle>

<ItemStyle Width="150px"></ItemStyle>
                        </telerik:gridboundcolumn>


                     <telerik:gridboundcolumn DataField="servicedesc" HeaderText="Service"  Visible="true"     HeaderStyle-Width="10px" ItemStyle-Width="10px"   SortExpression="servicedesc"
                            UniqueName="servicedesc" Display="true">
<HeaderStyle Width="300px"></HeaderStyle>

<ItemStyle Width="300px"></ItemStyle>
                        </telerik:gridboundcolumn>
                      <telerik:gridboundcolumn DataField="CustomerName" HeaderText="Customer Name"  Visible="true"     HeaderStyle-Width="20px" ItemStyle-Width="20px"   SortExpression="CustomerName"
                            UniqueName="CustomerName" Display="true">
<HeaderStyle Width="600px"></HeaderStyle>

<ItemStyle Width="600px"></ItemStyle>
                        </telerik:gridboundcolumn>
                     <telerik:gridboundcolumn DataField="PhoneNumbers" HeaderText="Phone Numbers"  Visible="true"     HeaderStyle-Width="20px" ItemStyle-Width="20px"   SortExpression="PhoneNumbers"
                            UniqueName="PhoneNumbers" Display="true">
<HeaderStyle Width="600px"></HeaderStyle>

<ItemStyle Width="600px"></ItemStyle>
                        </telerik:gridboundcolumn>
                      
                          <telerik:gridboundcolumn DataField="Mileage" HeaderText="Mileage"  Visible="true"     HeaderStyle-Width="10px" ItemStyle-Width="10px"   SortExpression="Status"
                            UniqueName="Status" Display="true">
<HeaderStyle Width="70px"></HeaderStyle>

<ItemStyle Width="70px"></ItemStyle>
                        </telerik:gridboundcolumn>
                                    
                      <telerik:gridboundcolumn DataField="ServiceAdvisor" HeaderText="Recieved By"  Visible="true"     HeaderStyle-Width="20px" ItemStyle-Width="20px"   SortExpression="BookingTime"
                            UniqueName="ServiceAdvisor" Display="true">
<HeaderStyle Width="400px"></HeaderStyle>

<ItemStyle Width="400px"></ItemStyle>
                        </telerik:gridboundcolumn>

                     <telerik:GridTemplateColumn DataField="customer" UniqueName="ChartColumn" HeaderText="Model Recieved Since Inception">
                        <ItemTemplate>
                            <div style="width: 400px; height: 100px;">
                                <telerik:RadHtmlChart ID="RadHtmlChart1" runat="server" Width="400" Height="100">
                                    <Legend>
                                        <Appearance Visible="false">
                                        </Appearance>
                                    </Legend>
                                    <PlotArea>
                                        <Series>
                                            <telerik:BarSeries DataFieldY="modelcount">
                                                <Appearance>
                                       <%--   <FillStyle BackgroundColor="#c5d291"></FillStyle>--%>
                                       </Appearance>
                                                <LabelsAppearance Visible="false">
                                                </LabelsAppearance>
                                                <TooltipsAppearance Color="White" />
                                            </telerik:BarSeries>
                                        </Series>
                                        <XAxis DataLabelsField="model">
                                        </XAxis>
                                    </PlotArea>
                                </telerik:RadHtmlChart>
                            </div>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                </Columns>
            </MasterTableView>
            <ClientSettings AllowColumnsReorder="True" ReorderColumnsOnClient="True">
                <Selecting AllowRowSelect="True" EnableDragToSelectRows="True"></Selecting>
            </ClientSettings>

                        <PagerStyle AlwaysVisible="True" />

<FilterMenu RenderMode="Lightweight"></FilterMenu>

<HeaderContextMenu RenderMode="Lightweight"></HeaderContextMenu>
        </telerik:radgrid>  </fieldset></div>
                
    </td>
            </tr>
        </table>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:AutoEnhancerConnectionString %>"
        SelectCommand="SELECT  count(Job.model) modelcount,model FROM Job INNER JOIN  Customer ON Job.customer = Customer.customer WHERE 
	Job.customer=@customer group by model">
        <SelectParameters>
            <asp:Parameter Name="Customer"></asp:Parameter>
        </SelectParameters>
    </asp:SqlDataSource>
        <p>
		        <cc1:msgBox ID="msgBox1" runat="server" />
    

                   
                                </p>
  
        
  
    </form>
</body>
</html>
