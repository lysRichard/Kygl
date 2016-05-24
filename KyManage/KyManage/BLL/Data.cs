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
    /// Data 的摘要说明
    /// </summary>
    public class DataBase : IDisposable
    {
        public SqlConnection cnn;
        public DataBase()
        {
        }

        public void GetExecuteNonQuery(CommandType cmdType, string cmdText, params SqlParameter[] commandParameters)
        {
            OPEN();
            SqlCommand cmd = CreateCommand(null, CommandType.Text, commandParameters);
            cmd.CommandText = cmdText;
            cmd.ExecuteNonQuery();
            cmd.Parameters.Clear();
            Close();
        }
        public void GetExecuteNonQuery(SqlCommand cmd, string cmdText)
        {
            OPEN();
            cmd.CommandText = cmdText;
            cmd.Connection = cnn;
            cmd.ExecuteNonQuery();
            Close();
        }
        /// <summary>
        /// 执行没有返回的Sql语句
        /// </summary>
        /// <param name="sql">Sql语句</param>
        public void Exesql(string sql)
        {
            OPEN();
            SqlCommand comm = new SqlCommand(sql, cnn);
            comm.ExecuteNonQuery();
            this.Close();
        }
        /// <summary>
        /// 执行返回dataset的操作
        /// </summary>
        /// <param name="sql">Sql语句</param>
        /// <returns></returns>
        public DataSet ExeSqlFillDs(string sql)
        {
            DataSet ds = new DataSet();
            OPEN();
            SqlDataAdapter dpr = new SqlDataAdapter(sql, cnn);
            dpr.Fill(ds);
            Close();
            return ds;

        }

        public string ExeSqlScalar(string sql)
        {
            OPEN();
            SqlCommand comm = new SqlCommand(sql, cnn);
            string str = comm.ExecuteScalar().ToString();
            Close();
            return str;
        }
        /// <summary>
        /// 执行sql语句返回指定分页的dataset
        /// </summary>
        /// <param name="cmdText">sql语句</param>
        /// <param name="myds">dataset</param>
        /// <param name="CurrentPage">当前页</param>
        /// <param name="PageSize"></param>
        /// <param name="tablename"></param>
        public void FillData(string cmdText, DataSet myds, int CurrentPage, int PageSize, string tablename)
        {
            DataBase data = new DataBase();
            OPEN();
            SqlDataAdapter dpr = new SqlDataAdapter(cmdText, cnn);
            dpr.Fill(myds, CurrentPage, PageSize, tablename);
            Close();
        }

        /// <summary>
        /// 执行返回dataset的操作
        /// </summary>
        /// <param name="sql">Sql语句</param>
        /// <param name="tablename">表名</param>
        /// <returns></returns>
        public DataSet ExeSqlFillDs(string sql, string tablename)
        {
            DataSet ds = new DataSet();
            OPEN();
            SqlDataAdapter dpr = new SqlDataAdapter(sql, cnn);
            dpr.Fill(ds, tablename);
            Close();
            return ds;

        }
        public DataSet ExeSqlFillDs(string sql, string tablename, DataSet ds)
        {
            OPEN();
            SqlDataAdapter dpr = new SqlDataAdapter(sql, cnn);
            dpr.Fill(ds, tablename);
            Close();
            return ds;

        }
        private SqlCommand CreateCommand(SqlTransaction trans, CommandType cmdType, SqlParameter[] cmdParms)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cnn;
            if (trans != null)
            {
                cmd.Transaction = trans;
            }
            cmd.CommandType = cmdType;
            if (cmdParms != null)
            {
                foreach (SqlParameter parameter in cmdParms)
                {
                    cmd.Parameters.Add(parameter);
                }
            }
            return cmd;
        }
        /// <summary>
        /// 执行返回SqlDataReader的操作
        /// </summary>
        /// <param name="sql"></param>
        /// <returns></returns>
        public SqlDataReader ExeSqlFillDr(string sql)
        {
            this.OPEN();
            SqlCommand cmd = new SqlCommand(sql, cnn);
            SqlDataReader dr = null;
            dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            //this.Close();
            return dr;
        }
        public void OPEN()
        {
            string connection = ConfigurationSettings.AppSettings["ConnectionString"].ToString();
            if (cnn == null)
                cnn = new SqlConnection(connection);
            if (cnn.State == System.Data.ConnectionState.Closed)
                cnn.Open();
        }
        public void Close()
        {
            if (cnn != null)
                cnn.Close();
        }
        public void Dispose()
        {
            if (cnn != null)
            {
                cnn.Dispose();
                cnn = null;
            }
        }
    }
}