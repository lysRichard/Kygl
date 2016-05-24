using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Text.RegularExpressions;
using System.Data.OleDb;
namespace KyManage.BLL
{
    public class lyb
    {

        /// <summary>
        /// Creates a new instance of ly
        /// </summary>
        string _xm; //姓名
        string _yx; //邮箱
        string _zy; //主页
        string _qq; //QQ
        string _ly; //留言

        string _lj; //连接字符串
        bool _ubb; //是否使用UBB

        int _xy, _dx, _zs; //当前页,页大小,记录总数
        //该源码下载自www.51aspx.com(５１ａｓｐｘ．ｃｏｍ)

        public lyb()
        {
            _ubb = true;
            _xy = 1;
            _dx = 5;
            _zs = 0;
            _xm = _yx = _zy = _qq = _ly = "";
            _lj = ConfigurationSettings.AppSettings["ConnectionString"].ToString() + System.Web.HttpContext.Current.Server.MapPath(ConfigurationSettings.AppSettings["mdb"].ToString());
        }

        //UBB属性
        public bool ubb
        {
            get
            {
                return _ubb;
            }
            set
            {
                _ubb = value;
            }
        }

        //姓名属性
        public string xm
        {
            get
            {
                return _xm;
            }
            set
            {
                _xm = html(value);
            }
        }

        //邮箱属性
        public string yx
        {
            get
            {
                return _yx;
            }
            set
            {
                _yx = html(value);
            }
        }

        //主页属性
        public string zy
        {
            get
            {
                return _zy;
            }
            set
            {
                _zy = html(value);
            }
        }

        //QQ属性
        public string qq
        {
            get
            {
                return _qq;
            }
            set
            {
                _qq = html(value);
            }
        }

        //留言属性
        public string ly
        {
            get
            {
                return _ly;
            }
            set
            {
                if (_ubb)
                    _ly = ubbzh(html(value));
                else
                    _ly = html(value);
            }
        }

        //当前页属性
        public int xy
        {
            get { return _xy; }
            set { _xy = value - 1; }
        }

        //页大小属性
        public int dx
        {
            get { return _dx; }
            set { _dx = value; }
        }

        //记录总数属性,只读
        public int zs
        {
            get { return _zs; }
        }

        //UBB代码
        string ubbzh(string bl)
        {
            Random sj = new Random();
            bl = Regex.Replace(bl, "\\[URL\\](.*?)\\[/URL\\]", "<a href=\"$1\" target=\"_blank\" title=\"$1\">$1</a>");
            bl = Regex.Replace(bl, "\\[URL=(.*?)\\](.*?)\\[/URL\\]", "<a href=\"$1\" target=\"_blank\" title=\"$1\">$2</a>");
            bl = Regex.Replace(bl, "\\[MAIL\\](.*?)\\[/MAIL\\]", "<a href=\"mailto:$1\">$1</a>");
            bl = Regex.Replace(bl, "\\[MAIL=(.*?)\\](.*?)\\[/MAIL\\]", "<a href=\"mailto:$1\">$2</a>");
            bl = Regex.Replace(bl, "\\[COLOR\\](.*?)\\[/COLOR\\]", "<span style=\"color:#" + sj.Next(000000, 999999) + ";\">$1</span>");
            bl = Regex.Replace(bl, "\\[COLOR=(.*?)\\](.*?)\\[/COLOR\\]", "<span style=\"color:$1\">$2</span>");
            bl = Regex.Replace(bl, "\\[MOVE\\](.*?)\\[/MOVE\\]", "<marquee>$1</marquee>");
            bl = Regex.Replace(bl, "\\[STRONG\\](.*?)\\[/STRONG\\]", "<strong>$1</strong>");
            bl = Regex.Replace(bl, "\\[EM\\](.*?)\\[/EM\\]", "<em>$1</em>");
            return bl;
        }

        //过滤所有script标记
        public string wipeScript(string html)
        {
            System.Text.RegularExpressions.Regex regex1 = new System.Text.RegularExpressions.Regex(@"<script[\s\S]+</script *>", System.Text.RegularExpressions.RegexOptions.IgnoreCase);
            System.Text.RegularExpressions.Regex regex2 = new System.Text.RegularExpressions.Regex(@" href *= *[\s\S]*script *:", System.Text.RegularExpressions.RegexOptions.IgnoreCase);
            System.Text.RegularExpressions.Regex regex3 = new System.Text.RegularExpressions.Regex(@" on[\s\S]*=", System.Text.RegularExpressions.RegexOptions.IgnoreCase);
            System.Text.RegularExpressions.Regex regex4 = new System.Text.RegularExpressions.Regex(@"<iframe[\s\S]+</iframe *>", System.Text.RegularExpressions.RegexOptions.IgnoreCase);
            System.Text.RegularExpressions.Regex regex5 = new System.Text.RegularExpressions.Regex(@"<frameset[\s\S]+</frameset *>", System.Text.RegularExpressions.RegexOptions.IgnoreCase);
            html = regex1.Replace(html, ""); //过滤<script></script>标记
            html = regex2.Replace(html, ""); //过滤href=javascript: (<A>) 属性
            html = regex3.Replace(html, " _disibledevent="); //过滤其它控件的on...事件
            html = regex4.Replace(html, ""); //过滤iframe
            html = regex5.Replace(html, ""); //过滤frameset
            return html;
        }


        //还原
        public string hy(string bl)
        {
            return bl.Replace("<br>", "\n").Replace("&lt;", "<").Replace("&gt;", ">").Replace("&quot;", "\"").Replace("&nbsp;", " ").Replace("&", "&amp;");
        }
        //还原
        public string hy(object bl)
        {
            return bl.ToString().Replace("<br>", "\n").Replace("&lt;", "<").Replace("&gt;", ">").Replace("&quot;", "\"").Replace("&nbsp;", " ").Replace("&", "&amp;");
        }

        //编码
        string html(string bl)
        {
            return HttpContext.Current.Server.HtmlEncode(bl.Replace("'", "''")).Replace("\n", "<br />");
        }

        //读取留言
        public DataTable dq(int bl)
        {
            string mlwb = "SELECT * FROM ly WHERE hf<>'' ORDER BY bh desc";
            if (bl != 0)
                mlwb = "select * from ly where bh=" + bl;

            OleDbConnection lj = new OleDbConnection(_lj);
            OleDbDataAdapter ml = new OleDbDataAdapter(mlwb, lj);
            DataSet sj = new DataSet();
            if (bl != 0)
                ml.Fill(sj);
            else
                ml.Fill(sj, _xy * _dx, _dx, "数据");

            if (sj.Tables[0].Rows.Count > 0 && bl != 0)
            {
                _xm = sj.Tables[0].Rows[0]["xm"].ToString();
                _zy = sj.Tables[0].Rows[0]["zy"].ToString();
                _yx = sj.Tables[0].Rows[0]["yx"].ToString();
                _qq = sj.Tables[0].Rows[0]["qq"].ToString();
                _ly = sj.Tables[0].Rows[0]["ly"].ToString();
            }

            //统计数量
            _zs = tjsl();

            return sj.Tables[0];
        }

        //记录总数
        int tjsl()
        {
            int fh = 0;
            OleDbConnection lj = new OleDbConnection(_lj);
            OleDbCommand ml = new OleDbCommand("select count(*) as sl from ly where hf<>''", lj);
            lj.Open();
            fh = (int)ml.ExecuteScalar();
            lj.Close();
            return fh;
        }

        //提交留言
        public int tj()
        {
            return zx("insert into ly(xm,yx,zy,qq,ly) values('" + _xm + "','" + _yx + "','" + _zy + "','" + _qq + "','" + _ly + "')");
        }

        //修改留言
        public int xg(int bh)
        {
            return zx("update ly set xm='" + _xm + "',yx='" + _yx + "',zy='" + _zy + "',qq='" + _qq + "',ly='" + _ly + "' where bh=" + bh);
        }

        //回复留言
        public int hf(int bh)
        {
            return zx("update ly set hf='" + _ly + "' where bh=" + bh);
        }

        //删除留言
        public int sc(int bh)
        {
            return zx("delete * from ly where bh=" + bh);
        }
        //删除留言
        public int sc(string bh)
        {
            return zx("delete * from ly where bh=" + bh.Replace(",", " or bh="));
        }

        //执行操作
        int zx(string bl)
        {
            int fh;
            OleDbConnection lj = new OleDbConnection(_lj);
            OleDbCommand ml = new OleDbCommand(bl, lj);
            lj.Open();
            fh = ml.ExecuteNonQuery();
            lj.Close();
            return fh;
        }

        //权限判断
        public bool qx(string yh, string mm)
        {
            bool fh = false;
            string[] yhz = ConfigurationSettings.AppSettings["用户组"].Split('|');
            foreach (string i in yhz)
            {
                string[] xx = i.Split(',');
                if (yh == xx[0] && mm == xx[1])
                {
                    fh = true;
                    break;
                }
                else
                    fh = false;
            }
            return fh;
        }
    }
}
