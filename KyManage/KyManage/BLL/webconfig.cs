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
    public class webconfig
    {
        public webconfig()
        {

        }
        /// <summary>
        /// 获取人才网基本设置信息
        /// </summary>
        /// <returns></returns>
        public static string[] Get_Setup()
        {
            string[] config = new string[3];
            DataBase data = new DataBase();
            SqlDataReader dr = null;
            config[0] = ConfigurationManager.AppSettings["MyTitle"].ToString();
            config[1] = ConfigurationManager.AppSettings["webkeys"].ToString();
            config[2] = ConfigurationManager.AppSettings["webdescription"].ToString();
            if (config == null)
            {
                config = null;
                string errormsg = HttpContext.Current.Server.UrlDecode("人才网还未进行过设置，目前无法运行");
                webError.Log(errormsg);
            }
            return config;
        }
    }
}
