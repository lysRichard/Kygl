﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="paperEdit.aspx.cs" Inherits="KyManage.KyGL.paperEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>论文修改</title>
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
            height: 30px;
        }
        .style2
        {
            height: 31px;
        }
        .style3
        {
            height: 41px;
        }
        .style4
        {
            height: 35px;
        }
        .style5
        {
            height: 44px;
        }
        .style6
        {
            height: 43px;
        }
        .style7
        {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 12px;
            line-height: 25px;
            color: #000000;
            height: 36px;
        }
        .style9
        {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 12px;
            line-height: 25px;
            color: #666666;
            height: 36px;
        }
        .style10
        {
            height: 36px;
        }
        .style11
        {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 12px;
            line-height: 25px;
            color: #000000;
            height: 39px;
        }
        .style12
        {
            height: 39px;
        }
        .style13
        {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 12px;
            line-height: 25px;
            color: #666666;
            height: 39px;
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
                    论文修改</div></td>
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
                        当前位置：论文修改</td>
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
                        <td width="90%" valign="top"><span class="left_txt2">在这里，您可以根据您的需求修改论文信息。</span></td>
                      </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td>&nbsp;</td>
                  </tr>
                  <tr>
                    <td><table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="nowtable">
                      <tr>
                        <td class="left_bt2">&nbsp;&nbsp;&nbsp; 论文修改</td>
                      </tr>
                    </table></td>
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
                        <td width="12%" align="right" bgcolor="#f2f2f2" class="style7">
                            论文编号：</td>
                        <td width="3%" bgcolor="#f2f2f2" class="style10"></td>
                        <td width="60%" bgcolor="#f2f2f2" class="style10">
                            <asp:TextBox ID="TextPaper_Number" runat="server" size="50"></asp:TextBox>
                        </td>
                        <td width="25%" bgcolor="#f2f2f2" class="style9">
                            论文编号</td>
                      </tr>
                      <tr>
                        <td width="12%" align="right" bgcolor="#f2f2f2" class="style11">
                            教师：</td>
                        <td width="3%" bgcolor="#f2f2f2" class="style12"></td>
                        <td width="60%" bgcolor="#f2f2f2" class="style12">
                           <asp:DropDownList ID="DdlTeacher_Number" runat="server" 
                            oninit="DdlTeacher_Number_Init" 
                                onselectedindexchanged="DdlTeacher_Number_SelectedIndexChanged">
                            </asp:DropDownList>
                          </td>
                        <td width="25%" bgcolor="#f2f2f2" class="style13">
                            教师姓名</td>
                      </tr>
                      
                      
                      <tr>
                        <td width="12%" align="right" bgcolor="#f2f2f2" class="style3">
                            刊物名称：</td>
                        <td width="3%" bgcolor="#f2f2f2" class="style3"></td>
                        <td width="60%" bgcolor="#f2f2f2" class="style3">
                            <asp:TextBox ID="TextPublication_Name" runat="server" size="50"></asp:TextBox>
                          </td>
                        <td width="25%" bgcolor="#f2f2f2" class="left_txt">
                            刊物名称</td>
                      </tr>
                      
                      
                        <tr>
                            <td align="right" class="style3">
                                发表时间：</td>
                            <td class="style3">
                            </td>
                            <td class="style3">
                            <asp:TextBox ID="TextTime" runat="server" size="50" onfocus="$(this).calendar()"></asp:TextBox>
                            </td>
                            <td class="left_txt">
                                发表时间</td>
                        </tr>
                      
                      
                        <tr>
                            <td align="right" class="style4">
                                论文形式：</td>
                            <td class="style4">
                                </td>
                            <td class="style4">
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
                                <asp:Button ID="Button1" runat="server" Text=" 编   辑 " OnClick="Button1_Click" /></td>
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
