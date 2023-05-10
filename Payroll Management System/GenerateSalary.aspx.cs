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
    public partial class GenerateSalary : System.Web.UI.Page
    {
        string conn = ConfigurationManager.ConnectionStrings["myconn"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }
        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            try
            {
                OracleConnection conn1 = new OracleConnection(conn);
                if (conn1.State == ConnectionState.Closed)
                {
                    conn1.Open();
                }
                OracleCommand cmd = new OracleCommand("select empid,full_name,designation,dept,basic_pay from salarytbl_1 where empid = '" + TextBox1.Text.Trim() + "'", conn1);
                OracleDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        TextBox1.Text = dr["empid"].ToString();
                        TextBox2.Text = dr["full_name"].ToString();
                        TextBox3.Text = dr["designation"].ToString();
                        DropDownList1.Text = dr["dept"].ToString();
                        TextBox5.Text = dr["basic_pay"].ToString();
                        Response.Write("<script>alert('" + dr.GetValue(1).ToString() + "');</script>");
                        DataBind(); 
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

        protected void Generate_Click(object sender, EventArgs e)
        {
            GenerateSalaryMethod();
            BindData();
        }


        void GenerateSalaryMethod()
        {
            try
            {
                Session["basic_pay"] = TextBox5.Text.Trim();
                Session["full_name"] = TextBox2.Text.Trim();
                //Calculate the monthly salary
                //no. of leaves
                int i3 = int.Parse(TextBox14.Text);

                //basic salary and salary per day

                float i1 = float.Parse(Session["basic_pay"].ToString());
                float i2 = i1 / 31;
                TextBox7.Text = i2.ToString();

                //HRA
                float i4 = i2 * i3;

                float f11 = float.Parse(Session["basic_pay"].ToString());
                float f2 = 20 * f11 / 100;
                TextBox8.Text = f2.ToString();

                //DA
                float f12 = 10 * f11 / 100;
                TextBox9.Text = f12.ToString();

                //TA
                float f13 = 2 * f11 / 100;
                TextBox10.Text = f13.ToString();

                //MA
                float f14 = 1 * f11 / 100;
                TextBox11.Text = f14.ToString();

                //PF
                float f15 = 3 * f11 / 100;
                TextBox12.Text = f15.ToString();

                //Food Allowance
                float f16 = 4 * f11 / 100;
                TextBox13.Text = f16.ToString();

                //Earnings
                float f17 = f2 + f12 + f13 + f14;
                TextBox15.Text = f17.ToString();

                float f18 = i4 + f15 + f16;

                //Deduction
                float f19 = (f2 + f12 + f13 + f14) - (f18 = i4 + f15 + f16);
                TextBox16.Text = f19.ToString();

                //NetSalary
                float f20 = (i1 + f17) - (f19);
                TextBox17.Text = f20.ToString();

                //Insert record into Database
                OracleConnection conn1 = new OracleConnection(conn);
                if (conn1.State == ConnectionState.Closed)
                {
                    conn1.Open();
                }
                var cmdText = "update salarytbl_1 set month = :month, year = :year, SDay = :SDay, hra = :hra, da = :da, ta = :ta, ma = :ma, pf = :pf, food = :food, leaves = :leaves, earnings = :earnings, deduction = :deduction, NetSalary = :NetSalary, createdby=:createdby where empid='"+TextBox1.Text.Trim()+"'";
                //var cmdText = "update salarytbl_1 set month = @month where empid=" + TextBox1.Text.Trim() + "";

                using (OracleConnection conn2 = new OracleConnection(conn))
                {
                    using (OracleCommand cmd = new OracleCommand(cmdText, conn2))
                    {
                        cmd.Parameters.AddWithValue("month", DropDownList2.SelectedItem.Value);
                        cmd.Parameters.AddWithValue("year", Convert.ToDecimal(TextBox4.Text.Trim()));
                        cmd.Parameters.AddWithValue("SDay", Convert.ToDecimal(TextBox7.Text.Trim()));
                        cmd.Parameters.AddWithValue("hra", Convert.ToDecimal(TextBox8.Text.Trim()));
                        cmd.Parameters.AddWithValue("da", Convert.ToDecimal(TextBox9.Text.Trim()));
                        cmd.Parameters.AddWithValue("ta", Convert.ToDecimal(TextBox10.Text.Trim()));
                        cmd.Parameters.AddWithValue("ma", Convert.ToDecimal(TextBox11.Text.Trim()));
                        cmd.Parameters.AddWithValue("pf", Convert.ToDecimal(TextBox12.Text.Trim()));
                        cmd.Parameters.AddWithValue("food", Convert.ToDecimal(TextBox13.Text.Trim()));
                        cmd.Parameters.AddWithValue("leaves", Convert.ToDecimal(TextBox14.Text.Trim()));
                        cmd.Parameters.AddWithValue("earnings", Convert.ToDecimal(TextBox15.Text.Trim()));
                        cmd.Parameters.AddWithValue("deduction", Convert.ToDecimal(TextBox16.Text.Trim()));
                        cmd.Parameters.AddWithValue("NetSalary", Convert.ToDecimal(TextBox17.Text.Trim()));
                        cmd.Parameters.AddWithValue("createdby", "Higher Authority");
                        conn2.Open();
                        cmd.ExecuteNonQuery();
                        BindData();
                        clearform();
                        Response.Write("<script>alert('Salary Genererated Successfully');</script>");
                        conn2.Close();

                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {

            }
        }
        void BindData()
        {
            try
            {
                OracleConnection conn2 = new OracleConnection(conn);
                if (conn2.State == ConnectionState.Closed)
                {
                    conn2.Open();
                }
                OracleCommand cmd = new OracleCommand("select * from salarytbl_1", conn2);
                OracleDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        TextBox7.Text = dr["SDay"].ToString();
                        TextBox8.Text = dr["hra"].ToString();
                        TextBox9.Text = dr["da"].ToString();
                        TextBox10.Text = dr["ta"].ToString();
                        TextBox11.Text = dr["ma"].ToString();
                        TextBox12.Text = dr["pf"].ToString();
                        TextBox13.Text = dr["food"].ToString();
                        TextBox14.Text = dr["leaves"].ToString();
                        TextBox15.Text = dr["earnings"].ToString();
                        TextBox16.Text = dr["deduction"].ToString();
                        TextBox17.Text = dr["NetSalary"].ToString();
                        clearform();
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

        void clearform()
        {
            DropDownList2.SelectedValue = "";
            TextBox4.Text = "";
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox7.Text = "";
            TextBox8.Text = "";
            TextBox9.Text = "";
            TextBox11.Text = "";
            TextBox10.Text = "";
            TextBox12.Text = "";
            TextBox13.Text = "";
            TextBox14.Text = "";
            TextBox15.Text = "";
            TextBox16.Text = "";
            TextBox17.Text = "";
        }
    }
}