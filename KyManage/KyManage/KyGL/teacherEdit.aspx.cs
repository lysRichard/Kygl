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
    public partial class teacherEdit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Chkadmin.checkadmin("login.aspx");
            string id = Request.QueryString["i"];
            ViewState["id"] = id;
            if (!Page.IsPostBack)
            {
                string sql = "select * from teacherinfo where teacher_id=" + id;
                DataBase data = new DataBase();
                using (SqlDataReader dr = data.ExeSqlFillDr(sql))
                {
                    if (dr.Read())
                    {
                        TextName.Text = dr["name"].ToString();
                        DDLSex.SelectedIndex = DDLSex.Items.IndexOf(DDLSex.Items.FindByValue(dr["sex"].ToString()));
                        TextAge.Text = dr["age"].ToString();
                        TextTeacher_Profile.Text = dr["teacher_profile"].ToString();
                    }
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string sql = "update teacherinfo set name='" + TextName.Text + "',sex='" + DDLSex.SelectedValue + "',age=" + TextAge.Text + ",teacher_profile='" + TextTeacher_Profile.Text + "',refresh_time='" + DateTime.Now.ToString() + "' where teacher_id=" + ViewState["id"].ToString();
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
    }
}