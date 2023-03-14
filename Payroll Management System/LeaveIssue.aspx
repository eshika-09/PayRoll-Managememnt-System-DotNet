<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="LeaveIssue.aspx.cs" Inherits="Payroll_Management_System.LeaveIssue" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-5">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Leave Issuing</h4>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="100px" src="Images/leave.png" />
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Employee ID</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtId" runat="server" placeholder="Employee ID"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label>Leave ID</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtLeave" runat="server" placeholder="Leave ID"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="txtCount" runat="server" placeholder="No. of Holidays taken" TextMode="Number" Visible="false"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Employee Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtName" runat="server" placeholder="Employee Name" ReadOnly="false"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label>Leave Reason</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtReason" runat="server" placeholder="Maximum 50 Words" TextMode="MultiLine"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Start Date</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtstrt" runat="server" placeholder="Start Date" TextMode="Date" OnTextChanged="txtstrt_TextChanged"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="strtValid" runat="server" ControlToValidate="txtstrt" ForeColor="Red" ErrorMessage="Please enter start date" ValidationGroup="Submit"></asp:RequiredFieldValidator>
                                    <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtstrt" MinimumValue="01-01-2023" MaximumValue="31-12-2024" ForeColor="Red" ErrorMessage="Selected Date of the Past is not Applied!" Type="Date" ValidationGroup="Submit"></asp:RangeValidator>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label>End Date</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtend" runat="server" placeholder="End Date" TextMode="Date"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="endValid" ControlToValidate="txtend" runat="server" ForeColor="Red" ErrorMessage="Please enter end date" ValidationGroup="Submit"></asp:RequiredFieldValidator>
                                    <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="txtend" MinimumValue="01-01-2023" MaximumValue="31-12-2024" ForeColor="Red" ErrorMessage="Selected Date of the Future is not Applied!" Type="Date" ValidationGroup="Submit"></asp:RangeValidator>
                                </div>
                            </div>
                            <asp:CompareValidator ID="cmpDate" runat="server" ControlToValidate="txtend" ControlToCompare="txtstrt" Operator="GreaterThanEqual" ForeColor="Red" ErrorMessage="End date should be greater than or equal to start date"></asp:CompareValidator>
                        </div>

                        <div class="row">
                            <div class="col-4 mx-auto">
                                <center>
                                    <asp:Button ID="BtnApply" class="btn btn-lg btn-block btn-primary" runat="server" Text="Apply" OnClick="BtnApply_Click" ValidationGroup="Submit" />
                                </center>
                            </div>
                            <div class="col-4 mx-auto">
                                <center>
                                    <asp:Button ID="BtnDelete" class="btn btn-lg btn-block btn-success" runat="server" Text="Delete" OnClick="BtnDelete_Click" />
                                </center>
                            </div>
                        </div>

                    </div>
                </div>
                <a href="HomePage.aspx"><< Back to Home</a><br>
                <br>
            </div>
            <div class="col-md-7">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Issued Leave Request</h4>
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
                        <div class="row">
                            <div class="col">
                                <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" CellPadding="4" AutoGenerateColumns="False" ForeColor="#333333" GridLines="None">
                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />

                                    <Columns>
                                        <asp:BoundField HeaderText="EMP ID" DataField="empid" />
                                        <asp:BoundField HeaderText="LEAVE ID" DataField="leaveid" />
                                        <asp:BoundField HeaderText="LEAVES TAKEN" DataField="leavecount" />
                                        <asp:BoundField HeaderText="Full Name" DataField="full_name" />
                                        <asp:BoundField HeaderText="REASON" DataField="reason" />
                                        <asp:BoundField HeaderText="FROM DATE" DataField="strtdate" />
                                        <asp:BoundField HeaderText="TILL DATE" DataField="enddate" />
                                        <asp:BoundField HeaderText="APPROVE" DataField="approvestatus" />

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
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
