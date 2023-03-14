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
                BindData();
            }
        }
        
        protected void Button1_Click(object sender, EventArgs e)
        {

            try
            {
                OracleConnection conn1 = new OracleConnection(conn);
                if (conn1.State == ConnectionState.Closed)
                {
                    conn1.Open();
                }
                OracleCommand cmd = new OracleCommand("select full_name,account_status,dob,phone,email,state,city,pincode,address,ctc from EmpManage where empid = '" + txtid.Text.Trim() + "'", conn1);
                OracleDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {

                        txtname.Text = dr["full_name"].ToString();
                        txtdob.Text = dr["dob"].ToString();
                        txtphone.Text = dr["phone"].ToString();
                        txtmail.Text = dr["email"].ToString();
                        ddlstate.Items.Add(dr["state"].ToString());
                        txtcity.Text = dr["city"].ToString();
                        txtpin.Text = dr["pincode"].ToString();
                        txtaddress.Text = dr["address"].ToString();
                        Response.Write("<script>alert('" + dr.GetValue(0).ToString() + "');</script>");
                        DataBind();

                        Label1.Text = dr["account_status"].ToString().Trim();

                        if (dr["account_status"].ToString().Trim() == "Active")
                        {
                            Label1.Attributes.Add("class", "badge badge-pill badge-success");
                        }
                        else if (dr["account_status"].ToString().Trim() == "Pending")
                        {
                            Label1.Attributes.Add("class", "badge badge-pill badge-warning");
                        }
                        else if (dr["account_status"].ToString().Trim() == "Deactive")
                        {
                            Label1.Attributes.Add("class", "badge badge-pill badge-danger");
                        }
                        else
                        {
                            Label1.Attributes.Add("class", "badge badge-pill badge-info");
                        }
                        BindData();
                    }
                }
                else
                {
                    Response.Write("<script>alert('Invalid ID');</script>");
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            UpdateEmp();
            clear();
        }

        void UpdateEmp()
        {
            DateTime dob = Convert.ToDateTime(txtdob.Text.ToString()).Date;
            DateTimeFormatInfo mfi = new DateTimeFormatInfo();
            string strMonthName = mfi.GetAbbreviatedMonthName(dob.Month);
            string _dob = dob.Day + "-" + strMonthName + "-" + dob.Year;
            try
            {
                var cmdText = "update EmpManage set full_name =:full_name, dob=:dob, phone=:phone, email=:email, state=:state, city=:city, pincode=:pincode, address=:address where empid='" + txtid.Text.Trim() + "'";
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
                    cmd.Connection.Open();
                    cmd.ExecuteNonQuery();
                    cmd.Connection.Close();
                    Response.Write("<script>alert('Employee Updated Successfully');</script>");
                    BindData();
                    clear();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        void BindData()
        {
            OracleConnection conn2 = new OracleConnection(conn);
            if (conn2.State == ConnectionState.Closed)
            {
                conn2.Open();
            }
            OracleCommand cmd = new OracleCommand("select * from EmpManage", conn2);
            OracleDataAdapter da = new OracleDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        void clear()
        {
            txtname.Text = "";
            txtdob.Text = "";
            txtphone.Text = "";
            txtmail.Text = "";
            ddlstate.Text = "";
            txtcity.Text = "";
            txtphone.Text = "";
            txtaddress.Text = "";
            txtid.Text = "";
        }
    }
}
