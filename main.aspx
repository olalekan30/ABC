<%@ Page Language="C#" AutoEventWireup="true" CodeFile="main.aspx.cs" Inherits="main" %>
<%@ Register Assembly="Infragistics35.Web.v10.2, Version=10.2.20102.1011, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.Web.UI.LayoutControls" TagPrefix="ig" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="msgBox" Namespace="BunnyBear" TagPrefix="cc1" %>


<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Welcome:IIPL Extra Reporting System</title>
   	<%--<link rel="stylesheet" type="text/css" href="css/login_1.css"/>--%>
    <%--<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" />--%>
    <link href="css/main.css" rel="stylesheet" type="text/css" />
    <%--<link href="css/responsive.css" rel="stylesheet" type="text/css" />--%>
	<link rel="stylesheet" type="text/css" href="css/HQLHrms.css"/>
    <%--<link rel="shortcut icon" href="images/19.ico" />--%>      
         <link rel="stylesheet" type="text/css" href="css/wtf-all.css"/>



    <style type="text/css">
        .auto-style2 {
            width: 97%;
            height: 100%;
        }
         .auto-style4 {
            width: 2219px;
            height: 68px;
        }
         .auto-style6 {
            padding: 6px 0;
            background-color: steelblue;
            border-bottom: 1px solid #0054A8;
            line-height: 4px;
            width: 2519px;
            height: 40px;
        }
        .auto-style7 {
            padding: 6px 0;
            background-color: steelblue;
            border-bottom: 1px solid #0054A8;
            line-height: 4px;
            width: 1924px;
        }
         .auto-style13 {
            width: 342px;
        }
         .auto-style15 {
            height: 18px;
        }
         .auto-style19 {
            color: #fff;
            font-size: 11pt;
        }
            .style3
            {
                font-size: x-large;
            }
            .auto-style21 {
            width: 128px;
        }
            .auto-style22 {
            color: #660066;
        }
            .auto-style24 {
            color: #CC0000;
        }
        .auto-style29 {
            font-size: x-small;
            width: 79px;
            height: 48px;
        }
        .auto-style32 {
            padding: 6px 0;
            background-color: steelblue;
            border-bottom: 1px solid #0054A8;
            line-height: 4px;
            width: 2519px;
            height: 40px;
            font-size: large;
            color: #CC0000;
        }
        .auto-style33 {
            width: 651px;
            color: #FF99CC;
        }
        .auto-style34 {
            padding: 6px 0;
            background-color: steelblue;
            border-bottom: 1px solid #0054A8;
            line-height: 4px;
            width: 1924px;
            color: #CC0000;
        }
        .auto-style35 {
            width: 128px;
            color: #00CC66;
        }
        .auto-style36 {
            height: 18px;
            color: #FFCC66;
        }
        .auto-style37 {
            color: #FF6600;
            }
        .auto-style38 {
            font-size: small;
        }
        .auto-style39 {
            color: #fff;
            font-size: small;
        }
        .auto-style40 {
            font-size: xx-large;
        }
        .auto-style41 {
            color: #00FF99;
            }
        .auto-style42 {
            color: #99CC00;
        }
        .auto-style44 {
            padding: 6px 0;
            background-color: steelblue;
            border-bottom: 1px solid #0054A8;
            line-height: 4px;
            width: 1924px;
            color: #FF9966;
        }
        .auto-style45 {
            color: #FF9966;
        }
        .auto-style46 {
            color: #FFCC66;
        }
        .auto-style47 {
            padding: 6px 0;
            background-color: steelblue;
            border-bottom: 1px solid #0054A8;
            line-height: 4px;
            width: 1924px;
            color: #FFCC66;
        }
        .auto-style49 {
            padding: 6px 0;
            background-color: steelblue;
            border-bottom: 1px solid #0054A8;
            line-height: 4px;
            width: 1924px;
            color: #FF00FF;
        }
        .auto-style50 {
            color: #FF9999;
        }
        .auto-style51 {
            color: #FF3399;
        }
            .auto-style52 {
            color: #66FF99;
        }
        .auto-style53 {
            color: #CCFFFF;
        }
            .auto-style54 {
            width: 1075px;
            height: 36px;
        }
            .auto-style56 {
            color: #fff;
            font-size: x-large;
        }
        .auto-style58 {
            color: #FF6600;
            font-size: x-large;
        }
            .auto-style59 {
            font-size: x-large;
            color: #996633;
        }
        .auto-style60 {
            height: 18px;
            color: #CC99FF;
        }
        .auto-style61 {
            height: 18px;
            color: #CC3300;
        }
        .auto-style62 {
            font-size: x-large;
            color: #FFFF00;
        }
        .auto-style63 {
            padding: 6px 0;
            background-color: steelblue;
            border-bottom: 1px solid #0054A8;
            line-height: 4px;
            width: 1924px;
            color: #CC0099;
        }
        .auto-style64 {
            color: #FF0000;
        }
        .auto-style65 {
            height: 18px;
            color: #FFFFCC;
        }
            .auto-style67 {
            height: 18px;
            width: 835px;
        }
            .auto-style68 {
            width: 2468px;
            height: 2172px;
        }
            .auto-style70 {
            height: 6px;
            width: 835px;
        }
        .auto-style71 {
            width: 1652px;
            top: 0px;
            left: 0px;
            height: 21px;
        }
            .auto-style72 {
            height: 6px;
            width: 483px;
        }
        .auto-style73 {
            height: 18px;
            width: 483px;
        }
            .auto-style74 {
            text-decoration: none;
            font-weight: bold;
        }
            .auto-style75 {
            width: 465px;
        }
        .auto-style76 {
            height: 6px;
            width: 572px;
        }
        .auto-style77 {
            height: 18px;
            width: 572px;
        }
            </style>
            <script type="text/javascript" language="JavaScript">
		
                window.history.forward();
                function noBack() {
                    window.history.forward();
                }

		</script>
    <script type="text/javascript">
        function load_splitterUrl(splitter) {
            var elem = splitter.get_panes()[1];
            if (elem)
                elem = elem.get_iframe();
            if (elem && elem.offsetWidth > 10 && elem.src.indexOf('http:') < 0)
                elem.src = 'index.html';
        }
    </script>
   
</head>
<body>
    <form id="form1" runat="server" class="auto-style68">
  
        <div class="auto-style6">


           
                 <table class="auto-style4" cellpadding="2" cellspacing="2" ><td class="auto-style75" valign="top"> 
                     <span class="style3">
                     <img alt="" class="auto-style29" src="images/index.png" style="max-width: 100%;" /><span class="auto-style32"><span class="auto-style40"><asp:Image ID="Image1" runat="server" Height="19px" Width="21px" ImageUrl="~/images/19.ico" />
                                    </span>
                                    <span class="auto-style65">A</span><span class="auto-style15"><span class="auto-style27"><span class="auto-style59">u</span></span></span><span class="auto-style17"><span class="auto-style36">t</span><span class="auto-style61">o</span></span><span class="auto-style36"><span class="auto-style56">E</span><span class="auto-style42">n</span><span class="auto-style33">h</span></span><span class="auto-style15"><span class="auto-style17"><span class="auto-style62">a</span></span></span><span class="auto-style36">n</span><span class="auto-style60">c</span><span class="auto-style36">e<span class="auto-style58">r</span></span><span class="auto-style24"> </span><span class="auto-style51">E</span><span class="anElem">xt</span><span class="auto-style50">r</span><span class="anElem">a</span><span class="auto-style24"> </span><span class="auto-style53">R</span><span class="auto-style41">e</span><span class="auto-style63">p</span><span class="auto-style36">o</span><span class="auto-style50">r</span><span class="auto-style47">t</span><span class="auto-style64">i</span><span class="auto-style46">n</span><span class="auto-style52">g</span><span class="auto-style34"> </span><span class="auto-style35">S</span><span class="auto-style44">y</span><span class="auto-style45">s</span><span class="auto-style49">t</span><span class="auto-style33">e</span><span class="auto-style37">m</span>&nbsp;</span>
                     &nbsp;&nbsp; </span>
                     
                     <br />
                     <br />
                     <br />
                     </td><td class="auto-style13" valign="top">   
                     <table cellpadding="2" cellspacing="2" align="left" class="auto-style54">
                        
                         <tr>
                             <td class="auto-style72" valign="top">
                                                <strong>
                                                <telerik:RadSkinManager ID="RadSkinManager1" runat="server" ShowChooser="true" />
                                 </strong>
                             </td>
                             <td class="auto-style76" valign="top">
                                 <img id="Image10" src="images/bullet.gif" class="auto-style38" />
                                 <strong>
                                 <asp:Label ID="lblwelcome" runat="server" CssClass="auto-style39"></asp:Label>
                                 </strong>
                             </td>
                             <td class="auto-style70" valign="top">
                                    <img id="Image12" src="images/bullet.gif" /><asp:Label ID="lblDept" runat="server" CssClass="auto-style19"></asp:Label>
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                           
                          
                         </tr>
                         <tr>
                             <td class="auto-style73">
                                 <img id="Image11" src="images/bullet.gif" />
                                 <strong>
                                 <asp:Label ID="lblbranch" runat="server" CssClass="auto-style19" ForeColor="#003300"></asp:Label>
                                 </strong>
                                 <span class="style1">&nbsp;&nbsp; </span></td>
                             <td class="auto-style77">
                                 <span class="style1">&nbsp;<a href="RavivaRiskHelp.chm" target="myiframe"><asp:ImageButton ID="ImageButton1" runat="server" Height="16px" ImageUrl="~/images/ayuda.gif" Width="26px" OnClientClick="&quot;logout.aspx&quot;" PostBackUrl="~/logout.aspx" />
                        
                                                </a>
                                                <strong>
                                                <asp:HyperLink ID="HyperLink1" runat="server" ForeColor="#003300" NavigateUrl="~/logout.aspx" CssClass="auto-style74">Sign Out</asp:HyperLink>
                              </strong></span></td>
                             <td class="auto-style67">
                                 &nbsp;<strong><asp:PlaceHolder ID="placeHolder1" runat="server"></asp:PlaceHolder>
                                 </strong>&nbsp;&nbsp;&nbsp; <strong>
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong></td>
                            
                         </tr>
                                    
                     </table>
                     </td>></table>

        </div>
   <div id="wtf-gen12" class="auto-style71" >
				<ul id="wtf-gen14" class="x-tab-strip x-tab-strip-top">
					<li class="auto-style21" id="as__tabdashboard">
						<a  href="main.aspx">&nbsp;&nbsp;&nbsp;<strong>Dashboard</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;</a>
					</li>
					<li class=" x-tab-with-icon x-tab-strip-active ">
						<a  id="wtf-gen297" class="x-tab-right" href="#" onclick="return false;">
                        <em class="x-tab-left"><span style="width: 140px;" class="x-tab-strip-inner">
                        <span class="auto-style22">Reports & Analysis</span></span></em></a>
					</li>
					
				    <li>&nbsp;</li>
				    </ul>
			</div>  

 <ig:WebSplitter runat="server" ID="TraditionalLeftNav" 
            Height="678px" Width="1672px"   
            ToolTip="Collapse your web page" StyleSetName="simple">
       
            <ClientEvents Loaded="load_splitterUrl"></ClientEvents>
            <Panes>
                <ig:SplitterPane FrameScrolling="True" 
                    Size="13%" CollapsedDirection="PreviousPane" ScrollBars="Hidden" Locked="True" BorderStyle="Groove" FrameBorder="True" MinSize="6px" >
                    <Template>
                   
                        <telerik:RadPanelBar ID="RadPanelBar1" Runat="server" OnItemDataBound="RadPanelBar1_ItemDataBound" Font-Size="Medium" Font-Bold="False"  RenderMode="Auto" ExpandMode="SingleExpandedItem">
                        </telerik:RadPanelBar>
                    
                       &nbsp;
                    
                    </Template>
                </ig:SplitterPane>
                <ig:SplitterPane
                    Size="100%" FrameBorder="False" ScrollBars="Scroll">
                    <Template>
                        <iframe name="myiframe" id="myiframe" 
                            style="border-style: none; border-color: inherit; border-width: 0px; margin: 0px; padding: 0px;"
                            src="index.html" class="auto-style2" scrolling="yes"></iframe>

                    </Template>
                </ig:SplitterPane>
            </Panes>
        </ig:WebSplitter>
      
                <div class="auto-style7">
                  
                </div>
        <br />
       <cc1:msgBox ID="msgBox1" runat="server" />
             <asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>
    </form>
  
    
</body>
</html>

