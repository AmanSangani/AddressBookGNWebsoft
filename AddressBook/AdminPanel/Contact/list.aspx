<%@ Page Title="" Language="C#" MasterPageFile="~/Content/AddressBookMasterPage.Master" AutoEventWireup="true" CodeBehind="list.aspx.cs" Inherits="AddressBook.AdminPanel.Contact.list" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    Contact
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MasterPagebreadcrumb" runat="server">
    <asp:Label ID="lbl" runat="server" Text="Contact" Font-Size="20"></asp:Label>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <div class="row">
        <div class="col-md-12 ">
            <!-- BEGIN SAMPLE FORM PORTLET-->
            <div class="portlet light bordered rounded-4">
                <div class="portlet-title">
                    <div class="caption">
                        <i class="icon-bubbles font-green-sharp"></i>
                        <span class="caption-subject font-green-sharp bold uppercase">Search</span>
                    </div>
                    <div class="actions">
                        <div class="btn-group btn-group-devided">
                            <asp:HyperLink ID="hlAddBtn" CssClass="btn btn-transparent btn-circle btn-sm btn-outline green-jungle active" NavigateUrl="~/AdminPanel/Contact/Add" runat="server"> + Add New</asp:HyperLink>
                        </div>
                    </div>
                </div>
                <div class="portlet-body form">
                    <!-- BEGIN FORM-->
                    <div class="form-body">
                        <asp:Label ID="lblMsj" runat="server" Text=""></asp:Label>
                        <div class="row ">
                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                <ContentTemplate>
                                    <fieldset>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <div class="input-group">
                                                    <span class="input-group-addon">
                                                        <i class="fa fa-envelope"></i>
                                                    </span>
                                                    <asp:DropDownList ID="ddlCountry" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlCountry_SelectedIndexChanged" runat="server"></asp:DropDownList>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <div class="input-group">
                                                    <span class="input-group-addon">
                                                        <i class="fa fa-envelope"></i>
                                                    </span>
                                                    <asp:DropDownList ID="ddlState" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlState_SelectedIndexChanged" runat="server"></asp:DropDownList>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <div class="input-group">
                                                    <span class="input-group-addon">
                                                        <i class="fa fa-envelope"></i>
                                                    </span>
                                                    <asp:DropDownList ID="ddlCity" CssClass="form-control" runat="server"></asp:DropDownList>
                                                </div>
                                            </div>
                                        </div>
                                    </fieldset>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                        <div class="row ">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <div class="input-group">
                                        <span class="input-group-addon">
                                            <i class="fa fa-envelope"></i>
                                        </span>
                                        <asp:TextBox ID="txtContactNameSearch" runat="server" CssClass="form-control" Placeholder="Enter Name"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <div class="input-group">
                                        <span class="input-group-addon">
                                            <i class="fa fa-envelope"></i>
                                        </span>
                                        <asp:TextBox ID="txtContactNoSearch" runat="server" CssClass="form-control" Placeholder="Enter Contact Number"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <div class="input-group">
                                        <span class="input-group-addon">
                                            <i class="fa fa-envelope"></i>
                                        </span>
                                        <asp:TextBox ID="txtEmailSearch" runat="server" CssClass="form-control" Placeholder="Enter Email"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row ">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <div class="input-group">
                                        <span class="input-group-addon">
                                            <i class="fa fa-envelope"></i>
                                        </span>
                                        <asp:DropDownList ID="ddlUser" CssClass="form-control" runat="server"></asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-actions">
                            <div class="row">
                                <div class="col-md-9 col-sm-9">
                                    <asp:Button ID="btnSearch" runat="server" CssClass="btn blue-soft" Text="Search" OnClick="btnSearch_Click" />
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
    <div class="portlet-body">
        <div class="mt-element-card mt-element-overlay">
            <div class="row">
                <asp:Repeater ID="rptContact" runat="server">
                    <ItemTemplate>
                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                            <div class="mt-card-item">
                                <div class="mt-card-avatar mt-overlay-1">
                                    <img src="../../assets/pages/img/avatars/team5.jpg" />
                                    <div class="mt-overlay">
                                        <ul class="mt-info">
                                            <li>
                                                <div class="todo-container">
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <h4 class="todo-inline">
                                                                <asp:LinkButton ID="lbtnDelete" CssClass="btn btn-danger btn-sm rounded-lg mr-3" runat="server"
                                                                    Text="" CommandArgument='<%# Eval("ContactID").ToString() %>' OnClick="btnDelete_Click">
                                                                    <svg  xmlns="http://www.w3.org/2000/svg"  width="24"  height="24"  viewBox="0 0 24 24"  fill="none"  stroke="currentColor"  stroke-width="2"  stroke-linecap="round"  stroke-linejoin="round"  class="icon icon-tabler icons-tabler-outline icon-tabler-trash"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M4 7l16 0" /><path d="M10 11l0 6" /><path d="M14 11l0 6" /><path d="M5 7l1 12a2 2 0 0 0 2 2h8a2 2 0 0 0 2 -2l1 -12" /><path d="M9 7v-3a1 1 0 0 1 1 -1h4a1 1 0 0 1 1 1v3" /></svg>
                                                                </asp:LinkButton>
                                                            </h4>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <h4 class="todo-inline">
                                                                <asp:HyperLink ID="hlEdit" CssClass="btn btn-default btn-sm rounded-lg mr-0" runat="server" Text=""
                                                                    NavigateUrl='<%# "~/AdminPanel/Contact/Edit/" + AddressBook.HelperClass.EncryptDecrypt.encrypt(Eval("ContactID").ToString().Trim())  %>'
                                                                    CommandName="EditRecord" CommandArgument='<%# Eval("ContactID").ToString() %>'>
                                                                    <svg  xmlns="http://www.w3.org/2000/svg"  width="24"  height="24"  viewBox="0 0 24 24"  fill="none"  stroke="currentColor"  stroke-width="2"  stroke-linecap="round"  stroke-linejoin="round"  class="icon icon-tabler icons-tabler-outline icon-tabler-edit"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M7 7h-1a2 2 0 0 0 -2 2v9a2 2 0 0 0 2 2h9a2 2 0 0 0 2 -2v-1" /><path d="M20.385 6.585a2.1 2.1 0 0 0 -2.97 -2.97l-8.415 8.385v3h3l8.385 -8.415z" /><path d="M16 5l3 3" /></svg>
                                                                </asp:HyperLink>
                                                            </h4>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="mt-card-content">
                                    <h3 class="mt-card-name">
                                        <asp:Label ID="lblName" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                                    </h3>
                                    <p class="mt-card-desc font-grey-mint">
                                        <asp:Label ID="lblContactCategory" runat="server" Text='<%# Eval("ContactCategory") %>'></asp:Label>
                                    </p>
                                    <div class="mt-card-social">
                                        <ul>
                                            <li>
                                                <asp:LinkButton ID="lbtnShow" CssClass="btn btn-primary btn-sm rounded-lg mr-3 text-primary" runat="server"
                                                    Text="Show" CommandArgument='<%# Eval("ContactID").ToString() %>' OnClick="btnShow_Click" />
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </div>

    <div id="todo-task-modal" class="modal fade" role="dialog" aria-labelledby="myModalLabel10" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content scroller" style="height: 100%; width: 100%;" data-always-visible="1" data-rail-visible="0">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                </div>
                <div class="modal-body todo-task-modal-body">
                    <h3 class="todo-task-modal-bg">Contact Details</h3>
                </div>
                <!-- BEGIN PORTLET-->
                <div class="portlet light ">
                    <div class="portlet-body" id="chats">
                        <table class="table table-bordered">
                            <tbody>
                                <tr>
                                    <th>Country</th>
                                    <td>
                                        <asp:Label ID="lblCountryName" runat="server" Text=""></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <th>State</th>
                                    <td>
                                        <asp:Label ID="lblStateName" runat="server" Text=""></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <th>City</th>
                                    <td>
                                        <asp:Label ID="lblCityName" runat="server" Text=""></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <th>Name</th>
                                    <td>
                                        <asp:Label ID="lblName" runat="server" Text=""></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <th>Gender</th>
                                    <td>
                                        <asp:Label ID="lblGender" runat="server" Text=""></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <th>Mobile No</th>
                                    <td>
                                        <asp:Label ID="lblMobileNo" runat="server" Text=""></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <th>WhatsApp No</th>
                                    <td>
                                        <asp:Label ID="lblWhatsappNo" runat="server" Text=""></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <th>Email ID</th>
                                    <td>
                                        <asp:Label ID="lblEmail" runat="server" Text=""></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <th>Address</th>
                                    <td>
                                        <asp:Label ID="lblAddress" runat="server" Text=""></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <th>Date of Birth</th>
                                    <td>
                                        <asp:Label ID="lblDoB" runat="server" Text=""></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <th>Facebook ID</th>
                                    <td>
                                        <asp:Label ID="lblFacebook" runat="server" Text=""></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <th>Instagram ID</th>
                                    <td>
                                        <asp:Label ID="lblInstagram" runat="server" Text=""></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <th>Blood Group</th>
                                    <td>
                                        <asp:Label ID="lblBloodGroup" runat="server" Text=""></asp:Label>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <!-- END PORTLET-->
                <div class="modal-footer">
                    <button class="btn default" data-dismiss="modal" aria-hidden="true">Close</button>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
