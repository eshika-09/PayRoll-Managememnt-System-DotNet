<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="EmpDetail.aspx.cs" Inherits="Payroll_Management_System.EmpReport" %>
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
         <div class="col-md-12">
            <div class="card">
               <div class="card-body">
                  <div class="row">
                        <div class="col">
                        <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" CellPadding="4" AutoGenerateColumns="False" ForeColor="#333333" GridLines="None">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />

                            <Columns>
                                <asp:BoundField HeaderText="ID" DataField="empid" />
                                <asp:BoundField HeaderText="Full Name" DataField="full_name" />
                                <asp:BoundField HeaderText="Status" DataField="account_status" />
                                <asp:BoundField HeaderText="DOB" DataField="dob" />
                                <asp:BoundField HeaderText="Contact" DataField="phone" />
                                <asp:BoundField HeaderText="Email" DataField="email" />
                                <asp:BoundField HeaderText="State" DataField="state" />
                                <asp:BoundField HeaderText="City" DataField="city" />
                                <asp:BoundField HeaderText="Pincode" DataField="pincode" />
                                <asp:BoundField HeaderText="Address" DataField="address" />
                                <asp:BoundField HeaderText="CTC" DataField="ctc" />
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
