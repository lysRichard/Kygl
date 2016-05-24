using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KyManage.BLL;
using System.Data;
using System.Data.SqlClient;

namespace KyManage.KyGL
{
    public partial class teacherAdd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Chkadmin.checkadmin("login.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            string sql = "insert into teacherinfo (name,sex,age,teacher_profile,log_time,refresh_time) values('" + TextName.Text + "','"+DDLSex.SelectedValue+"', '" +
                TextAge.Text + "','" + TextTeacher_Profile.Text + "','" + DateTime.Now.ToString() + "','" + DateTime.Now.ToString() + "')";
            DataBase data = new DataBase();
            try
            {
                data.Exesql(sql);
                WebJS.AlertAndRefresh("添加完成，继续添加！");
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            finally
            {
                data.Dispose();
            }
        }
    }
}