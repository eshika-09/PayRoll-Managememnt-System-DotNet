using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.OracleClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Globalization;


namespace Payroll_Management_System
{
    [Obsolete]
    public partial class EmployeeProfile : System.Web.UI.Page
    {
        string conn = ConfigurationManager.ConnectionStrings["myconn"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindDDL();
            }
            if (Session["fullname"] != null)
            {
                txtname.Text = Session["fullname"].ToString();
            }
            if (Session["username"] != null)
            {
                txtid.Text = Session["username"].ToString();
            }
            if (Session["empclass"] != null)
            {
                txtDesig.Text = Session["empclass"].ToString();
            }
        }
        void BindDDL()
        {
            OracleConnection conn2 = new OracleConnection(conn);
            if (conn2.State == ConnectionState.Closed)
            {
                conn2.Open();
            }
            OracleCommand cmd2 = new OracleCommand("select dept_name from master_dept", conn2);
            cmd2.CommandType = CommandType.Text;
            ddlDept.DataSource = cmd2.ExecuteReader();
            ddlDept.DataTextField = "dept_name";
            ddlDept.DataBind();
            conn2.Close();
        }

        protected void Apply_Click(object sender, EventArgs e)
        {
            try
            {
                var cmdText = "insert into salarytbl_1(empid,full_name,designation,dept,basic_pay)values(:empid,:full_name,:designation,:dept,:basic_pay)";
                //var cmdText = "insert into EmpManage(basic_pay)values(:basic_pay)";
                using (OracleConnection conn1 = new OracleConnection(conn))
                using (OracleCommand cmd = new OracleCommand(cmdText, conn1))

                {
                    cmd.Parameters.AddWithValue("empid", txtid.Text.Trim());
                    cmd.Parameters.AddWithValue("full_name", txtname.Text.Trim());
                    cmd.Parameters.AddWithValue("designation", txtDesig.Text.Trim());
                    cmd.Parameters.AddWithValue("dept", ddlDept.Text.Trim());
                    cmd.Parameters.AddWithValue("basic_pay", txtBasic.Text.Trim());
                    cmd.Connection.Open();
                    cmd.ExecuteNonQuery();
                    cmd.Connection.Close();
                    Response.Write("<script>alert('Information sent Successfully');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}
