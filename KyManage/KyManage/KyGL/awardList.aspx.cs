using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using KyManage.BLL;

namespace KyManage.KyGL
{
    public partial class awardList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Chkadmin.checkadmin("login.aspx");
            if (!Page.IsPostBack)
            {
                dataBind();
            }
        }
        private void dataBind()
        {
            string sql = "";
            sql += "select a.*,b.name as teacher_name from awardinfo as a left join teacherinfo as b on a.teacher_number=b.teacher_id where 1=1";
            if (TextName.Text.Trim() != "")
            {
                sql += " and a.award_number like '%" + TextName.Text.Trim() + "%'";
            }
            sql += " order by a.id desc";
            DataBase data = new DataBase();
            DataTable dt = data.ExeSqlFillDs(sql).Tables[0];
            PagedDataSource pds = new PagedDataSource();
            pager.RecordCount = dt.Rows.Count;
            pds.AllowPaging = true;
            pds.PageSize = pager.PageSize;
            pds.CurrentPageIndex = pager.CurrentPageIndex - 1;

            pds.DataSource = dt.DefaultView;
            infoList.DataSource = pds;
            infoList.DataBind();
        }
        protected void AspNetPager1_PageChanged(object sender, EventArgs e)
        {
            dataBind();
        }
        protected void btnDelAll_Click(object sender, EventArgs e)
        {
            string ggid = "";
            int nums = 0;
            foreach (GridViewRow Gvr in infoList.Rows)
            {
                CheckBox cb = (CheckBox)Gvr.Cells[0].Controls[1];
                if (cb.Checked)
                {
                    int k = Gvr.RowIndex;
                    ggid += "," + infoList.DataKeys[k].Value.ToString();
                    nums += 1;
                }
            }
            if (ggid == "")
                WebJS.Alert("请选择要删除的信息！");
            else
            {
                ggid = ggid.Substring(1);
                Class.DelInfo("delete from awardinfo where id in (" + ggid + " )");
                WebJS.Alert("删除完成");
                dataBind();

            }
        }

        protected void infoList_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int k = e.RowIndex;
            string id = infoList.DataKeys[k].Value.ToString();
            DataBase data = new DataBase();
            try
            {
                data.Exesql("delete from awardinfo where id=" + id);
                dataBind();
            }
            catch (Exception ex)
            {
                throw;
            }
            finally
            {
                data.Dispose();
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            dataBind();
        }
    }
}