using System;
using System.Collections.Generic;
using System.Text;
using System.Xml;
using System.Data;

namespace KyManage.BLL
{
    public class XmlDataBase
    {
        private string _conStr = "";
        
        public XmlDataBase()
        {

        }

        public XmlDataBase(string conStr)
        {
            _conStr = conStr;
        }

        public static XmlElement GetXmlElement(string xmlUrl)
        {
            XmlDocument doc = new XmlDocument();
            doc.Load(xmlUrl);
            if (doc != null && doc.ChildNodes.Count > 0)
            {
                return doc.DocumentElement;
            }
            return null;
        }
        
    }
}
