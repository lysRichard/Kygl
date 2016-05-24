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
    /// admin 的摘要说明
    /// </summary>
    public class Chkadmin
    {
        public Chkadmin()
        {
            //
            // TODO: 在此处添加构造函数逻辑
            //
        }
        public static void checkadmin()
        {
            if (System.Web.HttpContext.Current.Session["RC_AdminUserID"] == null)
            {
                System.Web.HttpContext.Current.Response.Redirect("../../admin/default.aspx");
            }
            else
            {
                if (System.Web.HttpContext.Current.Session["RC_AdminUserID"].ToString() == "")
                    System.Web.HttpContext.Current.Server.Transfer("../../admin/default.aspx");
            }
        }
        public static void checkadmin(string path)
        {
            if (System.Web.HttpContext.Current.Session["RC_AdminUserID"] == null)
            {
                System.Web.HttpContext.Current.Response.Redirect(path);
            }
            else
            {
                if (System.Web.HttpContext.Current.Session["RC_AdminUserID"].ToString() == "")
                    System.Web.HttpContext.Current.Server.Transfer(path);
            }
        }
        public static void adminlogout()
        {
            System.Web.HttpContext.Current.Session.Clear();
            System.Web.HttpContext.Current.Session["RC_AdminUserID"] = null;
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
        public static string GetAdminInfo(string adminid)
        {
            string sql = "select * from web_admin where id=" + adminid;
            DataBase data = new DataBase();
            SqlDataReader dr = null;
            try
            {
                dr = data.ExeSqlFillDr(sql);
                if (dr.Read())
                {
                    return dr["username"].ToString();
                }
            }
            catch (Exception ex)
            {
                Error.Log(ex.ToString());
            }
            finally
            {
                dr.Close();
                data.Dispose();
            }
            return "";
        }

    }
}
