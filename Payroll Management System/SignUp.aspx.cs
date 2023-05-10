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
    public partial class SignUp : System.Web.UI.Page
    {
        string conn = ConfigurationManager.ConnectionStrings["myconn"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindDDL();
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (CheckUserExist())
            {
                Response.Write("<script>alert('Member Already Exist with this Member ID, try other ID');</script>");
            }
            else
            {
                SignUpNewUser();
                Response.Write("<script>alert('Signed Up Succesfully');</script>");
                Response.Redirect("EmpLogin.aspx");
            }
        }

        [Obsolete]
        bool CheckUserExist()
        {
            try
            {
                OracleConnection conn2 = new OracleConnection(conn);
                if (conn2.State == ConnectionState.Closed)
                {
                    conn2.Open();
                }
                OracleCommand cmd2 = new OracleCommand("select * from signup where empid = '" + TextBox8.Text.Trim() + "'", conn2);
                OracleDataAdapter da = new OracleDataAdapter(cmd2);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }

            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
        }
        void SignUpNewUser()
        {
            DateTime dob = Convert.ToDateTime(TextBox2.Text.ToString()).Date;
            DateTimeFormatInfo mfi = new DateTimeFormatInfo();
            string strMonthName = mfi.GetAbbreviatedMonthName(dob.Month);
            string _dob = dob.Day + "-" + strMonthName + "-" + dob.Year;

            try
            {
                var cmdText = "insert into signup(full_name, dob, phone, email, state, city, pincode, address, empid, pass, empclass, account_status)values(:full_name,:dob,:phone,:email,:state,:city,:pincode,:address,:EMP_ID, :pass,:empclass,:account_status)";
                using (OracleConnection conn1 = new OracleConnection(conn))
                using (OracleCommand cmd = new OracleCommand(cmdText, conn1))

                {
                    cmd.Parameters.AddWithValue("full_name", TextBox1.Text.Trim());
                    cmd.Parameters.AddWithValue("dob", _dob);
                    cmd.Parameters.AddWithValue("phone", TextBox3.Text.Trim());
                    cmd.Parameters.AddWithValue("email", TextBox4.Text.Trim());
                    cmd.Parameters.AddWithValue("state", DropDownList1.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("city", TextBox6.Text.Trim());
                    cmd.Parameters.AddWithValue("pincode", TextBox7.Text.Trim());
                    cmd.Parameters.AddWithValue("address", TextBox5.Text.Trim());
                    cmd.Parameters.AddWithValue("emp_id", TextBox8.Text.Trim());
                    cmd.Parameters.AddWithValue("pass", TextBox10.Text.Trim());
                    cmd.Parameters.AddWithValue("empclass", TextBox9.Text.Trim());
                    cmd.Parameters.AddWithValue("account_status", "pending");
                    cmd.Connection.Open();
                    cmd.ExecuteNonQuery();
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void BindDDL()
        {
            OracleConnection conn2 = new OracleConnection(conn);
            if (conn2.State == ConnectionState.Closed)
            {
                conn2.Open();
            }
            OracleCommand cmd2 = new OracleCommand("select dept_name, dept_code from master_dept", conn2);
            cmd2.CommandType = CommandType.Text;
            ddlDept.DataSource = cmd2.ExecuteReader();
            ddlDept.DataTextField = "dept_code";
            ddlDept.DataTextField = "dept_name";
            ddlDept.DataBind();
            conn2.Close();

            ddlDept.Items.Insert(0, new ListItem("--Select Department--", "0"));
        }

        protected void ddlDept_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                OracleConnection conn2 = new OracleConnection(conn);
                if (conn2.State == ConnectionState.Closed)
                {
                    conn2.Open();
                }
                string department = ddlDept.SelectedValue;
                string id = "";
                if (department == ddlDept.SelectedValue)
                {
                    OracleCommand cmd = new OracleCommand("select t.dept_code||signup_seq.nextval EMP_ID from master_dept t where dept_name='" + ddlDept.SelectedValue + "'", conn2);
                    OracleDataReader dr = cmd.ExecuteReader();
                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            TextBox8.Text = dr["EMP_ID"].ToString();
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

    }
}