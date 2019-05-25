<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SendPasbyMail.aspx.cs" Inherits="SendPasbyMail" %>

<%@ Register assembly="msgBox" namespace="BunnyBear" tagprefix="cc1" %>
<html xmlns="http://www.w3.org/1999/xhtml" lang="en"><head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		<meta name="robots" content="noindex,nofollow"/>
		<title>Login:IIPL Extra Reporting System</title>
		<link rel="stylesheet" type="text/css" href="css/login_1.css"/>
<link rel="shortcut icon" href="images/19.ico" />
	    <style type="text/css">
            .style1
            {
                width: 100%;
            }
            #form1
            {
                width: 1442px;
            }
            .style2
            {
                font-size: large;
            }
            .style3
            {
                font-size: x-large;
            }
            .auto-style3 {
                width: 1435px;
            }
            .auto-style12 {
                width: 96%;
            }
            .auto-style13 {
                width: 67px;
            }
            .auto-style14 {
                color: #003399;
                font-size: medium;
            }
            .auto-style15 {
                position: absolute;
                width: 675px;
                height: 72px;
                top: 259px;
                left: 330px;
            }
            .auto-style6 {
                color: #33CC33;
            }
            .auto-style17 {
                color: #996633;
            }
            .auto-style22 {
                color: #CC9900;
            }
            .auto-style19 {
                color: #990000;
            }
            .auto-style7 {
                color: #CC0099;
            }
            .auto-style26 {
                color: #CCCC00;
            }
            .auto-style23 {
                color: #0033CC;
            }
            .auto-style27 {
                color: #CC00CC;
            }
            .auto-style25 {
                color: #009999;
            }
            .auto-style21 {
                color: #006699;
            }
            .auto-style24 {
                color: #CC0066;
            }
            .auto-style16 {
                color: #FF9900;
            }
            .auto-style20 {
                color: #003366;
            }
            .auto-style30 {
                height: auto;
                width: auto\9;
                border-style: none;
                border-color: inherit;
                border-width: 0;
            }
            .auto-style34 {
                color: #336600;
            }
            .auto-style35 {
                color: #669999;
            }
            .auto-style33 {
                color: #CC99FF;
            }
            .auto-style31 {
                color: #669900;
            }
            .auto-style32 {
                color: #993366;
            }
            .auto-style36 {
                font-size: xx-large;
            }
            .auto-style37 {
                color: #33CCCC;
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
	</head>
	<body onload="hideLoading();">    
  <form id="Form1" runat="server">
                                <p class="auto-style3" >
<span class="style3">
                     <img alt="" class="auto-style30" src="images/index.png" style="max-width: 100%;" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; 
                                    <asp:Image ID="Image1" runat="server" Height="34" Width="35" ImageUrl="~/images/19.ico" />
                                    </span>
                                    <span class="auto-style36">
                                    <span class="auto-style17"><span class="auto-style38">A</span><span class="auto-style27">u</span>to<span class="auto-style39">E</span><span class="auto-style42">n</span><span class="auto-style33">h</span>a<span class="auto-style40">n</span>ce<span class="auto-style37">r</span> E</span><span class="auto-style34">x</span><span class="auto-style17">t</span><span class="auto-style35">r</span><span class="auto-style17">a </span><span class="auto-style33">A</span><span class="auto-style22">n</span><span class="auto-style31">a</span><span class="auto-style6">l</span><span class="auto-style22">y</span><span class="auto-style30">t</span><span class="auto-style22">ic</span><span class="auto-style26">a</span><span class="auto-style32">l</span><span class="auto-style22"> R</span><span class="auto-style19">e</span><span class="auto-style7">p</span><span class="auto-style37"></span><span class="auto-style15">o</span><span class="auto-style26">r</span><span class="auto-style7">t</span><span class="auto-style23">i</span><span class="auto-style27">n</span><span class="auto-style25">g</span><span class="auto-style7"> </span><span class="auto-style21">S</span><span class="auto-style7">y</span><span class="auto-style24">s</span><span class="auto-style7">t</span><span class="auto-style16">e</span><span class="auto-style20">m</span></span><span class="style3"><span class="auto-style36">&nbsp; </span> </span></p>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Login.aspx" CssClass="auto-style14">Login</asp:HyperLink>
        <p>
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           <asp:Label ID="Lblmsg" runat="server" ForeColor="#FF3300" style="font-size: medium; color:steelblue;" Width="67px"></asp:Label></p>

     <div id="wrapper" class="prompt" align="left">
                                
		
				<div class="contents">
				<table cellpadding="0" cellspacing="0" class="auto-style12">
            <tr>
                <td class="style10" colspan="3">
                    <asp:Label ID="LblPasswordStrength" runat="server" ForeColor="#FF3300" style="font-size: medium"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style13">
                    <asp:Label ID="Label1" runat="server" Text="Username:" style="font-size: medium; color: #000066;" Width="74px"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtUsername" runat="server" Height="20px" Width="176px"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style13">
                    &nbsp;</td>
                <td>
                    &nbsp;<asp:Button ID="BtnUpdate" OnClientClick="ShowLoading();"  runat="server" Height="31px" OnClick="BtnUpdate_Click" Text="Send Password By Mail" Width="163px" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table></div>  
        </div>
        <table cellpadding="0" cellspacing="0" class="style1">
            <tr>
                <td style="margin-left: 40px">
                                            <cc1:msgBox ID="msgBox1" runat="server" />
                                            </td>
            </tr>
        </table>

   <div id="pageIsLoading" runat="server" 
                    
                    
                    style="display: block; padding-left: 50px; padding-right: 12px; line-height: 40px; border: 1px solid #CCCCCC; color: #000000; font-family: verdana; font-size: 12px; background-color: #ffffff; background-position: 100px center; background-repeat: no-repeat; " class="auto-style15">
                    <img align="bottom" alt="" src="images/1.gif" 
                        style="height: 27px; width: 137px; margin-top: 17px;" title="Loading..." />
                    <asp:Label ID="Label4" runat="server" 
                        Text="Please wait while your password is being sent to your email......"></asp:Label>
                </div>
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <p>
                                    &nbsp;</p>
                                				</form>
                              
</body></html>

