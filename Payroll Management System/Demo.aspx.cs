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
    public partial class Demo : System.Web.UI.Page
    {
        string conn = ConfigurationManager.ConnectionStrings["myconn"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void Confirm_Click(object sender, EventArgs e)
        {

        }

        protected void Update_Click(object sender, EventArgs e)
        {

        }

        protected void read_Click(object sender, EventArgs e)
        {

        }
    }
}