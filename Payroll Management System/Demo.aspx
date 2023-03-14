<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Demo.aspx.cs" Inherits="Payroll_Management_System.Demo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Demo</title>
    <link href="Bootstrap/CSS/bootstrap.min.css" rel="stylesheet" />
    <link href="Datatables/CSS/jquery.dataTables.css" rel="stylesheet" />
    <link href="fontawesome/css/all.css" rel="stylesheet" />
    <link href="Main_CSS/CustomeStyleSheet.css" rel="stylesheet" />
    <script src="Bootstrap/js/jquery-3.2.1.slim.min.js"></script>
    <script src="Bootstrap/js/popper.min.js"></script>
    <script src="Bootstrap/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="Datatables/JS/jquery.dataTables.js"></script>
    <style type="text/css">
        body {
            background: linear-gradient(#a50034, #d43768);
            height: 100vh;
            margin: 0;
            display: flex;
            justify-content: center;
        }

        .menu-bar {
            border-radius: 25px;
            height: fit-content;
            display: inline;
            background-color: rgba(0, 0, 0, .4);
            -webkit-backdrop-filter: blur(10px);
            backdrop-filter: blur(10px);
            align-items: center;
            padding: 0 10px;
            margin: 50px 0 0 0;
        }

        li {
            list-style: none;
            color: white;
            font-family: sans-serif;
            font-weight: bold;
            padding: 12px 16px;
            margin: 0 8px;
            position: relative;
            cursor: pointer;
            white-space: nowrap;
            display: inline;
        }

            li::before {
                content: " ";
                position: absolute;
                top: 0;
                left: 0;
                height: 100%;
                width: 100%;
                z-index: -1;
                transition: .2s;
                border-radius: 25px;
            }

            li:hover {
                background: linear-gradient(to bottom, #e8edec, #d2d1d3);
                box-shadow: 0px 3px 20px 0px black;
                transform: scale(1.2);
                color: black;
                border-radius: 25px;
            }
    </style>

</head>
<body>
    <div class="menu-bar">
        <ul>
            <li>Watch Now</li>
            <li>Movies</li>
            <li>TV Shows</li>
            <li>Sports</li>
            <li>Kids</li>
            <li>Library</li>
        </ul>
    </div>
</body>
</html>
