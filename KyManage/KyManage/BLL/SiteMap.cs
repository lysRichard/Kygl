using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
namespace KyManage.BLL
{
    public class SiteMapList
    {
        private string map = "";
        private string _categoryid;
        public string Map
        {
            get { return map; }
        }
        public SiteMapList()
        {

        }
        public SiteMapList(string categoryid)
        {
            _categoryid = categoryid;
            GetMap(categoryid);
        }
        private string GetMap(string cateid)
        {
            DataBase data = new DataBase();
            string sql = "select * from web_category where categoryid=" + cateid;
            SqlDataReader dr = null;
            using (dr = data.ExeSqlFillDr(sql))
            {
                if (dr.Read())
                {
                    if (dr["categoryparent"].ToString() != "0")
                    {
                        map = " > <a href=\"category.aspx?categoryid=" + dr["categoryid"].ToString() + "\"><font color=#ffffff>" + dr["categoryname"].ToString() + "</a></font>" + map;
                        GetMap(dr["categoryparent"].ToString());
                    }
                    else
                        map = "<a href=\"category.aspx?categoryid=" + dr["categoryid"].ToString() + "\"><font color=#ffffff>" + dr["categoryname"].ToString() + "</a></font>" + map;
                }
            }
            data.Dispose();
            return map;

        }
        string categoryidList = "";
        public string getChildID(string categoryid)
        {
            DataBase data = new DataBase();
            string sql = "select categoryid from web_category where categoryparent=" + categoryid + " order by categoryid";
            SqlDataReader dr = null;
            //categoryidList = categoryid;
            using (dr = data.ExeSqlFillDr(sql))
            {
                while (dr.Read())
                {
                    categoryidList += "," + dr[0].ToString();
                    getChildID(dr[0].ToString());
                }
            }
            data.Dispose();
            if (categoryidList != "")
                return categoryidList.Substring(1);
            else
                return categoryid;
        }
    }
}
