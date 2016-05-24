using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.IO;
namespace KyManage.BLL
{
    /// <summary>
    /// Error 的摘要说明
    /// </summary>
    public class Error
    {
        private const string File_Log = "C:\\RC_LOG.txt";
        public Error()
        {

        }
        public static void Log(string message)
        {
            //if (File.Exists(File_Log))
            //{
            //    StreamWriter sw = File.AppendText(File_Log);
            //    sw.WriteLine("\n");
            //    sw.WriteLine(DateTime.Now.ToString() + message);
            //    sw.Close();
            //}
            //else
            //{
            //    StreamWriter sw = File.CreateText(File_Log);
            //    sw.Close();
            //}
            //System.Web.HttpContext.Current.Response.Redirect("../error.aspx");
            System.Web.HttpContext.Current.Response.Write(message.ToString());
        }
    }
}