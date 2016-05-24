<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="paperAdd.aspx.cs" Inherits="KyManage.KyGL.paperAdd" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

  <head id="Head1" runat="server">
      <title>论文添加</title>
    <style type="text/css">
    <!--
    body {
	    margin-left: 0px;
	    margin-top: 0px;
	    margin-right: 0px;
	    margin-bottom: 0px;
	    background-color: #F8F9FA;
    }
        .style1
        {
            height: 20px;
        }
        .style2
        {
            height: 21px;
        }
        .style5
        {
            height: 34px;
        }
        .style6
        {
            height: 38px;
        }
        .style9
        {
            height: 37px;
        }
        .style10
        {
            height: 42px;
        }
        .style11
        {
            height: 35px;
        }
        .style12
        {
            height: 40px;
        }
    -->
    </style>

    <link href="images/skin.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="JS/jquery-1.3.2.js"></script> 
	<script type="text/javascript" src="JS/jquery-calendar.js"></script> 
	<link rel="stylesheet" type="text/css" href="JS/jquery-calendar.css" /> 
</head>
<body  style="font-size:9pt;">
    <form id="form1" runat="server">
   <div>
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td width="17" height="29" valign="top" background="images/mail_leftbg.gif"><img src="images/left-top-right.gif" width="17" height="29" /></td>
            <td width="935" height="29" valign="top" background="images/content-bg.gif"><table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="left_topbg" id="table2">
              <tr>
                <td height="31"><div class="titlebt">
                    论文添加</div></td>
              </tr>
            </table></td>
            <td width="16" valign="top" background="images/mail_rightbg.gif"><img src="images/nav-right-bg.gif" width="16" height="29" /></td>
          </tr>
          <tr>
            <td height="71" valign="middle" background="images/mail_leftbg.gif">&nbsp;</td>
            <td valign="top" bgcolor="#F7F8F9"><table width="100%" height="138" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td height="13" valign="top">&nbsp;</td>
              </tr>
              <tr>
                <td valign="top"><table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="left_txt">
                        当前位置：论文添加</td>
                  </tr>
                  <tr>
                    <td height="20"><table width="100%" height="1" border="0" cellpadding="0" cellspacing="0" bgcolor="#CCCCCC">
                      <tr>
                        <td></td>
                      </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td><table width="100%" height="55" border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <td width="10%" height="55" valign="middle"><img src="images/title.gif" width="54" height="55"></td>
                        <td width="90%" valign="top"><span class="left_txt2">在这里，您可以根据您的需求添加论文信息。</span></td>
                      </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td>&nbsp;</td>
                  </tr>
                   <tr>
                    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="12%" align="right" bgcolor="#f2f2f2" class="style6">
                            <font color="red">*</font><span class="style1">论文</span>名称：</td>
                        <td width="3%" bgcolor="#f2f2f2" class="style6"></td>
                        <td width="60%" bgcolor="#f2f2f2" class="style6">
                            <asp:TextBox ID="TextTitle" runat="server" size="50"></asp:TextBox>
                          </td>
                        <td width="25%" bgcolor="#f2f2f2" class="left_txt">
                            论文名称</td>
                      </tr>
                      <tr>
                        <td width="12%" align="right" bgcolor="#f2f2f2" class="style11">
                            论文编号：</td>
                        <td width="3%" bgcolor="#f2f2f2" class="style11"></td>
                        <td width="60%" bgcolor="#f2f2f2" class="style11">
                            <asp:TextBox ID="TextPaper_Number" runat="server" size="50"></asp:TextBox>
                        </td>
                        <td width="25%" bgcolor="#f2f2f2" class="left_txt">
                            论文编号</td>
                      </tr>
                      <tr>
                        <td width="12%" height="30" align="right" bgcolor="#f2f2f2" class="left_txt2">
                            教师：</td>
                        <td width="3%" bgcolor="#f2f2f2">&nbsp;</td>
                        <td width="60%" height="30" bgcolor="#f2f2f2">
                            
                 
                            <asp:DropDownList ID="DdlTeacher_Number" runat="server" 
                                oninit="DdlTeacher_Number_Init" 
                                onselectedindexchanged="DdlTeacher_Number_SelectedIndexChanged" 
                                style="height: 19px">
                            </asp:DropDownList>
                          </td>
                        <td width="25%" height="30" bgcolor="#f2f2f2" class="left_txt">
                            教师编号</td>
                      </tr>
                      
                      
                      <tr>
                        <td width="12%" align="right" bgcolor="#f2f2f2" class="style9">
                            刊物名称：</td>
                        <td width="3%" bgcolor="#f2f2f2" class="style9"></td>
                        <td width="60%" bgcolor="#f2f2f2" class="style9">
                            <asp:TextBox ID="TextPublication_Name" runat="server" size="50"></asp:TextBox>
                          </td>
                        <td width="25%" bgcolor="#f2f2f2" class="left_txt">
                            刊物名称</td>
                      </tr>
                      
                      
                        <tr>
                            <td align="right" class="style10">
                                发表时间：</td>
                            <td class="style10">
                            </td>
                            <td class="style10">
                            <asp:TextBox ID="TextTime" runat="server" size="50" onfocus="$(this).calendar()"></asp:TextBox>
                            </td>
                            <td class="left_txt">
                                发表时间</td>
                        </tr>
                      
                      
                        <tr>
                            <td align="right" class="style12">
                                论文形式：</td>
                            <td class="style12">
                                </td>
                            <td class="style12">
                            <asp:TextBox ID="TextForm" runat="server" size="50"></asp:TextBox>
                            </td>
                            <td class="left_txt">
                                论文形式</td>
                        </tr>
                      
                      
                        <tr>
                            <td align="right" class="style5">
                                论文等级：</td>
                            <td class="style5">
                                </td>
                            <td class="style5">
                            <asp:TextBox ID="TextLevel" runat="server" size="50"></asp:TextBox>
                            </td>
                            <td class="left_txt">
                                论文等级</td>
                        </tr>
                        <tr>
                            <td align="right" class="left_txt2" height="30">
                                <br />
                                <br />
                            </td>
                            <td>
                            </td>
                            <td align="center" height="30">
                                <asp:Button ID="Button1" runat="server" Text=" 添  加 " OnClick="Button1_Click" /></td>
                            <td class="left_txt" height="30">
                            </td>
                        </tr>
                    </table></td>
                  </tr>
                </table>
                  </td>
              </tr>
            </table></td>
            <td background="images/mail_rightbg.gif">&nbsp;</td>
          </tr>
          <tr>
            <td valign="middle" background="images/mail_leftbg.gif" class="style2"><img src="images/buttom_left2.gif" width="17" height="17" /></td>
              <td valign="top" background="images/buttom_bgs.gif" class="style2"><img src="images/buttom_bgs.gif" width="17" height="17" /></td>
            <td background="images/mail_rightbg.gif" class="style2"><img src="images/buttom_right2.gif" width="16" height="17" /></td>
          </tr>
        </table>
    </div>
    </form>
</body>
</html>
