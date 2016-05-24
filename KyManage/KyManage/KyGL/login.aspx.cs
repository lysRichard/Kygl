using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using KyManage.BLL;

namespace KyManage.KyGL
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (CheckCode.Text == Session["x2_validate_code"].ToString())
            {
                string UserIp;
                if (Request.ServerVariables["HTTP_VIA"] != null)
                    UserIp = Request.ServerVariables["HTTP_X_FORWARDED_FOR"].ToString();
                else
                    UserIp = Request.ServerVariables["REMOTE_ADDR"].ToString();

                if (IsSafeRequst(this.username.Text, "'"))
                {
                    WebJS.AlertAndRefresh("用户名或密码不正确！");
                    return;
                }

                Class cls = new Class();
                if (cls.Login(this.username.Text, password.Text, UserIp)) //Chkadmin.GetHash(password.Text)
                {
                    //cls.Log("管理员ID：" + Session["RC_AdminUserID"].ToString() + "-登录", UserIp);
                    Response.Redirect("index.aspx");

                }
                else
                    WebJS.AlertAndRefresh("用户名或密码不正确！");
            }
            else
                WebJS.Alert("验证码不正确！");
        }
        /// <summary>
        /// 判断文本中是否包含敏感字符
        /// </summary>
        /// <param name="str">需要判断的文本</param>
        /// <param name="all">需要判断的敏感词，以逗号分隔</param>
        /// <returns></returns>
        public bool IsSafeRequst(string str, string all)
        {
            char[] separator = { ',' };
            string[] context = all.Split(separator);
            for (int i = 0; i < context.Length; i++)
            {
                if (str.IndexOf(context[i].ToString()) > -1)
                {
                    return true;
                }
            }
            return false;
        }
    }
}
