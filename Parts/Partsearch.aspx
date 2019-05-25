<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Partsearch.aspx.cs" Inherits="Partsearch" %>
<%@ Register Assembly="Infragistics35.Web.v10.2, Version=10.2.20102.1011, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.Web.UI.LayoutControls" TagPrefix="ig" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="msgBox" Namespace="BunnyBear" TagPrefix="cc1" %>


<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Welcome:Kia Motors Nigeria Parts Enquiry</title>
    <link href="css/main.css" rel="stylesheet" type="text/css" />
    <%--<link rel="stylesheet" type="text/css" href="css/HQLHrms.css"/>--%>         <%--<link rel="stylesheet" type="text/css" href="css/wtf-all.css"/>--%>

     <link href="styles.css" rel="stylesheet" type="text/css" />

    <style type="text/css">
            .style3
            {
                font-size: x-large;
            }
            .auto-style81 {
            height: 640px;
            width: 1501px;
        }
             .auto-style91 {
            height: 84px;
            width: 355px;
        }
            .auto-style95 {
            height: 568px;
            width: 1493px;
        }
        .auto-style96 {
            color: #FFFFFF;
        }
            .auto-style97 {
            width: 626px;
            height: 20px;
            text-align: left;
        }
            .auto-style98 {
            height: 36px;
            width: 1500px;
        }
            .auto-style99 {
            padding: 6px 0;
            background-color: steelblue;
            border-bottom: 1px solid #0054A8;
            line-height: 4px;
            width: 1304px;
            height: 40px;
            text-align: left;
        }
            .auto-style138 {
            background-color: steelblue;
            width: 1682px;
            height: 29px;
        }
            .tbl1 {
    background:#FFFFFF url(../images/icon.png) no-repeat 4px 4px;
    padding:4px 4px 4px 22px; padding-right:initial;height:18px;
}
        .search_textbx {
    background:url(../images/icon.png) right no-repeat;
    background-size: 19px 19px;
    height:18px;
    font:15px Ms Sans Serif;
    padding-right:21px;
    color:#646262;
    width:130px;
    border:1px solid gray;
}
            .auto-style143 {
            height: 27px;
            width: 138px;
            margin-top:10px;
            vertical-align:top;
        }
            .auto-style144 {
            width: 694px;
            height: 388px;
        }
            .auto-style147 {
            padding: 6px 0;
            background-color: steelblue;
            border-bottom: 1px solid #0054A8;
            line-height: 4px;
            width: 2371px;
            height: 40px;
        }
            .auto-style146 {
            color: #FFFFFF;
            margin-top: 0px;
        }
            </style>
     <style type="text/css">
   
           /*body{
                margin: 0px;
                text-align:center;
                background-color:#ebe9d7;
                font-family:Arial, Sans-Serif;
                font-size:0.75em;
            }*/
            .box 
            {
            	margin: 0px auto;
            	width:960px;
            	background-color:#ffffff;
            	text-align:left;
                position: relative;
            }
            .header
            {
            	height:100px;
            }
            .header h1
            {
            	margin:0px;
            	padding:30px;
            }
            .menu
            {
            	height:30px;
            	border-top:solid 1px #dccfbb;
            	border-bottom:solid 1px #dccfbb;
            	background-color:white;
            }
            .menu div
            {
            	padding:10px 30px;
            }
            .menu a
            {
            	margin:0px 10px;
            	color:#ffc400;
            	text-decoration: none;
            }
            .content
            {
             	padding:10px 30px;
            }
            #contactFormContainer
            {
            	position:absolute;
            	right:0px;
            	float:right;
            }
            #contactForm
            {
            	height:400px;
            	width:357px;
            	/*background-image:url('../images/bkg.jpg');*/
                background-color:steelblue;
            	display:none;
            }
            #contactForm fieldset
            {
            	padding:30px;
            	border:none;
            }      
            #contactForm label
            {
            	display:block;
            	color:white;
            }      
            #contactForm input[type=text]
            {
            	display:block;
            	border:solid 1px #4d3a24;
            	width:100%;
            	margin-bottom:10px;
            	height:24px;
            }  
            #contactForm textarea
            {
            	display:block;
            	border:solid 1px #4d3a24;
            	width:100%;
            	margin-bottom:10px;
            }  
            #contactForm input[type=submit]
            {
            	background-color:#4d3a24;
            	border:solid 1px #23150c;
            	color:#fecd28;
            	padding:5px;
            }                
            #contactLink
            {
            	height:40px;
            	width:357px;
            	background-image:url('../images/slidein_button.png');
            	display:block;
            	cursor:pointer;
            }
            #messageSent
            {
            	color:#ff9933;
            	display:none;
            }
         .auto-style152 {
             width: 281px;
         }
         .auto-style153 {
             width: 44px;
         }
         .auto-style154 {
             width: 269%;
             height: 285px;
         }
         .auto-style150 {
             height: 448px;
             width: 780px;
         }
         </style>
        <script src="../js/jquery-1.2.6.min.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(document).ready(function(){

                $("#contactLink").click(function(){
                    if ($("#contactForm").is(":hidden")){
                        $("#contactForm").slideDown("slow");
                    }
                    else{
                        $("#contactForm").slideUp("slow");
                    }
                });
                
            });
            
            function closeForm(){
                $("#messageSent").show("slow");
                setTimeout('$("#messageSent").hide();$("#contactForm").slideUp("slow")', 10000);
           }
        </script>
    <script language="javascript"   type="text/javascript">

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
<body onload="hideReport();">
    
    <form id="form1" runat="server" class="auto-style81">
        
                 <table class="auto-style98" ><td valign="bottom" class="auto-style99" > 
                 
                         <br />
                         <br />
                         <br />
                         <br />
                         <br />
                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Label ID="Label2" runat="server" CssClass="auto-style146" Font-Size="XX-Large" Text="Kia Motors Nigeria Parts Enquiry" Height="16px" Width="441px"></asp:Label>
                         <br />
                         <br />
 </td><td valign="top" class="auto-style147" > 
                 
                         <br />
                 
                         <asp:Label ID="Label3" runat="server" CssClass="auto-style96" Font-Size="Large" Text="Hotlines:07053223233,07080669900"></asp:Label>
                         <br />
                         <br />
                         <br />
                         <br />
                         <br />
                         <asp:Label ID="Label4" runat="server" CssClass="auto-style96" Font-Size="Large" Text="eMail:smaharana@kiamotorsnigeria.com,service@kiamotorsnigeria.com"></asp:Label>
                         <br />
                         <br />
                     </td></table>

         <div class="box">
            <div id="contactFormContainer" >
                <div id="contactForm">
                       <label for="lblnames" >Full Name*</label>
                    <asp:TextBox Width="345px" ID="txtname" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="White" runat="server" ControlToValidate="txtname" ErrorMessage="Please enter your name!" ></asp:RequiredFieldValidator>
                        <label for="Email">Email Address *</label>
                    <asp:TextBox  Width="345px" ID="txtemail" runat="server"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ForeColor="White" runat="server" ControlToValidate="txtemail" ErrorMessage="Please enter your email" ></asp:RequiredFieldValidator>
                   <br /> <asp:RegularExpressionValidator ID="RegularExpressionValidator2"
              runat="server" ErrorMessage="Please enter a valid email address!"
                  ValidationGroup="vgSubmit" ControlToValidate="txtemail"
                  CssClass="requiredFieldValidateStyle"
               ForeColor="White"
                  ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" style="color: white">
                  </asp:RegularExpressionValidator>
                      <label for="phone">Phone No *</label>
                    <asp:TextBox Width="345px" ID="txtPhone" runat="server"></asp:TextBox>
                                          <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtPhone" ErrorMessage="Please enter your GSM Number!" ForeColor="White"></asp:RequiredFieldValidator>
                        <label for="Message">Your message *</label>
           <asp:TextBox ID="txtbody" runat="server" Height="60px" Width="345px" TextMode="MultiLine"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator4"  runat="server" ControlToValidate="txtbody" ErrorMessage="Please enter your message!" ForeColor="White"></asp:RequiredFieldValidator><br/>
                    <asp:Button ID="Button1" runat="server" OnClientClick="closeForm()" OnClick="Button1_Click" Text="Send Message" Height="30px" Width="100px" /><br/>
                <br />
                </div>
               
                <div id="contactLink"></div>
                 
            </div>
             
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 
 
            
            <asp:Label ID="lblmsg" runat="server" Font-Size="Medium" CssClass="auto-style148" style="color: #993333"></asp:Label>
             
        </div>



        <table  class="auto-style95" ><td valign="top" class="auto-style153"  > 
                 
                     <img alt="" src="../images/kiapics.png" class="auto-style91" /><telerik:RadAjaxPanel ID="AjaxPanel1" runat="server" HorizontalAlign="NotSet" Height="16px" Width="16px">
        <table cellpadding="0" cellspacing="0" class="auto-style78">
            <tr>
                <td class="auto-style93">&nbsp;</td>
                <td>
                    <asp:TextBox ID="TextBox1"  placeholder="Type the parts you want search for......" runat="server" class="search_textbx" onChange="ShowReport();" OnTextChanged="TextBox1_TextChanged" Width="669px" AutoPostBack="True" Height="52px" Font-Size="Large" ForeColor="#000066"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style93">&nbsp;</td>
                <td valign="top">
 
 
            
            <asp:Label ID="Label1" runat="server" Font-Size="Medium" CssClass="auto-style148" style="color: #993333"></asp:Label>
                  <div class="demo-container size-wide">
               <div id="demo" class="auto-style144">

<div id="ReportIsLoading" runat="server" class="auto-style97" style="display: block; padding-left: 50px; padding-right: 12px; line-height: 10px; border: 1px solid #CCCCCC; color: #000000; font-family: verdana; font-size: 12px; background-color: #ffffff; background-position: 100px center; background-repeat: no-repeat; ">
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <img align="top" alt="" src="../images/1.gif" 
                        style="margin-top: 0px;" title="Loading..." class="auto-style143" />
                                                </div>
<obout:Grid ID="grid1" runat="server" Width="700px" Height="400px" CallbackMode="true" FolderStyle="../styles/premiere_blue"
                        Serialize="true" ShowColumnsFooter="true"  ShowFooter="true" 
                         PageSize="20" PageSizeOptions="100" 
                            AutoGenerateColumns="False" KeepSelectedRecords="False" AllowAddingRecords="False" AllowRecordSelection="False">
                        <%--<ClientSideEvents OnClientCallback="updateGroupTotalsWidths" />--%>
                    <Columns>
                         <obout:Column DataField="" ReadOnly="true" HeaderText="No." Width="80" runat="server">
                    <TemplateSettings TemplateId="tplNumbering"/>
                </obout:Column>
                  <obout:Column ID="Column1" DataField="part" HeaderText="Part Number"  Width="220" runat="server" />
                 <obout:Column ID="Column13" DataField="partdesc" HeaderText="Part Name"  Width="300" runat="server" />
                    <obout:Column ID="Column2" DataField="MAXQTY" HeaderText="Qty"  Width="100" runat="server" />
                        
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
             <ScrollingSettings ScrollHeight="400px" ScrollWidth="700px"/>
	
                    </obout:Grid>




                               <br />
        </div>
        </div>   </td>
            </tr>

            </table>
 
                                                
 
        </telerik:RadAjaxPanel>
             

                        </td><td valign="top" class="auto-style152"  > 
                 
                     <table cellpadding="0" cellspacing="0" class="auto-style154">
                         <tr>
                             <td> 
                 
                     <img alt="" src="../images/Capture.PNG" class="auto-style150" /></td>
                         </tr>
                         <tr>
                             <td>&nbsp;</td>
                         </tr>
                     </table>
                     <br />
                     <br />
            </td></table>  

<asp:SqlDataSource ID="dllDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:AutoEnhancerConnectionString %>"
        SelectCommand="SELECT TOP 10 [partdesc], [part],[MAXQTY] FROM [PartEnq]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="gridDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:AutoEnhancerConnectionString %>"
        SelectCommand="SELECT TOP 10 [partdesc], [part],[MAXQTY]  FROM [PartEnq]"></asp:SqlDataSource>
        <br />
       <cc1:msgBox ID="msgBox1" runat="server" />
             <asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>

                 <table class="auto-style138" >
                     <tr>
                         <td  valign="top"></td>
                     </tr>
                 </table>
        
    </form>
  
    
</body>
</html>

