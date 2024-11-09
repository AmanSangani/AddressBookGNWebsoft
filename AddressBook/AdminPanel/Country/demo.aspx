<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="demo.aspx.cs" Inherits="AddressBook.AdminPanel.Country.demo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:TextBox ID="txtNumberOfTextBoxes" runat="server" CssClass="form-control" placeholder="Enter number of TextBoxes"></asp:TextBox>
            <asp:Button ID="btnGenerate" runat="server" Text="Generate TextBoxes" OnClick="btnGenerate_Click" CssClass="btn btn-primary" />
            <asp:Button ID="btnRetrieve" runat="server" Text="Retrieve Values" OnClick="btnRetrieve_Click" CssClass="btn btn-success" />
            <br />
            <br />

            <!-- Panel to hold dynamically generated TextBoxes -->
            <asp:Panel ID="mainPanel" runat="server"></asp:Panel>
            <br />
            <br />

            <!-- Label to display the results -->
            <asp:Label ID="lblResult" runat="server" Text="" CssClass="result-label"></asp:Label>
        </div>
    </form>
</body>
</html>
