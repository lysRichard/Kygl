using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Xml;
using System.Xml.XPath;

namespace KyManage.BLL
{
    public class XmlOpt
    {
        public DataTable GetProvinceList(string xmlUrl)  //获取大图列表（列表地址）
        {
            XmlDocument xmlDoc = new XmlDocument();
            xmlDoc.Load(xmlUrl);
            string strPath = "/country";


            /*
             XPathDocument：进行XML文档处理时，提供一个快速、有效的、只读的Cache功能，在进行XSLT转换时，推荐使用该类。 

            XPathException：当处理XPath产生错误时，抛出一个例外。 

            XPathExpression：保存在调用XPathNavigator的Compile()方法时生成的、经过编译的XPath表达式。 

            XPathNavigator：提供一个指针模型，供我们读取支持IXPathNavigable接口的所保存的任何类型的数据。 

            XPathNodeIterator：遍历节点集合。

             */
            //XPathNavigator nav = xmlDoc.CreateNavigator();  
            //XPathDocument xmlDoc = new XPathDocument(xmlUrl);
            //XPathExpression exp = nav.Compile(strPath);
            //exp.AddSort("id", XmlSortOrder.Ascending, XmlCaseOrder.None, "", XmlDataType.Text);
            //XPathNodeIterator nodeIter1 = nav.Select(strPath);

            XmlNode node1 = xmlDoc.SelectSingleNode(strPath);
            DataTable dt = new DataTable();

            //DataColumn dl1 = new DataColumn();
            //dl1.ColumnName = "id";
            //dl1.DataType = Type.GetType("System.Int32");
            //dt.Columns.Add(dl1);

            DataColumn dl2 = new DataColumn();
            dl2.ColumnName = "province";
            dl2.DataType = Type.GetType("System.String");
            dt.Columns.Add(dl2);

            //DataColumn dl3 = new DataColumn();
            //dl3.ColumnName = "strurl";
            //dl3.DataType = Type.GetType("System.String");
            //dt.Columns.Add(dl3);

            //DataColumn dl4 = new DataColumn();
            //dl4.ColumnName = "imgurl";
            //dl4.DataType = Type.GetType("System.String");
            //dt.Columns.Add(dl4);

            foreach (XmlNode node2 in node1.ChildNodes)
            {
                //while (nodeIter1.MoveNext()) 
                //{
                DataRow row = dt.NewRow();
                //row["id"] = Convert.ToInt32(node2.Attributes["id"].Value.ToString());
                row["province"] = node2.Attributes["name"].Value.ToString().Trim();//node2.InnerText.Trim();
                //row["strurl"] = node2.Attributes["strurl"].Value.ToString().Trim();
                //row["imgurl"] = node2.Attributes["imgurl"].Value.ToString().Trim();
                dt.Rows.Add(row);
            }

            //dt.DefaultView.Sort = "id";
            return dt;

        }
        public DataTable GetCityList(string xmlUrl, string province)  //获取大图列表（列表地址）
        {
            XmlDocument xmlDoc = new XmlDocument();
            xmlDoc.Load(xmlUrl);
            string strPath = "/country/province[@name='" + province.Trim() + "']";


            /*
             XPathDocument：进行XML文档处理时，提供一个快速、有效的、只读的Cache功能，在进行XSLT转换时，推荐使用该类。 

            XPathException：当处理XPath产生错误时，抛出一个例外。 

            XPathExpression：保存在调用XPathNavigator的Compile()方法时生成的、经过编译的XPath表达式。 

            XPathNavigator：提供一个指针模型，供我们读取支持IXPathNavigable接口的所保存的任何类型的数据。 

            XPathNodeIterator：遍历节点集合。

             */
            //XPathNavigator nav = xmlDoc.CreateNavigator();  
            //XPathDocument xmlDoc = new XPathDocument(xmlUrl);
            //XPathExpression exp = nav.Compile(strPath);
            //exp.AddSort("id", XmlSortOrder.Ascending, XmlCaseOrder.None, "", XmlDataType.Text);
            //XPathNodeIterator nodeIter1 = nav.Select(strPath);

            XmlNode node1 = xmlDoc.SelectSingleNode(strPath);
            DataTable dt = new DataTable();

            //DataColumn dl1 = new DataColumn();
            //dl1.ColumnName = "id";
            //dl1.DataType = Type.GetType("System.Int32");
            //dt.Columns.Add(dl1);

            DataColumn dl2 = new DataColumn();
            dl2.ColumnName = "city";
            dl2.DataType = Type.GetType("System.String");
            dt.Columns.Add(dl2);

            //DataColumn dl3 = new DataColumn();
            //dl3.ColumnName = "strurl";
            //dl3.DataType = Type.GetType("System.String");
            //dt.Columns.Add(dl3);

            //DataColumn dl4 = new DataColumn();
            //dl4.ColumnName = "imgurl";
            //dl4.DataType = Type.GetType("System.String");
            //dt.Columns.Add(dl4);

            foreach (XmlNode node2 in node1.ChildNodes)
            {
                //while (nodeIter1.MoveNext()) 
                //{
                DataRow row = dt.NewRow();
                //row["id"] = Convert.ToInt32(node2.Attributes["id"].Value.ToString());
                //row["title"] = node2.InnerText.Trim();
                //row["strurl"] = node2.Attributes["strurl"].Value.ToString().Trim();
                row["city"] = node2.Attributes["name"].Value.ToString().Trim();
                dt.Rows.Add(row);
            }

            //dt.DefaultView.Sort = "id";
            return dt;

        }

        #region H1位置的广告操作

        /// <summary>
        /// 这部分是右侧大图的方法集合
        /// </summary>
        /// <param name="id"></param>
        /// <param name="xmlUrl"></param>
        /// <returns></returns>
        public bool DelBigListByID(string id, string xmlUrl)  //从列表删除大图（大图序号/列表地址）
        {
            bool Flag = false;
            XmlDocument xmlDoc = new XmlDocument();
            xmlDoc.Load(xmlUrl);

            string strPath = "/root";
            string strPath1 = "/root/bigright[@id='" + id.Trim() + "']";
            XmlNode node = xmlDoc.SelectSingleNode(strPath);
            XmlNode node1 = xmlDoc.SelectSingleNode(strPath1);
            node.RemoveChild(node1);

            xmlDoc.Save(xmlUrl);
            Flag = true;
            return Flag;
        }
        public DataTable GetBigList(string xmlUrl)  //获取大图列表（列表地址）
        {
            XmlDocument xmlDoc = new XmlDocument();
            xmlDoc.Load(xmlUrl);
            string strPath = "/root";


            /*
             XPathDocument：进行XML文档处理时，提供一个快速、有效的、只读的Cache功能，在进行XSLT转换时，推荐使用该类。 

            XPathException：当处理XPath产生错误时，抛出一个例外。 

            XPathExpression：保存在调用XPathNavigator的Compile()方法时生成的、经过编译的XPath表达式。 

            XPathNavigator：提供一个指针模型，供我们读取支持IXPathNavigable接口的所保存的任何类型的数据。 

            XPathNodeIterator：遍历节点集合。

             */
            //XPathNavigator nav = xmlDoc.CreateNavigator();  
            //XPathDocument xmlDoc = new XPathDocument(xmlUrl);
            //XPathExpression exp = nav.Compile(strPath);
            //exp.AddSort("id", XmlSortOrder.Ascending, XmlCaseOrder.None, "", XmlDataType.Text);
            //XPathNodeIterator nodeIter1 = nav.Select(strPath);

            XmlNode node1 = xmlDoc.SelectSingleNode(strPath);
            DataTable dt = new DataTable();

            DataColumn dl1 = new DataColumn();
            dl1.ColumnName = "id";
            dl1.DataType = Type.GetType("System.Int32");
            dt.Columns.Add(dl1);

            DataColumn dl2 = new DataColumn();
            dl2.ColumnName = "title";
            dl2.DataType = Type.GetType("System.String");
            dt.Columns.Add(dl2);

            DataColumn dl3 = new DataColumn();
            dl3.ColumnName = "strurl";
            dl3.DataType = Type.GetType("System.String");
            dt.Columns.Add(dl3);

            DataColumn dl4 = new DataColumn();
            dl4.ColumnName = "imgurl";
            dl4.DataType = Type.GetType("System.String");
            dt.Columns.Add(dl4);

            foreach (XmlNode node2 in node1.ChildNodes)
            {
                //while (nodeIter1.MoveNext()) 
                //{
                DataRow row = dt.NewRow();
                row["id"] = Convert.ToInt32(node2.Attributes["id"].Value.ToString());
                row["title"] = node2.InnerText.Trim();
                row["strurl"] = node2.Attributes["strurl"].Value.ToString().Trim();
                row["imgurl"] = node2.Attributes["imgurl"].Value.ToString().Trim();
                dt.Rows.Add(row);
            }

            dt.DefaultView.Sort = "id desc";
            return dt;

        }
        public bool AddBigList(string strtitle, string strurl, string imgurl, string xmlurl)//添加到新闻列表（标题，链接地址，图片地址，xml路径）
        {
            bool flag = false;
            XmlDocument xmlDoc = new XmlDocument();

            xmlDoc.Load(xmlurl);

            XmlAttribute xmlAtt;
            string strPath = "/root";

            XmlNode node1 = xmlDoc.SelectSingleNode(strPath);



            XmlNode node2 = xmlDoc.CreateElement("bigright");
            xmlAtt = xmlDoc.CreateAttribute("id");

            string nodenum;
            if (node1.ChildNodes.Count == 0)
            {
                nodenum = "0";
            }
            else
            {
                nodenum = node1.LastChild.Attributes["id"].Value.ToString();
            }
            xmlAtt.Value = Convert.ToString(Convert.ToInt32(nodenum) + 1);
            node2.Attributes.Append(xmlAtt);

            xmlAtt = xmlDoc.CreateAttribute("strurl");
            xmlAtt.Value = strurl;
            node2.Attributes.Append(xmlAtt);

            xmlAtt = xmlDoc.CreateAttribute("imgurl");
            xmlAtt.Value = imgurl;
            node2.Attributes.Append(xmlAtt);

            node2.InnerText = strtitle.Trim();

            node1.AppendChild(node2);

            xmlDoc.Save(xmlurl);
            flag = true;
            return flag;

        }
        public bool UpdateBigList(string id, string strtitle, string strurl, string imgurl, string xmlurl)//()
        //添加到新闻列表（id, 标题，链接地址，图片地址， xml路径）
        {
            bool flag = false;
            XmlDocument xmlDoc = new XmlDocument();

            xmlDoc.Load(xmlurl);

            XmlAttribute xmlAtt;
            string strPath = "/root";
            string strPath1 = "/root/bigright[@id='" + id.Trim() + "']";

            XmlNode node1 = xmlDoc.SelectSingleNode(strPath);
            XmlNode node3 = xmlDoc.SelectSingleNode(strPath1);


            XmlNode node2 = xmlDoc.CreateElement("bigright");
            xmlAtt = xmlDoc.CreateAttribute("id");
            xmlAtt.Value = id;
            node2.Attributes.Append(xmlAtt);

            xmlAtt = xmlDoc.CreateAttribute("strurl");
            xmlAtt.Value = strurl;
            node2.Attributes.Append(xmlAtt);

            xmlAtt = xmlDoc.CreateAttribute("imgurl");
            xmlAtt.Value = imgurl;
            node2.Attributes.Append(xmlAtt);

            node2.InnerText = strtitle.Trim();

            node1.ReplaceChild(node2, node3);

            xmlDoc.Save(xmlurl);
            flag = true;
            return flag;

        }
        public DataTable GetBigListByID(string id, string xmlUrl)  //获取大图列表ID为ID的（ID，列表地址）
        {
            XmlDocument xmlDoc = new XmlDocument();
            xmlDoc.Load(xmlUrl);
            string strPath = "/root/bigright[@id='" + id.Trim() + "']";


            XmlNode node = xmlDoc.SelectSingleNode(strPath);
            DataTable dt = new DataTable();

            DataColumn dl1 = new DataColumn();
            dl1.ColumnName = "id";
            dl1.DataType = Type.GetType("System.Int32");
            dt.Columns.Add(dl1);

            DataColumn dl2 = new DataColumn();
            dl2.ColumnName = "title";
            dl2.DataType = Type.GetType("System.String");
            dt.Columns.Add(dl2);

            DataColumn dl3 = new DataColumn();
            dl3.ColumnName = "strurl";
            dl3.DataType = Type.GetType("System.String");
            dt.Columns.Add(dl3);

            DataColumn dl4 = new DataColumn();
            dl4.ColumnName = "imgurl";
            dl4.DataType = Type.GetType("System.String");
            dt.Columns.Add(dl4);


            DataRow row = dt.NewRow();
            row["id"] = Convert.ToInt32(node.Attributes["id"].Value.ToString());
            row["title"] = node.InnerText.Trim();
            row["strurl"] = node.Attributes["strurl"].Value.ToString().Trim();
            row["imgurl"] = node.Attributes["imgurl"].Value.ToString().Trim();
            dt.Rows.Add(row);

            return dt;

        }

        #endregion
    }
}
