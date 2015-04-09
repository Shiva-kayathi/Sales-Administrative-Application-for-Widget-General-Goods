<%@ Page Title="" Language="C#" MasterPageFile="~/AlgonquinMasterPage3.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="App_Themes/StyleSheet.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Panel ID="pnlLogin" runat="server" CssClass="panel">
         <h1>Widget General Goods</h1>
         <p>Welcome to Widget General Goods system.</p>
        <div class="row">
            <asp:Label ID="lblUserName" Text="User Name:" runat="server" CssClass="label"></asp:Label>
            <asp:TextBox ID="tbxUserName" runat="server"></asp:TextBox>
        </div>
        <div class="row">
            <asp:Label ID="lblPassword" Text="Password:" runat="server" CssClass="label"></asp:Label>
            <asp:TextBox ID="tbxPassword" runat="server"></asp:TextBox>
        </div>
        <asp:CheckBox ID="cbxRemember" runat="server" Text="Remember Me" />
        <div class="row">
            <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="submissionButton" OnClick="btnLogin_Click" />
            <asp:Button ID="btnClear" runat="server" Text="Reset" CssClass="submissionButton" OnClick="btnClear_Click" />
        </div> 
        <asp:Label ID="lblError" runat="server" Visible="false"></asp:Label>          
    </asp:Panel>
</asp:Content>

