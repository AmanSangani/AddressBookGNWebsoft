<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="AddressBook.AdminPanel.Auth.ChangePassword" %>

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
                            <h3>Change Password</h3>
                        </div>
                        <div class="card-body">
                            <div class="form-group" id="DIV_Password" runat="server">
                                <asp:Label ID="lblPassword" runat="server" Text="Password"></asp:Label>
                                <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ErrorMessage="**" ControlToValidate="txtPassword" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="Enter Password"></asp:TextBox>
                            </div>
                            <div class="form-group" id="DIV_ConfirmPassword" runat="server">
                                <asp:Label ID="lblConfirmPassword" runat="server" Text="Confirm Password"></asp:Label>
                                <asp:RequiredFieldValidator ID="rfvConfirmPassword" runat="server" ErrorMessage="**" ControlToValidate="txtConfirmPassword" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="cvConfirmPassword" runat="server" ControlToValidate="txtConfirmPassword" ControlToCompare="txtPassword" ForeColor="Red" ErrorMessage="Password Mismatch"></asp:CompareValidator>
                                <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="Confirm Password"></asp:TextBox>
                            </div>
                            <div class="form-group text-center" id="DIV_btnSave" runat="server" >
                                <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-primary btn-block" OnClick="btnSave_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </form>
</body>
</html>
