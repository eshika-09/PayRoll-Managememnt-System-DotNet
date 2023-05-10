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
    public partial class AdminSignUp : System.Web.UI.Page
    {
        string conn = ConfigurationManager.ConnectionStrings["myconn"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataBind();
            }
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
                clearform();
                Response.Redirect("AdminLogin.aspx");
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
                OracleCommand cmd2 = new OracleCommand("select * from adminsignup where adminid = '" + txtid.Text.Trim() + "'", conn2);
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
                Response.Write("<script>alert('Invalid ID');</script>");
                return false;
                throw (ex);
            }
        }
        void SignUpNewUser()
        {
            DateTime dob = Convert.ToDateTime(txtdob.Text.ToString()).Date;
            DateTimeFormatInfo mfi = new DateTimeFormatInfo();
            string strMonthName = mfi.GetAbbreviatedMonthName(dob.Month);
            string _dob = dob.Day + "-" + strMonthName + "-" + dob.Year;

            try
            {
                var cmdText = "insert into adminsignup(full_name,dob,phone,email,state,city,pincode,address,adminid,pass,empclass)values(:full_name,:dob,:phone,:email,:state,:city,:pincode,:address,:adminid,:pass,:empclass)";
                using (OracleConnection conn1 = new OracleConnection(conn))
                using (OracleCommand cmd = new OracleCommand(cmdText, conn1))

                {
                    cmd.Parameters.AddWithValue("full_name", txtname.Text.Trim());
                    cmd.Parameters.AddWithValue("dob", _dob);
                    cmd.Parameters.AddWithValue("phone", txtphone.Text.Trim());
                    cmd.Parameters.AddWithValue("email", txtmail.Text.Trim());
                    cmd.Parameters.AddWithValue("state", ddlstate.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("city", txtcity.Text.Trim());
                    cmd.Parameters.AddWithValue("pincode", txtpin.Text.Trim());
                    cmd.Parameters.AddWithValue("address", txtaddress.Text.Trim());
                    cmd.Parameters.AddWithValue("adminid", txtid.Text.Trim());
                    cmd.Parameters.AddWithValue("pass", txtpass.Text.Trim());
                    cmd.Parameters.AddWithValue("empclass", txtclass.Text.Trim());
                    cmd.Connection.Open();
                    cmd.ExecuteNonQuery();

                    Response.Write("<script>alert('Signed Up Successfuly');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Invalid ID');</script>");
                throw (ex);
            }
        }

        protected void txtname_TextChanged(object sender, EventArgs e)
        {
            try
            {
                OracleConnection conn2 = new OracleConnection(conn);
                if (conn2.State == ConnectionState.Closed)
                {
                    conn2.Open();
                }
                string department = txtname.Text;
                //string id = "";
                if (department == txtname.Text)
                {
                    OracleCommand cmd = new OracleCommand("select 'ADMIN'||admin_seq.nextval ADMIN_ID from dual", conn2);
                    OracleDataReader dr = cmd.ExecuteReader();
                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            txtid.Text = dr["ADMIN_ID"].ToString();
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        void clearform()
        {
            txtname.Text = "";
            txtphone.Text = "";
            txtdob.Text = "";
            txtmail.Text = "";
            txtcity.Text = "";
            txtpin.Text = "";
            txtaddress.Text = "";
            txtpass.Text = "";
            txtclass.Text = "";
        }
    }
}