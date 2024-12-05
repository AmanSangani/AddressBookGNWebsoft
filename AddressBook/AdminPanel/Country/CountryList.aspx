<%@ Page Title="" Language="C#" MasterPageFile="~/Content/AddressBookMasterPage.Master" AutoEventWireup="true" CodeBehind="CountryList.aspx.cs" Inherits="AddressBook.AdminPanel.Country.CountryList" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    Country
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="MasterPagebreadcrumb" runat="server">
    <asp:Label ID="lbl" runat="server" Text="Country" Font-Size="20"></asp:Label>
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
                                        </span>
                                        <asp:TextBox ID="txtCountryNameSearch" runat="server" CssClass="form-control" Placeholder="Enter Country Name"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <div class="input-group">
                                        <span class="input-group-addon">
                                            <i class="fa fa-envelope"></i>
                                        </span>
                                        <asp:TextBox ID="txtCountryCodeSearch" runat="server" CssClass="form-control" Placeholder="Enter Country Code"></asp:TextBox>
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
    <div class="row">
        <div class="col-md-12">
            <!-- BEGIN EXAMPLE TABLE PORTLET-->

            <div class="portlet light bordered rounded-4">
                <div class="portlet-title">
                    <div class="caption font-dark">
                        <i class="icon-settings font-dark"></i>
                        <span class="caption-subject bold uppercase font-green-sharp">Search Result</span>
                    </div>
                </div>
                <div class="portlet-body">
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            <table class="table table-striped table-bordered table-hover table-responsive" id="sample_1">
                                <thead>
                                    <tr>
                                        <th class="col-md-1 text-center">
                                            <label class="mt-checkbox mt-checkbox-single mt-checkbox-outline">
                                                <input type="checkbox" id="chkAll" class="group-checkable" runat="server" data-set="#sample_1 .checkboxes" />
                                                <span></span>
                                            </label>
                                        </th>
                                        <th>Code</th>
                                        <th>Country</th>
                                        <th>Capital</th>
                                        <th class="text-center col-md-2">Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:Repeater ID="rptCountry" runat="server" OnItemCommand="rptCountry_ItemCommand">
                                        <ItemTemplate>
                                            <tr class="odd gradeX">
                                                <td class="text-center">
                                                    <asp:HiddenField ID="hfCountryID" Value='<%# Eval("CountryID") %>' runat="server" />
                                                    <label class="mt-checkbox mt-checkbox-single mt-checkbox-outline">
                                                        <input type="checkbox" id="chkRow" class="checkboxes" runat="server" />
                                                        <span></span>
                                                    </label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblCountryCode" runat="server" Text='<%# Eval("CountryCode") %>'></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblCountryName" runat="server" Text='<%# Eval("CountryName") %>'></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblCountryCapital" runat="server" Text='<%# Eval("CountryCapital") %>'></asp:Label>
                                                </td>
                                                <td class="text-center">
                                                    <asp:LinkButton ID="btnDelete" CssClass="text-danger" runat="server" Text="" Style="padding-right: 20px;"
                                                        CommandName="DeleteRecord" CommandArgument='<%# Eval("CountryID").ToString() %>'>
                                                <svg  xmlns="http://www.w3.org/2000/svg"  width="24"  height="24"  viewBox="0 0 24 24"  fill="none"  stroke="currentColor"  stroke-width="2"  stroke-linecap="round"  stroke-linejoin="round"  class="icon icon-tabler icons-tabler-outline icon-tabler-trash"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M4 7l16 0" /><path d="M10 11l0 6" /><path d="M14 11l0 6" /><path d="M5 7l1 12a2 2 0 0 0 2 2h8a2 2 0 0 0 2 -2l1 -12" /><path d="M9 7v-3a1 1 0 0 1 1 -1h4a1 1 0 0 1 1 1v3" /></svg>
                                                    </asp:LinkButton>
                                                    <asp:HyperLink ID="hlEdit" CssClass="" runat="server" Text=""
                                                        NavigateUrl='<%# "~/AdminPanel/Country/Edit/" +  AddressBook.HelperClass.EncryptDecrypt.encrypt(Eval("CountryID").ToString().Trim())  %>'
                                                        CommandName="EditRecord" CommandArgument='<%# Eval("CountryID").ToString() %>'>
                                                <svg  xmlns="http://www.w3.org/2000/svg"  width="24"  height="24"  viewBox="0 0 24 24"  fill="none"  stroke="currentColor"  stroke-width="2"  stroke-linecap="round"  stroke-linejoin="round"  class="icon icon-tabler icons-tabler-outline icon-tabler-edit"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M7 7h-1a2 2 0 0 0 -2 2v9a2 2 0 0 0 2 2h9a2 2 0 0 0 2 -2v-1" /><path d="M20.385 6.585a2.1 2.1 0 0 0 -2.97 -2.97l-8.415 8.385v3h3l8.385 -8.415z" /><path d="M16 5l3 3" /></svg>
                                                    </asp:HyperLink>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </tbody>
                            </table>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="rptPagination" EventName="ItemCommand" />
                        </Triggers>
                    </asp:UpdatePanel>
                    <div>
                        <ul class="pagination">
                            <li>
                                <a href="javascript:;">
                                    <i class="fa fa-angle-left"></i>
                                </a>
                            </li>
                            <asp:Repeater ID="rptPagination" runat="server" OnItemCommand="rptPagination_ItemCommand">
                                <ItemTemplate>
                                    <li>
                                        <asp:LinkButton ID="hlNumOfPage" runat="server" CommandName="numOfPage" CommandArgument='<%# Container.ItemIndex + 1 %>'></asp:LinkButton>
                                    </li>
                                </ItemTemplate>
                            </asp:Repeater>
                            <li>
                                <a href="javascript:;">
                                    <i class="fa fa-angle-right"></i>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- END EXAMPLE TABLE PORTLET-->
        </div>
    </div>
</asp:Content>
