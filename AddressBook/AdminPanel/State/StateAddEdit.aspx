<%@ Page Title="" Language="C#" MasterPageFile="~/Content/AddressBookMasterPage.Master" AutoEventWireup="true" CodeBehind="StateAddEdit.aspx.cs" Inherits="AddressBook.AdminPanel.State.StateAddEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    State
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="MasterPagebreadcrumb" runat="server">
    <asp:Label ID="lbl" runat="server" Text="State" Font-Size="20"></asp:Label>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="tab-pane" id="tab_2">
        <div class="portlet box green rounded-lg">
            <div class="portlet-title">
                <div class="caption">
                    <i class="fa fa-gift"></i>State 
                </div>
            </div>
            <div class="portlet-body form">
                <!-- BEGIN FORM--> 
                <div class="form-body">
                    <asp:Label ID="lblMsj" runat="server" Text=""></asp:Label>
                    <h3 class="form-section">State Details</h3>
                    <div class="row margin-bottom-30">
                        <div class="col-md-6">
                            <asp:Label ID="lblCountryName" CssClass="control-label col-md-3" runat="server" Text="Country Name">
                                <asp:RequiredFieldValidator ID="rfvCountryName" runat="server" ErrorMessage="**" Display="Dynamic" ForeColor="Red" ControlToValidate="txtStateName" ValidationGroup="AddData"></asp:RequiredFieldValidator>
                            </asp:Label>
                            <div class="col-md-9">
                                <asp:DropDownList ID="ddlCountry" CssClass="form-control" runat="server"></asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <asp:Label ID="lblStateName" CssClass="control-label col-md-3" runat="server" Text="State Name">
                                    <asp:RequiredFieldValidator ID="rfvStateName" runat="server" ErrorMessage="**" Display="Dynamic" ForeColor="Red" ControlToValidate="txtStateName" ValidationGroup="AddData"></asp:RequiredFieldValidator>
                                </asp:Label>
                                <div class="col-md-9">
                                    <asp:TextBox ID="txtStateName" CssClass="form-control" Placeholder="Gujarat" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row mb-5">
                        <!--/span-->
                        <div class="col-md-6">
                            <div class="form-group">
                                <asp:Label ID="lblStateCode" CssClass="control-label col-md-3" runat="server" Text="State Code">
                                    <asp:RequiredFieldValidator ID="rfvtxtStateCode" runat="server" ErrorMessage="**" Display="Dynamic" ForeColor="Red" ControlToValidate="txtStateCode" ValidationGroup="AddData"></asp:RequiredFieldValidator>
                                </asp:Label>
                                <div class="col-md-9">
                                    <asp:TextBox ID="txtStateCode" CssClass="form-control" Placeholder="GJ" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <asp:Label ID="lblStateCapital" CssClass="control-label col-md-3" runat="server" Text="State Capital">
                                    <asp:RequiredFieldValidator ID="rfvStateCapital" runat="server" ErrorMessage="**" Display="Dynamic" ForeColor="Red" ControlToValidate="txtStateCapital" ValidationGroup="AddData"></asp:RequiredFieldValidator>
                                </asp:Label>
                                <div class="col-md-9">
                                    <asp:TextBox ID="txtStateCapital" CssClass="form-control" Placeholder="Gandhinagar" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <!--/span-->
                    </div>
                </div>
                <div class="form-actions">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="row">
                                <div class="col-md-offset-3 col-md-9">
                                    <asp:Button ID="btnAdd" CssClass="btn green rounded-lg" runat="server" Text="Submit" OnClick="btnAdd_Click" ValidationGroup="AddData" />
                                    <asp:Button ID="btnCancel" CssClass="btn default rounded-lg" runat="server" Text="Cancel" OnClick="btnCancel_Click"/>
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
