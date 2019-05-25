<%@ Page Language="C#" AutoEventWireup="true" CodeFile="changepasword.aspx.cs" Inherits="changepasword" %>
<%@ Register assembly="msgBox" namespace="BunnyBear" tagprefix="cc1" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<html xmlns="http://www.w3.org/1999/xhtml" lang="en"><head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		<meta name="robots" content="noindex,nofollow"/>
		<title>-IIPL Extra Reporting System-</title>
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
                height: 700px;
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
            .auto-style15 {
                color: #000099;
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
                font-size: xx-large;
            }
            .auto-style29 {
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
            .auto-style30 {
                color: #3333FF;
            }
            .auto-style32 {
                color: #993366;
            }
            .auto-style36 {
                font-size: xx-large;
            }
            .auto-style37 {
                color: #33CC33;
                font-size: xx-large;
            }
            </style>
	</head>
	<body>    
  <form id="Form1" runat="server">
                     
                                     <span class="style3"><img alt="" class="auto-style29" src="../images/index.png" style="max-width: 100%;" /></span>
&nbsp;&nbsp;<p class="auto-style3" >
<span class="style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; 
                                    </span></p>
                                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<span class="style3"> 
                                    <asp:Image ID="Image1" runat="server" Height="34" Width="35" ImageUrl="~/images/19.ico" />
                                     </span>
                                     <span class="auto-style36"><span class="auto-style17"><span class="auto-style38">A</span><span class="auto-style27">u</span>to<span class="auto-style39">E</span><span class="auto-style42">n</span><span class="auto-style33">h</span>a<span class="auto-style40">n</span>ce<span class="auto-style37">r</span> E</span><span class="auto-style34">x</span><span class="auto-style17">t</span><span class="auto-style35">r</span><span class="auto-style17">a </span><span class="auto-style33">A</span><span class="auto-style22">n</span><span class="auto-style31">a</span><span class="auto-style6">l</span><span class="auto-style22">y</span><span class="auto-style30">t</span><span class="auto-style22">ic</span><span class="auto-style26">a</span><span class="auto-style32">l</span><span class="auto-style22"> R</span><span class="auto-style19">e</span><span class="auto-style7">p</span><span class="auto-style15">o</span><span class="auto-style26">r</span><span class="auto-style7">t</span><span class="auto-style23">i</span><span class="auto-style27">n</span><span class="auto-style25">g</span><span class="auto-style7"> </span><span class="auto-style21">S</span><span class="auto-style7">y</span><span class="auto-style24">s</span><span class="auto-style7">t</span><span class="auto-style16">e</span></span><span class="auto-style20">m</span><span class="style3"> 
                                    </span>
        <p>
            &nbsp;<br />
        </p>
                                    </p>
                                <p>
                    <span class="style8">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                    <asp:Label ID="lblwelcome" runat="server" Width="279px" CssClass="style8" style="font-size: large"></asp:Label>
                    </span>
            <br />
        </p>
        <div id="wrapper" class="prompt" align="left">
                                
		
				<div class="content">
						<p class="auto-style13">
											<table cellpadding="0" cellspacing="0" class="auto-style14">
            <tr>
                <td class="style8">
                    <asp:Label ID="LblPasswordStrength" runat="server" ForeColor="#FF3300" Width="137px" CssClass="auto-style11"></asp:Label>
                </td>
            </tr>
        </table>
        <table cellpadding="0" cellspacing="0" class="auto-style6">
            <tr>
                <td class="auto-style8">
                    <asp:Label ID="Label1" runat="server" Text="New Password:" Width="94px"></asp:Label>
                </td>
                <td>
        <asp:TextBox ID="txtPassword1" runat="server" CssClass="auto-style12" 
            TextMode="Password" MaxLength="15" Height="20px" Width="179px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style8">
                    <asp:Label ID="Label2" runat="server" Text="Re-type Password:" Width="108px"></asp:Label>
                </td>
                <td>
        <asp:TextBox ID="txtPassword2" runat="server" CssClass="inputbox" 
            TextMode="Password" MaxLength="15" Height="20px" Width="182px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style8">
                    &nbsp;</td>
                <td>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<telerik:RadButton ID="RadButton1" runat="server" CssClass="auto-style10" OnClick="RadButton1_Click" Skin="Default" Text="Save">
                    </telerik:RadButton>
                </td>
            </tr>
        </table>
        <table cellpadding="0" cellspacing="0" class="auto-style7">
            <tr>
                <td class="auto-style5">
                    &nbsp;</td>
                <td class="style6">
                    &nbsp;</td>
                <td>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" 
                        ControlToCompare="txtPassword1" ControlToValidate="txtPassword2" 
                        ErrorMessage="Passwords does not match!!!" ForeColor="Red" Width="195px"></asp:CompareValidator>
                </td>
            </tr>               <asp:ScriptManager ID="ScriptManager1" runat="server">
                                    </asp:ScriptManager>
            </table>
		        <cc1:msgBox ID="msgBox1" runat="server" />
        </form>
  

</body></html>
