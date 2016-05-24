<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="KyManage.KyGL.login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>网站管理员登陆</title>
    <style type="text/css">
    <!--
    body {
	    margin-left: 0px;
	    margin-top: 0px;
	    margin-right: 0px;
	    margin-bottom: 0px; 
	    background-color: #1D3647;
    }
        .style1
        {
            text-align: center;
        }
        .style2
        {
            width: 32%;
        }
        .style3
        {
            height: 169px;
        }
    -->
    </style>
    <script language="JavaScript">
    function ReferCheckImg(id)
    {
        var obj = document.getElementById('getValidateImg');
        obj.src = "getValidateImg.aspx?id=" + Math.random()
    }
    function correctPNG()
    {
        var arVersion = navigator.appVersion.split("MSIE")
        var version = parseFloat(arVersion[1])
        if ((version >= 5.5) && (document.body.filters)) 
        {
           for(var j=0; j<document.images.length; j++)
           {
              var img = document.images[j]
              var imgName = img.src.toUpperCase()
              if (imgName.substring(imgName.length-3, imgName.length) == "PNG")
              {
                 var imgID = (img.id) ? "id='" + img.id + "' " : ""
                 var imgClass = (img.className) ? "class='" + img.className + "' " : ""
                 var imgTitle = (img.title) ? "title='" + img.title + "' " : "title='" + img.alt + "' "
                 var imgStyle = "display:inline-block;" + img.style.cssText 
                 if (img.align == "left") imgStyle = "float:left;" + imgStyle
                 if (img.align == "right") imgStyle = "float:right;" + imgStyle
                 if (img.parentElement.href) imgStyle = "cursor:hand;" + imgStyle
                 var strNewHTML = "<span " + imgID + imgClass + imgTitle
                 + " style=\"" + "width:" + img.width + "px; height:" + img.height + "px;" + imgStyle + ";"
                 + "filter:progid:DXImageTransform.Microsoft.AlphaImageLoader"
                 + "(src=\'" + img.src + "\', sizingMethod='scale');\"></span>" 
                 img.outerHTML = strNewHTML
                 j = j-1
              }
           }
        }    
    }
    window.attachEvent("onload", correctPNG);
    </script>
    <link href="images/skin.css" rel="stylesheet" type="text/css">
</head>
<body>
    <form id="form1" runat="server">
    <table width="100%" height="166" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="42" valign="top">
            <table width="100%" height="42" border="0" cellpadding="0" cellspacing="0" class="login_top_bg">
              <tr>
                <td width="1%" height="21">&nbsp;</td>
                <td height="42">&nbsp;</td>
                <td width="17%">&nbsp;</td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td valign="top"><table width="100%" height="532" border="0" cellpadding="0" cellspacing="0" class="login_bg">
              <tr>
                <td width="49%" align="right"><table width="91%" height="532" border="0" cellpadding="0" cellspacing="0" class="login_bg2">
                    <tr>
                      <td height="138" valign="top"><table width="89%" height="427" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                          <td height="149">&nbsp;</td>
                        </tr>
                        <tr>
                          <td height="80" align="right" valign="top">&nbsp;</td>
                        </tr>
                        <tr>
                          <td height="198" align="right" valign="top"><table width="100%" border="0" 
                                  cellpadding="0" cellspacing="0" style="height: 150px">
                            <tr>
                              <td class="style2">&nbsp;</td>
                              <td height="75" colspan="2" class="left_txt"><img src="images/logo.jpg" width="279" 
                                      style="height: 80px; margin-left: 0px"></td>
                            </tr>
                            <tr>
                            <%--<tr>
                              <td width="35%">&nbsp;</td>
                              <td height="25" colspan="2" class="left_txt"><p>1- 地区商家信息网门户站建立的首选方案...</p></td>
                            </tr>
                            <tr>
                              <td>&nbsp;</td>
                              <td height="25" colspan="2" class="left_txt"><p>2- 一站通式的整合方式，方便用户使用...</p></td>
                            </tr>
                            <tr>
                              <td>&nbsp;</td>
                              <td height="25" colspan="2" class="left_txt"><p>3- 强大的后台系统，管理内容易如反掌...</p></td>
                            </tr>--%>
                            <tr>
                              <td class="style2">&nbsp;</td>
                              <td width="30%" height="40">&nbsp;</td>
                              <td width="35%" class="style1">刘晏松</td>
                            </tr>
                          </table></td>
                        </tr>
                      </table></td>
                    </tr>
                    
                </table></td>
                <td width="1%" >&nbsp;</td>
                <td width="50%" valign="bottom"><table width="100%" height="59" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                      <td width="4%">&nbsp;</td>
                      <td width="96%" height="38"><span class="login_txt_bt">XX高校科研管理信息系统后台管理</span></td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td height="21"><table cellSpacing="0" cellPadding="0" width="100%" border="0" id="table211" height="328">
                          <tr>
                            <td colspan="2" align="center" class="style3">
                                <table cellSpacing="0" cellPadding="0" width="100%" border="0" height="143" id="table212">
                                  <tr>
                                    <td width="13%" height="38" class="top_hui_text"><span class="login_txt">管理员：&nbsp;&nbsp; </span></td>
                                    <td height="38" colspan="2" class="top_hui_text" align="left">
                                        &nbsp;&nbsp;<asp:TextBox ID="username" runat="server" class="editbox4" size="20"></asp:TextBox><%--<input name="username" class="editbox4" value="" size="20">--%>                            </td>
                                  </tr>
                                  <tr>
                                    <td width="13%" height="35" class="top_hui_text"><span class="login_txt"> 密 码： &nbsp;&nbsp; </span></td>
                                    <td height="35" colspan="2" class="top_hui_text" align="left"> 
                                        &nbsp;&nbsp;<asp:TextBox ID="password" TextMode="Password" runat="server" class="editbox4" size="20"></asp:TextBox><%--<input class="editbox4" type="password" size="20" name="password">--%>
                                      <img src="images/luck.gif" width="19" height="18"> </td>
                                  </tr>
                                  <tr>
                                    <td width="13%" height="35" ><span class="login_txt">验证码：</span></td>
                                    <td height="35" colspan="2" class="top_hui_text" align="left">&nbsp;&nbsp;<asp:TextBox ID="CheckCode" runat="server" onfocus="this.select(); " onmouseout="this.style.background='#FFFFFF'"
                onmouseover="this.style.background='#E1F4EE';" Style="border-top-style: solid;
                border-right-style: solid; border-left-style: solid; border-bottom-style: solid"
                Width="53px"></asp:TextBox>
            &nbsp; <a title="看不清楚,换张图片" href="#" onclick="javascript:ReferCheckImg('getValidateImg')">
                <asp:Image ID="getValidateImg" runat="server" ImageUrl="getValidateImg.aspx" />
            </a>请在左边输入<%--<input class=wenbenkuang name=verifycode type=text value="" maxLength=4 size=10>--%>
                                      </td>
                                  </tr>
                                  <tr>
                                    <td height="35" >&nbsp;</td>
                                    <td width="20%" height="35" >
                                        <asp:Button ID="btnLogin" runat="server" Text="登 陆" class="button" OnClick="btnLogin_Click"/><%--<input name="Submit" type="submit" class="button" id="Submit" value="登 陆">--%> </td>
                                    <td width="67%" class="top_hui_text"  align="left"><asp:Button ID="btnCancle" runat="server" Text="取 消" class="button"/><%--<input name="cs" type="button" class="button" id="cs" value="取 消" onClick="showConfirmMsg1()">--%></td>
                                  </tr>
                                </table>
                                <br>
                            </td>
                          </tr>
                          <tr>
                            <td width="433" height="164" align="right" valign="bottom">
                                <img src="images/login-wel.gif" width="242" height="138" 
                                    style="margin-left: 0px"></td>
                            <td width="57" align="right" valign="bottom">&nbsp;</td>
                          </tr>
                      </table></td>
                    </tr>
                  </table>
                  </td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td height="20"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="login-buttom-bg">
              <tr>
                <td align="center"><span class="login-buttom-txt">Copyright</span></td>
              </tr>
            </table></td>
          </tr>
        </table>
    </form>
</body>
</html>
