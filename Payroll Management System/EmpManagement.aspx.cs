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
    public partial class EmpManagement : System.Web.UI.Page
    {
        string conn = ConfigurationManager.ConnectionStrings["myconn"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindData();
            }
        }

        [Obsolete]
       
        protected void Button4_Click(object sender, EventArgs e)
        {
            if (CheckMemeberExist())
            {
                DeleteEmp();
                BindData();
            }
            else
            {
                Response.Write("<script>alert('Memeber already Exist, Can Not Add More!!');</script>");
            }
        }

        //GO BUTTON
        protected void LinkButton4_Click(object sender, EventArgs e)
        
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
                        //DateTime dob = Convert.ToDateTime(txtdob.Text.ToString()).Date;
                        //DateTimeFormatInfo mfi = new DateTimeFormatInfo();
                        //string strMonthName = mfi.GetAbbreviatedMonthName(dob.Month);
                        //string _dob = dob.Day + "-" + strMonthName + "-" + dob.Year;

                        txtname.Text = dr["full_name"].ToString();
                        txtstatus.Text = dr["account_status"].ToString();
                        txtdob.Text = dr["dob"].ToString();
                        txtphone.Text = dr["phone"].ToString();
                        txtmail.Text = dr["email"].ToString();
                        txtstatus.Text = dr["state"].ToString();
                        txtcity.Text = dr["city"].ToString();
                        txtpin.Text = dr["pincode"].ToString();
                        txtaddress.Text = dr["address"].ToString();
                        //TextBox5.Text = dr["ctc"].ToString();
                        Response.Write("<script>alert('" + dr.GetValue(0).ToString() + "');</script>");
                        DataBind();
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
        bool CheckMemeberExist()
        {
            try
            {
                OracleConnection conn2 = new OracleConnection(conn);
                if (conn2.State == ConnectionState.Closed)
                {
                    conn2.Open();
                }
               
                OracleCommand cmd2 = new OracleCommand("select * from EmpManage where empid = '" + txtid.Text.Trim() + "'", conn2);
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
        void DeleteEmp()
        {
            try
            {
                OracleConnection conn2 = new OracleConnection(conn);
                if (conn2.State == ConnectionState.Closed)
                {
                    conn2.Open();
                }
                OracleCommand cmd = new OracleCommand("delete from EmpManage where empid = '" + txtid.Text.Trim() + "'", conn2);
                cmd.ExecuteNonQuery();
                cmd.Connection.Close();
                Response.Write("<script>alert('Employee Deleted Successfully');</script>");
                DataBind();
                clearForm();
            }

            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
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
        void clearForm()
        {
           
            txtname.Text = "";
            txtdob.Text = "";
            txtphone.Text = "";
            txtmail.Text = "";
            txtstatus.Text = "";
            txtcity.Text = "";
            txtpin.Text = "";
            txtaddress.Text = "";
            txtid.Text = "";
            //TextBox5.Text = "";
        }


        // ACTIVE BUTTON
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            try
            {
                OracleConnection conn3 = new OracleConnection(conn);
                if (conn3.State == ConnectionState.Closed)
                {
                    conn3.Open();
                }
              
                OracleCommand cmd1 = new OracleCommand("update EmpManage set account_status ='Active' where empid='" + txtid.Text.Trim() + "'", conn3);
                cmd1.ExecuteNonQuery();
                cmd1.Connection.Close();
                Response.Write("<script>alert('Status Updated Successfully');</script>");
                DataBind();
                clearForm();
              
            }

            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                
            }
            BindData();
        }


        //PENDING BUTTON
        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            try
            {
                OracleConnection conn3 = new OracleConnection(conn);
                if (conn3.State == ConnectionState.Closed)
                {
                    conn3.Open();
                }
                
                OracleCommand cmd1 = new OracleCommand("update EmpManage set account_status ='Pending' where empid='" + txtid.Text.Trim() + "'", conn3);
                cmd1.ExecuteNonQuery();
                cmd1.Connection.Close();
                Response.Write("<script>alert('Status Updated Successfully');</script>");
                DataBind();
                clearForm();

            }

            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
            BindData();
        }

        //DEACTIVE BUTTON
        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            try
            {
                OracleConnection conn3 = new OracleConnection(conn);
                if (conn3.State == ConnectionState.Closed)
                {
                    conn3.Open();
                }
              
                OracleCommand cmd1 = new OracleCommand("update EmpManage set account_status ='Deactive' where empid='" + txtid.Text.Trim() + "'", conn3);
                cmd1.ExecuteNonQuery();
                cmd1.Connection.Close();
                Response.Write("<script>alert('Status Updated Successfully');</script>");
                DataBind();
                clearForm();

            }

            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
            BindData();
        }
    }
}
//protected void Button2_Click(object sender, EventArgs e)
//{
//    if (CheckMemeberExist())
//    {
//        Response.Write("<script>alert('Memeber already Exist, Can Not Add More!!');</script>");
//    }
//    else
//    {
//        AddNewEmp();
//        BindData();
//    }
//}
//protected void Button3_Click(object sender, EventArgs e)
//{
//    if (CheckMemeberExist())
//    {
//        UpdateEmp();
//        BindData();
//    }
//    else
//    {
//        Response.Write("<script>alert('Memeber already Exist, Can Not Update!!');</script>");
//    }
//}


//void AddNewEmp()
//{
//    DateTime dob = Convert.ToDateTime(TextBox8.Text.ToString()).Date;
//    DateTimeFormatInfo mfi = new DateTimeFormatInfo();
//    string strMonthName = mfi.GetAbbreviatedMonthName(dob.Month);
//    string _dob = dob.Day + "-" + strMonthName + "-" + dob.Year;
//    try
//    {
//        var cmdText = "insert into EmpManage (empid, full_name, account_status, dob, phone, email, state, city, pincode, address,ctc)values(:empid,:full_name, :account_status,:dob,:phone,:email,:state,:city,:pincode,:address,:ctc)";
//        using (OracleConnection conn1 = new OracleConnection(conn))
//        using (OracleCommand cmd = new OracleCommand(cmdText, conn1))

//        {
//            cmd.Parameters.AddWithValue("empid", TextBox1.Text.Trim());
//            cmd.Parameters.AddWithValue("full_name", TextBox2.Text.Trim());
//            cmd.Parameters.AddWithValue("dob", _dob);
//            cmd.Parameters.AddWithValue("phone", TextBox3.Text.Trim());
//            cmd.Parameters.AddWithValue("email", TextBox4.Text.Trim());
//            cmd.Parameters.AddWithValue("state", TextBox9.Text.Trim());
//            cmd.Parameters.AddWithValue("city", TextBox10.Text.Trim());
//            cmd.Parameters.AddWithValue("pincode", TextBox11.Text.Trim());
//            cmd.Parameters.AddWithValue("address", TextBox6.Text.Trim());
//            cmd.Parameters.AddWithValue("ctc", TextBox5.Text.Trim());
//            cmd.Connection.Open();
//            cmd.ExecuteNonQuery();
//            cmd.Connection.Close();
//            Response.Write("<script>alert('Employee added Successfully');</script>");
//            DataBind();
//            clearForm();
//        }
//    }
//    catch (Exception ex)
//    {
//        Response.Write("<script>alert('" + ex.Message + "');</script>");
//    }
//}


//void UpdateEmp()
//{
//    DateTime dob = Convert.ToDateTime(TextBox8.Text.ToString()).Date;
//    DateTimeFormatInfo mfi = new DateTimeFormatInfo();
//    string strMonthName = mfi.GetAbbreviatedMonthName(dob.Month);
//    string _dob = dob.Day + "-" + strMonthName + "-" + dob.Year;
//    try
//    {
//        var cmdText = "update EmpManage set full_name = :full_name, account_status=:account_status, dob=:dob, phone=:phone, email=:email, state=:state, city=:city, pincode=:pincode, address=:address, ctc=:ctc where empid='" + TextBox1.Text.Trim() + "'";
//        using (OracleConnection conn1 = new OracleConnection(conn))
//        using (OracleCommand cmd = new OracleCommand(cmdText, conn1))

//        {
//            cmd.Parameters.AddWithValue("full_name", TextBox2.Text.Trim());
//            cmd.Parameters.AddWithValue("account_status", TextBox7.Text.Trim());
//            cmd.Parameters.AddWithValue("dob", _dob);
//            cmd.Parameters.AddWithValue("phone", TextBox3.Text.Trim());
//            cmd.Parameters.AddWithValue("email", TextBox4.Text.Trim());
//            cmd.Parameters.AddWithValue("state", TextBox9.Text.Trim());
//            cmd.Parameters.AddWithValue("city", TextBox10.Text.Trim());
//            cmd.Parameters.AddWithValue("pincode", TextBox11.Text.Trim());
//            cmd.Parameters.AddWithValue("address", TextBox6.Text.Trim());
//            cmd.Parameters.AddWithValue("ctc", TextBox5.Text.Trim());
//            cmd.Connection.Open();
//            cmd.ExecuteNonQuery();
//            cmd.Connection.Close();
//            Response.Write("<script>alert('Employee Updated Successfully');</script>");
//            DataBind();
//            clearForm();
//        }
//    }
//    catch (Exception ex)
//    {
//        Response.Write("<script>alert('" + ex.Message + "');</script>");
//    }
//}
