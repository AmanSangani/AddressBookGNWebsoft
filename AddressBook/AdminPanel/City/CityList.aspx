﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Content/AddressBookMasterPage.Master" AutoEventWireup="true" CodeBehind="CityList.aspx.cs" Inherits="AddressBook.AdminPanel.City.CityList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    City
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MasterPagebreadcrumb" runat="server">
    <asp:Label ID="lbl" runat="server" Text="City" Font-Size="20"></asp:Label>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="MasterPageLinks" runat="server">
    <link rel="shortcut icon" href="favicon.ico" />
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="row">
        <div class="col-md-12 ">
            <!-- BEGIN SAMPLE FORM PORTLET-->
            <div class="portlet light bordered">
                <div class="portlet-title">
                    <div class="caption">
                        <i class="icon-bubbles font-green-sharp"></i>
                        <span class="caption-subject font-green-sharp bold uppercase">Search</span>
                    </div>
                </div>
                <div class="portlet-body form">
                    <!-- BEGIN FORM-->
                    <div class="form-body">
                        <asp:Label ID="lblMsj" EnableViewState="false" runat="server" Text=""></asp:Label>
                        <div class="row ">

                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                <ContentTemplate>
                                    <fieldset>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <div class="input-group">
                                                    <span class="input-group-addon">
                                                        <i class="fa fa-envelope"></i>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="**" Display="Dynamic" ControlToValidate="ddlCountry" ForeColor="Red" InitialValue="-1" ValidationGroup="AddData"></asp:RequiredFieldValidator>
                                                    </span>
                                                    <asp:DropDownList ID="ddlCountry" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlCountry_SelectedIndexChanged" runat="server"></asp:DropDownList>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <div class="input-group">
                                                    <span class="input-group-addon">
                                                        <i class="fa fa-envelope"></i>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic" ErrorMessage="**" ControlToValidate="ddlState" ForeColor="Red" InitialValue="-1" ValidationGroup="AddData"></asp:RequiredFieldValidator>
                                                    </span>
                                                    <asp:DropDownList ID="ddlState" CssClass="form-control" runat="server"></asp:DropDownList>
                                                </div>
                                            </div>
                                        </div>
                                    </fieldset>
                                </ContentTemplate>
                            </asp:UpdatePanel>

                        </div>
                        <div class="row ">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <div class="input-group">
                                        <span class="input-group-addon">
                                            <i class="fa fa-envelope"></i>
                                        </span>
                                        <asp:TextBox ID="txtCityNameSearch" runat="server" CssClass="form-control" Placeholder="Enter City Name"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <div class="input-group">
                                        <span class="input-group-addon">
                                            <i class="fa fa-envelope"></i>
                                        </span>
                                        <asp:TextBox ID="txtCityCodeSearch" runat="server" CssClass="form-control" Placeholder="Enter City Code"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-actions">
                            <div class="row">
                                <div class="col-md-9 col-sm-9">
                                    <asp:Button ID="btnSearch" runat="server" CssClass="btn blue-soft" Text="Search" OnClick="btnDisplay_Click" ValidationGroup="AddData" />
                                    <asp:Button ID="btnClear" runat="server" CssClass="btn default" Text="Clear" OnClick="btnClear_Click" />
                                </div>
                            </div>
                        </div>
                        <!-- END FORM-->
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="alert alert-danger" id="errDisplay" runat="server">
        <strong>
            <asp:Label ID="lblInfo" runat="server" EnableViewState="false"></asp:Label>
        </strong>
    </div>

    <div class="row mt-5">
        <div class="col-md-12">
            <!-- BEGIN EXAMPLE TABLE PORTLET-->

            <div class="portlet light bordered">
                <div class="portlet-title">
                    <div class="caption font-dark">
                        <i class="icon-settings font-dark"></i>
                        <span class="caption-subject font-green-sharp bold uppercase ">Search Result</span>
                    </div>
                    <div class="actions">
                        <div class="btn-group btn-group-devided">
                            <asp:HyperLink ID="btnAdd" CssClass="btn btn-transparent btn-circle btn-sm btn-outline green-jungle active" NavigateUrl="~/AdminPanel/City/Add" runat="server" Text=" + Add New" />
                            <asp:HyperLink ID="hlAddMany" CssClass="btn btn-transparent btn-circle btn-sm btn-outline green-jungle active" NavigateUrl="~/AdminPanel/City/AddMany" runat="server"> + Add Many</asp:HyperLink>
                            <asp:Button ID="btnDelete" CssClass="btn btn-transparent btn-circle btn-sm btn-outline btn-danger active" OnClick="btnDelete_Click" runat="server" Text="Delete Selected" />
                        </div>
                    </div>
                </div>
                <div class="portlet-body display-none" id="tableDisplay" runat="server">
                    <table class="table table-striped table-bordered table-hover  table-responsive" id="sample_1">
                        <thead>
                            <tr>
                                <th class="col-md-1 text-center">
                                    <label class="mt-checkbox mt-checkbox-single mt-checkbox-outline">
                                        <input type="checkbox" id="chkAll" class="group-checkable" runat="server" data-set="#sample_1 .checkboxes" />
                                        <span></span>
                                    </label>
                                </th>
                                <th>Code</th>
                                <th>City</th>
                                <th class="text-center col-md-2">Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="rptCity" runat="server" OnItemCommand="rptCity_ItemCommand">
                                <ItemTemplate>
                                    <tr class="odd gradeX">
                                        <td class="text-center">
                                            <asp:HiddenField ID="hfCityID" Value='<%# Eval("CityID") %>' runat="server" />
                                            <label class="mt-checkbox mt-checkbox-single mt-checkbox-outline">
                                                <input type="checkbox" id="chkRow" class="checkboxes" runat="server"/>
                                                <span></span>
                                            </label>
                                        </td>
                                        <td>
                                            <asp:Label ID="lblCityCode" runat="server" Text='<%# Eval("CityCode") %>'></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="lblCityName" runat="server" Text='<%# Eval("CityName") %>'></asp:Label>
                                        </td>
                                        <td class="text-center">
                                            <asp:LinkButton ID="lbtnDelete" CssClass="text-danger" runat="server" Text="Delete" Style="padding-right: 20px;"
                                                CommandName="DeleteRecord" CommandArgument='<%# Eval("CityID").ToString() %>'>
                                                <svg  xmlns="http://www.w3.org/2000/svg"  width="24"  height="24"  viewBox="0 0 24 24"  fill="none"  stroke="currentColor"  stroke-width="2"  stroke-linecap="round"  stroke-linejoin="round"  class="icon icon-tabler icons-tabler-outline icon-tabler-trash"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M4 7l16 0" /><path d="M10 11l0 6" /><path d="M14 11l0 6" /><path d="M5 7l1 12a2 2 0 0 0 2 2h8a2 2 0 0 0 2 -2l1 -12" /><path d="M9 7v-3a1 1 0 0 1 1 -1h4a1 1 0 0 1 1 1v3" /></svg>
                                            </asp:LinkButton>
                                            <asp:HyperLink ID="hlEdit" CssClass="" runat="server" Text="Edit"
                                                NavigateUrl='<%# "~/AdminPanel/City/Edit/" + AddressBook.HelperClass.EncryptDecrypt.encrypt(Eval("CityID").ToString().Trim())  %>'
                                                CommandName="EditRecord" CommandArgument='<%# Eval("CityID").ToString() %>'>
                                                <svg  xmlns="http://www.w3.org/2000/svg"  width="24"  height="24"  viewBox="0 0 24 24"  fill="none"  stroke="currentColor"  stroke-width="2"  stroke-linecap="round"  stroke-linejoin="round"  class="icon icon-tabler icons-tabler-outline icon-tabler-edit"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M7 7h-1a2 2 0 0 0 -2 2v9a2 2 0 0 0 2 2h9a2 2 0 0 0 2 -2v-1" /><path d="M20.385 6.585a2.1 2.1 0 0 0 -2.97 -2.97l-8.415 8.385v3h3l8.385 -8.415z" /><path d="M16 5l3 3" /></svg>
                                            </asp:HyperLink>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- END EXAMPLE TABLE PORTLET-->
        </div>
    </div>
</asp:Content>
