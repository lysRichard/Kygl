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
using System.Data.SqlClient;

namespace KyManage.KyGL
{
    public partial class admin_add : System.Web.UI.Page
    {
        protected string rightstr_ls = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            Chkadmin.checkadmin("login.aspx");
            //if (!Page.IsPostBack)
            //{
            //    BindTree();
            //    ddltype.Attributes.Add("onchange", "selectChange(this,'" + this.ddltype.ClientID + "')");
            //}
        }
        //protected void BindTree()
        //{
        //    TreeNode node = new TreeNode();   //这里是创建一个根节点,就是dome中看到的Root 
        //    node.Text = "新闻菜单权限";
        //    CreateChildTree(node, 0);
        //    TreeView1.Nodes.Add(node);
        //}

        //protected void CreateChildTree(TreeNode _parentNode, int _parentID)
        //{

        //    string sql = "select CategoryID,CategoryName from Web_category where CategoryParent=" + _parentID + " order by CategoryRoot";
        //    DataBase data = new DataBase();
        //    using (SqlDataReader r = data.ExeSqlFillDr(sql))
        //    {
        //        while (r.Read())
        //        {
        //            TreeNode _node = new TreeNode(r["CategoryName"].ToString(), r["CategoryID"].ToString());
        //            CreateChildTree(_node, (int)r["CategoryID"]);  //递归出子节点 
        //            _parentNode.ChildNodes.Add(_node);
        //        }
        //    }
        //}
        //protected void chkNodes()
        //{//先调用这个方法 把treeView1改成你的名字就可以了
        //    foreach (TreeNode tn in this.TreeView1.Nodes)
        //    {
        //        fff(tn);
        //    }
        //}
        //protected void fff(TreeNode tnp)
        //{
        //    if (tnp.Checked)
        //    {
        //        //这里就是选中的节点tn
        //        rightstr_ls += tnp.Value + "|";
        //    }
        //    foreach (TreeNode tn in tnp.ChildNodes)
        //    {
        //        fff(tn);
        //    }
        //}
        protected void Button1_Click(object sender, EventArgs e)
        {
            //chkNodes();
            if (password.Text != rpassword.Text)
            {
                WebJS.Alert("两次输入的密码不一样！");
            }
            if (username.Text.Trim() == "")
            {
                WebJS.Alert("用户名不能为空！");
            }
            else
            {
                //Class cls = new Class();
                string rightstr = rightstr_ls;//"-1|";
                //权限分配 隐藏
                //foreach (ListItem item in userRight.Items)
                //{
                //    if (item.Selected == true)
                //    {
                //        rightstr += item.Value + "|";  //权限值
                //    }
                //}
                string sql = "insert into userinfo (Username,user_password,log_time,refresh_time) values('" + username.Text + "','" + password.Text + "','" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "','" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "')";
                DataBase data = new DataBase();
                try
                {
                    data.Exesql(sql);
                    WebJS.AlertAndRedirect("添加完成！", "admin.aspx");
                }
                catch (Exception ex)
                {
                    throw new Exception(ex.ToString());
                }
                finally
                {
                    data.Dispose();
                }
                //cls.GonggaoAction("insert into zs_admin(username,userpassword) values('" + username.Text + "','" + admin.GetHash(password.Text) + "')", Session["ZS_AdminUserID"].ToString());

            }

        }
        //protected void userRight_Init(object sender, EventArgs e)
        //{
        //    //string sql = "select CategoryID,CategoryName from Web_category order by CategoryRoot";
        //    //DataBase data = new DataBase();
        //    //DataTable dt = new DataTable();
        //    //dt = data.ExeSqlFillDs(sql).Tables[0];
        //    //userRight.DataSource = dt;
        //    //userRight.DataTextField = "CategoryName";
        //    //userRight.DataValueField = "CategoryID";
        //    //userRight.DataBind();
        //    ListItem item1 = new ListItem();
        //    item1.Text = "管理员管理";
        //    item1.Value = "1101";
        //    userRight.Items.Add(item1);
        //    ListItem item2 = new ListItem();
        //    item2.Text = "新闻类别";
        //    item2.Value = "1102";
        //    userRight.Items.Add(item2);
        //    ListItem item3 = new ListItem();
        //    item3.Text = "友情链接";
        //    item3.Value = "1100";
        //    userRight.Items.Add(item3);
        //    ListItem item4 = new ListItem();
        //    item4.Text = "留言管理";
        //    item4.Value = "1103";
        //    userRight.Items.Add(item4);
        //}

        //protected void ddltype_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    if (ddltype.SelectedValue == "2")
        //        trguanli.Visible = true;
        //}
    }
}
