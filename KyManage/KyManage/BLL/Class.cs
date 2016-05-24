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
    /// Class 的摘要说明
    /// </summary>
    public class Class
    {
        public Class()
        {
            //
            // TODO: 在此处添加构造函数逻辑
            //
        }

        public DataTable RunSql(string sql)
        {
            DataBase data = new DataBase();
            DataSet ds = new DataSet();
            ds = data.ExeSqlFillDs(sql, "Table1");
            return ds.Tables["Table1"];

        }
        public void Log(string message, string LogIp)
        {
            DataBase data = new DataBase();
            string sql = "insert into web_log (LogIP,Message) values('" + LogIp + "','" + message + "')";
            try
            {
                data.Exesql(sql);
            }
            catch (Exception ex)
            {
                Error.Log(ex.ToString());
            }
            finally
            {
                data.Dispose();
            }
        }

        public bool Login(string Username, string uspassword, string LogIp)
        {
            DataBase data = new DataBase();
            string sql = "select * from userinfo where Username='" + Username + "' and user_password='" + uspassword + "'";
            SqlDataReader dr = null;
            try
            {
                dr = data.ExeSqlFillDr(sql);
                if (dr.Read())
                {
                    //data.Exesql("update rc_admin set [LogIp]='" + LogIp + "' where [Username]='" + Username + "' and [UserPassword]='" + uspassword + "'");
                    System.Web.HttpContext.Current.Session["RC_AdminUserID"] = dr["user_id"].ToString();
                    System.Web.HttpContext.Current.Session["username"] = dr["username"].ToString();
                    return true;
                }
            }
            catch (Exception ex)
            {
                Error.Log(ex.ToString());
                return false;
            }
            finally
            {
                data.Dispose();

            }
            return false;
        }
        public static string CheckAdminId(string adminid)
        {
            DataBase data = new DataBase();

            try
            {

            }
            catch (Exception ex)
            {
                Error.Log(ex.ToString());
            }
            finally { data.Dispose(); }
            return "nopass";
        }
        public static void DelInfo(string sql)
        {
            DataBase data = new DataBase();
            try
            {
                data.Exesql(sql);
            }
            catch (Exception ex)
            {
                Error.Log(ex.ToString());
            }
            finally { data.Dispose(); }
        }


    }
}