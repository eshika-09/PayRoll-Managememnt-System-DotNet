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
    public partial class AdminSignUp : System.Web.UI.Page
    {
        string conn = ConfigurationManager.ConnectionStrings["myconn"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        [Obsolete]
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (CheckUserExist())
            {
                Response.Write("<script>alert('Member Already Exist with this Member ID, try other ID');</script>");
            }
            else
            {
                SignUpNewUser();
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
                OracleCommand cmd2 = new OracleCommand("select * from adminsignup where adminid = '" + TextBox8.Text.Trim() + "'", conn2);
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

        [Obsolete]
        void SignUpNewUser()
        {
            DateTime dob = Convert.ToDateTime(TextBox2.Text.ToString()).Date;
            DateTimeFormatInfo mfi = new DateTimeFormatInfo();
            string strMonthName = mfi.GetAbbreviatedMonthName(dob.Month);
            string _dob = dob.Day + "-" + strMonthName + "-" + dob.Year;

            try
            {
                var cmdText = "insert into adminsignup(full_name, dob, phone, email, state, city, pincode, address, adminid, password, empclass, account_status)values(:full_name,:dob,:phone,:email,:state,:city,:pincode,:address,:adminid,:pass,:empclass,:account_status)";
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
                    cmd.Parameters.AddWithValue("adminid", TextBox8.Text.Trim());
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
    }
}