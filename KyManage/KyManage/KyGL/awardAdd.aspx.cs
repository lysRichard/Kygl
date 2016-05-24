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
    public partial class awardAdd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Chkadmin.checkadmin("login.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            string sql = "insert into awardinfo (award_number,teacher_number,organization,presenter,prizewinner,time,type,award_level,form,log_time,refresh_time) values('" + TextAward_number.Text + "','" + DdlTeacher_Number.SelectedValue + "','" +
             TextOrganization.Text + "','" + TextPresenter.Text + "','" + TextPrizewinner.Text + "','" + TextTime.Text + "','" + TextType.Text + "','" + TextLevel.Text + "','" + TextForm.Text + "','" + DateTime.Now.ToString() + "','" + DateTime.Now.ToString() + "')";
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
      protected void DdlTeacher_Number_Init(object sender, EventArgs e)
        {
            DataBase data = new DataBase();
            string sql = "select * from teacherinfo order by teacher_id";
            DataTable dt = data.ExeSqlFillDs(sql).Tables[0];
            DdlTeacher_Number.DataSource = dt;
            DdlTeacher_Number.DataTextField = "name";
            DdlTeacher_Number.DataValueField = "teacher_id";
            DdlTeacher_Number.DataBind();
        }

        protected void DdlTeacher_Number_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}
