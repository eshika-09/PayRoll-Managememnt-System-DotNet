<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="EmpProfile.aspx.cs" Inherits="Payroll_Management_System.EmpProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script type="text/javascript">
         $(document).ready(function () {
             $("#toggle_pwd").hover(function show() {
                 $(this).toggleClass("fa-eye fa-eye-slash");
                 var type = $(this).hasClass("fa-eye-slash") ? "text" : "password";
                 $("[id*=OldPswd]").attr("type", type);
             });
         }); $(document).ready(function () {
             $("#toggle_pwd1").hover(function show() {
                 $(this).toggleClass("fa-eye fa-eye-slash");
                 var type = $(this).hasClass("fa-eye-slash") ? "text" : "password";
                 $("[id*=NewPswd]").attr("type", type);
             });
         });
     </script>
    <style>
        * {
            padding: 0;
            margin: 0;
            box-sizing: border-box;
        }
        .input-group-append {
            display: flex;
            margin-top: 7px
        }

        .container {
            max-width: 900px;
            justify-content: space-evenly;
            margin: 20px;
        }

        .card-wrapper {
            width: 400px;
            height: 500px;
            position: relative;
        }

        .card {
            position: absolute;
            top: 50%;
            left: 50%;
            width: 350px;
            height: 500px;
            transform: translate(-50%, -50%);
            border-radius: 16px;
            overflow: hidden;
            box-shadow: 0 5px 18px rgba(0, 0, 0, 0.6);
            cursor: pointer;
            transition: 0.5s;
        }

        .card-image {
            position: absolute;
            top: 0px;
            left: 0px;
            width: 100%;
            height: 100%;
            z-index: 2;
            background-color: #fff;
            transition: .5s;
        }

            .card-image:hover img {
                opacity: 0.5;
                transition: .5s;
            }

        .card:hover .card-image {
            transform: translateY(-100px);
            transition: all .9s;
        }

        /**** Social Icons *****/

        .social-icons {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            z-index: 2;
            display: flex;
        }

        li {
            list-style: none;
        }

        .link {
            position: relative;
            display: block;
            width: 50px;
            height: 50px;
            line-height: 50px;
            text-align: center;
            background: #fff;
            font-size: 23px;
            color: #000;
            font-weight: bold;
            margin: 0 6px;
            transition: .4s;
            transform: translateY(200px);
            opacity: 0;
            border-radius: 50%;
        }

        .card:hover .social-icons li a {
            transform: translateY(0px);
            opacity: 1;
        }

        .social-icons li a:hover {
            background: #000;
            transition: .2s;
        }

        .fab {
            color: #000;
        }

        .social-icons li a .fab {
            transition: .8s;
        }

            .social-icons li a .fab:hover {
                transform: rotateY(360deg);
                color: #fff;
            }

        .card:hover li:nth-child(1) a {
            transition-delay: 0.1s;
        }

        .card:hover li:nth-child(2) a {
            transition-delay: 0.2s;
        }

        .card:hover li:nth-child(3) a {
            transition-delay: 0.3s;
        }

        .card:hover li:nth-child(4) a {
            transition-delay: 0.4s;
        }
        /**** Personal Details ****/
        .details {
            position: absolute;
            bottom: 0;
            left: 0;
            background: #fff;
            width: 100%;
            height: 120px;
            z-index: 1;
            padding: 10px;
        }

        h2 {
            margin: 30px 0;
            padding: 0;
            text-align: center;
        }

        .job-title {
            font-size: 1rem;
            line-height: 2.5rem;
            color: #000;
            font-weight: 300;
        }

        .container-down {
            max-width: 1000px;
            justify-content: space-evenly;
            margin: 20px;
        }

        .card-wrapper-down {
            width: 400px;
            height: 500px;
            position: relative;
        }

        .card-down {
            position: relative;
            top: 75%;
            left: 100%;
            width: 900px;
            height: 750px;
            margin: 0 auto;
            transform: translate(-50%, -50%);
            border-radius: 16px;
            overflow: hidden;
            box-shadow: 0 5px 18px rgba(0, 0, 0, 0.4);
            cursor: pointer;
            transition: 0.5s;
            padding: 50px;
        }
        .input-group-append {
            z-index: 9999;
            position: absolute;
            left: 218px;
            margin-top: -135px;
        }
         .input-group-append-1 {
            z-index: 9999;
            position: absolute;
            left: 215px;
           margin-top: -135px;
        }
        .form-group-1{
             margin-top: 32px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="float-left">
        <div class="container">
            <div class="card-wrapper">
                <div class="card">
                    <div class="card-image">
                        <img src="Images/Person.png" alt="profile one" />
                    </div>

                    <ul class="social-icons">
                        <li>
                            <a class="link" href="">
                                <i class="fab fa-facebook-f"></i>
                            </a>
                        </li>
                        <li>
                            <a class="link" href="">
                                <i class="fab fa-instagram"></i>
                            </a>
                        </li>
                        <li>
                            <a class="link" href="">
                                <i class="fab fa-twitter"></i>
                            </a>
                        </li>
                        <li>
                            <a class="link" href="">
                                <i class="fab fa-dribbble"></i>
                            </a>
                        </li>
                    </ul>

                    <div class="details">
                        <h2>
                            <asp:Label runat="server" ID="Heading"></asp:Label>
                            <br>

                            <asp:Label runat="server" ID="designation" CssClass="job-title">
                            </asp:Label>
                        </h2>
                    </div>
                </div>
            </div>
            <!-- end box wrapper -->
        </div>
    </div>
    <div class="float-left">
        <div class="container-down">
            <div class="card-wrapper-down">
                <div class="card-down">
                    <div class="row">
                        <div class="col">
                            <center>
                                <h4>YOUR PROFILE</h4>
                                <span>Account Status - </span>
                                <asp:Label class="badge badge-pill badge-info" ID="Label1" runat="server" Text="Your status"></asp:Label>
                            </center>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <label>Full Name</label>
                            <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="txtname" runat="server" placeholder="Full Name"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label>Date of Birth</label>
                            <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="txtdob" runat="server" placeholder="DOB"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <label>Contact No</label>
                            <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="txtphone" runat="server" placeholder="Contact No" TextMode="Number" MaxLength="10"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <label>Email ID</label>
                            <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="txtmail" runat="server" placeholder="Email ID" TextMode="Email"></asp:TextBox>
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
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <label>State</label>
                            <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="txtstate" runat="server" placeholder="State"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <label>City</label>
                            <div class="form-group">
                                <asp:TextBox class="form-control" ID="txtcity" runat="server" placeholder="City"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <label>Pincode</label>
                            <div class="form-group">
                                <asp:TextBox class="form-control" ID="txtpin" runat="server" placeholder="Pincode" TextMode="Number"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <label>Full Address</label>
                            <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="txtaddress" runat="server" placeholder="Full Address" TextMode="MultiLine" Rows="2"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <center>
                                <asp:Label class="badge badge-pill badge-info" ID="Label2" runat="server" Text="Change Password"></asp:Label>
                            </center>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <label>Old Password</label>
                            <div class="form-group">
                                <asp:TextBox class="form-control" ID="OldPswd" runat="server" placeholder="Max.10 characters" TextMode="Password"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="validator1" runat="server" ControlToValidate="OldPswd" ErrorMessage="Password must have at least 8 char & contain at least one uppercase, lowercase letter, numeric digit, and a special character." ForeColor="Red" ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[^\da-zA-Z])[^\s]{8,}$"></asp:RegularExpressionValidator>

                                 <div class="input-group-append">
                                        <button class="btn btn-outline-secondary" type="button" id="toggle_pwd">
                                            <i class="fa fa-fw fa-eye field_icon" id="password-icon"></i>
                                        </button>
                                    </div>                           
                            </div>
                        </div>
                        <div class="col-md-4">
                            <label>New Password</label>
                            <div class="form-group">
                                <asp:TextBox class="form-control" ID="NewPswd" runat="server" placeholder="Max.10 characters" TextMode="Password"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="validator" runat="server" ControlToValidate="NewPswd" ErrorMessage="Password must have at least 8 char & contain at least one uppercase, lowercase letter, numeric digit, and a special character." ForeColor="Red" ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[^\da-zA-Z])[^\s]{8,}$"></asp:RegularExpressionValidator>

                                <div class="input-group-append-1">
                                        <button class="btn btn-outline-secondary" type="button" id="toggle_pwd1">
                                            <i class="fa fa-fw fa-eye field_icon" id="password-icon1"></i>
                                        </button>
                                    </div>
                                 
                            </div>
                        </div>
                        <div class="col-md-2">
                           <div class="form-group-1">
                                <asp:Button class="btn btn-outline-secondary btn-block" ID="confirm" runat="server" Text="Confirm" OnClick="confirm_Click" />
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-4 mx-auto">
                            <center>
                                <div class="form-group">
                                    <asp:Button class="btn btn-outline-danger btn-block btn-lg" ID="update" runat="server" Text="UPDATE" OnClick="update_Click" />
                                </div>
                            </center>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
