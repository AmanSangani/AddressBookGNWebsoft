<%@ Page Title="" Language="C#" MasterPageFile="~/Content/AddressBookMasterPage.Master" AutoEventWireup="true" CodeBehind="CityAddMany.aspx.cs" Inherits="AddressBook.AdminPanel.City.CityAddMany" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    CityAddMany
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MasterPageLinks" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MasterPagebreadcrumb" runat="server">
    <asp:Label ID="lbl" runat="server" Text="City" Font-Size="20"></asp:Label>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="row">
        <div class="col-md-12 ">
            <!-- BEGIN SAMPLE FORM PORTLET-->
            <div class="portlet light bordered rounded-4">
                <div class="portlet-title">
                    <div class="caption">
                        <i class="icon-bubbles font-green-sharp"></i>
                        <span class="caption-subject font-green-sharp bold uppercase">Number Of Rows</span>
                    </div>
                </div>
                <div class="portlet-body form">
                    <!-- BEGIN FORM-->
                    <div class="form-body">
                        <asp:Label ID="lblMsj" runat="server" Text=""></asp:Label>
                        <div class="row ">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <div class="input-group">
                                        <span class="input-group-addon">
                                            <i class="fa fa-envelope"></i>
                                            <asp:RequiredFieldValidator ID="rfvCityName" runat="server" ErrorMessage="**" Display="Dynamic" ForeColor="Red" ControlToValidate="txtNumOfRow" ValidationGroup="AddData"></asp:RequiredFieldValidator>
                                        </span>
                                        <asp:TextBox ID="txtNumOfRow" runat="server" CssClass="form-control" Placeholder="Enter Number of Rows" TextMode="Number"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-actions">
                            <div class="row">
                                <div class="col-md-9 col-sm-9">
                                    <asp:Button ID="btnLoad" runat="server" OnClick="btnLoad_Click" CssClass="btn blue-soft" Text="Load" ValidationGroup="AddData" />
                                </div>
                            </div>
                        </div>
                        <!-- END FORM-->
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="portlet light bordered rounded-4">
        <div class="portlet-title">
            <div class="caption font-dark">
                <i class="icon-settings font-dark"></i>
                <span class="caption-subject bold uppercase font-green-sharp">Add Data</span>
            </div>
        </div>
        <div class="portlet-body">
            <asp:Label ID="lblErrMsj" runat="server" Text="" EnableViewCity="false"></asp:Label>
            <div class="row display-none" id="columnDisplay" runat="server">
                <div class="col-md-3" id="Div5" runat="server">
                    <h4>Country </h4>
                </div>
                <div class="col-md-3" id="Div2" runat="server">
                    <h4>State</h4>
                </div>
                <div class="col-md-3" id="Div1" runat="server">
                    <h4>City Name</h4>
                </div>
                <div class="col-md-3" id="Div3" runat="server">
                    <h4>City Code</h4>
                </div>
            </div>
            <div class="row">
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <fieldset>
                            <asp:Repeater ID="rptLoadRows" runat="server">
                                <ItemTemplate>
                                    <div class="col-md-3">
                                        <asp:DropDownList ID="ddlCountry" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlCountry_SelectedIndexChanged" runat="server"></asp:DropDownList>
                                    </div>
                                    <div class="col-md-3">
                                        <asp:DropDownList ID="ddlState" CssClass="form-control" runat="server"></asp:DropDownList>
                                    </div>
                                    <div class="col-md-3">
                                        <asp:TextBox ID="txtCityName" runat="server" CssClass="form-control margin-bottom-15"></asp:TextBox>
                                    </div>
                                    <div class="col-md-3">
                                        <asp:TextBox ID="txtCityCode" runat="server" CssClass="form-control margin-bottom-15"></asp:TextBox>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </fieldset>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            <div class="row">
                <div class="col-md-4" id="Div4" runat="server">
                    <asp:Button ID="btnSave" CssClass="btn btn-green" runat="server" OnClick="btnSave_Click" Text="Save" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
