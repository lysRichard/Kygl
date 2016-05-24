<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="teacherEdit.aspx.cs" Inherits="KyManage.KyGL.teacherEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>编辑教师信息</title>
    <style type="text/css">
    <!--
    body {
	    margin-left: 0px;
	    margin-top: 0px;
	    margin-right: 0px;
	    margin-bottom: 0px;
	    background-color: #F8F9FA;
    }
    -->
    </style>

    <link href="images/skin.css" rel="stylesheet" type="text/css" />
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
                    教师编辑</div></td>
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
                        当前位置：教师编辑</td>
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
                        <td width="90%" valign="top"><span class="left_txt2">在这里，您可以根据您的需求编辑教师资料。</span></td>
                      </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td>&nbsp;</td>
                  </tr>
                  <tr>
                    <td><table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="nowtable">
                      <tr>
                        <td class="left_bt2">&nbsp;&nbsp;&nbsp;教师编辑</td>
                      </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="12%" height="30" align="right" bgcolor="#f2f2f2" class="left_txt2">
                            <font color="red">*</font>教师姓名：</td>
                        <td width="3%" bgcolor="#f2f2f2">&nbsp;</td>
                        <td width="60%" height="30" bgcolor="#f2f2f2">
                            <asp:TextBox ID="TextName" runat="server" size="50"></asp:TextBox>
                          </td>
                        <td width="25%" height="30" bgcolor="#f2f2f2" class="left_txt">
                            教师姓名</td>
                      </tr>
                      <tr>
                        <td width="12%" height="30" align="right" bgcolor="#f2f2f2" class="left_txt2">
                            性别：</td>
                        <td width="3%" bgcolor="#f2f2f2">&nbsp;</td>
                        <td width="60%" height="30" bgcolor="#f2f2f2">
                            <asp:DropDownList ID="DDLSex" runat="server">
                                <asp:ListItem>男</asp:ListItem>
                                <asp:ListItem>女</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td width="25%" height="30" bgcolor="#f2f2f2" class="left_txt">
                            性别</td>
                      </tr>
                      <tr>
                        <td width="12%" height="30" align="right" bgcolor="#f2f2f2" class="left_txt2">
                            年龄：</td>
                        <td width="3%" bgcolor="#f2f2f2">&nbsp;</td>
                        <td width="60%" height="30" bgcolor="#f2f2f2">
                            <asp:TextBox ID="TextAge" runat="server" size="50"></asp:TextBox>
                          </td>
                        <td width="25%" height="30" bgcolor="#f2f2f2" class="left_txt">
                            年龄</td>
                      </tr>
                      
                      
                      <tr>
                        <td width="12%" height="30" align="right" bgcolor="#f2f2f2" class="left_txt2">
                            教师介绍：</td>
                        <td width="3%" bgcolor="#f2f2f2">&nbsp;</td>
                        <td width="60%" height="30" bgcolor="#f2f2f2">
                            <asp:TextBox ID="TextTeacher_Profile" runat="server" size="50" Height="159px" 
                                TextMode="MultiLine" Width="359px"></asp:TextBox>
                          </td>
                        <td width="25%" height="30" bgcolor="#f2f2f2" class="left_txt">
                            介绍</td>
                      </tr>
                      
                      
                        <tr>
                            <td align="right" class="left_txt2" height="30">
                            </td>
                            <td>
                            </td>
                            <td height="30">
                            </td>
                            <td class="left_txt" height="30">
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="left_txt2" height="30">
                            </td>
                            <td>
                            </td>
                            <td align="center" height="30">
                                <asp:Button ID="Button1" runat="server" Text=" 编 辑 " OnClick="Button1_Click" /></td>
                            <td class="left_txt" height="30">
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="left_txt2" height="30">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td align="center" height="30">
                                &nbsp;</td>
                            <td class="left_txt" height="30">
                                &nbsp;</td>
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
            <td valign="middle" background="images/mail_leftbg.gif"><img src="images/buttom_left2.gif" width="17" height="17" /></td>
              <td height="17" valign="top" background="images/buttom_bgs.gif"><img src="images/buttom_bgs.gif" width="17" height="17" /></td>
            <td background="images/mail_rightbg.gif"><img src="images/buttom_right2.gif" width="16" height="17" /></td>
          </tr>
        </table>
    </div>
    </form>
</body>
</html>
