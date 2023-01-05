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
                     <div class="col-md-3">
                        <label>Employee ID</label>
                        <div class="form-group">
                           <div class="input-group">
                              <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Employee ID"></asp:TextBox>
                              <asp:LinkButton class="btn btn-primary" ID="LinkButton4" runat="server"><i class="fas fa-check-circle"></i></asp:LinkButton>
                           </div>
                        </div>
                     </div>
                     <div class="col-md-9">
                        <label>Employee Name</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Employee Name"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                <div class="row">
                     <div class="col-md-3">
                        <label>Department</label>
                        <div class="form-group">
                           <div class="input-group">
                              <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control" >
                              <asp:ListItem Text="--Select--" Value="--Select--" />
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
                     <div class="col-md-9">
                        <label>Manager Name</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox13" runat="server" placeholder="Manager Name"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                   <div class="row">
                     <div class="col-md-4">
                        <label>Basic Pay</label>
                        <div class="form-group">
                           <div class="input-group">
                              <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Fixed" TextMode="Number"></asp:TextBox>
                           </div>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <label>Bonus</label>
                        <div class="form-group">
                              <div class="input-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox8" runat="server" placeholder="Current Year Bonus" TextMode="Number"></asp:TextBox>
                                  </div>
                        </div>
                     </div>
                        <div class="col-md-4">
                        <label>Tax</label>
                        <div class="form-group">
                           <div class="input-group">
                              <asp:TextBox CssClass="form-control" ID="TextBox7" runat="server" placeholder="%" TextMode="Number"></asp:TextBox>
                           </div>
                        </div>
                     </div>
                  </div>
                  </div>
                <div class="row">
                     <div class="col-md-4 mx-auto">
                        <label>Medical Allowance</label>
                        <div class="form-group">
                           <div class="input-group">
                              <asp:TextBox CssClass="form-control" ID="TextBox9" runat="server" placeholder="Medical"></asp:TextBox>
                           </div>
                        </div>
                     </div>
                     <div class="col-md-4 mx-auto">
                        <label>Travel Allowance</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox10" runat="server" placeholder="Travel"></asp:TextBox>
                        </div>
                     </div>
                  </div>
               <div class="row">
                     <div class="col-md-4 mx-auto">
                        <label>Leaves Taken</label>
                        <div class="form-group">
                           <div class="input-group">
                              <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Taken" TextMode="Number"></asp:TextBox>
                           </div>
                        </div>
                     </div>
                     <div class="col-md-4 mx-auto">
                        <label>TLeaves Left</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="Left" TextMode="Number"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-9 mx-auto">
                        <label>Salary Description</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" placeholder="50 Words Max" TextMode="MultiLine" Rows="2"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-4 mx-auto">
                        <asp:Button ID="Button1" class="btn btn-lg btn-block btn-success" runat="server" Text="Generate Salary" />
                         <br />
                     </div>
                  </div>
               </div>
              <a href="HomePage.aspx"><< Back to Home</a><br />
            <br />
            </div>
           
         </div>
               </div>
     <div class="col-md-7 mx-auto">
            <div class="card">
               <div class="card-body">
    <div class="row">
                     <div class="col">
                        <center>
                           <h4>Employee Salry Description</h4>
                        </center>
                     </div>
                  </div>
     <div class="row">
                     <div class="col">
                        <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server"></asp:GridView>
                     </div>
                  </div>
                   </div>
                </div>
         </div>
</asp:Content>
