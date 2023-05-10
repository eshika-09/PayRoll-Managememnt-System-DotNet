<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="LeaveApprove.aspx.cs" Inherits="Payroll_Management_System.LeaveApprove" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
    </script>

    <style type="text/css">
        .Col-design {
            padding: 35px;
            padding-right: 100px;
            padding-left: 100px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <div class="Col-design">
        <asp:GridView ID="GridView1" runat="server" class="table table-striped table-bordered" CellPadding="4" AutoGenerateColumns="False">
            <Columns>
                <asp:TemplateField HeaderText="ID">
                    <ItemTemplate>
                        <asp:Label ID="empID" runat="server" Text='<%# Bind("empid") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="LEAVE ID">
                    <ItemTemplate>
                        <asp:Label ID="leaveID" runat="server" Text='<%# Bind("leaveid") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField HeaderText="LEAVES TAKEN" DataField="leavecount" />
                <asp:BoundField HeaderText="Full Name" DataField="full_name" />
                <asp:BoundField HeaderText="REASON" DataField="reason" />
                <asp:BoundField HeaderText="FROM DATE" DataField="strtdate" />
                <asp:BoundField HeaderText="TILL DATE" DataField="enddate" />
                <asp:TemplateField HeaderText="APPROVAL">
                    <ItemTemplate>
                        <asp:CheckBox ID="CheckBox1" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
    <div class="row">
        <div class="col-1 mx-auto">
            <center>
                <asp:Button ID="btnApprove" class="btn btn-lg btn-block btn-primary" runat="server" Text="APPROVE" OnClick="btnApprove_Click" />
            </center>
        </div>
        <div class="col-1 mx-auto">
            <center>
                <asp:Button ID="btnDecline" class="btn btn-lg btn-block btn-danger" runat="server" Text="REJECT" OnClick="btnDecline_Click" />
            </center>
        </div>
    </div>
</asp:Content>
