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
    public partial class EmpManagement : System.Web.UI.Page
    {
        OracleConnection conn = new OracleConnection(ConfigurationManager.ConnectionStrings["myconn"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                conn.Open();
                OracleCommand cmd = new OracleCommand("select * from signup", conn);
                DataTable dtbl = new DataTable();
                
            }
        }
    }
}