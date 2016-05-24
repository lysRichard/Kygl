
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="projectList.aspx.cs" Inherits="KyManage.KyGL.projectList" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
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
            font-size: small;
        }
        -->
     </style>

    <link href="images/skin.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
  <div>
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td width="17" height="29" valign="top" background="images/mail_leftbg.gif">
                    <strong>
                    <img src="images/left-top-right.gif" width="17" height="29" class="style1" /></strong><span 
                        class="style1"><strong> </strong></span>
                </td>
                <td width="935" height="29" valign="top" background="images/content-bg.gif">
                    <table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="left_topbg"
                        id="table2">
                        <tr>
                            <td height="31">
                                <div class="style1">
                                    <strong>项目管理</strong></div>
                            </td>
                        </tr>
                    </table>
                </td>
                <td width="16" valign="top" background="images/mail_rightbg.gif">
                    <img src="images/nav-right-bg.gif" width="16" height="29" />
                </td>
            </tr>
            <tr>
                <td height="71" valign="middle" background="images/mail_leftbg.gif">
                    &nbsp;
                </td>
                <td valign="top" bgcolor="#F7F8F9">
                    <table width="100%" height="138" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td height="13" valign="top">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td valign="top">
                                <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td class="left_txt">
                                            当前位置：项目管理
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="20">
                                            <table width="100%" height="1" border="0" cellpadding="0" cellspacing="0" bgcolor="#CCCCCC">
                                                <tr>
                                                    <td>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <table width="100%" height="55" border="0" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td width="10%" height="55" valign="middle">
                                                        <img src="images/title.gif" width="54" height="55">
                                                    </td>
                                                    <td width="90%" valign="top">
                                                        <span class="left_txt2">&nbsp;&nbsp;<span class="style1"> 在这里，您可以进行项目管理。</span><br />
                                                        </span>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="nowtable">
                                                <tr>
                                                    <td class="left_bt2">
                                                        &nbsp;&nbsp;&nbsp;项目列表
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;<span style="font-size: 9pt; font-family: Arial"><a href="projectAdd.aspx" target="_blank">添加项目</a>
                                                &nbsp; &nbsp; 项目编号：<asp:TextBox ID="TextName" runat="server"></asp:TextBox>
                                                <asp:Button ID="btnSearch" runat="server" Text=" 搜 索 " OnClick="btnSearch_Click" /></span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="font-size: 12px;">
                                            <asp:GridView ID="infoList" runat="server" AutoGenerateColumns="False" BackColor="White"
                                                BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="prjid"
                                                ForeColor="Black" GridLines="Vertical" OnRowDeleting="infoList_RowDeleting" PageSize="12"
                                                Width="100%">
                                                <FooterStyle BackColor="#CCCC99" />
                                                <RowStyle BackColor="#EFF3FB" />
                                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="White" />
                                                <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                <AlternatingRowStyle BackColor="White" />
                                                <Columns>
                                                    <asp:TemplateField HeaderText="选中">
                                                        <ItemStyle Width="30px" />
                                                        <ItemTemplate>
                                                            <asp:CheckBox ID="GGID" runat="server" Checked="False" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="项目编号">
                                                        <ItemStyle Width="60px" />
                                                        <ItemTemplate>
                                                            <%#Eval("project_number")%>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="项目名称">
                                                        <ItemStyle Width="160px" />
                                                        <ItemTemplate>
                                                            <a href='projectEdit.aspx?i=<%#Eval("prjid") %>'>
                                                                <%#Eval("project_name")%></a>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="教师编号">
                                                        <ItemStyle Width="60px" />
                                                        <ItemTemplate>
                                                            <%#Eval("teacher_number")%>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="文件号">
                                                        <ItemStyle Width="60px" />
                                                        <ItemTemplate>
                                                            <%#Eval("id")%>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="立项时间">
                                                        <ItemStyle Width="380px" />
                                                        <ItemTemplate>
                                                            <%#Eval("time")%>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="立项组织">
                                                        <ItemStyle Width="380px" />
                                                        <ItemTemplate>
                                                            <%#Eval("organization")%>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="负责人">
                                                        <ItemStyle Width="380px" />
                                                        <ItemTemplate>
                                                            <%#Eval("director")%>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="经费">
                                                        <ItemStyle Width="380px" />
                                                        <ItemTemplate>
                                                            <%#Eval("funds")%>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <%--<asp:TemplateField HeaderText="评论">
                                        <ItemStyle Width="120px" />
                                        <ItemTemplate> <a href="comment_manage.aspx?infoid=<%#Eval("id")%>&type=1">获取评论</a></ItemTemplate>
                                    </asp:TemplateField>--%>
                                                    <asp:BoundField DataField="log_time" HeaderText="添加时间" SortExpression="log_time">
                                                        <ItemStyle Width="150px" />
                                                    </asp:BoundField>
                                                    <asp:TemplateField HeaderText="操作">
                                                        <ItemStyle Width="160px" />
                                                        <ItemTemplate>
                                                           <a href='projectEdit.aspx?i=<%#Eval("prjid") %>'>编辑</a>|
                                                            <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete"
                                                                OnClientClick="return confirm('确定要删除吗？');" Text="删除"></asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <webdiyer:AspNetPager ID="pager" runat="server" OnPageChanged="AspNetPager1_PageChanged"
                                                AlwaysShow="True" PageSize="15">
                                            </webdiyer:AspNetPager>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
                <td background="images/mail_rightbg.gif">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td valign="middle" background="images/mail_leftbg.gif">
                    <img src="images/buttom_left2.gif" width="17" height="17" />
                </td>
                <td height="17" valign="top" background="images/buttom_bgs.gif">
                    <img src="images/buttom_bgs.gif" width="17" height="17" />
                </td>
                <td background="images/mail_rightbg.gif">
                    <img src="images/buttom_right2.gif" width="16" height="17" />
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
