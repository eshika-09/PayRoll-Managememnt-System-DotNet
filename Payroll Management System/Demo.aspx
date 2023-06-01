<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Demo.aspx.cs" Inherits="Payroll_Management_System.Demo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $("#toggle_pwd").hover(function show() {
                $(this).toggleClass("fa-eye fa-eye-slash");
                var type = $(this).hasClass("fa-eye-slash") ? "text" : "password";
                $("[id*=oldPswd]").attr("type", type);
            });
        }); $(document).ready(function () {
            $("#toggle_pwd1").hover(function show() {
                $(this).toggleClass("fa-eye fa-eye-slash");
                var type = $(this).hasClass("fa-eye-slash") ? "text" : "password";
                $("[id*=newPswd]").attr("type", type);
            });
        });
    </script>
    <style>
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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-2">
        <div class="card-wrapper-2">
            <div class="card-2">
                <div class="row row-cols-3 g-3">
                    <div class="col">
                        <div class="card">
                            <img src="https://mdbcdn.b-cdn.net/img/new/standard/city/041.webp" class="card-img-top"
                                alt="Hollywood Sign on The Hill" />
                            <div class="card-body">
                                <h5 class="card-title">Card title</h5>
                                <p class="card-text">
                                    This is a longer card with supporting text below as a natural lead-in to
          additional content. This content is a little bit longer.
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card">
                        <img src="https://mdbcdn.b-cdn.net/img/new/standard/city/042.webp" class="card-img-top"
                            alt="Palm Springs Road" />
                        <div class="card-body">
                            <h5 class="card-title">Card title</h5>
                            <p class="card-text">
                                This is a longer card with supporting text below as a natural lead-in to
          additional content. This content is a little bit longer.
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

