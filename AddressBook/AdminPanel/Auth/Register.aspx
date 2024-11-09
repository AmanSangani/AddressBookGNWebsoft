<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="AddressBook.AdminPanel.Auth.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register</title>
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
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="card mt-5">
                        <div class="card-header text-center">
                            <h3>Register</h3>
                        </div>
                        <div class="card-body">
                            <asp:Label ID="lblMessage" runat="server" ForeColor="Red" Text=""></asp:Label>
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
                            <div class="form-group">
                                <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label>
                                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ErrorMessage="**" ControlToValidate="txtEmail" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="revEmail" runat="server" ErrorMessage="Invalid email format" ControlToValidate="txtEmail" ValidationExpression="\w+([-+.'\w])*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="Red"></asp:RegularExpressionValidator>
                                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Enter email"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="lblDisplayName" runat="server" Text="Display Name"></asp:Label>
                                <asp:RequiredFieldValidator ID="rfvDisplayName" runat="server" ErrorMessage="**" ControlToValidate="txtDisplayName" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:TextBox ID="txtDisplayName" runat="server" CssClass="form-control" placeholder="Enter display name"></asp:TextBox>
                            </div>
                            <div class="form-group text-center">
                                <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn btn-success btn-block" OnClick="btnRegister_Click" />
                            </div>
                            <div class="form-group text-center">
                                <asp:Label ID="lblLogin" runat="server" Text="Already have account? "></asp:Label>
                                <asp:HyperLink ID="hlLogin" runat="server" Text="Login" NavigateUrl="~/AdminPanel/Auth/Login.aspx"></asp:HyperLink>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </form>
</body>
</html>
