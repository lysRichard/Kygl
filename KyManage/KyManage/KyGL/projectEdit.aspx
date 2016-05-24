<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="projectEdit.aspx.cs" Inherits="KyManage.KyGL.projectEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
     <title>修改项目信息</title>
    <style type="text/css">
    <!--
    body {
	    margin-left: 0px;
	    margin-top: 0px;
	    margin-right: 0px;
	    margin-bottom: 0px;
	    background-color: #F8F9FA;
    }
        .style2
        {
            height: 31px;
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
            height: 33px;
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
                    项目修改</div></td>
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
                        当前位置：项目修改</td>
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
                        <td width="90%" valign="top"><span class="left_txt2">在这里，您可以根据您的需求修改项目信息。</span></td>
                      </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td>&nbsp;</td>
                  </tr>
                  <tr>
                    <td><table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="nowtable">
                      <tr>
                        <td class="left_bt2">&nbsp;&nbsp;&nbsp; 项目修改</td>
                      </tr>
                    </table></td>
                  </tr>
                 <tr>
                    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="12%" height="30" align="right" bgcolor="#f2f2f2" class="left_txt2">
                            <font color="red">*</font>项目编号：</td>
                        <td width="3%" bgcolor="#f2f2f2">&nbsp;</td>
                        <td width="60%" height="30" bgcolor="#f2f2f2">
                            <asp:TextBox ID="TextProject_Number" runat="server" size="50"></asp:TextBox>
                          </td>
                        <td width="25%" height="30" bgcolor="#f2f2f2" class="left_txt">
                            项目编号</td>
                      </tr>
                      <tr>
                        <td width="12%" height="30" align="right" bgcolor="#f2f2f2" class="left_txt2">
                            项目名称：</td>
                        <td width="3%" bgcolor="#f2f2f2">&nbsp;</td>
                        <td width="60%" height="30" bgcolor="#f2f2f2">
                            <asp:TextBox ID="TextProject_Name" runat="server" size="50"></asp:TextBox>
                        </td>
                        <td width="25%" height="30" bgcolor="#f2f2f2" class="left_txt">
                            项目名称</td>
                      </tr>
                      <tr>
                        <td width="12%" height="30" align="right" bgcolor="#f2f2f2" class="left_txt2">
                            教师编号：</td>
                        <td width="3%" bgcolor="#f2f2f2">&nbsp;</td>
                        <td width="60%" height="30" bgcolor="#f2f2f2">
                            <asp:DropDownList ID="DdlTeacher_Number" runat="server" 
                            oninit="DdlTeacher_Number_Init" 
                                onselectedindexchanged="DdlTeacher_Number_SelectedIndexChanged">
                            </asp:DropDownList>

                          </td>
                        <td width="25%" height="30" bgcolor="#f2f2f2" class="left_txt">
                            教师编号</td>
                      </tr>
                      
                      
                      <tr>
                        <td width="12%" height="30" align="right" bgcolor="#f2f2f2" class="left_txt2">
                            立项时间：</td>
                        <td width="3%" bgcolor="#f2f2f2">&nbsp;</td>
                        <td width="60%" height="30" bgcolor="#f2f2f2">
                            <asp:TextBox ID="TextTime" runat="server" size="50" onfocus="$(this).calendar()"></asp:TextBox>
                          </td>
                        <td width="25%" height="30" bgcolor="#f2f2f2" class="left_txt">
                            立项时间</td>
                      </tr>
                      
                      
                        <tr>
                            <td align="right" class="style4">
                                立项单位：</td>
                            <td class="style4">
                            </td>
                            <td class="style4">
                            <asp:TextBox ID="TextOrganization" runat="server" size="50"></asp:TextBox>
                            </td>
                            <td class="left_txt">
                                立项单位</td>
                        </tr>
                      
                      
                        <tr>
                            <td align="right" class="style5">
                                负责人：</td>
                            <td class="style5">
                                </td>
                            <td class="style5">
                            <asp:TextBox ID="TextDirector" runat="server" size="50"></asp:TextBox>
                            </td>
                            <td class="left_txt">
                                负责人</td>
                        </tr>
                      
                      
                        <tr>
                            <td align="right" class="style6">
                                文件号：</td>
                            <td class="style6">
                                </td>
                            <td class="style6">
                            <asp:TextBox ID="TextId" runat="server" size="50"></asp:TextBox>
                            </td>
                            <td class="left_txt">
                                文件号</td>
                        </tr>
                      
                      
                        <tr>
                            <td align="right" class="style7">
                                经费：</td>
                            <td class="style7">
                                </td>
                            <td class="style7">
                            <asp:TextBox ID="TextFunds" runat="server" size="50"></asp:TextBox>
                            </td>
                            <td class="left_txt">
                                经费</td>
                        </tr>
                        <tr>
                            <td align="right" class="left_txt2" height="30">
                                <br />
                                <br />
                            </td>
                            <td>
                            </td>
                            <td align="center" height="30">
                                <asp:Button ID="Button1" runat="server" Text=" 修    改 " OnClick="Button1_Click" /></td>
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
