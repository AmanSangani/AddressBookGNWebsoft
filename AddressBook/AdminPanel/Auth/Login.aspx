<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="AddressBook.AdminPanel.Auth.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
        <!-- Bootstrap CSS CDN -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Optionally include jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <!-- Bootstrap JS CDN -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <asp:Label ID="lblMessage" runat="server" ForeColor="Red" Text=""></asp:Label>
            <div class="row justify-content-center">
                <div class="col-md-5">
                    <div class="card mt-5">
                        <div class="card-header text-center">
                            <h3>Login</h3>
                        </div>
                        <div class="card-body">
                            <div class="form-group">
                                <asp:Label ID="lblUsername" runat="server" Text="Username"></asp:Label>
                                <asp:RequiredFieldValidator ID="rfvUsername" runat="server" ErrorMessage="**" ControlToValidate="txtUsername" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Enter username"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="lblPassword" runat="server" Text="Password"></asp:Label>
                                <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ErrorMessage="**" ControlToValidate="txtPassword" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="Enter password"></asp:TextBox>
                            </div>
                            <div class="form-group text-center">
                                <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn btn-primary btn-block" OnClick="btnLogin_Click" />
                            </div>
                            <div class="form-group text-center">
                                <asp:Label ID="lblRegister" runat="server" Text="Don't have account? "></asp:Label>
                                <asp:HyperLink ID="hlRegister" runat="server" Text="Register" NavigateUrl="~/AdminPanel/Auth/Register.aspx"></asp:HyperLink>
                            </div>
                            <div class="form-group text-center">
                                <asp:HyperLink ID="hlForgotPassword" runat="server" Text="Forgot Password?" NavigateUrl="~/AdminPanel/Auth/ForgotPassword.aspx"></asp:HyperLink>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </form>
</body>
</html>
