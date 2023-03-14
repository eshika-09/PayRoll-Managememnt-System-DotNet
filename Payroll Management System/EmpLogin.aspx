<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="EmpLogin.aspx.cs" Inherits="Payroll_Management_System.UserLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script type="text/javascript">
         $(document).ready(function () {
             $("#toggle_pwd").hover(function show() {
                 $(this).toggleClass("fa-eye fa-eye-slash");
                 var type = $(this).hasClass("fa-eye-slash") ? "text" : "password";
                 $("[id*=txtpass]").attr("type", type);
             });
         });
     </script>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;600&display=swap" rel="stylesheet">
    <style media="screen">
        *,
        *:before,
        *:after {
            padding: 0;
            margin: 0;
            box-sizing: border-box;
        }

        body {
            background-color: #ffffff;
        }

        .container {
            width: 430px;
            height: 700px;
            position: absolute;
            transform: translate(-50%,-50%);
            left: 50%;
            top: 75%;
            display: flex;
        }

            .container .shape {
                height: 200px;
                width: 200px;
                position: absolute;
                border-radius: 50%;
            }

        .shape:first-child {
            background: linear-gradient( #a50034, #d43768 );
            left: -80px;
            top: -300px;
        }

        .shape:last-child {
            background: linear-gradient(#6b6b6b,#b5b3b3);
            right: -72px;
            bottom: 150px;
        }

        .card {
            height: 650px;
            width: 400px;
            background-color: rgba(255,255,255,0.13);
            position: center;
            transform: translate(-50%,-50%);
            top: 20%;
            left: 50%;
            border-radius: 10px;
            backdrop-filter: blur(10px);
            border: 2px solid rgba(255,255,255,0.1);
            box-shadow: 0 0 40px rgba(8,7,16,0.6);
            padding: 50px 35px;
            z-index: 999999;
        }

        form * {
            font-family: 'Poppins',sans-serif;
            color: black;
            letter-spacing: 0.5px;
            outline: none;
            border: none;
        }

        form h3 {
            font-size: 32px;
            font-weight: 500;
            line-height: 42px;
            text-align: center;
        }

        label {
            display: block;
            margin-top: 30px;
            font-size: 16px;
            font-weight: 500;
        }

        .input-group-append {
            display: flex;
            margin-top: 7px
        }

        .form-control {
            display: block;
            height: 50px;
            width: 100%;
            background-color: rgba(255,255,255,0.07);
            border-radius: 3px;
            padding: 0 10px;
            margin-top: 8px;
            font-size: 14px;
            font-weight: 300;
        }

        ::placeholder {
            /* color: #e5e5e5;*/
            color: azure;
        }

        .social {
            margin-top: 30px;
            display: flex;
        }

            .social div {
                background: red;
                width: 150px;
                border-radius: 3px;
                padding: 5px 10px 10px 5px;
                background-color: rgba(255,255,255,0.27);
                background-color:#8c8888;
                color: #eaf0fb;
                text-align: center;
            }
            .social .go a {
                color:#f2f2f2;
            }
                .social .go a:active, .social .go a:focus {
                    color:#f2f2f2;
                }
                .social div:hover {
                    background-color: rgba(255,255,255,0.47);
                }

            .social .fb {
                margin-left: 25px;
            }

            .social i {
                margin-right: 4px;
            }

        a:hover {
            text-decoration: underline;
            color: #6b6b6b;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
         <div class="shape"></div>
        <div class="row">
            <div class="col-md-6 mx-auto">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <%--<div class="col">
                                <center>
                                    <img width="150px" src="Images/login.gif" />
                                </center>
                            </div>--%>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h3>Employee Login</h3>
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
                                <label>Employee ID</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtid" runat="server" placeholder="Employee ID"></asp:TextBox>
                                </div>
                                <label>Password</label>
                                <div class="input-group">
                                    <asp:TextBox CssClass="form-control" ID="txtpass" runat="server" TextMode="Password" placeholder="Enter Password" onBlur="validatePassword(this.value)">
                                    </asp:TextBox>
                                    <div class="input-group-append">
                                        <button class="btn btn-outline-secondary" type="button" id="toggle_pwd">
                                            <i class="fa fa-fw fa-eye field_icon" id="password-icon"></i>
                                        </button>
                                    </div>
                                </div>
                                <br />
                                <div class="form-group">
                                    <asp:Button class="btn btn-success btn-block btn-lg" ID="Button1" runat="server" Text="Login" OnClick="Button1_Click" />
                                </div>
                                <div class="form-group">
                                    <a href="SignUp.aspx">
                                        <input class="btn btn-info btn-block btn-lg" id="Button2" type="button" value="Sign Up" /></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <a href="HomePage.aspx"><< Back to Home</a><br>
                <br>
            </div>
        </div>
        <div class="shape"></div>
    </div>
</asp:Content>
