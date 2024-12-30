<%@ Page Title="" Language="C#" MasterPageFile="~/Content/AddressBookMasterPage.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="AddressBook.index" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    Dashboard
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="MasterPagebreadcrumb" runat="server">
    <asp:Label ID="lbl" runat="server" Text="Master Dasboard" Font-Size="20"></asp:Label>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="sm" runat="server"></asp:ScriptManager>

    <asp:UpdatePanel ID="upCount" runat="server" EnableViewState="true" UpdateMode="Conditional" ChildrenAsTriggers="false">
        <Triggers>
            <%--<asp:AsyncPostBackTrigger ControlID="btnShow" EventName="Click" />--%>
        </Triggers>
        <ContentTemplate>
            <asp:Panel ID="pnlCount" runat="server" Visible="true">
                <div class="portlet light">
                    <div class="portlet-title">
                        <div class="caption font-green">
                            <i class="fa fa-line-chart font-green"></i>
                            <span class="caption-subject bold uppercase">Total Overview</span>
                        </div>
                        <div class="tools"></div>
                    </div>
                    <div class="portlet-body form">
                        <div class="form-horizontal" role="form">
                            <div class="form-body">
                                <div class="row">
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <a class="dashboard-stat dashboard-stat-v2 green" href="AdminPanel/Country/List">
                                            <div class="visual">
                                                <i class="fa fa-comments"></i>
                                            </div>
                                            <div class="details">
                                                <div class="number">
                                                    <asp:Label runat="server" ID="lblCountryTotal"></asp:Label>
                                                </div>
                                                <div class="desc">Total Country</div>
                                            </div>
                                        </a>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <a class="dashboard-stat dashboard-stat-v2 red" href="AdminPanel/State/List">
                                            <div class="visual">
                                                <i class="fa fa-list"></i>
                                            </div>
                                            <div class="details">
                                                <div class="number">
                                                    <asp:Label runat="server" ID="lblStateTotal"></asp:Label>
                                                </div>
                                                <div class="desc">Total State</div>
                                            </div>
                                        </a>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <a class="dashboard-stat dashboard-stat-v2 blue" href="AdminPanel/City/List">
                                            <div class="visual">
                                                <i class="fa fa-globe"></i>
                                            </div>
                                            <div class="details">
                                                <div class="number">
                                                    <asp:Label runat="server" ID="lblCityTotal"></asp:Label>
                                                </div>
                                                <div class="desc">Total City</div>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>

    <div class="row">
        <div class="col-md-6">
            <!-- BEGIN EXAMPLE TABLE PORTLET-->
            <div class="portlet box blue">
                <div class="portlet-title">
                    <div class="caption">
                        <i class="fa fa-bullhorn "></i>RECENT 5 States
                    </div>
                    <div class="tools">
                        <a href="javascript:;" class="collapse" data-original-title="" title=""></a>
                        <a href="AdminPanel/State/List"><i class="fa fa-edit font-white"></i></a>
                    </div>
                </div>
                <div class="portlet-body" style="display: block;">
                    <div class="table-responsive">
                        <div id="TableContent1">
                            <table class="table table-bordered table-advanced table-striped table-hover" id="sample11">
                                <%-- Table Header --%>
                                <thead>
                                    <tr class="TRDark">
                                        <th class="text-center" style="width: 20px;">
                                            <asp:Label ID="lbhSerialNo" runat="server" Text="Sr."></asp:Label>
                                        </th>
                                        <th class="text-center">
                                            <asp:Label ID="lblStateCode" runat="server" Text="State Code"></asp:Label>
                                        </th>
                                        <th class="text-center">
                                            <asp:Label ID="lblStateName" runat="server" Text="State Name"></asp:Label>
                                        </th>
                                        <th class="text-center">
                                            <asp:Label ID="lblStateCapital" runat="server" Text="State Capital"></asp:Label>
                                        </th>
                                    </tr>
                                </thead>
                                <%-- END Table Header --%>
                                <tbody>
                                    <asp:Repeater ID="rpState" runat="server">
                                        <ItemTemplate>
                                            <%-- Table Rows --%>
                                            <tr class="odd gradeX">
                                                <td class="text-center">
                                                    <%#Container.ItemIndex+1 %>
                                                </td>
                                                <td class="text-center">
                                                    <%#Eval("StateCode") %>
                                                </td>
                                                <td class="text-center">
                                                    <%#Eval("StateName") %>
                                                </td>
                                                <td class="text-center">
                                                    <%#Eval("StateCapital") %>
                                                </td>
                                            </tr>
                                            <%-- END Table Rows --%>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <!-- BEGIN EXAMPLE TABLE PORTLET-->
            <div class="portlet box blue">
                <div class="portlet-title">
                    <div class="caption">
                        <i class="fa fa-bullhorn "></i>RECENT 5 Cities
                    </div>
                    <div class="tools">
                        <a href="javascript:;" class="collapse" data-original-title="" title=""></a>
                        <a href="AdminPanel/City/List"><i class="fa fa-edit font-white"></i></a>
                    </div>
                </div>
                <div class="portlet-body" style="display: block;">
                    <div class="table-responsive">
                        <div id="TableContent2">
                            <table class="table table-bordered table-advanced table-striped table-hover" id="sample112">
                                <%-- Table Header --%>
                                <thead>
                                    <tr class="TRDark">
                                        <th class="text-center" style="width: 20px;">
                                            <asp:Label ID="lblSerial" runat="server" Text="Sr."></asp:Label>
                                        </th>
                                        <th class="text-center">
                                            <asp:Label ID="lblCityCode" runat="server" Text="City Code"></asp:Label>
                                        </th>
                                        <th class="text-center">
                                            <asp:Label ID="lblCityName" runat="server" Text="City Name"></asp:Label>
                                        </th>
                                    </tr>
                                </thead>
                                <%-- END Table Header --%>
                                <tbody>
                                    <asp:Repeater ID="rpCity" runat="server">
                                        <ItemTemplate>
                                            <%-- Table Rows --%>
                                            <tr class="odd gradeX">
                                                <td class="text-center">
                                                    <%#Container.ItemIndex+1 %>
                                                </td>
                                                <td class="text-center">
                                                    <%#Eval("CityCode") %>
                                                </td>
                                                <td class="text-center">
                                                    <%#Eval("CityName") %>
                                                </td>
                                            </tr>
                                            <%-- END Table Rows --%>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <asp:UpdatePanel runat="server" UpdateMode="Conditional" ID="UpGraph">
        <ContentTemplate>
            <div class="portlet light bordered">
                <div class="portlet-title">
                    <div class="caption">
                        <i class="icon-bar-chart font-green-haze"></i>
                        <span class="caption-subject bold uppercase font-green-haze">States per Country</span>
                        <span class="caption-helper">Bar Charts</span>
                    </div>
                    <div class="tools">
                        <a href="javascript:;" class="collapse"></a>
                        <a href="javascript:;" class="reload"></a>
                        <a href="javascript:;" class="fullscreen"></a>
                    </div>
                </div>
                <div class="portlet-body">
                    <div id="chart_1" class="amcharts-chart-div">
                        <asp:Chart ID="Chart1" runat="server" width=1200px height=500px Visible="false" style="display:flex; justify-content:center; width: 100%; height: 500px;">
                            <Titles>
                                <asp:Title Text="State Count by Country" Name="Title1" />
                            </Titles>
                            <Legends>
                                <asp:Legend Name="Default" Docking="Bottom" Alignment="Center" IsTextAutoFit="False" />
                            </Legends>
                            <Series>
                                <asp:Series Name="Num of State" ChartType="Bar" XValueMember="CountryName" YValueMembers="TotalState" />
                            </Series>
                            <ChartAreas>
                                <asp:ChartArea Name="ChartArea1">
                                    <AxisX Title="CountryName" />
                                    <AxisY Title="StateCount" />
                                </asp:ChartArea>
                            </ChartAreas>
                        </asp:Chart>
                    </div>  
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

    <div class="row">
        <div class="col-md-12">
            <!-- BEGIN EXAMPLE TABLE PORTLET-->

            <div class="portlet light bordered rounded-4">
                <div class="portlet-title">
                    <div class="caption font-dark">
                        <i class="icon-settings font-dark"></i>
                        <span class="caption-subject bold uppercase font-green-sharp">Data Tree</span>
                    </div>
                </div>
                <div class="portlet-body">
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            <table class="table table-striped table-bordered table-hover table-responsive">
                                <thead>
                                    <tr>
                                        <th class="col-md-1 text-center"></th>
                                        <th>Code</th>
                                        <th>Country</th>
                                        <th>Capital</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:Repeater ID="rptCountry" runat="server" OnItemCommand="rptCountry_ItemCommand">
                                        <ItemTemplate>
                                            <tr class="odd gradeX">
                                                <td class="text-center">
                                                    <asp:HiddenField ID="hfCountryID" Value='<%# Eval("CountryID") %>' runat="server" />
                                                    <label class="">
                                                        <%--<input type="checkbox" id="chkRow" class="checkboxes" runat="server" />--%>
                                                        <asp:Button runat="server" ID="btnTree" Text="+"
                                                            CommandName="FillStateRecord" CommandArgument='<%# Eval("CountryID").ToString() %>'
                                                            CssClass="btn btn-sm green" />
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
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td colspan="3">
                                                    <div id="StateTree" runat="server" visible="false">
                                                        <table class="table table-striped table-bordered table-hover table-responsive">
                                                            <thead>
                                                                <tr>
                                                                    <th class="col-md-1 text-center"></th>
                                                                    <th>State</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <asp:HiddenField ID="hdCountryID" Value='<%# Eval("CountryID") %>' runat="server" />
                                                                <asp:Repeater ID="rptState" runat="server">
                                                                    <ItemTemplate>
                                                                        <tr class="odd gradeX">
                                                                            <td class="text-center">
                                                                                <asp:HiddenField ID="hfStateID" Value='<%# Eval("StateID") %>' runat="server" />
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="lblStateName" runat="server" Text='<%# Eval("StateName") %>'></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                    </ItemTemplate>
                                                                </asp:Repeater>
                                                            </tbody>
                                                        </table>
                                                    </div>
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

    <div class="row">
        <div class="col-md-12">

            <asp:UpdatePanel ID="UpLinks" runat="server" EnableViewState="true" UpdateMode="Conditional" ChildrenAsTriggers="false">
                <ContentTemplate>
                    <div class="portlet">
                        <div class="portlet-body form">
                            <div class="form-horizontal" role="form">
                                <div class="form-body">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <!-- BEGIN EXAMPLE TABLE PORTLET-->
                                            <div class="portlet box green">
                                                <div class="portlet-title">
                                                    <div class="caption">
                                                        <i class="fa fa-external-link "></i></i>Quick Links
                                                    </div>
                                                    <div class="tools">
                                                        <a href="javascript:;" class="collapse" data-original-title="" title=""></a>
                                                    </div>

                                                </div>
                                                <div class="portlet-body" style="display: block;">
                                                    <div class="tools ">
                                                        <ul class="nav nav-tabs">
                                                            <li class="active">
                                                                <a href="#tab_1_1" class="active menu-toggler font-green" data-toggle="tab" aria-expanded="false">List Pages</a>
                                                            </li>
                                                            <li class="">
                                                                <a href="#tab_1_2" class="font-green" data-toggle="tab" aria-expanded="true">Add Pages </a>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                    <div class="portlet-body table-both-scroll">
                                                        <div class="portlet light ">
                                                            <div class="portlet-body">
                                                                <!--BEGIN TABS-->
                                                                <div class="tab-content">
                                                                    <div class=" active tab-pane " id="tab_1_1">
                                                                        <div class="tiles">
                                                                            <a href="AdminPanel/Country/List">
                                                                                <div class="tile bg-blue">
                                                                                    <div class="tile-body">
                                                                                        <i class="fa fa-list"></i>
                                                                                    </div>
                                                                                    <div class="tile-object">
                                                                                        <div class="name">Country </div>
                                                                                        <div class="number"></div>
                                                                                    </div>
                                                                                </div>
                                                                            </a>
                                                                            <a href="AdminPanel/State/List">
                                                                                <div class="tile bg-blue">
                                                                                    <div class="tile-body">
                                                                                        <i class="fa fa-list"></i>
                                                                                    </div>
                                                                                    <div class="tile-object">
                                                                                        <div class="name">State </div>
                                                                                        <div class="number"></div>
                                                                                    </div>
                                                                                </div>
                                                                            </a>
                                                                            <a href="AdminPanel/City/List">
                                                                                <div class="tile bg-blue">
                                                                                    <div class="tile-body">
                                                                                        <i class="fa fa-list"></i>
                                                                                    </div>
                                                                                    <div class="tile-object">
                                                                                        <div class="name">City </div>
                                                                                        <div class="number"></div>
                                                                                    </div>
                                                                                </div>
                                                                            </a>
                                                                        </div>
                                                                    </div>
                                                                    <div class="tab-pane " id="tab_1_2">
                                                                        <div class="tiles">
                                                                            <a href="AdminPanel/Country/Add">
                                                                                <div class="tile bg-red">
                                                                                    <div class="tile-body">
                                                                                        <i class="fa fa-edit"></i>
                                                                                    </div>
                                                                                    <div class="tile-object">
                                                                                        <div class="name">Country</div>
                                                                                        <div class="number"></div>
                                                                                    </div>
                                                                                </div>
                                                                            </a>
                                                                            <a href="AdminPanel/State/Add">
                                                                                <div class="tile bg-red">
                                                                                    <div class="tile-body">
                                                                                        <i class="fa fa-edit"></i>
                                                                                    </div>
                                                                                    <div class="tile-object">
                                                                                        <div class="name">State</div>
                                                                                        <div class="number"></div>
                                                                                    </div>
                                                                                </div>
                                                                            </a>
                                                                            <a href="AdminPanel/City/Add">
                                                                                <div class="tile bg-red">
                                                                                    <div class="tile-body">
                                                                                        <i class="fa fa-edit"></i>
                                                                                    </div>
                                                                                    <div class="tile-object">
                                                                                        <div class="name">City</div>
                                                                                        <div class="number"></div>
                                                                                    </div>
                                                                                </div>
                                                                            </a>
                                                                        </div>

                                                                    </div>
                                                                </div>
                                                                <!--END TABS-->
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>

        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" EnableViewState="true" UpdateMode="Conditional" ChildrenAsTriggers="false">
                <ContentTemplate>
                    <div class="portlet">
                        <div class="portlet-body form">
                            <div class="form-horizontal" role="form">
                                <div class="form-body">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <!-- BEGIN EXAMPLE TABLE PORTLET-->
                                            <div class="portlet box yellow">
                                                <div class="portlet-title">
                                                    <div class="caption">
                                                        <i class="fa fa-h-square "></i></i>Country Wise State
                                                    </div>
                                                    <div class="tools">
                                                        <a href="javascript:;" class="collapse" data-original-title="" title=""></a>
                                                    </div>
                                                </div>
                                                <div class="portlet-body" style="display: block;">
                                                    <div class="tools ">
                                                        <ul class="nav nav-tabs">
                                                            <asp:Repeater ID="rpCol" runat="server">
                                                                <ItemTemplate>
                                                                    <li class='<%#Container.ItemIndex == 0 ? "active" : ""%>'>
                                                                        <asp:LinkButton ID="lbtnCol" runat="server" href='<%#"#tab_Inc_" + Eval("CountryID").ToString()%>' Text='<%#Eval("CountryName") %>' data-toggle="tab"></asp:LinkButton>
                                                                    </li>
                                                                </ItemTemplate>
                                                            </asp:Repeater>
                                                        </ul>
                                                    </div>
                                                    <div class="portlet-body table-both-scroll">
                                                        <div class="portlet light ">
                                                            <div class="portlet-body">
                                                                <div class="tab-content">
                                                                    <asp:Repeater ID="rpActive" runat="server">
                                                                        <ItemTemplate>
                                                                            <div class='<%#Container.ItemIndex == 0 ? "tab-pane active" : "tab-pane"%>' id='<%#"tab_Inc_" + Eval("CountryID").ToString()%>'>
                                                                                <asp:HiddenField ID="hfCountryID" runat="server" Value='<%#Eval("CountryID")%>' />
                                                                                <table class="table table-bordered table-advanced table-striped table-hover" id="">
                                                                                    <%-- Table Header --%>
                                                                                    <thead>
                                                                                        <tr class="TRDark">
                                                                                            <th class="text-center col-md-4">
                                                                                                <asp:Label ID="lbhExpenseTypeID" runat="server" Text="Code"></asp:Label>
                                                                                            </th>
                                                                                            <th class="text-center col-md-4">
                                                                                                <asp:Label ID="lbhAmount" runat="server" Text="Country"></asp:Label>
                                                                                            </th>
                                                                                            <th class="text-center col-md-4">
                                                                                                <asp:Label ID="lbhExpenseDate" runat="server" Text="Capital"></asp:Label>
                                                                                        </tr>
                                                                                    </thead>
                                                                                    <%-- END Table Header --%>

                                                                                    <tbody>
                                                                                        <asp:Repeater ID="rpData" runat="server">
                                                                                            <ItemTemplate>
                                                                                                <%-- Table Rows --%>
                                                                                                <tr class="odd gradeX">
                                                                                                    <td class="text-center">
                                                                                                        <%#Eval("StateCode") %>
                                                                                                    </td>
                                                                                                    <td class="text-center">
                                                                                                        <%#Eval("StateName") %>
                                                                                                    </td>
                                                                                                    <td class="text-center">
                                                                                                        <%#Eval("StateCapital") %>
                                                                                                    </td>
                                                                                                </tr>
                                                                                                <%-- END Table Rows --%>
                                                                                            </ItemTemplate>
                                                                                        </asp:Repeater>
                                                                                    </tbody>
                                                                                </table>
                                                                            </div>
                                                                        </ItemTemplate>
                                                                    </asp:Repeater>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>

        </div>
    </div>

</asp:Content>
