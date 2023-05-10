<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="EmpManagement.aspx.cs" Inherits="Payroll_Management_System.EmpManagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container-fluid">
      <div class="row">
         <div class="col-md-5">
            <div class="card">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        <center>
                           <h4>Member Details</h4>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <center>
                           <img width="100px" src="Images/protection.gif" />
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
                              <asp:TextBox CssClass="form-control" ID="txtid" runat="server" placeholder="Employee ID"></asp:TextBox>
                              <asp:LinkButton class="btn btn-outline-primary" ID="LinkButton4" Text="Go" runat="server" OnClick="LinkButton4_Click"><i class="fas fa-check-circle"></i></asp:LinkButton>
                           </div>
                        </div>
                     </div>
                     <div class="col-md-3">
                        <label>Full Name</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txtname" runat="server" placeholder="Full Name" ReadOnly="true"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-6">
                        <label>Account Status</label>
                        <div class="form-group">
                           <div class="input-group">
                              <asp:TextBox CssClass="form-control mr-1" ID="txtstatus" runat="server" placeholder="Account Status" ReadOnly="true" ></asp:TextBox>
                              <asp:LinkButton class="btn btn-outline-success mr-1" ID="LinkButton1" Text="S" runat="server" OnClick="LinkButton1_Click"><i class="fas fa-check-circle"></i></asp:LinkButton>
                              <asp:LinkButton class="btn btn-outline-warning mr-1" ID="LinkButton2" Text="P" runat="server" OnClick="LinkButton2_Click"><i class="far fa-pause-circle"></i></asp:LinkButton>
                              <asp:LinkButton class="btn btn-outline-danger mr-1" ID="LinkButton3" Text="D" runat="server" OnClick="LinkButton3_Click"><i class="fas fa-times-circle"></i></asp:LinkButton>
                           </div>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-3">
                        <label>DOB</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txtdob" runat="server" placeholder="DOB" ReadOnly="true" ></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <label>Contact No</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txtphone" runat="server" placeholder="Contact No" MaxLength="10" ReadOnly="true" ></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-5">
                        <label>Email ID</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txtmail" runat="server" placeholder="Email ID" ReadOnly="true"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-4">
                        <label>State</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txtstate" runat="server" placeholder="State" ReadOnly="true"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <label>City</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txtcity" runat="server" placeholder="City" ReadOnly="true" ></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <label>Pin Code</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txtpin" runat="server" placeholder="Pin Code" ReadOnly="true"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-7">
                        <label>Full Postal Address</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txtaddress" runat="server" placeholder="Full Postal Address" TextMode="MultiLine" Rows="2" ReadOnly="true"></asp:TextBox>
                        </div>
                     </div>
                      <%--<div class="col-5">
                        <label>Cost To Company (CTC)</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="Anual Pay" TextMode="Number" ReadOnly="true"></asp:TextBox>
                        </div>
                     </div>--%>
                  </div>
                 <div class="row">
                          <div class="col-4 mx-auto">
                              <center>
                                <asp:Button ID="Button4" class="btn btn-outline-danger btn-block btn-lg" runat="server" Text="DELETE" OnClick="Button4_Click" />
                                <asp:Button ID="Button3" class="btn btn-outline-secondary btn-block btn-lg" runat="server" Text="UPDATE" OnClick="Button3_Click"/>
                                  </center>
                            </div>
                        </div>
               </div>
            </div>
            <br>
         </div>
         <div class="col-md-7">
            <div class="card">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        <center>
                           <h4>Employee List</h4>
                        </center>
                     </div>
                  </div>
                    <div class="row">
                     <div class="col">
                        <center>
                           <img width="75px" src="Images/List.gif" />
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" CellPadding="4" AutoGenerateColumns="False" ForeColor="#333333" GridLines="None">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />

                            <Columns>
                                <asp:BoundField HeaderText="ID" DataField="empid" />
                                <asp:BoundField HeaderText="Full Name" DataField="full_name" />
                                <asp:BoundField HeaderText="Status" DataField="account_status" />
                                <asp:BoundField HeaderText="DOB" DataField="dob" />
                                <asp:BoundField HeaderText="Contact" DataField="phone" />
                                <asp:BoundField HeaderText="Email" DataField="email" />
                              <%--  <asp:BoundField HeaderText="State" DataField="state" />
                                <asp:BoundField HeaderText="City" DataField="city" />
                                <asp:BoundField HeaderText="Pincode" DataField="pincode" />--%>
                                <asp:BoundField HeaderText="Address" DataField="address" />
                                <%--<asp:BoundField HeaderText="CTC" DataField="ctc" />--%>
                            </Columns>
                            <EditRowStyle BackColor="#999999" />
                            <FooterStyle BackColor="#990033" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#990033" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#999999" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#999999" ForeColor="#333333" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#E9E7E2" />
                            <SortedAscendingHeaderStyle BackColor="#506C8C" />
                            <SortedDescendingCellStyle BackColor="#FFFDF8" />
                            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                        </asp:GridView>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</asp:Content>
