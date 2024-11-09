<%@ Page Title="" Language="C#" MasterPageFile="~/Content/AddressBookMasterPage.Master" AutoEventWireup="true" CodeBehind="CityAddEdit.aspx.cs" Inherits="AddressBook.AdminPanel.City.CityAddEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    City
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="MasterPagebreadcrumb" runat="server">
    <asp:Label ID="lbl" runat="server" Text="City" Font-Size="20"></asp:Label>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="tab-pane" id="tab_2">
        <div class="portlet box green rounded-lg">
            <div class="portlet-title">
                <div class="caption">
                    <i class="fa fa-gift"></i>City 
                </div>
            </div>
            <div class="portlet-body form">
                <!-- BEGIN FORM-->
                <div class="form-body">
                    <asp:Label ID="lblMsj" runat="server" Text=""></asp:Label>
                    <h3 class="form-section">City Details</h3>
                    <div class="row margin-bottom-30">
                        <div class="col-md-6">
                            <asp:Label ID="lblCountryName" CssClass="control-label col-md-3" runat="server" Text="Country Name">
                                <asp:RequiredFieldValidator ID="rfvCountryName" runat="server" ErrorMessage="**" Display="Dynamic" ForeColor="Red" ControlToValidate="ddlCountry" ValidationGroup="AddData"></asp:RequiredFieldValidator>
                            </asp:Label>
                            <div class="col-md-9">
                                <asp:DropDownList ID="ddlCountry" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlCountry_SelectedIndexChanged" runat="server"></asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <asp:Label ID="lblState" CssClass="control-label col-md-3" runat="server" Text="State Name">
                                <asp:RequiredFieldValidator ID="rfvState" runat="server" ErrorMessage="**" Display="Dynamic" ForeColor="Red" ControlToValidate="ddlState" ValidationGroup="AddData"></asp:RequiredFieldValidator>
                            </asp:Label>
                            <div class="col-md-9">
                                <asp:DropDownList ID="ddlState" CssClass="form-control" runat="server"></asp:DropDownList>
                            </div>
                        </div>
                    </div>
                    <div class="row mb-5">
                        <!--/span-->
                        <div class="col-md-6">
                            <div class="form-group">
                                <asp:Label ID="lblCityName" CssClass="control-label col-md-3" runat="server" Text="City Name">
                                    <asp:RequiredFieldValidator ID="rfvCityName" runat="server" ErrorMessage="**" Display="Dynamic" ForeColor="Red" ControlToValidate="txtCityName" ValidationGroup="AddData"></asp:RequiredFieldValidator>
                                </asp:Label>
                                <div class="col-md-9">
                                    <asp:TextBox ID="txtCityName" CssClass="form-control" Placeholder="Gujarat" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <asp:Label ID="lblCityCode" CssClass="control-label col-md-3" runat="server" Text="City Code">
                                    <asp:RequiredFieldValidator ID="rfvtxtCityCode" runat="server" ErrorMessage="**" Display="Dynamic" ForeColor="Red" ControlToValidate="txtCityCode" ValidationGroup="AddData"></asp:RequiredFieldValidator>
                                </asp:Label>
                                <div class="col-md-9">
                                    <asp:TextBox ID="txtCityCode" CssClass="form-control" Placeholder="GJ" runat="server"></asp:TextBox>
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
