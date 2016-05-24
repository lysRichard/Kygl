<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="modiPwd.aspx.cs" Inherits="KyManage.KyGL.modiPwd" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>管理区域</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
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
<body>
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="17" height="29" valign="top" background="images/mail_leftbg.gif"><img src="images/left-top-right.gif" width="17" height="29" /></td>
        <td width="935" height="29" valign="top" background="images/content-bg.gif"><table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="left_topbg" id="table2">
          <tr>
            <td height="31"><div class="titlebt">
                修改密码</div></td>
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
                    当前位置：修改密码</td>
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
                    <td width="90%" valign="top"><span class="left_txt2">在这里，您可以对您自己的登录密码进行修改。</span></td>
                  </tr>
                </table></td>
              </tr>
              <tr>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td><table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="nowtable">
                  <tr>
                    <td class="left_bt2">&nbsp;&nbsp;&nbsp;修改密码</td>
                  </tr>
                </table></td>
              </tr>
              <tr>
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td align="right" bgcolor="#f2f2f2" class="left_txt2" height="30" width="12%">
                            旧密码：</td>
                        <td bgcolor="#f2f2f2" width="3%">
                        </td>
                        <td bgcolor="#f2f2f2" height="30" width="60%">
                            <font color="red"><asp:TextBox ID="oldpwd" runat="server" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="oldpwd"
                                        ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator></font></td>
                        <td bgcolor="#f2f2f2" class="left_txt" height="30" width="25%">
                            旧密码</td>
                    </tr>
                  <tr>
                    <td height="30" align="right" class="left_txt2">
                        新密码：</td>
                    <td>&nbsp;</td>
                    <td height="30">
                        <font color="red"><asp:TextBox ID="newpwd" runat="server" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="newpwd"
                                        ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator></font></td>
                    <td height="30" class="left_txt">
                        新密码</td>
                  </tr>
                    <tr>
                        <td align="right" class="left_txt2" height="30">
                            确认密码：</td>
                        <td>
                        </td>
                        <td height="30">
                            <span
                                style="color: #ff0000"><asp:TextBox ID="newpwd2" runat="server" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="newpwd2"
                                        ErrorMessage="*"></asp:RequiredFieldValidator>
                                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="newpwd"
                                        ControlToValidate="newpwd2" ErrorMessage="两次密码不一致"></asp:CompareValidator></span></td>
                        <td class="left_txt" height="30">
                        确认密码</td>
                    </tr>
                    <tr>
                        <td align="right" class="left_txt2" height="30">
                        </td>
                        <td>
                        </td>
                        <td align="center" height="30">
                <asp:Button ID="btnOk" runat="server" OnClick="btnOk_Click" Text=" 提 交 " /></td>
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
        <td valign="middle" background="images/mail_leftbg.gif"><img src="images/buttom_left2.gif" width="17" height="17" /></td>
          <td height="17" valign="top" background="images/buttom_bgs.gif"><img src="images/buttom_bgs.gif" width="17" height="17" /></td>
        <td background="images/mail_rightbg.gif"><img src="images/buttom_right2.gif" width="16" height="17" /></td>
      </tr>
    </table>
    </form>
</body>
</html>
