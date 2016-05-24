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
    public partial class patentEdit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Chkadmin.checkadmin("login.aspx");
            string id = Request.QueryString["i"];
            ViewState["id"] = id;
            if (!Page.IsPostBack)
            {
                string sql = "select * from patentinfo where id=" + id;
                DataBase data = new DataBase();
                using (SqlDataReader dr = data.ExeSqlFillDr(sql))
                {
                    if (dr.Read())
                    {
                        TextPatent_Number.Text = dr["patent_number"].ToString();
                        TextPatent_Name.Text= dr["patent_name"].ToString();
                        DdlTeacher_Number.SelectedIndex = DdlTeacher_Number.Items.IndexOf(DdlTeacher_Number.Items.FindByValue(dr["teacher_number"].ToString()));
                        TextTime.Text = dr["time"].ToString();
                        TextType.Text = dr["type"].ToString();
                       
                    }
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string sql = "update patentinfo set time='" + TextTime.Text + "',teacher_number='" + DdlTeacher_Number.SelectedValue + "',patent_name='" + TextPatent_Name.Text + "',patent_number='" + TextPatent_Number.Text + "',refresh_time='" + DateTime.Now.ToString() + "' where id=" + ViewState["id"].ToString();
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