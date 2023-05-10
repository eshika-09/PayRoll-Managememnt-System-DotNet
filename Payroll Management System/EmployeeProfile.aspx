<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="EmployeeProfile.aspx.cs" Inherits="Payroll_Management_System.EmployeeProfile" %>

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
            <div class="col-md-6 mx-auto">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="100px" src="Images/login.gif" />
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                    <label>User ID</label>
                                    <div class="form-group">
                                        <asp:TextBox class="form-control" ID="txtid" runat="server" placeholder="User ID" ReadOnly="false"></asp:TextBox>
                                    </div>
                                </div>
                            <div class="col-md-6">
                                <label>Full Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtname" runat="server" placeholder="Full Name"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <label>Designation</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtDesig" runat="server" placeholder="Designation"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                        <label>Department</label>
                        <div class="form-group">
                           <div class="input-group">
                              <asp:DropDownList ID="ddlDept" runat="server" CssClass="form-control" AutoPostBack="True">
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
                                <label>Basic Pay</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtBasic" runat="server" placeholder="Monthly" TextMode="Number"></asp:TextBox>
                                </div>
                                </div>
                            </div>
                         <div class="row">
                            <div class="col-4 mx-auto">
                                <center>
                                    <div class="form-group">
                                        <asp:Button class="btn btn-primary btn-block btn-lg" ID="Apply" runat="server" Text="Apply" OnClick="Apply_Click"/>
                                    </div>
                                </center>
                            </div>
                        </div>
                        </div>
                    </div>
                </div>
                <br>
            </div>
        </div>
</asp:Content>
