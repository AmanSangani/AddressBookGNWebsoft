<%@ Page Title="" Language="C#" MasterPageFile="~/Content/AddressBookMasterPage.Master" AutoEventWireup="true" CodeBehind="ContactList.aspx.cs" Inherits="AddressBook.AdminPanel.Contact.ContactList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-6">
            <h1>Contact List</h1>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <asp:GridView ID="gvContact" CssClass="table rounded-lg table-striped table-borderless table-hover" AutoGenerateColumns="false" runat="server" OnRowCommand="gvContact_RowCommand" Width="800px">
                <Columns>
                    <asp:BoundField DataField="CountryName" HeaderText="CountryName" HeaderStyle-BackColor="Gray" HeaderStyle-ForeColor="White" />
                    <asp:BoundField DataField="StateName" HeaderText="StateName" HeaderStyle-BackColor="Gray" HeaderStyle-ForeColor="White" />
                    <asp:BoundField DataField="CityName" HeaderText="CityName" HeaderStyle-BackColor="Gray" HeaderStyle-ForeColor="White" />
                    <asp:BoundField DataField="Name" HeaderText="Name" HeaderStyle-BackColor="Gray" HeaderStyle-ForeColor="White" />
                    <asp:BoundField DataField="Gender" HeaderText="Gender" HeaderStyle-BackColor="Gray" HeaderStyle-ForeColor="White" />
                    <asp:BoundField DataField="MobileNo" HeaderText="MobileNo" HeaderStyle-BackColor="Gray" HeaderStyle-ForeColor="White" />
                    <asp:BoundField DataField="WhatsAppNo" HeaderText="WhatsAppNo" HeaderStyle-BackColor="Gray" HeaderStyle-ForeColor="White" />
                    <asp:BoundField DataField="EmailID" HeaderText="EmailID" HeaderStyle-BackColor="Gray" HeaderStyle-ForeColor="White" />
                    <asp:BoundField DataField="Address" HeaderText="Address" HeaderStyle-BackColor="Gray" HeaderStyle-ForeColor="White" />
                    <asp:BoundField DataField="DoB" HeaderText="DoB" HeaderStyle-BackColor="Gray" HeaderStyle-ForeColor="White" />
                    <asp:BoundField DataField="FaceBookID" HeaderText="FaceBookID" HeaderStyle-BackColor="Gray" HeaderStyle-ForeColor="White" />
                    <asp:BoundField DataField="InstagramID" HeaderText="InstagramID" HeaderStyle-BackColor="Gray" HeaderStyle-ForeColor="White" />
                    <asp:BoundField DataField="BloodGroup" HeaderText="BloodGroup" HeaderStyle-BackColor="Gray" HeaderStyle-ForeColor="White" />
                    <asp:TemplateField HeaderText="Action" HeaderStyle-BackColor="Gray" HeaderStyle-ForeColor="White">
                        <ItemTemplate>
                            <asp:Button ID="btnDelete" CssClass="btn btn-danger btn-sm rounded-lg mr-3" runat="server" Text="Delete"
                                CommandName="DeleteRecord" CommandArgument='<%# Eval("ContactID").ToString() %>' />
                            <asp:HyperLink ID="hlEdit" CssClass="btn btn-primary btn-sm rounded-lg mr-0" runat="server" Text="Edit"
                                NavigateUrl='<%# "~/AdminPanel/Contact/ContactAddEdit.aspx?ContactID=" + Eval("ContactID").ToString().Trim()  %>'
                                CommandName="EditRecord" CommandArgument='<%# Eval("ContactID").ToString() %>'></asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <!-- BEGIN EXAMPLE TABLE PORTLET-->

            <div class="portlet light bordered">
                <div class="portlet-title">
                    <div class="caption font-dark">
                        <i class="icon-settings font-dark"></i>
                        <span class="caption-subject bold uppercase">Contact List</span>
                    </div>
                    <div class="actions">
                        <div class="btn-group btn-group-devided" data-toggle="buttons">
                            <asp:HyperLink ID="hlAddBtn" CssClass="btn green rounded-lg" NavigateUrl="~/AdminPanel/Contact/ContactAddEdit.aspx" runat="server">Add New Contact</asp:HyperLink>
                        </div>
                    </div>
                </div>
                <div class="portlet-body">
                    <table class="table table-striped table-bordered table-hover table-checkable order-column" id="sample_1">
                        <thead>
                            <tr>
                                <th>Country</th>
                                <th>State</th>
                                <th>City</th>
                                <th>Name</th>
                                <th>Gender</th>
                                <th>MobileNo</th>
                                <th>WhatsAppNo</th>
                                <th>EmailID</th>
                                <th>Address</th>
                                <th>DoB</th>
                                <th>FaceBookID </th>
                                <th>InstagramID </th>
                                <th>BloodGroup </th>
                                <th>Actions </th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr class="odd gradeX">
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td>
                                    <asp:Button ID="btnDelete" CssClass="btn btn-danger btn-sm rounded-lg mr-3" runat="server" Text="Delete"
                                        CommandName="DeleteRecord" CommandArgument='<%# Eval("ContactID").ToString() %>' />
                                    <asp:HyperLink ID="hlEdit" CssClass="btn btn-primary btn-sm rounded-lg mr-0" runat="server" Text="Edit"
                                        NavigateUrl='<%# "~/AdminPanel/Contact/ContactAddEdit.aspx?ContactID=" + Eval("ContactID").ToString().Trim()  %>'
                                        CommandName="EditRecord" CommandArgument='<%# Eval("ContactID").ToString() %>'></asp:HyperLink>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- END EXAMPLE TABLE PORTLET-->
        </div>
    </div>
</asp:Content>
