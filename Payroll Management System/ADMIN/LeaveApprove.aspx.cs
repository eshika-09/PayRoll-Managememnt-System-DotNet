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

        }
        void BindData()
        {
            OracleConnection conn2 = new OracleConnection(conn);
            if (conn2.State == ConnectionState.Closed)
            {
                conn2.Open();
            }
            OracleCommand cmd = new OracleCommand("select * from leavetbl", conn2);
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
                        Label A = (Label)row.FindControl("empid");
                        OracleConnection conn2 = new OracleConnection(conn);
                        if (conn2.State == ConnectionState.Closed)
                        {
                            conn2.Open();
                        }
                        OracleCommand cmd = new OracleCommand("update leavetbl set approvestatus='1' where EMPID= '" + A.Text.Trim() + "'", conn2);
                        OracleDataAdapter da = new OracleDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                    }
                    else
                    {
                        Label A = (Label)row.FindControl("empid");
                        OracleConnection conn2 = new OracleConnection(conn);
                        if (conn2.State == ConnectionState.Closed)
                        {
                            conn2.Open();
                        }
                        OracleCommand cmd = new OracleCommand("update leavetbl set approvestatus='2' where EMPID= '" + A.Text.Trim() + "'", conn2);
                        OracleDataAdapter da = new OracleDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
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