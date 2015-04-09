<%@ Page Title="" Language="C#" MasterPageFile="~/AlgonquinMasterPage3.master" AutoEventWireup="true" CodeFile="UserManagement.aspx.cs" Inherits="UserManagement_UserManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../App_Themes/StyleSheet.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="smUserManagement" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

    <%--<asp:Panel ID="pnlUserManagement" runat="server">--%>
        <h1>User Management</h1>
        <asp:Label ID="lbl" runat="server" CssClass="listLabel" Text="Following Employees in the company:"></asp:Label>
        <div>
            <br />
            <asp:GridView ID="gridEmployees" runat="server" DataKeyNames="EmployeeID" AutoGenerateColumns="false"
                BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px"
                CellPadding="4" Font-Size="X-Small" ForeColor="Black" GridLines="Horizontal" OnSelectedIndexChanged="gridEmployees_SelectedIndexChanged">
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

                <Columns>
                    <asp:BoundField DataField="EmployeeID" />
                    <asp:BoundField DataField="LastName" />
                    <asp:BoundField DataField="FirstName" />
                    <asp:BoundField DataField="Title" />
                    <asp:BoundField DataField="Email" />
                    <asp:BoundField DataField="SecurityLevel" />
                </Columns>
            </asp:GridView>
        </div>

        <%--<div class="row">
            <asp:Label ID="lblEmployeeID" runat="server" CssClass="label" Text="Employee ID:" />
            <asp:TextBox ID="tbEmployeeId" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ID="rfvEmployeeId" ControlToValidate="tbEmployeeId" Display="Static" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>--%>
        <div class="row">
            <asp:Label ID="lblLastName" CssClass="label" runat="server" Text="Last Name:" />
            <asp:TextBox ID="tbLastName" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvLastName" ControlToValidate="tbLastName" CssClass="error" Display="Static" ErrorMessage="Required!" runat="server" />
        </div>
        <div class="row">
            <asp:Label ID="lblFirstName" CssClass="label" runat="server" Text="First Name:" />
            <asp:TextBox ID="tbFirstName" runat="server" />
            <asp:RequiredFieldValidator ID="rfvFirstName" ControlToValidate="tbFirstName" CssClass="error" Display="Static" ErrorMessage="Required!" runat="server" />
        </div>
        <div class="row">
            <asp:Label ID="lblTitle" runat="server" CssClass="label" Text="Title:"></asp:Label>
            <asp:TextBox ID="tbTitle" runat="server"></asp:TextBox>
        </div>
        <div class="row">
            <asp:Label ID="lblEmail" runat="server" CssClass="label" Text="Email:"></asp:Label>
            <asp:TextBox ID="tbEmail" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvEmail" ControlToValidate="tbEmail" CssClass="error" Display="Static" ErrorMessage="Required!" runat="server" />
        </div>
        <div class="row">
            <asp:Label ID="lblPassword" runat="server" CssClass="label" Text="Password:"></asp:Label>
            <asp:TextBox ID="tbPassword" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvPassword" ControlToValidate="tbPassword" CssClass="error" Display="Static" ErrorMessage="Required!" runat="server" />
        </div>
        <div class="row">
            <asp:DropDownList ID="ddlSecurityLevel" runat="server">
                <asp:ListItem Value="Admin" Selected="False">Administrator</asp:ListItem>
                <asp:ListItem Value="User">Normal User</asp:ListItem>
            </asp:DropDownList>
        </div>
        <asp:Button ID="btAddNewEmployee" runat="server" CssClass="submissionButton" OnClick="btAddNewEmployee_Click" Text="Add new Employee" />
        <asp:Button ID="btUpdateEmployee" runat="server" CssClass="submissionButton" OnClick="btUpdateEmployee_Click" Text="Update Employee" />
        <asp:Button ID="btDeleteEmployee" runat="server" OnClick="btDeleteEmployee_Click" Text="Delete Selected Employee" CssClass="submissionButton" CausesValidation="false" />
        <br />
        <asp:Button ID="btAddNewOrder" runat="server" Text="Add New Order" OnClick="btAddNewOrder_Click" />
        <div>
            <asp:Label ID="lblResult" runat="server" CssClass="label, error" Text="" ViewStateMode="Disabled" />
        </div>
            
        </ContentTemplate>
    </asp:UpdatePanel>
    <%--</asp:Panel>--%>
</asp:Content>

