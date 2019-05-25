<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>
<%@ Register assembly="msgBox" namespace="BunnyBear" tagprefix="cc1" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
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
            }
            .auto-style29 {
                height: auto;
                width: auto\9;
                border-style: none;
                border-color: inherit;
                border-width: 0;
            }
            .auto-style30 {
                color: #3333FF;
            }
            .auto-style31 {
                color: #669900;
            }
            .auto-style32 {
                color: #993366;
            }
            .auto-style33 {
                color: #CC99FF;
            }
            .auto-style34 {
                color: #336600;
            }
            .auto-style35 {
                color: #669999;
            }
            .auto-style36 {
                font-size: xx-large;
            }
            .auto-style37 {
                color: #009933;
            }
            .auto-style38 {
                color: #FF3300;
            }
            .auto-style39 {
                color: #FF3399;
            }
            .auto-style40 {
                color: #FFCC00;
            }
            .auto-style41 {
                color: #33CCCC;
            }
            .auto-style42 {
                color: #00CC99;
            }
            </style>
	</head>
	<body>    
  <form id="Form1" runat="server">
                                <span class="style3"><img alt="" class="auto-style29" src="images/index.png" style="max-width: 100%;" /></span>
&nbsp;&nbsp;<p class="auto-style3" >
<span class="style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; 
                                    </span></p>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;<span class="style3"><asp:Image ID="Image1" runat="server" Height="34" Width="35" ImageUrl="~/images/19.ico" />
                                    </span>
<span class="auto-style36"> 
                                    <span class="auto-style38">A</span><span class="auto-style27">u</span><span class="auto-style17">to</span><span class="auto-style39">E</span><span class="auto-style42">n</span><span class="auto-style33">h</span><span class="auto-style17">a</span><span class="auto-style40">n</span><span class="auto-style17">ce</span><span class="auto-style37">r</span><span class="auto-style17"> </span><span class="auto-style41">E</span><span class="auto-style34">x</span><span class="auto-style17">t</span><span class="auto-style35">r</span><span class="auto-style17">a </span><span class="auto-style33">A</span><span class="auto-style22">n</span><span class="auto-style31">a</span><span class="auto-style6">l</span><span class="auto-style22">y</span><span class="auto-style30">t</span><span class="auto-style22">ic</span><span class="auto-style26">a</span><span class="auto-style32">l</span><span class="auto-style22"> R</span><span class="auto-style19">e</span><span class="auto-style7">p</span><span class="auto-style15">o</span><span class="auto-style26">r</span><span class="auto-style7">t</span><span class="auto-style23">i</span><span class="auto-style27">n</span><span class="auto-style25">g</span><span class="auto-style7"> </span><span class="auto-style21">S</span><span class="auto-style7">y</span><span class="auto-style24">s</span><span class="auto-style7">t</span><span class="auto-style16">e</span><span class="auto-style20">m</span></span>
        <p>
            &nbsp;<br />
        </p>
        <div id="wrapper" class="prompt" align="left">
                                
		
				<div class="content">
						<p>
							
							<label for="username" id="UserNameLabel" class="labels">Username:</label>
							<asp:TextBox ID="txtUsername" runat="server" CssClass="inputbox" 
            MaxLength="20" Width="150px" ></asp:TextBox>
							<span id="UserNameRequired" class="errorprompt" title="Username is required.">*</span>
						</p>
						<p>
							<label for="password" id="PasswordLabel" class="labels">Password:</label>
							<asp:TextBox ID="txtPassword" runat="server" CssClass="inputbox" 
            TextMode="Password" MaxLength="15" Width="150px"></asp:TextBox>
							<span id="PasswordRequired" class="errorprompt" title="Password is required.">*</span>
						</p>
						
							<label for="password" id="PasswordLabel0" class="labels">Location:</label>
					
						<telerik:RadComboBox ID="RadLocation" Runat="server" Width="150px" >
                            <Items>
                               <telerik:RadComboBoxItem runat="server" Text="KP1" Value="Data Source=10.3.0.15;Initial Catalog=AutoEnhancer;Persist Security Info=True;User ID=sa;Password=9SA27052009KP1"/>
                                <telerik:RadComboBoxItem runat="server" Text="KP2" Value="Data Source=10.100.11.10;Initial Catalog=AutoEnhancer;Persist Security Info=True;User ID=sa;Password=9SA27052009KP2$"/>
                                  <telerik:RadComboBoxItem runat="server" Text="Abuja" Value="Data Source=10.100.15.10;Initial Catalog=AutoEnhancer;Persist Security Info=True;User ID=sa;Password=9SA03082009ABJ$" />
                            <telerik:RadComboBoxItem runat="server" Text="PHC" Value="Data Source=10.100.12.10;Initial Catalog=AutoEnhancer;Persist Security Info=True;User ID=sa;Password=9SA04112009PHC$" />
                             <telerik:RadComboBoxItem runat="server" Text="Kano" Value="Data Source=10.100.16.9;Initial Catalog=AutoEnhancer;Persist Security Info=True;User ID=sa;Password=9SA08092009KAN$"/>
                            </Items>
                        </telerik:RadComboBox>
						<p>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
							<asp:Button ID="btnLogin" runat="server" BackColor="SteelBlue"
                                                         CssClass="btn-submit" Text="Login" Height="21px" Width="82px" onclick="btnLogin_Click" 
                                                          />
						</p>
			
						&nbsp;<p>

							        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

<%--							        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/SendPasbyMail.aspx" CssClass="auto-style2">Forgot your password?</asp:HyperLink>--%>
							</p>
			
					</div>
				</div>
		
					
		
						<table cellpadding="0" cellspacing="0" class="style1">
                        <tr>
                            <td align="left" valign="top">
					<table cellpadding="0" cellspacing="0" class="style1">
                                </table>
		        <cc1:msgBox ID="msgBox1" runat="server" />
                                <asp:ScriptManager ID="ScriptManager1" runat="server">
                            </asp:ScriptManager>
  
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                				</form>
                              
</body></html>