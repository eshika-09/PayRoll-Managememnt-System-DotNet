<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="GenerateSalary.aspx.cs" Inherits="Payroll_Management_System.GenerateSalary" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <div class="container-fluid">
      <div class="row">
         <div class="col-md-5 mx-auto">
            <div class="card">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        <center>
                           <h4>Employee Salary Details</h4>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <center>
                         <img width="100px" src="Images/icons8-cash.gif" />
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div> 
                  <div class="row">
                     <div class="col-md-4">
                        <label>Employee ID</label>
                        <div class="form-group">
                           <div class="input-group">
                              <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Employee ID"></asp:TextBox>
                              <asp:LinkButton class="btn btn-primary" ID="LinkButton4" runat="server" Text="Go" OnClick="LinkButton4_Click"><i class="fas fa-check-circle"></i></asp:LinkButton>
                           </div>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <label>Employee Name</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Employee Name"></asp:TextBox>
                        </div>
                     </div>
                         <div class="col-md-4">
                        <label>Designation</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Designation"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                <div class="row">
                     <div class="col-md-4">
                        <label>Department</label>
                        <div class="form-group">
                           <div class="input-group">
                              <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control" AutoPostBack="True">
                              <asp:ListItem Text="Select" Value="Select" />
                              <asp:ListItem Text="IT & CNS" Value="IT & CNS" />
                              <asp:ListItem Text="Finance" Value="Finance" />
                              <asp:ListItem Text="Accounts" Value="Accounts" />
                              <asp:ListItem Text="Legal" Value="Legal" />
                              <asp:ListItem Text="General Procurement" Value="General Procurement" />
                              <asp:ListItem Text="General Affairs" Value="General Affairs" />
                           </asp:DropDownList>
                           </div>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <label>Month</label>
                        <div class="form-group">
                           <div class="input-group">
                              <asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-control" AutoPostBack="True">
                              <asp:ListItem Text="Select" Value="Select" />
                              <asp:ListItem Text="January" Value="January" />
                              <asp:ListItem Text="February" Value="February" />
                              <asp:ListItem Text="March" Value="March" />
                              <asp:ListItem Text="April" Value="April" />
                              <asp:ListItem Text="May" Value="May" />
                              <asp:ListItem Text="June" Value="June" />
                              <asp:ListItem Text="July" Value="July" />
                              <asp:ListItem Text="August" Value="August" />
                              <asp:ListItem Text="September" Value="September" />
                              <asp:ListItem Text="October" Value="October" />
                              <asp:ListItem Text="November" Value="November" />
                              <asp:ListItem Text="December" Value="December" />
                           </asp:DropDownList>
                           </div>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <label>Year</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                   <div class="row">
                     <div class="col-4 mx-auto">
                        <label>Basic Pay</label>
                        <div class="form-group">
                           <div class="input-group">
                              <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="Basic Pay" TextMode="Number"></asp:TextBox>
                           </div>
                        </div>
                     </div>
                    <%-- <div class="col-md-4">
                        <label>Salary Per Month</label>
                        <div class="form-group">
                              <div class="input-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" TextMode="Number"></asp:TextBox>
                                  </div>
                        </div>
                     </div>--%>
                        <div class="col-4 mx-auto">
                        <label>Salary Per Day</label>
                        <div class="form-group">
                           <div class="input-group">
                              <asp:TextBox CssClass="form-control" ID="TextBox7" runat="server" TextMode="Number"></asp:TextBox>
                           </div>
                        </div>
                     </div>
                  </div>
                  </div>
                <div class="row">
                     <div class="col-md-3">
                       <center>
                        <label>HRA</label></center>
                        <div class="form-group">
                           <div class="input-group">
                              <asp:TextBox CssClass="form-control" ID="TextBox8" runat="server" placeholder="House Rent"></asp:TextBox>
                           </div>
                        </div>
                     </div>
                     <div class="col-md-3">
                        <center>
                        <label>DA</label></center>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox9" runat="server" placeholder="Dearness"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-3">
                        <center>
                        <label>TA</label></center>
                        <div class="form-group">
                           <div class="input-group">
                              <asp:TextBox CssClass="form-control" ID="TextBox10" runat="server" placeholder="Travelling" TextMode="Number"></asp:TextBox>
                           </div>
                        </div>
                     </div>
                     <div class="col-md-3">
                         <center>
                        <label>MA</label></center>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox11" runat="server" placeholder="Medical" TextMode="Number"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                     <div class="row">
                     <div class="col-md-4">
                       <center>
                        <label>PF</label></center>
                        <div class="form-group">
                           <div class="input-group">
                              <asp:TextBox CssClass="form-control" ID="TextBox12" runat="server" TextMode="Number"></asp:TextBox>
                           </div>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <center>
                        <label>Food Allowance</label></center>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox13" runat="server" TextMode="Number"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <center>
                        <label>No. of Leaves</label></center>
                        <div class="form-group">
                           <div class="input-group">
                              <asp:TextBox CssClass="form-control" ID="TextBox14" runat="server" TextMode="Number"></asp:TextBox>
                           </div>
                        </div>
                     </div>
                  </div>
               <%--   <div class="row">
                     <div class="col-9 mx-auto">
                        <label>Salary Description</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" placeholder="50 Words Max" TextMode="MultiLine" Rows="2"></asp:TextBox>
                        </div>
                     </div>
                  </div>--%>
                <div class="row">
                    <div class="col-4 mx-auto">
                        <label>Earnings</label>
                        <div class="form-group">
                            <asp:TextBox CssClass="form-control" ID="TextBox15" runat="server" TextMode="Number"></asp:TextBox>
                        </div>
                    </div>
                     <div class="col-4 mx-auto">
                        <label>Deduction</label>
                        <div class="form-group">
                            <asp:TextBox CssClass="form-control" ID="TextBox16" runat="server" TextMode="Number"></asp:TextBox>
                        </div>
                    </div>
                </div>
                 <div class="row">
                    <div class="col-4 mx-auto">
                        <label>NET SALARY</label>
                        <div class="form-group">
                            <asp:TextBox CssClass="form-control" ID="TextBox17" runat="server" TextMode="Number"></asp:TextBox>
                        </div>
                    </div>
                </div>
                  <div class="row">
                     <div class="col-4 mx-auto">
                        <asp:Button ID="Generate" class="btn btn-lg btn-block btn-success" runat="server" Text="Generate Salary" OnClick="Generate_Click"/>
                         <br />
                     </div>
                  </div>
              <a href="HomePage.aspx"><< Back to Home</a><br />
            <br />
            </div>
           
         </div>
               </div>
     </div>
</asp:Content>