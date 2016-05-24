using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

namespace KyManage.BLL
{
    public class webError
    {
        public webError()
        {

        }
        public static void Log(string message)
        {
            string errPath = ConfigurationManager.AppSettings["errorurl"].ToString();
            System.Web.HttpContext.Current.Response.Redirect(errPath + "?msg=" + message);
        }
    }
}
