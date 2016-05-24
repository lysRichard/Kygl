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
using System.IO;
using System.Data.SqlClient;

namespace KyManage.KyGL
{
    public partial class modiPwd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Chkadmin.checkadmin("login.aspx");
        }

        protected void btnOk_Click(object sender, EventArgs e)
        {
            string sql1 = "select * from web_admin where username='" + Session["username"].ToString() + "' and UserPassword='" + Chkadmin.GetHash(oldpwd.Text) + "'";
            DataBase data = new DataBase();
            using (SqlDataReader dr1 = data.ExeSqlFillDr(sql1))
            {
                if (dr1.Read())
                {
                    string sql = "update web_admin set UserPassword='" + Chkadmin.GetHash(newpwd.Text) + "' where username='" + Session["username"].ToString() + "'";
                    data.Exesql(sql);
                    WebJS.AlertAndRefresh("修改密码成功，请牢记！");
                }
                else
                {
                    WebJS.AlertAndRefresh("旧密码不正确！");
                }
            }
        }
    }
}
