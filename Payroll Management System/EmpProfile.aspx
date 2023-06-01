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
            position: relative;
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
            left: 415px;
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

        .form-group-1 {
            margin-top: 32px;
        }

        .container-2 {
            max-width: 900px;
            justify-content: space-evenly;
            margin: 20px;
        }

        .card-wrapper-2 {
            width: 400px;
            height: 500px;
            position: relative;
        }

        .card-2 {
            position: absolute;
            top: 3.5%;
            left: 1400px;
            width: 450px;
            height: 750px;
            /*transform: translate(-50%, -50%);*/
            border-radius: 16px;
            overflow: hidden;
            box-shadow: 0 5px 18px rgba(0, 0, 0, 0.6);
            cursor: pointer;
            /*transition: 0.5s;*/
        }
            .card-2 .inner_part {
                display: flex;
                align-items: center;
                justify-content: center;
                padding: 0 0 0 30px;
                height: 350px;
                position: absolute;
            }
        #slideImg:checked ~ .inner_part {
            padding: 0;
            transition: .1s ease-in;
        }
        .inner_part .img {
            height: 260px;
            width: 395px;
            overflow: hidden;
            flex-shrink: 0;
            border-radius: 20px;
            box-shadow: 0 10px 50px rgba(0,0,0,0.2);
        }
        #slideImg:checked ~ .inner_part .img {
            height: 350px;
            width: 850px;
            z-index: 99;
            transition: .3s .2s ease-in;
        }

        .img img {
            height: 100%;
            width: 100%;
            cursor: pointer;
            opacity: 0;
            transition: .6s;
        }
        #slide_1:checked ~ .inner_part .img_1,
        #slide_2:checked ~ .inner_part .img_2,
        /*#slide_3:checked ~ .inner_part .img_3*/ {
            opacity: 1;
            transition-delay: .2s;
        }
        .content {
            padding: 0 20px 0 35px;
            width: 530px;
            margin-left: 50px;
            opacity: 0;
            transition: .6s;
        }
        #slideImg:checked ~ .inner_part .content {
            display: none;
        }
        #slide_1:checked ~ .inner_part .content_1,
        #slide_2:checked ~ .inner_part .content_2,
        /*#slide_3:checked ~ .inner_part .content_3*/ {
            opacity: 1;
            margin-left: 0;
            z-index: 100;
            transition-delay: .3s;
        }
        .content .text {
            font-size: 19px;
            color: #4e4a67;
            margin: 0 auto 30px auto;
            line-height: 1.5em;
            text-align: justify;
        }
        .content button {
            padding: 15px 20px;
            border: none;
            font-size: 16px;
            color: #fff0e6;
            font-weight: 600;
            letter-spacing: 1px;
            border-radius: 50px;
            cursor: pointer;
            outline: none;
            background: #000000;
            float: right;
        }
            .content button:hover {
                background: #cecece;
                color: #000000;
            }
        .slider {
            position: absolute;
            bottom: 25px;
            left: 55%;
            transform: translateX(-50%);
            z-index: 1;
        }
        #slideImg:checked ~ .slider {
            display: none;
        }

        .slider .slide {
            position: relative;
            height: 10px;
            width: 50px;
            background: #d9d9d9;
            border-radius: 5px;
            display: inline-flex;
            margin: 0 3px;
            cursor: pointer;
        }
            .slider .slide:before {
                position: absolute;
                content: '';
                top: 0;
                left: 0;
                height: 100%;
                width: -100%;
                background: #000000;
                ;
                border-radius: 10px;
                transform: scaleX(0);
                transition: transform .6s;
                transform-origin: left;
            }
        #slide_1:checked ~ .slider .slide_1:before,
        #slide_2:checked ~ .slider .slide_2:before,
        /*#slide_3:checked ~ .slider .slide_3:before*/ {
            transform: scaleX(1);
            width: 100%;
        }
        input {
            display: none;
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
    <div class="container-2">
        <div class="card-wrapper-2">
            <div class="card-2">
                <asp:RadioButton ID="slide_1" runat="server" Checked="True" />
                <asp:RadioButton ID="slide_2" runat="server" Checked="True" />
                <asp:RadioButton ID="slide_3" runat="server" Checked="True" />
                <asp:CheckBox ID="slideImg" runat="server" />
                <div class="slider">
                    <label for="slide_1" class="slide slide_1" runat="server"></label>
                    <label for="slide_2" class="slide slide_2" runat="server"></label>
                    <label for="slide_3" class="slide slide_3" runat="server"></label>
                </div>
                <div class="inner_part">
                    <label for="slideImg" class="img" runat="server">
                        <img class="img_1" src="https://c4.wallpaperflare.com/wallpaper/978/131/617/kiz-kulesi-turkey-istanbul-maiden-s-tower-wallpaper-preview.jpg">
                    </label>
                    <div class="content content_1">
                        <div class="title">İstanbul</div>
                        <span class="text">
                            Istanbul, a fascinating city built on two Continents, divided by the Bosphorus Strait. This is one of the greatest cities in the world.
                        </span>
                        <asp:Button ID="read" Text="Read More" runat="server" OnClick="read_Click" />
                    </div>
                </div>
                <div class="inner_part">
                    <label for="slideImg" class="img" runat="server">
                        <img class="img_2" src="https://c4.wallpaperflare.com/wallpaper/649/96/56/ankara-cityscape-night-night-sky-wallpaper-preview.jpg">
                    </label>
                    <div class="content content_2">
                        <div class="title">Ankara</div>
                        <span class="text">
                            Ankara is Turkey's beating heart, second largest city, located in the Central Anatolia region and home to the Grand National Assembly of Turkey.
                        </span>
                    </div>
                </div>
            </div>
        </div>
        <!-- end box wrapper -->
    </div>
</asp:Content>
