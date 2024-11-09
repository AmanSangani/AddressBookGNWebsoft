<%@ Page Title="" Language="C#" MasterPageFile="~/Content/AddressBookMasterPage.Master" AutoEventWireup="true" CodeBehind="CountryAddEdit.aspx.cs" Inherits="AddressBook.Country.CountryAddEdit" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    Country
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="MasterPagebreadcrumb" runat="server">
    <asp:Label ID="lbl" runat="server" Text="Country" Font-Size="20"></asp:Label>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="tab-pane" id="tab_2">
        <div class="portlet box green rounded-lg">
            <div class="portlet-title">
                <div class="caption">
                    <i class="fa fa-gift"></i>Country 
                </div>
            </div>
            <div class="portlet-body form">
                <!-- BEGIN FORM-->
                    <div class="form-body">
                        <asp:Label ID="lblMsj" runat="server" Text=""></asp:Label>
                        <h3 class="form-section">Country Details</h3>
                        <div class="row margin-bottom-30">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <asp:Label ID="lblCountryName" CssClass="control-label col-md-3" runat="server" Text="Country Name">
                                    <asp:RequiredFieldValidator ID="rfvCountryName" runat="server" ErrorMessage="**" Display="Dynamic" ForeColor="Red" ControlToValidate="txtCountryName" ValidationGroup="AddData"></asp:RequiredFieldValidator>
                                    </asp:Label>
                                    <div class="col-md-9">
                                        <asp:TextBox ID="txtCountryName" CssClass="form-control" Placeholder="India" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <!--/span-->
                            <div class="col-md-6">
                                <div class="form-group">
                                    <asp:Label ID="lblCountryCode" CssClass="control-label col-md-3" runat="server" Text="Country Code">
                                    <asp:RequiredFieldValidator ID="rfvtxtCountryCode" runat="server" ErrorMessage="**" Display="Dynamic" ForeColor="Red" ControlToValidate="txtCountryCode" ValidationGroup="AddData"></asp:RequiredFieldValidator>
                                    </asp:Label>
                                    <div class="col-md-9">
                                        <asp:TextBox ID="txtCountryCode" CssClass="form-control" Placeholder="IN" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <!--/span-->
                        </div>
                        <!--/row-->
                        <div class="row margin-bottom-20">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <asp:Label ID="lblCountryCapital" CssClass="control-label col-md-3" runat="server" Text="Country Capital">
                                    <asp:RequiredFieldValidator ID="rfvCountryCapital" runat="server" ErrorMessage="**" Display="Dynamic" ForeColor="Red" ControlToValidate="txtCountryCapital" ValidationGroup="AddData"></asp:RequiredFieldValidator>
                                    </asp:Label>
                                    <div class="col-md-9">
                                        <asp:TextBox ID="txtCountryCapital" CssClass="form-control" Placeholder="New Delhi" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--/row-->
                    </div>
                    <div class="form-actions">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="row">
                                    <div class="col-md-offset-3 col-md-9">
                                        <asp:Button ID="btnAdd" CssClass="btn green rounded-lg" runat="server" Text="Submit" ValidationGroup="AddData" OnClick="btnAdd_Click"/>
                                        <asp:Button ID="btnCancel" CssClass="btn default rounded-lg" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
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
