<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="LeaveApprove.aspx.cs" Inherits="Payroll_Management_System.LeaveApprove" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
    </script>

    <style type="text/css">
        /*        .Col-design {
            padding: 35px;
            padding-right: 100px;
            padding-left: 100px;
        }*/
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col">
        <div class="card">
            <div class="card-body">
                <div class="row">
                    <div class="col">
                        <center>
                            <h4>APPROVE LEAVE REQUEST</h4>
                        </center>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <center>
                            <img width="100px" src="Images/List.gif" />
                        </center>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <hr>
                    </div>
                </div>
                <div class="gridRow">
                    <div class="col">
                        <asp:GridView class="table table-striped table-bordered" ID="GridView1"  runat="server" CellPadding="4" AutoGenerateColumns="False" ForeColor="#333333" GridLines="None">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />

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
                            <EditRowStyle BackColor="#999999" />
                            <FooterStyle BackColor="#990033" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#990033 " Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#999999" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#999999" ForeColor="#000000" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#E9E7E2" />
                            <SortedAscendingHeaderStyle BackColor="#506C8C" />
                            <SortedDescendingCellStyle BackColor="#FFFDF8" />
                            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
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
