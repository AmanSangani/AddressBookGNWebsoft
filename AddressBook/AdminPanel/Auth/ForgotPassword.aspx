<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="AddressBook.AdminPanel.Auth.ForgotPassword" %>

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
        <div class="container bg-grey">
            <asp:Label ID="lblMessage" runat="server" EnableViewState="false" ForeColor="Red" Text=""></asp:Label>
            <div class="row justify-content-center">
                <div class="col-md-5">
                    <div class="card mt-5">
                        <div class="card-header text-center">
                            <h3>ForgotPassword</h3>
                        </div>
                        <div class="card-body">
                            <div class="form-group" id="DIV_Username" runat="server">
                                <asp:Label ID="lblUsername" runat="server" Text="Username"></asp:Label>
                                <asp:RequiredFieldValidator ID="rfvUsername" runat="server" ErrorMessage="**" ControlToValidate="txtUsername" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Enter username"></asp:TextBox>
                            </div>
                            <div class="form-group" id="DIV_Email" runat="server">
                                <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label>
                                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ErrorMessage="**" ControlToValidate="txtEmail" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="revEmail" runat="server" ErrorMessage="Invalid email format" ControlToValidate="txtEmail" ValidationExpression="\w+([-+.'\w])*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="Red"></asp:RegularExpressionValidator>
                                <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" CssClass="form-control" placeholder="Enter Email"></asp:TextBox>
                            </div>
                            <div class="form-group" id="DIV_OTP" runat="server" visible="false" >
                                <asp:Label ID="lblOTP" runat="server" Text="OTP"></asp:Label>
                                <asp:RequiredFieldValidator ID="rfvOTP" runat="server" ErrorMessage="**" ControlToValidate="txtOTP" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:TextBox ID="txtOTP" runat="server" CssClass="form-control" placeholder="Enter OTP"></asp:TextBox>
                            </div>
                            <div class="form-group text-center" id="DIV_btnCheck" runat="server">
                                <asp:Button ID="btnCheck" runat="server" Text="Validate" CssClass="btn btn-primary btn-block" OnClick="btnCheck_Click" />
                            </div>
                            <div class="form-group text-center" id="DIV_btnSendOTP" runat="server" visible="false">
                                <asp:Button ID="btnSendOTP" runat="server" Text="Send OTP" CssClass="btn btn-primary btn-block" OnClick="btnSendOTP_Click" />
                            </div>
                            <div class="form-group text-center" id="DIV_btnVerify" runat="server" visible="false">
                                <asp:Button ID="btnVerifyOTP" runat="server" Text="Verify OTP" CssClass="btn btn-primary btn-block" OnClick="btnVerifyOTP_Click" />
                            </div>
                            <div class="form-group text-center">
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
