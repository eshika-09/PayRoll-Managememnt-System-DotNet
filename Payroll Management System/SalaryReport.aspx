<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="SalaryReport.aspx.cs" Inherits="Payroll_Management_System.SalaryReport" EnableEventValidation = "false"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .divhide {
            display: none;
        }
    </style>
    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col">
            <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowCommand="GridView1_RowCommand">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <%--<asp:BoundField HeaderText="ID" DataField="empid" />--%>
                    <asp:TemplateField HeaderText="ID">
                        <ItemTemplate>
                            <asp:Label ID="empID" runat="server" Text='<%# Bind("empid") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:BoundField HeaderText="FULL NAME" DataField="full_name" />
                    <asp:BoundField HeaderText="DESIGNATION" DataField="designation" />
                    <asp:BoundField HeaderText="DEPARTMENT" DataField="dept" />
                    <asp:BoundField HeaderText="MONTH" DataField="month" />
                    <asp:BoundField HeaderText="BASIC PAY" DataField="basic_pay" />
                    <asp:BoundField HeaderText="EARNINGS" DataField="earnings" />
                    <asp:BoundField HeaderText="DEDUCTION" DataField="deduction" />
                    <asp:BoundField HeaderText="NET SALARY" DataField="NetSalary" />
                    <%--<asp:ButtonField HeaderText="SALARY SLIP" Text="DOWNLOAD" />--%>
                    <asp:TemplateField HeaderText="SALARY SLIP">
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkempID" runat="server" CommandName="cmdDownlaod" CommandArgument='<%# Eval("empid") %>' Text="Download" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
        </div>
    </div>
    <div class="row">
        <div class="col-4 mx-auto">
            <br />
            <asp:Button ID="Generate" class="btn btn-lg btn-block btn-success" runat="server" Text="Generate PDF" OnClick="Generate_Click1" Visible="false" />
            <asp:Button ID="Excel" class="btn btn-lg btn-block btn-success" runat="server" Text="Generate Excel" OnClick="Excel_Click" />
            <br />
        </div>
       <%-- <div class="col-4 mx-auto">
            <br /> 
            <asp:Label CssClass="form-control" ID="Eid" runat="server" Text="Employee ID"></asp:Label>
            <br />
            <asp:TextBox CssClass="form-control" ID="id" runat="server"></asp:TextBox>
            <br />
        </div>--%>
    </div>
    <div id="divPrintPDFContent" runat="server" class="divhide">
        <table border="1">
            <tr height="100px">
                <td colspan='4'>LG Electronics India Pvt. Ltd.</td>
            </tr>
            <tr>
                <th><b>Name</b></th>
                <td>
                    <asp:Label ID="lblName" runat="server"></asp:Label>
                </td>
                <th><b>Location</b></th>
                <td>India</td>
            </tr>
            <tr>
                <th><b>Department</b></th>
                <td>
                    <asp:Label ID="lblDept" runat="server"></asp:Label></td>
                <th><b>Designation</b></th>
                <td>
                    <asp:Label ID="lblDsg" runat="server"></asp:Label></td>
            </tr>
        </table>
        <br />
        <table border="1">
            <tr>
                <th><b>Earnings</b></th>
                <th><b>Amount</b></th>
                <th><b>Deductions</b></th>
                <th><b>Amount</b></th>
            </tr>
            <tr>
                <td><b>Basic Pay</b></td>
                <td>
                    <asp:Label ID="lblbasic" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td><b>House Rent Allowance</b></td>
                <td>
                    <asp:Label ID="lblhra" runat="server"></asp:Label></td>
                <td><b>Provident Fund</b></td>
                <td>
                    <asp:Label ID="lblpf" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td><b>Medical Allowance</b></td>
                <td>
                    <asp:Label ID="lblma" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td><b>Dearness Allowance</b></td>
                <td>
                    <asp:Label ID="lblda" runat="server"></asp:Label>

                </td>
            </tr>
            <tr>
                <td><b>Food Allowance</b></td>
                <td>
                    <asp:Label ID="lblfood" runat="server"></asp:Label>
                </td>
                <td><b>Leaves Taken</b></td>
                <td>
                    <asp:Label ID="lblLeaves" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <th><b>Gross Earnings</b></th>
                <td>
                    <asp:Label ID="lblearn" runat="server"></asp:Label>
                </td>
                <th><b>Gross Deductions</b></th>
                <td>
                    <asp:Label ID="lbldeduct" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td><strong>NET PAY</strong></td>
                <td>
                    <asp:Label ID="lblNetPay" runat="server"></asp:Label>
                </td>

            </tr>
        </table>
    </div>
</asp:Content>
