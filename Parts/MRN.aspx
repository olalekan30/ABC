<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MRN.aspx.cs" Inherits="Parts_MRN" %>
<%@ Register assembly="msgBox" namespace="BunnyBear" tagprefix="cc1" %>
<%@ Register assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <style type="text/css">
        .auto-style1 {
            height: 53px;
            width: 69px;
        }
        .auto-style2 {
            position: absolute;
            width: 462px;
            height: 64px;
            top: 77px;
            left: 144px;
        }
    </style>
    <title> </title>      <meta http-equiv="Page-Exit" content="Alpha(Opacity=100)"/>
      <script type="text/javascript">
          function hideLoading() {
              document.getElementById('pageIsLoading').style.display = 'none'; // DOM3 (IE5, NS6) only
          }
          function ShowLoading() {
              document.getElementById('pageIsLoading').style.display = 'Block'; // DOM3 (IE5, NS6) only
          }

</script></head><body onload="hideLoading()"><form id="form1" runat="server">
        <div>
    
        <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="true" ReuseParameterValuesOnRefresh="True" EnableDatabaseLogonPrompt="False" EnableParameterPrompt="False" ToolPanelView="None" DisplayToolbar="False" />

         <%-- <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />--%>

          <cc1:msgBox ID="msgBox1" runat="server" />

           <div id="pageIsLoading" runat="server" 
        
        style="display: block; padding-left: 50px; padding-right: 12px; line-height: 40px; border: 1px solid #CCCCCC; color: #000000; font-family: verdana; font-size: 12px; background-color: #ffffff; background-position: 100px center; background-repeat: no-repeat; text-align: left;" class="auto-style2">
        <img alt="" src="../images/19.ico" title="Loading..." class="auto-style1" /><span 
            class="style7">Please
        wait...
    </span>
    </div>
    
    </div>
    </form>
</body>
</html>
