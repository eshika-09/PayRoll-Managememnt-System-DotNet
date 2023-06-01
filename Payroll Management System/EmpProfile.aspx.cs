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
    public partial class EmpProfile : System.Web.UI.Page
    {
        string conn = ConfigurationManager.ConnectionStrings["myconn"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["fullname"] != null)
            {
                Heading.Text = Session["fullname"].ToString();

            }
            if (Session["empclass"] != null)
            {
                designation.Text = Session["empclass"].ToString();
            }
            details();
            BindDDL();
        }

        protected void update_Click(object sender, EventArgs e)
        {
            UpdateEmp();
        }
        protected void confirm_Click(object sender, EventArgs e)
        {
            Confirm_Pass();
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
        bool CheckMemeberExist()
        {
            try
            {
                OracleConnection conn2 = new OracleConnection(conn);
                if (conn2.State == ConnectionState.Closed)
                {
                    conn2.Open();
                }

                OracleCommand cmd2 = new OracleCommand("select * from signup where empid = '" + Session["username"].ToString() + "'", conn2);
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
        void UpdateEmp()
        {
            DateTime dob = Convert.ToDateTime(txtdob.Text.ToString()).Date;
            DateTimeFormatInfo mfi = new DateTimeFormatInfo();
            string strMonthName = mfi.GetAbbreviatedMonthName(dob.Month);
            string _dob = dob.Day + "-" + strMonthName + "-" + dob.Year;
            try
            {
                var cmdText = "update signup set full_name = :full_name, dob=:dob, phone=:phone, email=:email, state=:state, city=:city, pincode=:pincode, address=:address where empid='" + Session["username"].ToString() + "'";
                using (OracleConnection conn1 = new OracleConnection(conn))
                using (OracleCommand cmd = new OracleCommand(cmdText, conn1))

                {
                    cmd.Parameters.AddWithValue("full_name", txtname.Text.Trim());
                    cmd.Parameters.AddWithValue("state", txtstate.Text.Trim());
                    cmd.Parameters.AddWithValue("dob", _dob);
                    cmd.Parameters.AddWithValue("phone", txtphone.Text.Trim());
                    cmd.Parameters.AddWithValue("email", txtmail.Text.Trim());
                    cmd.Parameters.AddWithValue("state", txtstate.Text.Trim());
                    cmd.Parameters.AddWithValue("city", txtcity.Text.Trim());
                    cmd.Parameters.AddWithValue("pincode", txtpin.Text.Trim());
                    cmd.Parameters.AddWithValue("address", txtaddress.Text.Trim());
                    // cmd.Parameters.AddWithValue("ctc", TextBox5.Text.Trim());
                    cmd.Connection.Open();
                    cmd.ExecuteNonQuery();
                    cmd.Connection.Close();
                    Response.Write("<script>alert('Employee Updated Successfully');</script>");
                    DataBind();
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        void details()
        {
            try
            {

                OracleConnection conn1 = new OracleConnection(conn);
                if (conn1.State == ConnectionState.Closed)
                {
                    conn1.Open();
                }

                OracleCommand cmd = new OracleCommand("select full_name,account_status,dob,phone,email,state,city,pincode,address from signup where empid = '" + Session["username"].ToString() + "'", conn1);
                OracleDataReader dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        txtname.Text = dr["full_name"].ToString();
                        // txtstatus.Text = dr["account_status"].ToString();
                        //string emp_dob = Convert.ToDateTime(dr["dob"]).Day + "-" + Convert.ToDateTime(dr["dob"]).Month + "-" + Convert.ToDateTime(dr["dob"]).Year;//dr["dob"].ToString();
                        DateTime empdob = Convert.ToDateTime(dr["dob"].ToString());
                        txtdob.Text = empdob.ToString("dd-MM-yyyy");
                        txtdob.Text = dr["dob"].ToString(); //emp_dob;
                        txtphone.Text = dr["phone"].ToString();
                        txtmail.Text = dr["email"].ToString();
                        txtstate.Text = dr["state"].ToString();
                        txtcity.Text = dr["city"].ToString();
                        txtpin.Text = dr["pincode"].ToString();
                        txtaddress.Text = dr["address"].ToString();
                        //Response.Write("<script>alert('" + dr.GetValue(0).ToString() + "');</script>");
                        DataBind();
                    }
                }
                else
                {
                   
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        void Confirm_Pass()
        {
             try
            {
                var cmdText = "update signup set pass = :password where empid='" + Session["username"].ToString() + "'";
                using (OracleConnection conn1 = new OracleConnection(conn))
                using (OracleCommand cmd = new OracleCommand(cmdText, conn1))

                {
                    cmd.Parameters.AddWithValue("password", NewPswd.Text.Trim());
                    cmd.Connection.Open();
                    cmd.ExecuteNonQuery();
                    cmd.Connection.Close();
                    Response.Write("<script>alert('Password Updated Successfully');</script>");
                    DataBind();
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void read_Click(object sender, EventArgs e)
        {

        }
    }
}