using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Text;
using System.Xml;

namespace KyManage.BLL
{
    public class HXmlOpt
    {
        public static DataTable GetList(string xmlUrl, string listType)  //, int recNum
        {
            //string numStr = "";
            DataTable dt = new DataTable();
            //if (recNum > 0)
            //{
            //    numStr = "[position()<=" + recNum.ToString() + "]";
            //}
            XmlElement xet = XmlDataBase.GetXmlElement(xmlUrl);
            if (xet != null)
            {
                XmlNodeList nodeList = xet.SelectNodes("(Items[@type=" + listType + "]/Item)");
                if (nodeList != null && nodeList.Count > 0)
                {
                    DataColumn cl = new DataColumn();
                    cl.ColumnName = "itype";
                    dt.Columns.Add(cl);

                    cl = new DataColumn();
                    cl.ColumnName = "href";
                    dt.Columns.Add(cl);

                    cl = new DataColumn();
                    cl.ColumnName = "menuName";
                    dt.Columns.Add(cl);

                    foreach (XmlNode node in nodeList)
                    {
                        DataRow dr = dt.NewRow();
                        dr["menuName"] = node.InnerText;
                        dr["itype"] = node.Attributes["iType"].Value;
                        dr["href"] = node.Attributes["href"].Value;
                        dt.Rows.Add(dr);
                    }
                    return dt;
                }
            }
            return null;
        }
    }
}
