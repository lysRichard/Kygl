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
    /// <summary>
    /// Tools 的摘要说明
    /// </summary>
    public class Tools
    {
        public Tools()
        {
            //
            // TODO: 在此处添加构造函数逻辑
            //
        }
        #region 将DataReader 转为 DataTable
        /// <summary>
        /// 将DataReader 转为 DataTable
        /// </summary>
        /// <param name="DataReader">DataReader</param>
        public static DataTable ConvertDataReaderToDataTable(SqlDataReader dataReader)
        {
            DataTable datatable = new DataTable();
            DataTable schemaTable = dataReader.GetSchemaTable();
            //动态添加列
            try
            {

                foreach (DataRow myRow in schemaTable.Rows)
                {
                    DataColumn myDataColumn = new DataColumn();
                    myDataColumn.DataType = myRow.GetType();
                    myDataColumn.ColumnName = myRow[0].ToString();
                    datatable.Columns.Add(myDataColumn);
                }
                //添加数据
                while (dataReader.Read())
                {
                    DataRow myDataRow = datatable.NewRow();
                    for (int i = 0; i < schemaTable.Rows.Count; i++)
                    {
                        myDataRow[i] = dataReader[i].ToString();
                    }
                    datatable.Rows.Add(myDataRow);
                    myDataRow = null;
                }
                schemaTable = null;
                dataReader.Close();
                return datatable;
            }
            catch (Exception ex)
            {
                Error.Log(ex.ToString());
                throw new Exception("转换出错出错!", ex);
            }

        }

        #endregion

        #region 将英文的星期几转为中文
        public static string ConvertDayOfWeekToZh(System.DayOfWeek dw)
        {
            string DayOfWeekZh = "";
            switch (dw.ToString("D"))
            {
                case "0":
                    DayOfWeekZh = "日";
                    break;
                case "1":
                    DayOfWeekZh = "一";
                    break;
                case "2":
                    DayOfWeekZh = "二";
                    break;
                case "3":
                    DayOfWeekZh = "三";
                    break;
                case "4":
                    DayOfWeekZh = "四";
                    break;
                case "5":
                    DayOfWeekZh = "五";
                    break;
                case "6":
                    DayOfWeekZh = "六";
                    break;
            }

            return DayOfWeekZh;
        }
        #endregion

        #region 防SQL注入
        public static bool CheckInjectWord(string strWord)
        {
            string Fy_In = ";防and防exec防insert防select防delete防update防count防*防%防chr防mid防master防truncate防char防declare防=防|防script防while防drop防create";
            string[] Fy_Inf = Fy_In.Split('防');
            for (int i = 0; i < Fy_Inf.Length; i++)
            {
                if (strWord.Contains(Fy_Inf[i]))
                {
                    return true;
                }
            }
            return false;
        }
        #endregion

        #region 获取Json字符串某节点的值
        /// <summary>
        /// 获取Json字符串某节点的值
        /// </summary>
        public static string GetJsonValue(string jsonStr, string key)
        {
            string result = string.Empty;
            if (!string.IsNullOrEmpty(jsonStr))
            {
                key = "\"" + key.Trim('"') + "\"";
                int index = jsonStr.IndexOf(key) + key.Length + 1;
                if (index > key.Length + 1)
                {
                    //先截逗号，若是最后一个，截“｝”号，取最小值
                    int end = jsonStr.IndexOf(',', index);
                    if (end == -1)
                    {
                        end = jsonStr.IndexOf('}', index);
                    }

                    result = jsonStr.Substring(index, end - index);
                    result = result.Trim(new char[] { '"', ' ', '\'' }); //过滤引号或空格
                }
            }
            return result;
        }
        #endregion

        #region unix时间戳与datetime互相转换
        /// <summary>
        /// 将Unix时间戳转换为DateTime类型时间
        /// </summary>
        /// <param name="d">double 型数字</param>
        /// <returns>DateTime</returns>
        public static System.DateTime ConvertIntDateTime(double d)
        {
            System.DateTime time = System.DateTime.MinValue;
            System.DateTime startTime = TimeZone.CurrentTimeZone.ToLocalTime(new System.DateTime(1970, 1, 1));
            time = startTime.AddMilliseconds(d);
            return time;
        }

        /// <summary>
        /// 将c# DateTime时间格式转换为Unix时间戳格式
        /// </summary>
        /// <param name="time">时间</param>
        /// <returns>long</returns>
        public static long ConvertDateTimeInt(System.DateTime time)
        {
            ////double intResult = 0;
            System.DateTime startTime = TimeZone.CurrentTimeZone.ToLocalTime(new System.DateTime(1970, 1, 1, 0, 0, 0, 0));
            //intResult = (time- startTime).TotalMilliseconds;
            long t = (time.Ticks - startTime.Ticks) / 10000000;            //除10000000调整为10位
            return t;
            //DateTime dtStart = TimeZone.CurrentTimeZone.ToLocalTime(new DateTime(1970, 1, 1));
            //DateTime dtNow = DateTime.Parse(time.ToString());
            //TimeSpan toNow = dtNow.Subtract(dtStart);
            //string timeStamp = toNow.Ticks.ToString();
            //timeStamp = timeStamp.Substring(0, timeStamp.Length - 7);
            //return 
        }
        #endregion

    }
}