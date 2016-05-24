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
    public partial class awardEdit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Chkadmin.checkadmin("login.aspx");
            string id = Request.QueryString["i"];
            ViewState["id"] = id;
            if (!Page.IsPostBack)
            {
                string sql = "select * from awardinfo where id=" + id;
                DataBase data = new DataBase();
                using (SqlDataReader dr = data.ExeSqlFillDr(sql))
                {
                    if (dr.Read())
                    {
                        TextAward_number.Text= dr["award_number"].ToString();
                        TextOrganization.Text = dr["organization"].ToString();
                        DdlTeacher_Number.SelectedIndex = DdlTeacher_Number.Items.IndexOf(DdlTeacher_Number.Items.FindByValue(dr["teacher_number"].ToString()));
                       TextTime.Text = dr["time"].ToString();
                       TextPresenter.Text = dr["presenter"].ToString();
                       TextPrizewinner.Text=dr["prizewinner"].ToString();
                      TextType.Text= dr["type"].ToString();
                      TextLevel.Text = dr["award_level"].ToString();
                      TextForm.Text = dr["form"].ToString();

                    }
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string sql = "update awardinfo set time='" + TextTime.Text + "',award_number='" + TextAward_number.Text + "',award_level='" + TextLevel.Text + "',teacher_number='" + DdlTeacher_Number.SelectedValue + "',type='" + TextType.Text + "',presenter='" + TextPresenter.Text + "',organization='" + TextOrganization.Text + "',prizewinner='" + TextPrizewinner.Text + "',form='" + TextForm.Text + "',refresh_time='" + "' where id=" + ViewState["id"].ToString();
            DataBase data = new DataBase();
            try
            {
                data.Exesql(sql);
                WebJS.AlertAndRefresh("编辑成功！");
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