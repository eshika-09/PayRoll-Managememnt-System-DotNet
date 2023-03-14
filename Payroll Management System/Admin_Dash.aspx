<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Admin_Dash.aspx.cs" Inherits="Payroll_Management_System.HomePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css" media="screen">
        .ag-format-container {
            width: 1142px;
            margin: 0 auto;
        }

        .ag-courses_box {
            display: -webkit-box;
            display: -ms-flexbox;
            display: flex;
            -webkit-box-align: start;
            -ms-flex-align: start;
            align-items: flex-start;
            -ms-flex-wrap: wrap;
            flex-wrap: wrap;
            padding: 50px 0;
        }

        .ag-courses_item {
            -ms-flex-preferred-size: calc(33.33333% - 30px);
            flex-basis: calc(33.33333% - 30px);
            margin: 0 15px 30px;
            overflow: hidden;
            border-radius: 28px;
        }

        .ag-courses-item_link {
            display: block;
            padding: 30px 20px;
            background-color: #6b6b6b;
            overflow: hidden;
            position: relative;
        }

            .ag-courses-item_link:hover,
            .ag-courses-item_link:hover .ag-courses-item_date {
                text-decoration: none;
                color: #FFF;
            }

                .ag-courses-item_link:hover .ag-courses-item_bg {
                    -webkit-transform: scale(10);
                    -ms-transform: scale(10);
                    transform: scale(10);
                }

        .ag-courses-item_title {
            min-height: 87px;
            margin: 0 0 25px;
            overflow: hidden;
            font-weight: bold;
            font-size: 30px;
            color: #FFF;
            z-index: 2;
            position: relative;
        }

        .ag-courses-item_date-box {
            font-size: 18px;
            color: #FFF;
            z-index: 2;
            position: relative;
        }

        .ag-courses-item_date {
            font-weight: bold;
            color: #f9b234;
            -webkit-transition: color .5s ease;
            -o-transition: color .5s ease;
            transition: color .5s ease
        }

        .ag-courses-item_bg {
            height: 128px;
            width: 128px;
            background-color: #a50034;
            z-index: 1;
            position: absolute;
            top: -75px;
            right: -75px;
            border-radius: 50%;
            -webkit-transition: all .5s ease;
            -o-transition: all .5s ease;
            transition: all .5s ease;
        }

        .ag-courses_item:nth-child(2n) .ag-courses-item_bg {
            background-color: #a50034;
        }

        .ag-courses_item:nth-child(3n) .ag-courses-item_bg {
            background-color: #a50034;
        }

        .ag-courses_item:nth-child(4n) .ag-courses-item_bg {
            background-color: #a50034;
        }

        .ag-courses_item:nth-child(5n) .ag-courses-item_bg {
            background-color: #a50034;
        }


        @media only screen and (max-width: 979px) {
            .ag-courses_item {
                -ms-flex-preferred-size: calc(50% - 30px);
                flex-basis: calc(50% - 30px);
            }

            .ag-courses-item_title {
                font-size: 24px;
            }
        }

        @media only screen and (max-width: 767px) {
            .ag-format-container {
                width: 96%;
            }
        }

        @media only screen and (max-width: 639px) {
            .ag-courses_item {
                -ms-flex-preferred-size: 100%;
                flex-basis: 100%;
            }

            .ag-courses-item_title {
                min-height: 72px;
                line-height: 1;
                font-size: 24px;
            }

            .ag-courses-item_link {
                padding: 22px 40px;
            }

            .ag-courses-item_date-box {
                font-size: 16px;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section>
        <div class="ag-format-container">
            <div class="ag-courses_box">
                <div class="ag-courses_item">
                    <a href="EmpManagement.aspx" class="ag-courses-item_link">
                        <div class="ag-courses-item_bg"></div>

                        <div class="ag-courses-item_title">
                            ADD EMPLOYEE
                        </div>

                        <div class="ag-courses-item_date-box">
                            Start:
          <span class="ag-courses-item_date">04.11.2022
          </span>
                        </div>
                    </a>
                </div>

                <div class="ag-courses_item">
                    <a href="EmployeeProfile.aspx" class="ag-courses-item_link">
                        <div class="ag-courses-item_bg"></div>

                        <div class="ag-courses-item_title">
                            EMPLOYEE REPORT
                        </div>

                        <div class="ag-courses-item_date-box">
                            Start:
          <span class="ag-courses-item_date">04.11.2022
          </span>
                        </div>
                    </a>
                </div>
                <div class="ag-courses_item">
                    <a href="LeaveApprove.aspx" class="ag-courses-item_link">
                        <div class="ag-courses-item_bg"></div>

                        <div class="ag-courses-item_title">
                            LEAVE APPROVAL
                        </div>

                        <div class="ag-courses-item_date-box">
                            Start:
          <span class="ag-courses-item_date">04.11.2022
          </span>
                        </div>
                    </a>
                </div>
            </div>
        </div>
        <div class="ag-format-container">
            <div class="ag-courses_box">
                <div class="ag-courses_item">
                    <a href="GenerateSalary.aspx" class="ag-courses-item_link">
                        <div class="ag-courses-item_bg"></div>

                        <div class="ag-courses-item_title">
                            GENERATE SALARY
                        </div>

                        <div class="ag-courses-item_date-box">
                            Start:
          <span class="ag-courses-item_date">04.11.2022
          </span>
                        </div>
                    </a>
                </div>

                <div class="ag-courses_item">
                    <a href="SalaryReport.aspx" class="ag-courses-item_link">
                        <div class="ag-courses-item_bg"></div>

                        <div class="ag-courses-item_title">
                            SALARY REPORT
                        </div>

                        <div class="ag-courses-item_date-box">
                            Start:
          <span class="ag-courses-item_date">04.11.2022
          </span>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
