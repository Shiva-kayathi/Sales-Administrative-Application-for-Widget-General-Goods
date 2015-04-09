<%@ Page Title="" Language="C#" MasterPageFile="~/AlgonquinMasterPage3.master" AutoEventWireup="true" CodeFile="CustomerManagement.aspx.cs" Inherits="CustomerManagement_CustomerManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../App_Themes/StyleSheet.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <h1>Customer Management</h1>
        <asp:Label ID="lbl" runat="server" CssClass="listLabel" Text="Following Customers in the database:"></asp:Label>
        <div>
            <br />
            <asp:GridView ID="gridCustmoers" runat="server" DataKeyNames="CustomerID" AutoGenerateColumns="true"
                BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px"
                CellPadding="4" Font-Size="X-Small" ForeColor="Black" GridLines="Horizontal" OnSelectedIndexChanged="gridCustmoers_SelectedIndexChanged">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                </Columns>
                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                <SortedDescendingHeaderStyle BackColor="#242121" />

            </asp:GridView>
        </div>

        <div class="row" id="divCustomerId">
            <asp:Label ID="lblCustomerID" runat="server" CssClass="label" Text="Customer ID:" />
            <asp:TextBox ID="tbCustomerId" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ID="rfvCustomerId" ControlToValidate="tbCustomerId" Display="Static" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
        <div class="row">
            <asp:Label ID="lblCompanyName" CssClass="label" runat="server" Text="Company Name:" />
            <asp:TextBox ID="tbCompanyName" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvCompanyName" ControlToValidate="tbCompanyName" CssClass="error" Display="Static" ErrorMessage="Required!" runat="server" />
        </div>
        <div class="row">
            <asp:Label ID="lblContectName" CssClass="label" runat="server" Text="Contect Name:" />
            <asp:TextBox ID="tbContectName" runat="server" />
        </div>
        <div class="row">
            <asp:Label ID="lblContectTitle" runat="server" CssClass="label" Text="Contect Title:"></asp:Label>
            <asp:TextBox ID="tbContectTitle" runat="server"></asp:TextBox>
        </div>
        <div class="row">
            <asp:Label ID="lblAddress" runat="server" CssClass="label" Text="Address:"></asp:Label>
            <asp:TextBox ID="tbAddress" runat="server"></asp:TextBox>
        </div>
        <div class="row">
            <asp:Label ID="lblPhone" runat="server" CssClass="label" Text="Phone:"></asp:Label>
            <asp:TextBox ID="tbPhone" runat="server"></asp:TextBox>
        </div>
        <asp:Button ID="btAddNewCustomer" runat="server" CssClass="submissionButton" OnClick="btAddNewCustomer_Click" Text="Add new Customer" />
        <asp:Button ID="btUpdateCustomer" runat="server" CssClass="submissionButton" OnClick="btUpdateCustomer_Click" Text="Update Customer" />
        <asp:Button ID="btDeleteCustomer" runat="server" CssClass="submissionButton" OnClick="btDeleteCustomer_Click" Text="Delete Selected Customer" CausesValidation="false"  />
        <br />
        <asp:Button ID ="btAddNewOrder" runat="server" CssClass="submissionButton" OnClick="btAddNewOrder_Click" Text="Add New Order" />
        <div>
            <asp:Label ID="lblError" runat="server" CssClass="label, error" Text="" ViewStateMode="Disabled" />
        </div>
</asp:Content>

