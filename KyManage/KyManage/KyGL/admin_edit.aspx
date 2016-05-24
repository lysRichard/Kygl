<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin_edit.aspx.cs" Inherits="KyManage.KyGL.admin_edit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>admin</title>
    <!--link href="Admin_Style.css" rel="stylesheet" type="text/css"-->
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
    <script type="text/javascript">
        function selectChange(from,to)
        {
           //alert("From:"+from.selectedIndex+" To: "+to);
           if(from.selectedIndex=="1")
           {
                document.getElementById("trguanli").style.display="block";
           }
           else
           {
                document.getElementById("trguanli").style.display="none";
           }
        }
        function client_OnTreeNodeChecked()
        {
            var obj = window.event.srcElement;
            var treeNodeFound = false;
            var checkedState;
            if (obj.tagName == "INPUT" && obj.type == "checkbox")
            {
                var treeNode = obj;
                checkedState = treeNode.checked;
                do
                {
                    obj = obj.parentElement;
                } while (obj.tagName != "TABLE")
                var parentTreeLevel = obj.rows[0].cells.length;
                var parentTreeNode = obj.rows[0].cells[0];
                var tables = obj.parentElement.getElementsByTagName("TABLE");
                var numTables = tables.length
                if (numTables >= 1)
                {
                    for (i=0; i < numTables; i++)
                    {
                        if (tables[i] == obj)
                        {
                            treeNodeFound = true;
                             i++;
                             if (i == numTables)
                            {
                                return;
                            }
                    }
                    if (treeNodeFound == true)
                    {
                        var childTreeLevel = tables[i].rows[0].cells.length;
                        if (childTreeLevel > parentTreeLevel)
                        {
                            var cell = tables[i].rows[0].cells[childTreeLevel - 1];
                            var inputs = cell.getElementsByTagName("INPUT");
                            inputs[0].checked = checkedState;
                        }
                        else
                        {
                            return;
                        }
                    }
                }
            }
            }
        }
    </script>
</head>
<body style="font-size:9pt;">
    <form id="form1" runat="server">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td width="17" height="29" valign="top" background="images/mail_leftbg.gif"><img src="images/left-top-right.gif" width="17" height="29" /></td>
            <td width="935" height="29" valign="top" background="images/content-bg.gif"><table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="left_topbg" id="table2">
              <tr>
                <td height="31"><div class="titlebt">
                    编辑管理员</div></td>
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
                        当前位置：编辑管理员</td>
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
                        <td width="90%" valign="top"><span class="left_txt2">在这里，您可以对管理员信息进行编辑。</span></td>
                      </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td>&nbsp;</td>
                  </tr>
                  <tr>
                    <td><table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="nowtable">
                      <tr>
                        <td class="left_bt2">&nbsp;&nbsp;&nbsp;管理员编辑</td>
                      </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="12%" height="30" align="right" bgcolor="#f2f2f2" class="left_txt2">
                            <font color="red"><span style="color: #000000">用户名</span></font>：</td>
                        <td width="3%" bgcolor="#f2f2f2" style="color: #000000">&nbsp;</td>
                        <td width="60%" height="30" bgcolor="#f2f2f2" style="color: #000000">
                            <asp:TextBox ID="username" runat="server"></asp:TextBox>&nbsp;<font color="red">*</font></td>
                        <td width="25%" height="30" bgcolor="#f2f2f2" class="left_txt">
                            用户名</td>
                      </tr>
                        <tr>
                            <td align="right" bgcolor="#f2f2f2" class="left_txt2" height="30" width="12%">
                                旧密码：</td>
                            <td bgcolor="#f2f2f2" width="3%">
                            </td>
                            <td bgcolor="#f2f2f2" height="30" width="60%">
                                <asp:TextBox ID="password" runat="server" TextMode="Password"></asp:TextBox><font color="red">*</font></td>
                            <td bgcolor="#f2f2f2" class="left_txt" height="30" width="25%">
                                旧密码</td>
                        </tr>
                      <tr>
                        <td height="30" align="right" class="left_txt2">
                            新密码：</td>
                        <td>&nbsp;</td>
                        <td height="30">
                            <asp:TextBox ID="password1" runat="server" TextMode="Password"></asp:TextBox><font color="red">*</font></td>
                        <td height="30" class="left_txt">
                            新密码</td>
                      </tr>
                        <tr>
                            <td align="right" class="left_txt2" height="30">
                                确认密码：</td>
                            <td>
                            </td>
                            <td height="30">
                                <asp:TextBox ID="password2" runat="server" TextMode="Password"></asp:TextBox><span
                                    style="color: #ff0000">*</span></td>
                            <td class="left_txt" height="30">
                            确认密码</td>
                        </tr>
                        <%--<tr>
                            <td align="right" class="left_txt2" height="30">
                                真实姓名：</td>
                            <td>
                            </td>
                            <td height="30">
                    <span style="font-size: 10pt"><font color="red"><asp:TextBox ID="realName" runat="server"></asp:TextBox>*</font></span></td>
                            <td class="left_txt" height="30">
                                真实姓名</td>
                        </tr>--%>
                        <%--<tr>
                            <td align="right" class="left_txt2" height="30">
                                权限组：</td>
                            <td>
                            </td>
                            <td height="30">
                                <asp:DropDownList ID="ddltype" runat="server">
                                    <asp:ListItem Value="1">前台浏览</asp:ListItem>
                                    <asp:ListItem Value="2">后台管理</asp:ListItem>
                                </asp:DropDownList></td>
                            <td class="left_txt" height="30">
                            </td>
                        </tr>--%>
                        <%--<tr id="trguanli" runat="server" visible="false">
                            <td align="right" class="left_txt2" height="30">
                                后台权限：</td>
                            <td>
                            </td>
                            <td height="30">
                            <asp:CheckBoxList ID="userRight" runat="server" RepeatColumns="3" RepeatDirection="Horizontal"
                                Width="315px" OnInit="userRight_Init">

                            </asp:CheckBoxList>
                                <asp:TreeView ID="TreeView1" runat="server" ShowCheckBoxes="All" onclick='client_OnTreeNodeChecked()'>
                                </asp:TreeView>
                            </td>
                            <td class="left_txt" height="30">
                                权限分配</td>
                        </tr>--%>
                        <tr>
                            <td align="right" class="left_txt2" height="30">
                            </td>
                            <td>
                            </td>
                            <td align="center" height="30">
                  <asp:Button ID="Button1" runat="server" Text=" 修 改 " OnClick="Button1_Click" />&nbsp; 
		        <input name="Cancel" type="button" id="Cancel" value=" 取&nbsp;&nbsp;消 " onClick="window.location.href='Admin.aspx'" style="cursor: hand;background-color: #cccccc;"></td>
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
