using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

namespace KyManage.BLL
{
    /// <summary>
    /// WebJS 的摘要说明
    /// </summary>
    public class WebJS
    {
        public WebJS()
        {
            //
            // TODO: 在此处添加构造函数逻辑
            //
        }
        public static string GetHash(string s)
        {
            //下面两种加密方式选其1
            //md5加密
            s = FormsAuthentication.HashPasswordForStoringInConfigFile(s, "md5");
            //sha1加密
            //s=FormsAuthentication.HashPasswordForStoringInConfigFile(s, "sha1");
            return s.Substring(0, 32);
        }
        public static void Alert(string sMessage)
        {
            HttpContext.Current.Response.Write("<script>alert('" + sMessage + "');</script>");
        }
        public static void AlertAndBack(string sMessage)
        {
            HttpContext.Current.Response.Write("<script>alert('" + sMessage + "');history.go(-1);</script>");
        }
        public static void Refresh()
        {
            HttpContext.Current.Response.Write("<script>location.href=location.href</script>");
        }


        public static void AlertAndRefresh(string sMessage)
        {
            HttpContext.Current.Response.Write("<script>alert('" + sMessage + "');location.href=location.href</script>");
        }
        public static void AlertAndRedirect(string sMessage, string sURL)
        {
            HttpContext.Current.Response.Write("<script>alert('" + sMessage + "');location.href='" + sURL + "'</script>");
        }

        public static void AlertAndClose(string sMessage)
        {
            HttpContext.Current.Response.Write("<script>alert('" + sMessage + "');window.opener=null;window.close()</script>");
        }
        public static void AlertAndCloseAndRP(string sMessage)
        {
            HttpContext.Current.Response.Write("<script>alert('" + sMessage + "');window.close();opener.location.reload();</script>");
        }
        public static string Encode(string sData)
        {
            string s = sData;
            s = s.Replace("<", "&lt;");
            s = s.Replace(">", "&gt;");
            s = s.Replace(" ", "&nbsp;");
            s = s.Replace("\r\n", "<br>");
            return s;
        }
        public static string MenuList()
        {
            string value = "<script type='text/javascript' language='JavaScript1.2'>\r\n";
            value += "mpmenu1=new mMenu('<font color=#FFFFFF>本站首页</font>','default.aspx','self','','','','');\r\n";
            value += "mpmenu2=new mMenu('<font color=#FFFFFF>企业之窗</font>','content.aspx','self','','','','');\r\n";
            DataBase data = new DataBase();
            SqlDataReader dr = null;
            using (dr = data.ExeSqlFillDr("select * from web_category where categoryparent=0 order by CategoryRoot desc,orders"))
            {
                while (dr.Read())
                {
                    value += "mpmenu" + dr["categoryid"].ToString() + "=new mMenu('<font color=#FFFFFF>" + dr["categoryname"].ToString() + "</font>','category.aspx?categoryid=" + dr["categoryid"].ToString() + "','self','','','','');\r\n";
                    value += getChildCategoryMenu(dr["categoryid"].ToString());
                }
            }
            data.Dispose();
            value += "mpmenu4=new mMenu('<font color=#FFFFFF>联系我们</font>','lianxi.aspx','self','','','','');\r\n";
            value += "mpmenu5=new mMenu('<font color=#FFFFFF>客户留言</font>','gbook.aspx','self','','','','');\r\n";
            value += "\r\n mwritetodocument();\r\n</script>";
            return value;
        }

        private static string getChildCategoryMenu(string categoryid)
        {
            string sql = "select * from web_category where categoryparent=" + categoryid + " order by categoryid";
            DataBase data = new DataBase();
            string value = "";
            SqlDataReader dr = null;
            using (dr = data.ExeSqlFillDr(sql))
            {
                while (dr.Read())
                {
                    value += "mpmenu" + categoryid + ".addItem(new mMenuItem('<font color=#FFFFFF>" + dr["categoryname"].ToString() + "</font>','category.aspx?categoryid=" + dr["categoryid"].ToString() + "','self',false,'" + dr["categoryname"].ToString() + "',null,'','','',''));";
                    //value += "mpmenu" + categoryid + "=new mMenu('<font color=#FFFFFF>" + dr["categoryname"].ToString() + "</font>','category.aspx?categoryid=" + dr["categoryid"].ToString() + "','self','','','','');\r\n"; 
                    getChildCategoryMenu(dr["categoryid"].ToString());
                }
            }
            data.Dispose();

            return value;
        }
    }
}