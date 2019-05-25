<%@ Page Language="C#" AutoEventWireup="true" CodeFile="menugroups.aspx.cs" Inherits="Security_menugroups" %>
<%@ Register assembly="msgBox" namespace="BunnyBear" tagprefix="cc1" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Untitled Page</title>
      <meta http-equiv="Page-Exit" content="Alpha(Opacity=100)"/>
                   <link rel="stylesheet" type="text/css" href="../css/wtf-all.css"/>
	<link rel="stylesheet" type="text/css" href="../css/HQLHrms.css"/>
    

 
    

    <style type="text/css">
        .auto-style1 {
            width: 761px;
        }
        .auto-style2 {
            width: 559px;
        }
        .auto-style3 {
            width: 480px;
        }
        .auto-style4 {
            width: 924px;
            text-align: left;
        }
        .auto-style7 {
            height: 922px;
        }
        .auto-style8 {
            height: 733px;
        }
        .auto-style9 {
            width: 774px;
            height: 795px;
            margin-bottom: 0px;
        }
        .auto-style10 {
            width: 832px;
        }
        .auto-style5 {
            left: 0px;
            top: 2px;
            width: 38px;
            font-size: medium;
            color: #003399;
        }
        .auto-style11 {
            height: 922px;
            width: 15px;
        }
        </style>
    

 
    

</head>

<body style="height: 672px">
    <form id="form1" runat="server" class="auto-style8">
   
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td class="auto-style10">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="auto-style5"><strong>A</strong>ssign Menu To Users</span></td>
            </tr>
        </table>
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td>
		            <table cellpadding="0" cellspacing="0" class="auto-style1">
                        <tr>
                            <td class="auto-style2">
                                &nbsp;</td>
                            <td class="auto-style4" valign="top">
                                <span class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<telerik:RadButton ID="RadButton1" runat="server" OnClick="RadButton1_Click" Text="Save" CssClass="auto-style6" Skin="Office2007">
                                </telerik:RadButton>
                                </span>
                                <telerik:RadButton ID="RadButton2" runat="server" OnClick="RadButton2_Click" Text="Select All" Skin="Office2010Blue">
                                </telerik:RadButton>
                                <telerik:RadButton ID="RadButton3" runat="server" OnClick="RadButton3_Click" Text="Deselect All" Skin="Office2007">
                                </telerik:RadButton>
                                </td>
                        </tr>
                        </table>

		        </td>
            </tr>
        </table>
    
		            <table cellpadding="0" cellspacing="0" class="auto-style9">
                        <tr>
                            <td valign="top" class="auto-style11">
                                &nbsp;</td>
                            <td valign="top" class="auto-style7">
                               <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
        <telerik:RadListBox RenderMode="Lightweight" runat="server" ID="RadListBox1"  OnSelectedIndexChanged="RadListBox1_SelectedIndexChanged"
            Height="666px"  Width="200px" ButtonSettings-AreaWidth="35px" AllowAutomaticUpdates="True" AutoPostBack="True" ShowCheckAll="True" Skin="Office2010Blue" >
        </telerik:RadListBox>

                            </td>
                            <td valign="top" class="auto-style7">
                                <asp:CheckBoxList ID="chkavailablemenu" runat="server" 
                                    Height="623px" Width="503px" BorderColor="#3366CC" CellPadding="1" 
                                    CellSpacing="1" RepeatColumns="4" BorderStyle="Double" 
                                    Font-Size="Small">
                                </asp:CheckBoxList>

                            </td>
                            <td valign="top" class="style17">
                                &nbsp;</td>
                        </tr>
                    </table>



		        <cc1:msgBox ID="msgBox1" runat="server" />
    </form>
    </body>
</html>

