<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="right.aspx.cs" Inherits="KyManage.KyGL.right" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <link href="images/skin.css" rel="stylesheet" type="text/css" />
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" /><style type="text/css">
    <!--
    body {
	    margin-left: 0px;
	    margin-top: 0px;
	    margin-right: 0px;
	    margin-bottom: 0px;
	    background-color: #EEF2FB;
    }
                                                                              .style1
                                                                              {
                                                                                  font-size: small;
                                                                              }
                                                                              .style2
                                                                              {
                                                                                  font-family: Arial, Helvetica, sans-serif;
                                                                                  font-size: 12px;
                                                                                  line-height: 25px;
                                                                                  color: #666666;
                                                                                  width: 59%;
                                                                              }
    -->
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="17" valign="top" background="images/mail_leftbg.gif"><img src="images/left-top-right.gif" width="17" height="29" /></td>
        <td valign="top" background="images/content-bg.gif"><table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="left_topbg" id="table2">
          <tr>
            <td height="31"><div class="titlebt">欢迎界面</div></td>
          </tr>
        </table></td>
        <td width="16" valign="top" background="images/mail_rightbg.gif"><img src="images/nav-right-bg.gif" width="16" height="29" /></td>
      </tr>
      <tr>
        <td valign="middle" background="images/mail_leftbg.gif">&nbsp;</td>
        <td valign="top" bgcolor="#F7F8F9"><table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td colspan="2" valign="top">&nbsp;</td>
            <td>&nbsp;</td>
            <td valign="top">&nbsp;</td>
          </tr>
          <tr>
              <td colspan="4" valign="top">
                  <span class="left_bt">感谢您使用 高校科研管理信息系统程序</span><br>
                  <br>
                <span class="left_txt">&nbsp;<img src="images/ts.gif" width="16" height="16"> </span>&nbsp;<span 
                      class="style1">您可以在此页面进行科研信息的管理</span></td>
          </tr>
          <tr>
            <td colspan="4" align="center" height="200px">
                <span class="left_txt">
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="left_txt"><br>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
            </td>

          </tr>
          <tr>
            <td colspan="2" valign="top"><!--JavaScript部分-->
                  <SCRIPT language=javascript>
    function secBoard(n)
    {
    for(i=0;i<secTable.cells.length;i++)
    secTable.cells[i].className="sec1";
    secTable.cells[n].className="sec2";
    for(i=0;i<mainTable.tBodies.length;i++)
    mainTable.tBodies[i].style.display="none";
    mainTable.tBodies[n].style.display="block";
    }
              </SCRIPT>
                  <!--HTML部分-->
                  </td>
            <td>&nbsp;</td>
            <td valign="top"></td>
          </tr>
          <tr>
            <td height="40" colspan="4"><table width="100%" height="1" border="0" cellpadding="0" cellspacing="0" bgcolor="#CCCCCC">
              <tr>
                <td></td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td width="2%">&nbsp;</td>
            <td class="style2"><img src="images/icon-mail2.gif" width="16" height="11"> 
                123456@qq.com<br />
                  <img src="images/icon-phone.gif" width="17" height="14"> 1234567<td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
        </table></td>
        <td background="images/mail_rightbg.gif">&nbsp;</td>
      </tr>
      <tr>
        <td valign="bottom" background="images/mail_leftbg.gif"><img src="images/buttom_left2.gif" width="17" height="17" /></td>
        <td background="images/buttom_bgs.gif"><img src="images/buttom_bgs.gif" width="17" height="17"></td>
        <td valign="bottom" background="images/mail_rightbg.gif"><img src="images/buttom_right2.gif" width="16" height="17" /></td>
      </tr>
    </table>
    </div>
    </form>
</body>
</html>
