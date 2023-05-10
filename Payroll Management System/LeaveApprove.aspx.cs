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
    public partial class LeaveApprove : System.Web.UI.Page
    {
        string conn = ConfigurationManager.ConnectionStrings["myconn"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindData();
            }
        }
        void BindData()
        {
            OracleConnection conn2 = new OracleConnection(conn);
            if (conn2.State == ConnectionState.Closed)
            {
                conn2.Open();
            }
            OracleCommand cmd = new OracleCommand("select * from leavetbl where approvestatus='Pending'", conn2);
            OracleDataAdapter da = new OracleDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void btnApprove_Click(object sender, EventArgs e)
        {
            try
            {
                //loop on grid
                foreach (GridViewRow row in GridView1.Rows)
                {
                    // here you'll get all rows with RowType=DataRow
                    // others like Header are omitted in a foreach


                    //CheckBox1
                    bool isChecked = ((CheckBox)row.FindControl("CheckBox1")).Checked;
                    if (isChecked)
                    {
                        Label A = (Label)row.FindControl("leaveid");
                        Label B = (Label)row.FindControl("empid");
                        OracleConnection conn2 = new OracleConnection(conn);
                        if (conn2.State == ConnectionState.Closed)
                        {
                            conn2.Open();
                        }
                        OracleCommand cmd = new OracleCommand("update leavetbl set approvestatus='Approved' where leaveid= '" + A.Text.Trim() + "' and empid='"+B.Text.Trim()+"'", conn2);
                        OracleDataAdapter da = new OracleDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                        BindData();
                    }
                    else
                    {
                      
                    }
                }
            }

            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void btnDecline_Click(object sender, EventArgs e)
        {
            try
            {
                //loop on grid
                foreach (GridViewRow row in GridView1.Rows)
                {
                    // here you'll get all rows with RowType=DataRow
                    // others like Header are omitted in a foreach


                    //CheckBox1
                    bool isChecked = ((CheckBox)row.FindControl("CheckBox1")).Checked;
                    if (isChecked)
                    {
                        Label A = (Label)row.FindControl("leaveid");
                        Label B = (Label)row.FindControl("empid");
                        OracleConnection conn2 = new OracleConnection(conn);
                        if (conn2.State == ConnectionState.Closed)
                        {
                            conn2.Open();
                        }
                        OracleCommand cmd = new OracleCommand("update leavetbl set approvestatus='Rejected' where leaveid= '" + A.Text.Trim() + "' and empid='" + B.Text.Trim() + "'", conn2);
                        OracleDataAdapter da = new OracleDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        GridView1.DataSource = dt;
                        GridView1.DataBind();

                        BindData();
                    }
                    else
                    {
                       
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