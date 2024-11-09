<%@ Page Title="" Language="C#" MasterPageFile="~/Content/AddressBookMasterPage.Master" AutoEventWireup="true" CodeBehind="ContactCategoryList.aspx.cs" Inherits="AddressBook.AdminPanel.ContactCategory.ContactCategoryList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    Contact Category
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="MasterPagebreadcrumb" runat="server">
    <asp:Label ID="lbl" runat="server" Text="Contact Category" Font-Size="20"></asp:Label>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="tab-pane" id="tab_2">
        <div class="portlet box green rounded-lg">
            <div class="portlet-title">
                <div class="caption">
                    <i class="fa fa-gift"></i>Contact Category 
                </div>
            </div>
            <div class="portlet-body form">
                <!-- BEGIN FORM-->
                <div class="form-body">
                    <asp:Label ID="lblMsj" runat="server" Text=""></asp:Label>
                    <div class="row margin-top-20 margin-bottom-20">
                        <div class="col-md-6">
                            <div class="form-group">
                                <asp:Label ID="lblContactCategoryName" CssClass="control-label col-md-3" runat="server" Text="Category Name">
                                    <asp:RequiredFieldValidator ID="rfvContactCategoryName" runat="server" ErrorMessage="**" Display="Dynamic" ForeColor="Red" ControlToValidate="txtContactCategoryName" ValidationGroup="AddData"></asp:RequiredFieldValidator>
                                </asp:Label>
                                <div class="col-md-9">
                                    <asp:TextBox ID="txtContactCategoryName" CssClass="form-control" Placeholder="Friend" runat="server"></asp:TextBox>
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
                                    <asp:Button ID="btnAdd" CssClass="btn green rounded-lg" runat="server" Text="Submit" ValidationGroup="AddData" OnClick="btnAdd_Click" />
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

    <div class="row mt-5">
        <div class="col-md-12">
            <!-- BEGIN EXAMPLE TABLE PORTLET-->

            <div class="portlet light bordered">
                <div class="portlet-title">
                    <div class="caption font-dark">
                        <i class="icon-settings font-dark"></i>
                        <span class="caption-subject bold uppercase">Contact Category List</span>
                    </div>
                </div>
                <div class="portlet-body">
                    <table class="table table-striped table-bordered table-hover" id="sample_1">
                        <thead>
                            <tr>
                                <th>Contact Category</th>
                                <th class="text-center">Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="rptContactCategory" runat="server" OnItemCommand="rptContactCategory_ItemCommand">
                                <ItemTemplate>
                                    <tr class="odd gradeX">
                                        <td>
                                            <asp:Label ID="lblCityName" runat="server" Text='<%# Eval("ContactCategoryName") %>'></asp:Label>
                                        </td>
                                        <td class="text-center">
                                            <asp:LinkButton ID="lbtnDelete" CssClass="text-danger" runat="server" Text="Delete" Style="padding-right:20px;"
                                                CommandName="DeleteRecord" CommandArgument='<%# Eval("ContactCategoryID").ToString() %>'>
                                                <svg  xmlns="http://www.w3.org/2000/svg"  width="24"  height="24"  viewBox="0 0 24 24"  fill="none"  stroke="currentColor"  stroke-width="2"  stroke-linecap="round"  stroke-linejoin="round"  class="icon icon-tabler icons-tabler-outline icon-tabler-trash"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M4 7l16 0" /><path d="M10 11l0 6" /><path d="M14 11l0 6" /><path d="M5 7l1 12a2 2 0 0 0 2 2h8a2 2 0 0 0 2 -2l1 -12" /><path d="M9 7v-3a1 1 0 0 1 1 -1h4a1 1 0 0 1 1 1v3" /></svg>
                                            </asp:LinkButton>
                                            <asp:HyperLink ID="hlEdit" CssClass="" runat="server" Text="Edit"
                                                NavigateUrl='<%# "~/AdminPanel/ContactCategory/Edit/" + AddressBook.HelperClass.EncryptDecrypt.encrypt( Eval("ContactCategoryID").ToString().Trim() ) %>'
                                                CommandName="EditRecord" CommandArgument='<%# Eval("ContactCategoryID").ToString() %>'>
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
