<%@ Page Title="" Language="C#" MasterPageFile="~/AlgonquinMasterPage3.master" AutoEventWireup="true" CodeFile="AddNewOrder.aspx.cs" Inherits="AddOrder_AddNewUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../App_Themes/StyleSheet.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    
            <h4>Add New Order</h4>
       
            <div class="row">
                <asp:Label ID="lbEmployeeID" CssClass="label" runat="server" Text="Employee ID:" />
                <asp:Label ID="lblDisplayEmployeeID" runat="server"></asp:Label>
            </div>
            <div class="row">
                <asp:Label ID="lblCustomerID" CssClass="label" runat="server" Text="Customer ID:" />
                <asp:TextBox ID="tbCustomerID" runat="server"></asp:TextBox>
            </div>
            <div class="row">
                <asp:Label ID="lblOrderDate" CssClass="label" runat="server" Text="Order Date:" />
                <asp:TextBox ID="tbOrderDate" runat="server"></asp:TextBox>
            </div>
            <div class="row">
                <asp:Label ID="lblRequiredDate" CssClass="label" runat="server" Text="Required Date:" />
                <asp:TextBox ID="tbRequiredDate" runat="server"></asp:TextBox>
            </div>
            <div class="row">
                <asp:DropDownList ID="ddlShipVia" CssClass="dropdown" runat="server">
                    <asp:ListItem Value="1">Flight</asp:ListItem>
                    <asp:ListItem Value="2">Ship</asp:ListItem>
                    <asp:ListItem Value="3">Train</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="row">
                <asp:Button ID="btnAddOrder" runat="server" CssClass="submissionButton" Text="Add Order" OnClick="btnAddOrder_Click" />
            </div>

            <div class="row">
                <asp:Label ID="lblError" runat="server" Width="600px" ForeColor="Red" Visible="false"></asp:Label>
            </div>        
</asp:Content>

