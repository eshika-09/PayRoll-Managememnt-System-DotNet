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
using System.IO;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.tool.xml;
using iTextSharp.text.html.simpleparser;
using Excel = Microsoft.Office.Interop.Excel;

namespace Payroll_Management_System
{
    [Obsolete]
    public partial class SalaryReport : System.Web.UI.Page
    {
        string conn = ConfigurationManager.ConnectionStrings["myconn"].ConnectionString;


        protected void Page_Load(object sender, EventArgs e)
        {
            BindData();
        }

        void BindData()
        {
            OracleConnection conn2 = new OracleConnection(conn);
            if (conn2.State == ConnectionState.Closed)
            {
                conn2.Open();
            }
            OracleCommand cmd = new OracleCommand("select * from salarytbl_1 ", conn2);
            OracleDataAdapter da = new OracleDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        private void PrintPDF(int empId)
        {
            PrintPDFDetails(empId);
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment; filename=SalarySlip.pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            StringWriter stringWriter = new StringWriter();
            HtmlTextWriter htmlTextWriter = new HtmlTextWriter(stringWriter);
            divPrintPDFContent.RenderControl(htmlTextWriter);
            StringReader stringReader = new StringReader(stringWriter.ToString());
            Document pdfDoc = new Document(PageSize.A4);
            HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
            PdfWriter.GetInstance(pdfDoc, Response.OutputStream);

            //var writer = PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
            pdfDoc.Open();
            //XMLWorkerHelper.GetInstance().ParseXHtml(writer, pdfDoc, stringReader);
            htmlparser.Parse(stringReader);
            pdfDoc.Close();
            Response.Write(pdfDoc);
            Response.End();
        }
        protected void Generate_Click1(object sender, EventArgs e)
        {
            Int32 _empID = Convert.ToInt32(Session["emp_ID"]);
            PrintPDF(_empID);
        }

        public void PrintPDFDetails(Int32 emp_id)
        {
            try
            {
                OracleConnection conn1 = new OracleConnection(conn);
                if (conn1.State == ConnectionState.Closed)
                {
                    conn1.Open();
                }
                //OracleCommand cmd = new OracleCommand("select full_name,dept,designation,basic_pay,hra,pf,ma,da,food,leaves,earnings,deduction,NetSalary from salarytbl_1 where empid='"+id.Text.Trim()+"'", conn1);

                OracleCommand cmd = new OracleCommand("select full_name,dept,designation,basic_pay,hra,pf,ma,da,food,leaves,earnings,deduction,NetSalary from salarytbl_1 where empid='" + emp_id + "'", conn1);

                OracleDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        lblName.Text = dr["full_name"].ToString();
                        //lblContact.Text = dr[""].ToString();
                        lblDept.Text = dr["dept"].ToString();
                        lblDsg.Text = dr["designation"].ToString();
                        lblbasic.Text = dr["basic_pay"].ToString();
                        lblhra.Text = dr["hra"].ToString();
                        lblpf.Text = dr["pf"].ToString();
                        lblma.Text = dr["ma"].ToString();
                        lblda.Text = dr["da"].ToString();
                        lblfood.Text = dr["food"].ToString();
                        lblLeaves.Text = dr["leaves"].ToString();
                        lblearn.Text = dr["earnings"].ToString();
                        lbldeduct.Text = dr["deduction"].ToString();
                        lblNetPay.Text = dr["NetSalary"].ToString();
                    }

                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "cmdDownlaod")
                {
                    Int32 empId = Convert.ToInt32(e.CommandArgument);
                    Session["emp_ID"] = empId;
                    PrintPDF(empId);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void Excel_Click(object sender, EventArgs e)
        {
            ExportGridToExcel();
        }
        //public override void VerifyRenderingInServerForm(Control control)
        //{
        //    //required to avoid the runtime error "  
        //    //Control 'GridView1' of type 'GridView' must be placed inside a form tag with runat=server."  
        //}
        //public void ExportGridToExcel()
        //{
        //    Response.Clear();
        //    Response.Buffer = true;
        //    Response.ClearContent();
        //    Response.ClearHeaders();
        //    Response.Charset = "";
        //    string FileName = "SalarySlip" + DateTime.Now + ".xls";
        //    StringWriter strwriter = new StringWriter();
        //    HtmlTextWriter htmltextwriter = new HtmlTextWriter(strwriter);
        //    Response.Cache.SetCacheability(HttpCacheability.NoCache);
        //    Response.ContentType = "application/vnd.ms-excel";
        //    Response.AddHeader("Content-Disposition", "attachment;filename=" + FileName);
        //    GridView1.GridLines = GridLines.Both;
        //    GridView1.HeaderStyle.Font.Bold = true;
        //    GridView1.RenderControl(htmltextwriter);
        //    Response.Write(strwriter.ToString());
        //    Response.End();

        //}
        public void ExportGridToExcel()
        {
            Response.Clear();
            Response.AddHeader("content-disposition", "attachment;filename=ExportGridData.xls");
            Response.ContentType = "File/Data.xls";
            StringWriter StringWriter = new System.IO.StringWriter();
            HtmlTextWriter HtmlTextWriter = new HtmlTextWriter(StringWriter);

            GridView1.RenderControl(HtmlTextWriter);
            Response.Write(StringWriter.ToString());
            Response.End();
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Confirms that an HtmlForm control is rendered for the specified ASP.NET
               server control at run time. */
        }
    }
}