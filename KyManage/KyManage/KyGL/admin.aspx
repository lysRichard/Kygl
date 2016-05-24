<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin.aspx.cs" Inherits="KyManage.KyGL.admin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>admin</title>
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
    <script language=javascript>
    function unselectall()
    {
        if(document.form1.chkAll.checked){
	    document.form1.chkAll.checked = document.myform.chkAll.checked&0;
        } 	
    }

    function CheckAll(form)
    {
      for (var i=0;i<form.elements.length;i++)
        {
        var e = form.elements[i];
        if (e.Name != "chkAll"&&e.disabled!=true)
           e.checked = form.chkAll.checked;
        }
    }

    </script>

</head>
<body  style="font-size:9pt;">
    <form id="form1" runat="server">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td width="17" height="29" valign="top" background="images/mail_leftbg.gif"><img src="images/left-top-right.gif" width="17" height="29" /></td>
            <td width="935" height="29" valign="top" background="images/content-bg.gif"><table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="left_topbg" id="table2">
              <tr>
                <td height="31"><div class="titlebt">
                    <span style="color: #333333">管理员管理</span></div></td>
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
                        当前位置：<span style="color: #333333">管理员管理</span></td>
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
                        <td width="90%" valign="top"><span class="left_txt2">在这里，您可以对管理员进行管理。<br />
                        </span></td>
                      </tr>
                    </table></td>
                  </tr>
                  
                  <tr>
                    <td><table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="nowtable">
                      <tr>
                        <td class="left_bt2">&nbsp;&nbsp;&nbsp;管理员列表</td>
                      </tr>
                    </table></td>
                  </tr>
                    <tr>
                    <td>&nbsp;<span style="font-size: 9pt; font-family: Arial"><a href="admin_add.aspx" target="_blank">添加管理员</a></span></td>
                  </tr>
                    <tr>
                        <td style="font-size:12px;">
                            <asp:GridView ID="Gridadmin" runat="server" AutoGenerateColumns="False" BackColor="White"
                                BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="user_id"
                                ForeColor="Black" GridLines="Vertical" 
                                PageSize="12" Width="100%">
                                <FooterStyle BackColor="#CCCC99" />
                                <RowStyle BackColor="#EFF3FB" />
                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:TemplateField HeaderText="选中">
                                    <ItemStyle  Width=30px/>
                                    <ItemTemplate>
                                    <asp:CheckBox id="user_id" Checked="False" Runat="server"></asp:CheckBox>
                                    </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="用户名">
                                    <ItemStyle  Width=400px/>
                                    <ItemTemplate>
                                    <%#DataBinder.Eval(Container.DataItem, "UserName")%>
                                    </ItemTemplate>
                                    </asp:TemplateField>
                                     
                                     <%--<asp:TemplateField HeaderText="真实身份">
                                    <ItemStyle  Width=150px/>
                                    <ItemTemplate>
                                    <%#DataBinder.Eval(Container.DataItem, "RealName")%>
                                    </ItemTemplate>
                                    </asp:TemplateField>--%>
                                    <asp:TemplateField HeaderText="登录时间">
                                    <ItemStyle  Width=150px/>
                                    <ItemTemplate>
                                   <%#Eval("log_time")%>
                                    </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="操作">
                                    <ItemStyle  Width=150px/>
                                    <ItemTemplate>
                                  <a href="admin_edit.aspx?action=dele&id=<%#Eval("user_id")%>" onclick="javascript:return confirm('确实要删除吗？');">删除</a> | <a href="admin_edit.aspx?action=updat&id=<%#Eval("user_id")%>">修改</a>
                                    </ItemTemplate>
                                    </asp:TemplateField>
                                    </Columns>
                            </asp:GridView>
                        </td>
                    </tr>
                  <tr>
                    <td align="right"><%--<webdiyer:AspNetPager ID="pager" runat="server" OnPageChanged="AspNetPager1_PageChanged" AlwaysShow="True" PageSize="15"></webdiyer:AspNetPager>--%></td>
                  </tr>
                  <tr>
                  <td align="left" style="font-size: 9pt">
	            <input name="chkAll" type="checkbox" id="chkAll" onclick=CheckAll(this.form) value="checkbox" style="border: 0px;background-color: #eeeeee;">
                      选中本页显示的所有管理员
                      
                          &nbsp;<asp:Button ID="Button1" runat="server" Text="&nbsp;删除选中的管理员&nbsp;" OnClick="Button1_Click" />
	                  </td>
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
