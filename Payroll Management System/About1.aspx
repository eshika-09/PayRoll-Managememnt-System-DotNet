<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="About1.aspx.cs" Inherits="Payroll_Management_System.About1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home Page</title>
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="datatables/css/jquery.datatables.css" rel="stylesheet" />
    <link href="fontawesome/css/all.css" rel="stylesheet" />
    <link href="main_css/customestylesheet.css" rel="stylesheet" />
    <script src="bootstrap/js/jquery-3.2.1.slim.min.js"></script>
    <script src="bootstrap/js/popper.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="datatables/js/jquery.datatables.js"></script>
    <style type="text/css">
        @import url("https://fonts.googleapis.com/css2?family=Vollkorn&display=swap");

        body {
            width: 100vx;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            background: rgb(153,0,51);
            background: linear-gradient(90deg, rgba(153,0,51,1) 0%, rgba(153,153,153,1) 35%, rgba(0,0,0,1) 100%);
        }

        .flip-card {
            width: 700px;
            height: 500px;
            border: 1px solid #f1f1f1;
            perspective: 1000px; /* Remove this if you don't want the 3D effect */
            background: #f5f5f5;
            color: #272727;
            border-radius: 20px;
        }
        /* This container is needed to position the front and back side */
        .flip-card-inner {
            position: relative;
            width: 100%;
            height: 100%;
            text-align: center;
            transition: transform 0.8s;
            transform-style: preserve-3d;
        }
        /* Do an horizontal flip when you move the mouse over the flip box container */
        .flip-card:hover .flip-card-inner {
            transform: rotateY(180deg);
        }
        /* Position the front and back side */
        .flip-card-front, .flip-card-back {
            position: absolute;
            width: 100%;
            height: 100%;
            backface-visibility: hidden;
        }
        /* Style the front side (fallback if image is missing) */
        .flip-card-front {
            background: #f5f5f5;
            color: #272727;
            padding: 50px;
            box-shadow: 0px 7px 24px rgba(100, 100, 100, 0.4);
            border-radius: 20px;
        }
        /* Style the back side */
        .flip-card-back {
            background: #f5f5f5;
            color: #272727;
            padding: 50px;
            box-shadow: 0px 7px 24px rgba(100, 100, 100, 0.4);
            border-radius: 20px;
            transform: rotateY(180deg);
        }

        p {
            font-size: 40px;
            font-family: "Vollkorn", serif;
            font-weight: 500;
            color: #3f3f55;
            text-align: center;
        }

            p::after {
                content: "\201D";
                display: inline;
                color: black;
            }

            p::before {
                content: "\201C";
                display: inline;
                color: #999;
            }

        h4 {
            font-size: 20px;
            font-family: "Vollkorn", serif;
            font-weight: 200;
            color: #9DBEBB;
            text-align: center;
            line-height: 375px;
        }

        :root {
            --line_color: #555555;
        }

        .button {
            position: relative;
            z-index: 0;
            width: 240px;
            height: 56px;
            text-decoration: none;
            font-size: 14px;
            font-weight: bold;
            color: var(--line_color);
            letter-spacing: 2px;
            transition: all .3s ease;
        }

        .button__text {
            display: flex;
            justify-content: center;
            align-items: center;
            width: 100%;
            height: 100%;
        }

            .button::before,
            .button::after,
            .button__text::before,
            .button__text::after {
                content: '';
                position: absolute;
                height: 3px;
                border-radius: 2px;
                background: var(--line_color);
                transition: all .5s ease;
                color: hsl(0, 0%, 60%);
            }

        .button::before {
            top: 0;
            left: 54px;
            width: calc( 100% - 56px * 2 - 16px );
        }

        .button::after {
            top: 0;
            right: 54px;
            width: 8px;
        }

        .button__text::before {
            bottom: 0;
            right: 54px;
            width: calc( 100% - 56px * 2 - 16px );
        }

        .button__text::after {
            bottom: 0;
            left: 54px;
            width: 8px;
        }

        .button__line {
            position: absolute;
            top: 0;
            width: 56px;
            height: 100%;
            overflow: hidden;
        }

            .button__line::before {
                content: '';
                position: absolute;
                top: 0;
                width: 150%;
                height: 100%;
                box-sizing: border-box;
                border-radius: 300px;
                border: solid 3px var(--line_color);
            }

            .button__line:nth-child(1),
            .button__line:nth-child(1)::before {
                left: 0;
            }

            .button__line:nth-child(2),
            .button__line:nth-child(2)::before {
                right: 0;
            }

        .button:hover {
            letter-spacing: 6px;
        }

            .button:hover::before,
            .button:hover .button__text::before {
                width: 8px;
            }

            .button:hover::after,
            .button:hover .button__text::after {
                width: calc( 100% - 56px * 2 - 16px );
            }

        .button__drow1,
        .button__drow2 {
            position: absolute;
            z-index: -1;
            border-radius: 16px;
            transform-origin: 16px 16px;
        }

        .button__drow1 {
            top: -16px;
            left: 40px;
            width: 32px;
            height: 0;
            transform: rotate( 30deg );
        }

        .button__drow2 {
            top: 44px;
            left: 77px;
            width: 32px;
            height: 0;
            transform: rotate(-127deg );
        }

            .button__drow1::before,
            .button__drow1::after,
            .button__drow2::before,
            .button__drow2::after {
                content: '';
                position: absolute;
            }

        .button__drow1::before {
            bottom: 0;
            left: 0;
            width: 0;
            height: 32px;
            border-radius: 16px;
            transform-origin: 16px 16px;
            transform: rotate( -60deg );
        }

        .button__drow1::after {
            top: -10px;
            left: 45px;
            width: 0;
            height: 32px;
            border-radius: 16px;
            transform-origin: 16px 16px;
            transform: rotate( 69deg );
        }

        .button__drow2::before {
            bottom: 0;
            left: 0;
            width: 0;
            height: 32px;
            border-radius: 16px;
            transform-origin: 16px 16px;
            transform: rotate( -146deg );
        }

        .button__drow2::after {
            bottom: 26px;
            left: -40px;
            width: 0;
            height: 32px;
            border-radius: 16px;
            transform-origin: 16px 16px;
            transform: rotate( -262deg );
        }

        .button__drow1,
        .button__drow1::before,
        .button__drow1::after,
        .button__drow2,
        .button__drow2::before,
        .button__drow2::after {
            background: var( --back_color );
        }

        .button:hover .button__drow1 {
            animation: drow1 ease-in .06s;
            animation-fill-mode: forwards;
        }

            .button:hover .button__drow1::before {
                animation: drow2 linear .08s .06s;
                animation-fill-mode: forwards;
            }

            .button:hover .button__drow1::after {
                animation: drow3 linear .03s .14s;
                animation-fill-mode: forwards;
            }

        .button:hover .button__drow2 {
            animation: drow4 linear .06s .2s;
            animation-fill-mode: forwards;
        }

            .button:hover .button__drow2::before {
                animation: drow3 linear .03s .26s;
                animation-fill-mode: forwards;
            }

            .button:hover .button__drow2::after {
                animation: drow5 linear .06s .32s;
                animation-fill-mode: forwards;
            }

        @keyframes drow1 {
            0% {
                height: 0;
            }

            100% {
                height: 100px;
            }
        }

        @keyframes drow2 {
            0% {
                width: 0;
                opacity: 0;
            }

            10% {
                opacity: 0;
            }

            11% {
                opacity: 1;
            }

            100% {
                width: 120px;
            }
        }

        @keyframes drow3 {
            0% {
                width: 0;
            }

            100% {
                width: 80px;
            }
        }

        @keyframes drow4 {
            0% {
                height: 0;
            }

            100% {
                height: 120px;
            }
        }

        @keyframes drow5 {
            0% {
                width: 0;
            }

            100% {
                width: 124px;
            }
        }

        .form-group {
            width: 100%;
            height: 400px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }
    </style>
</head>
<body>
    <div class="flip-card">
        <div class="flip-card-inner">
            <div class="flip-card-front">
                <p>WELCOME TO THE PAYROLL MANAGEMENT SYSTEM OF LG ELECTRONICS INDIA</p>
                <br />
                <h4>HOVER ON THE CARD TO LOGIN</h4>
            </div>
            <div class="flip-card-back">
                <div class="form-group">
                    <a href="AdminLogin.aspx" class="button">
                        <div class="button__line"></div>
                        <div class="button__line"></div>
                        <span class="button__text">ADMIN</span>
                        <div class="button__drow1"></div>
                        <div class="button__drow2"></div>
                    </a>
                    <br />
                    <a href="EmpLogin.aspx" class="button">
                        <div class="button__line"></div>
                        <div class="button__line"></div>
                        <span class="button__text">EMPLOYEE</span>
                        <div class="button__drow1"></div>
                        <div class="button__drow2"></div>
                    </a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
