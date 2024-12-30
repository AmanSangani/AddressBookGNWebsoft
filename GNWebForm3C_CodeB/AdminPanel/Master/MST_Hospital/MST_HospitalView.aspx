<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Default/MasterPageView.master" CodeFile="MST_HospitalView.aspx.cs" Inherits="AdminPanel_Master_MST_Hospital_MST_HospitalView" Title="Hospital View"%>

<asp:Content ID="cnthead" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="cntPageContent" ContentPlaceHolderID="cphPageContent" Runat="Server">
	<!-- BEGIN SAMPLE FORM PORTLET-->
	
<!-- END SAMPLE FORM PORTLET-->
</asp:Content>
<asp:Content ID="cntScripts" ContentPlaceHolderID="cphScripts" Runat="Server">
<script>
$(document).keyup(function (e) {
if (e.keyCode == 27) {;
	$("#CloseButton").trigger("click");
}
});
</script>
</asp:Content>
