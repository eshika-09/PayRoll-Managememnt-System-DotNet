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
    public partial class LeaveIssue : System.Web.UI.Page
    {
        string conn = ConfigurationManager.ConnectionStrings["myconn"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindData();
            }
            if (Session["fullname"] != null)
            {
                txtName.Text = Session["fullname"].ToString();
            }
            if (Session["username"] != null)
            {
                txtId.Text = Session["username"].ToString();
            }
        }
        protected void BtnApply_Click(object sender, EventArgs e)
        {
            ApplyLeave();
            clearForm();
        }
        void ApplyLeave()
        {

            DateTime strtdate = Convert.ToDateTime(txtstrt.Text.ToString()).Date;
            DateTimeFormatInfo mfi = new DateTimeFormatInfo();
            string strMonthName = mfi.GetAbbreviatedMonthName(strtdate.Month);
            string start = strtdate.Day + "-" + strMonthName + "-" + strtdate.Year;

            DateTime enddate = Convert.ToDateTime(txtend.Text.ToString()).Date;
            DateTimeFormatInfo mfi1 = new DateTimeFormatInfo();
            string strMonthName1 = mfi1.GetAbbreviatedMonthName(enddate.Month);
            string end = enddate.Day + "-" + strMonthName1 + "-" + enddate.Year;
            try
            {
                var cmdText = "insert into leavetbl (empid, leaveid, leavecount, full_name, reason, strtdate,enddate,approvestatus)values(:empid, leave_seq.nextval, :lcount, :full_name, :reason, :strtdate, :enddate,:approvestatus)";
                using (OracleConnection conn1 = new OracleConnection(conn))
                using (OracleCommand cmd = new OracleCommand(cmdText, conn1))
                {
                    cmd.Parameters.AddWithValue("empid", txtId.Text.Trim());
                    cmd.Parameters.AddWithValue("lcount", txtCount.Text.Trim());
                    cmd.Parameters.AddWithValue("full_name", txtName.Text.Trim());
                    cmd.Parameters.AddWithValue("reason", txtReason.Text.Trim());
                    cmd.Parameters.AddWithValue("strtdate", start);
                    cmd.Parameters.AddWithValue("enddate", end);
                    cmd.Parameters.AddWithValue("approvestatus", "Pending");
                    cmd.Connection.Open();
                    cmd.ExecuteNonQuery();
                    cmd.Connection.Close();
                    Response.Write("<script>alert('Leave Issued Successfully');</script>");
                    DataBind();
                    clearForm();
                    BindData();
                }
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
            OracleCommand cmd = new OracleCommand("select e.* from leavetbl e where empid = '" + Session["username"].ToString() + "'order by e.createddate desc", conn2);
            OracleDataAdapter da = new OracleDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            // string leavecount = dt.Rows.Count; 
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        void clearForm()
        {
            txtleaveID.Text = "";
            txtCount.Text = "";
            //txtId.Text = "";
            txtReason.Text = "";
            txtstrt.Text = "";
            txtend.Text = "";

        }
        protected void txtstrt_TextChanged(object sender, EventArgs e)
        {
            try
            {
                OracleConnection conn1 = new OracleConnection(conn);
                if (conn1.State == ConnectionState.Closed)
                {
                    conn1.Open();
                }
                string count = txtCount.Text;
                if (count == txtCount.Text)
                {
                    List<DateTime> holidays = new List<DateTime>();
                    holidays.Add(new DateTime(DateTime.Now.Year, 1, 1)); // New Year.
                    holidays.Add(new DateTime(DateTime.Now.Year, 1, 14)); // Makar Sankranti.
                    holidays.Add(new DateTime(DateTime.Now.Year, 1, 26)); // National Holiday.
                    holidays.Add(new DateTime(DateTime.Now.Year, 3, 8)); // Holi Holiday.

                    DateTime startDate = Convert.ToDateTime(txtstrt.Text);
                    DateTime endDate = Convert.ToDateTime(txtend.Text);
                    int days = 0;

                    for (DateTime date = startDate; date <= endDate; date = date.AddDays(1))
                    {
                        if (startDate.DayOfWeek != DayOfWeek.Saturday && startDate.DayOfWeek != DayOfWeek.Sunday && !holidays.Contains(date))
                        {
                            days++;
                        }
                        startDate = startDate.AddDays(1);
                    }
                    txtCount.Text = days.ToString();
                }
            }
            catch (Exception)
            {

                throw;
            }
        }
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            e.Row.Cells[2].Visible = true;
            
                int sum = 0;
                for (int i = 0; i < GridView1.Rows.Count; i++)
                {
                    sum += int.Parse(GridView1.Rows[i].Cells[2].Text);
                }
                TtlLeave.Text = sum.ToString();
            
        }
        protected void btnItemLink_Click(object sender, EventArgs e)
        {
            try
            {
                OracleConnection conn2 = new OracleConnection(conn);
                if (conn2.State == ConnectionState.Closed)
                {
                    conn2.Open();
                }
                int rowindex = ((GridViewRow)(sender as Control).NamingContainer).RowIndex;
                string leaveID = Convert.ToString(GridView1.Rows[rowindex].Cells[1].Text);
                OracleCommand cmd = new OracleCommand("delete from leavetbl where leaveid ='" + leaveID + "'", conn2);
                cmd.ExecuteNonQuery();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Successfully Deleted');", true);
                BindData();
                cmd.Connection.Close();
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}
