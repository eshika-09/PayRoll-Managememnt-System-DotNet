using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Payroll_Management_System
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (HttpContext.Current.Session["role"] == null)
                {
                    UserLogin.Visible = false;
                    EmpSignUp.Visible = true;
                    LogOut.Visible = false;
                    hello.Visible = false;
                    AdminLogin.Visible = true;
                    AdminSignUp.Visible = false;
                    EmpManage.Visible = false;
                    SalarySlip.Visible = false;
                    IssueLeave.Visible = false;
                    ViewReq.Visible = false;
                    dashboard.Visible = false;
                    dashboard1.Visible = false;
                    EmpSalarySlip.Visible = false;
                }
                else if (HttpContext.Current.Session["role"].Equals("Admin"))
                {
                    UserLogin.Visible = false;
                    EmpSignUp.Visible = false;
                    LogOut.Visible = true;
                    hello.Visible = true;
                    hello.Text = "Hello " + Session["username"].ToString();
                    AdminSignUp.Visible = false;
                    ViewReq.Visible = true;
                    AdminLogin.Visible = false;
                    EmpManage.Visible = true;
                    SalarySlip.Visible = true;
                    IssueLeave.Visible = false;
                    dashboard.Visible = true;
                    dashboard1.Visible = false;
                    EmpSalarySlip.Visible = false;
                }
                else if (HttpContext.Current.Session["role"].Equals("User"))
                {
                    UserLogin.Visible = false;
                    EmpSignUp.Visible = false;
                    LogOut.Visible = true;
                    hello.Visible = true;
                    hello.Text = "Hello " + Session["username"].ToString();
                    AdminSignUp.Visible = false;
                    ViewReq.Visible = false;
                    AdminLogin.Visible = false;
                    EmpManage.Visible = false;
                    SalarySlip.Visible = false;
                    IssueLeave.Visible = true;
                    dashboard.Visible = false;
                    dashboard1.Visible = true;
                    EmpSalarySlip.Visible = true;
                    
                }
            }
            catch (Exception)
            {   

                throw;
            }
        }

        protected void ViewReq_Click(object sender, EventArgs e)
        {
            Response.Redirect("LeaveApprove.aspx");
        }

        protected void UserLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("EmpLogin.aspx");
        }

        protected void EmpSignUp_Click(object sender, EventArgs e)
        {
            Response.Redirect("SignUp.aspx");
        }

        protected void LogOut_Click(object sender, EventArgs e)
        {
            Response.Redirect("HomePage.aspx");
        }

        protected void hello_Click(object sender, EventArgs e)
        {
            Response.Redirect("EmpProfile.aspx");
        }

        protected void AdminLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminLogin.aspx");
        }

        protected void EmpManage_Click(object sender, EventArgs e)
        {
            Response.Redirect("EmpManagement.aspx");
        }

        protected void SalarySlip_Click(object sender, EventArgs e)
        {
            Response.Redirect("SalaryReport.aspx");
        }

        protected void IssueLeave_Click(object sender, EventArgs e)
        {
            Response.Redirect("LeaveIssue.aspx");
        }

        protected void AdminSignUp_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminSignUp.aspx");
        }

        protected void dashboard_Click(object sender, EventArgs e)
        {
            Response.Redirect("Admin_Dash.aspx");
        }

        protected void dashboard1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Emp_Dash.aspx");
        }

        protected void EmpSalarySlip_Click(object sender, EventArgs e)
        {
            Response.Redirect("EmpSalaryReport.aspx");
        }
    }
}