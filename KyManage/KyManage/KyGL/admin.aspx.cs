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
    public partial class admin : System.Web.UI.Page
    {
        protected int page = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (System.Web.HttpContext.Current.Session["Web_adminUserID"] == null)
            //{
            //    System.Web.HttpContext.Current.Response.Redirect("../cool_login.aspx");
            //}
            //else
            //{
            //    if (System.Web.HttpContext.Current.Session["Web_adminUserID"].ToString() == "")
            //        System.Web.HttpContext.Current.Server.Transfer("../cool_login.aspx");
            //}
            Chkadmin.checkadmin("login.aspx");
            if (!IsPostBack)
            {
                if (Request.QueryString["page"] != null)
                    page = Convert.ToInt32(Request.QueryString["page"].ToString());
                Gridadmin.PageIndex = page;
                Button1.Attributes["onclick"] = "javascript:return confirm('你确认要删除吗?');";
                DatabindKX();
            }
        }
        protected void DatabindKX()
        {
            DataBase data = new DataBase();
            DataSet ds = new DataSet();
            try
            {
                ds = data.ExeSqlFillDs("select * from userinfo where user_id<>1 order by user_id desc", "admin");//where ID<>1
                Gridadmin.DataSource = ds.Tables["admin"].DefaultView;
                Gridadmin.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
            finally
            {
                data.Dispose();
            }
        }
        protected void admin_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            Gridadmin.PageIndex = e.NewPageIndex;
            page = Gridadmin.PageIndex;
            DatabindKX();
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            string ggid = "";
            foreach (GridViewRow Gvr in Gridadmin.Rows)
            {
                CheckBox cb = (CheckBox)Gvr.Cells[0].Controls[1];
                if (cb.Checked)
                {
                    int k = Gvr.RowIndex;
                    ggid += "," + Gridadmin.DataKeys[k].Value.ToString();
                }
            }
            if (ggid == "")
                WebJS.Alert("请选择要删除的信息！");
            else
            {
                ggid = ggid.Substring(1);
                Class.DelInfo("delete from userinfo where user_id in (" + ggid + " )");
                WebJS.AlertAndRedirect("删除完成", "admin.aspx");

            }
        }
    }
}
