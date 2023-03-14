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
    public partial class GenerateSalary : System.Web.UI.Page
    {
        string conn = ConfigurationManager.ConnectionStrings["myconn"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [Obsolete]
        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            try
            {
                OracleConnection conn1 = new OracleConnection(conn);
                if (conn1.State == ConnectionState.Closed)
                {
                    conn1.Open();
                }
                OracleCommand cmd = new OracleCommand("select full_name,dept,mngr_name,basic,bonus,tax,medic,travel,taken,left,descp from salarytbl_1 where empid = '" + TextBox1.Text.Trim() + "'", conn1);
                OracleDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        TextBox2.Text = dr["full_name"].ToString();
                        DropDownList1.SelectedValue = dr["dept"].ToString().Trim();
                        TextBox13.Text = dr["mngr_name"].ToString();
                        TextBox3.Text = dr["basic"].ToString();
                        TextBox8.Text = dr["bonus"].ToString();
                        TextBox7.Text = dr["tax"].ToString();
                        TextBox9.Text = dr["medic"].ToString();
                        TextBox10.Text = dr["travel"].ToString();
                        TextBox4.Text = dr["taken"].ToString();
                        TextBox5.Text = dr["left"].ToString();
                        TextBox6.Text = dr["descp"].ToString();                                              

                        Response.Write("<script>alert('" + dr.GetValue(0).ToString() + "');</script>");
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

        protected void Button1_Click(object sender, EventArgs e)
        {

        }
    }
}