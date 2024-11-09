<%@ Page Title="" Language="C#" MasterPageFile="~/Content/AddressBookMasterPage.Master" AutoEventWireup="true" CodeBehind="ContactAddEdit.aspx.cs" Inherits="AddressBook.AdminPanel.Contact.ContactAddEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    Contact
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="MasterPagebreadcrumb" runat="server">
    <asp:Label ID="lbl" runat="server" Text="Contact" Font-Size="20"></asp:Label>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="tab-pane" id="tab_2">
        <div class="portlet box green rounded-lg">
            <div class="portlet-title">
                <div class="caption">
                    <i class="fa fa-gift"></i>Contact 
                </div>
            </div>
            <div class="portlet-body form">
                <!-- BEGIN FORM-->
                <div class="form-body">
                    <asp:Label ID="lblMsj" runat="server" Text=""></asp:Label>
                    <h3 class="form-section">Contact Details</h3>
                    <div class="row margin-bottom-20">
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                            <ContentTemplate>
                                <fieldset>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblCountryName" CssClass="control-label col-md-4" runat="server" Text="Country Name">
                                            <asp:RequiredFieldValidator ID="rfvCountryName" runat="server" ErrorMessage="**" InitialValue="-1" Display="Dynamic" ForeColor="Red" ControlToValidate="ddlCountry" ValidationGroup="AddData"></asp:RequiredFieldValidator>
                                        </asp:Label>
                                        <div class="col-md-8">
                                            <asp:DropDownList ID="ddlCountry" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlCountry_SelectedIndexChanged" runat="server"></asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblState" CssClass="control-label col-md-4" runat="server" Text="State Name">
                                            <asp:RequiredFieldValidator ID="rfvState" runat="server" ErrorMessage="**" InitialValue="-1" Display="Dynamic" ForeColor="Red" ControlToValidate="ddlState" ValidationGroup="AddData"></asp:RequiredFieldValidator>
                                        </asp:Label>
                                        <div class="col-md-8">
                                            <asp:DropDownList ID="ddlState" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlState_SelectedIndexChanged" runat="server"></asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:Label ID="Label1" CssClass="control-label col-md-4" runat="server" Text="City Name">
                                            <asp:RequiredFieldValidator ID="rfvCity" runat="server" ErrorMessage="**" InitialValue="-1" Display="Dynamic" ForeColor="Red" ControlToValidate="ddlCity" ValidationGroup="AddData"></asp:RequiredFieldValidator>
                                        </asp:Label>
                                        <div class="col-md-8">
                                            <asp:DropDownList ID="ddlCity" CssClass="form-control" runat="server"></asp:DropDownList>
                                        </div>
                                    </div>
                                </fieldset>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                    <div class="row margin-bottom-20">
                        <!--/span-->
                        <div class="col-md-4">
                            <div class="form-group">
                                <asp:Label ID="lblName" CssClass="control-label col-md-4" runat="server" Text="Name">
                                    <asp:RequiredFieldValidator ID="rfvName" runat="server" ErrorMessage="**" Display="Dynamic" ForeColor="Red" ControlToValidate="txtName" ValidationGroup="AddData"></asp:RequiredFieldValidator>
                                </asp:Label>
                                <div class="col-md-8">
                                    <asp:TextBox ID="txtName" CssClass="form-control" Placeholder="Aman" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <asp:Label ID="lblMobile" CssClass="control-label col-md-4" runat="server" Text="Mobile">
                                    <asp:RequiredFieldValidator ID="rfvMobile" runat="server" ErrorMessage="**" Display="Dynamic" ForeColor="Red" ControlToValidate="txtMobile" ValidationGroup="AddData"></asp:RequiredFieldValidator>
                                </asp:Label>
                                <div class="col-md-8">
                                    <asp:TextBox ID="txtMobile" CssClass="form-control" Placeholder="Mobile" runat="server"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="revMobileNo" runat="server" ForeColor="Red" ValidationGroup="AddData" ErrorMessage="Enter valid Mobile No" ControlToValidate="txtMobile" ValidationExpression="^[7-9][0-9]{9}$"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <asp:Label ID="lblWhatsapp" CssClass="control-label col-md-4" runat="server" Text="Whatsapp">
                                </asp:Label>
                                <div class="col-md-8">
                                    <asp:TextBox ID="txtWhatsapp" CssClass="form-control" Placeholder="Mobile" runat="server"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="revWhatsapp" runat="server" ForeColor="Red" ValidationGroup="AddData"  ErrorMessage="Enter valid Mobile No" ControlToValidate="txtWhatsapp" ValidationExpression="^[7-9][0-9]{9}$"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                        </div>
                        <!--/span-->
                    </div>
                    <div class="row margin-bottom-20">
                        <!--/span-->
                        <div class="col-md-4">
                            <div class="form-group">
                                <asp:Label ID="lblGender" CssClass="control-label col-md-4" runat="server" Text="Gender">
                                </asp:Label>
                                <div class="col-md-8">
                                    <asp:RadioButtonList ID="rblGender" runat="server" RepeatDirection="Horizontal" CellSpacing="5" CellPadding="5">
                                        <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                                        <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <asp:Label ID="lblDOB" CssClass="control-label col-md-4" runat="server" Text="DOB">
                                </asp:Label>
                                <div class="col-md-8">
                                    <asp:TextBox ID="txtDOB" TextMode="Date" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <asp:Label ID="lblBloodGroup" CssClass="control-label col-md-4" runat="server" Text="BloodGroup">
                                </asp:Label>
                                <div class="col-md-8">
                                    <asp:DropDownList ID="ddlBloodGroup" CssClass="form-control" runat="server">
                                        <asp:ListItem Text="Select Blood Group" Value="-1"></asp:ListItem>
                                        <asp:ListItem Text="A+" Value="A+"></asp:ListItem>
                                        <asp:ListItem Text="A-" Value="A-"></asp:ListItem>
                                        <asp:ListItem Text="B+" Value="B+"></asp:ListItem>
                                        <asp:ListItem Text="B-" Value="B-"></asp:ListItem>
                                        <asp:ListItem Text="AB+" Value="AB+"></asp:ListItem>
                                        <asp:ListItem Text="AB-" Value="AB-"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <!--/span-->
                    </div>
                    <div class="row margin-bottom-20">
                        <!--/span-->
                        <div class="col-md-4">
                            <div class="form-group">
                                <asp:Label ID="lblEmail" CssClass="control-label col-md-4" runat="server" Text="Email">
                                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ErrorMessage="**" Display="Dynamic" ForeColor="Red" ControlToValidate="txtEmail" ValidationGroup="AddData"></asp:RequiredFieldValidator>
                                </asp:Label>
                                <div class="col-md-8">
                                    <asp:TextBox ID="txtEmail" CssClass="form-control" Placeholder="aman@gmail.com" runat="server"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="revEmail" runat="server" ErrorMessage="Invalid email format" ValidationGroup="AddData"  ControlToValidate="txtEmail" ValidationExpression="\w+([-+.'\w])*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="Red"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-8">
                            <div class="form-group">
                                <asp:Label ID="lblAddress" CssClass="control-label col-md-2" runat="server" Text="Address">
                                </asp:Label>
                                <div class="col-md-10">
                                    <asp:TextBox ID="txtAddress" CssClass="form-control" Placeholder="Address" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <!--/span-->
                    </div>
                    <div class="row margin-bottom-20">
                        <!--/span-->
                        <div class="col-md-4">
                            <div class="form-group">
                                <asp:Label ID="lblFacebook" CssClass="control-label col-md-4" runat="server" Text="Facebook">
                                </asp:Label>
                                <div class="col-md-8">
                                    <asp:TextBox ID="txtFacebook" CssClass="form-control" Placeholder="Facebook" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <asp:Label ID="lblInstagram" CssClass="control-label col-md-4" runat="server" Text="Instagram">
                                </asp:Label>
                                <div class="col-md-8">
                                    <asp:TextBox ID="txtInstagram" CssClass="form-control" Placeholder="Instagram" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <!--/span-->
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <asp:Label ID="lblContactCategory" CssClass="control-label col-md-2" runat="server" Text="ContactCategory">
                                </asp:Label>
                                <div class="col-md-10">
                                    <asp:CheckBoxList ID="cblContactCategory" CssClass="" runat="server"  CellSpacing="10" CellPadding="2" RepeatDirection="Horizontal">
                                        
                                    </asp:CheckBoxList>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-actions">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="row">
                                <div class="col-md-offset-3 col-md-9">
                                    <asp:Button ID="btnAdd" CssClass="btn green rounded-lg" runat="server" Text="Submit" OnClick="btnAdd_Click" ValidationGroup="AddData" />
                                    <asp:Button ID="btnCancel" CssClass="btn default rounded-lg" runat="server" OnClick="btnCancel_Click" Text="Cancel" />
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6"></div>
                    </div>
                </div>
                <!-- END FORM-->
            </div>
        </div>
    </div>
</asp:Content>
