using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using GNForm3C.BAL;
using GNForm3C.ENT;
using GNForm3C;


public partial class AdminPanel_Master_MST_ReceiptType_MST_ReceiptTypeAddEdit : System.Web.UI.Page
{
	#region 10.0 Local Variables 

	String FormName = "MST_ReceiptTypeAddEdit";
	
	#endregion 10.0 Variables 

	#region 11.0 Page Load Event 

	protected void Page_Load(object sender, EventArgs e)
	{
		#region 11.1 Check User Login 

		if (Session["UserID"] == null)
			Response.Redirect(CV.LoginPageURL);
			
		#endregion 11.1 Check User Login 

		if(!Page.IsPostBack)
		{
			#region 11.2 Fill Labels 

			FillLabels(FormName);
			
			#endregion 11.2 Fill Labels 

			#region 11.3 DropDown List Fill Section 

			FillDropDownList();
			
			#endregion 11.3 DropDown List Fill Section 
              
			#region 11.4 Set Control Default Value 

			lblFormHeader.Text = CV.PageHeaderAdd + " Receipt Type";
			upr.DisplayAfter = CV.UpdateProgressDisplayAfter;
			txtReceiptTypeName.Focus();
			
			#endregion 11.4 Set Control Default Value 

			#region 11.5 Fill Controls 

			FillControls();
			
			#endregion 11.5 Fill Controls 

			#region 11.6 Set Help Text 

			ucHelp.ShowHelp("Help Text will be shown here");
			
			#endregion 11.6 Set Help Text 

		}
	}
	
	#endregion 11.0 Page Load Event

	#region 12.0 FillLabels 

	private void FillLabels(String FormName)
	{
	}
	
	#endregion 12.0 FillLabels 

	#region 13.0 Fill DropDownList 

	private void FillDropDownList()
	{
		CommonFillMethods.FillDropDownListHospitalID(ddlHospitalID);
	}
	
	#endregion 13.0 Fill DropDownList

	#region 14.0 FillControls By PK  

	private void FillControls()
	{
		if (Request.QueryString["ReceiptTypeID"] != null) 
		{
			lblFormHeader.Text = CV.PageHeaderEdit + " Receipt Type";
			MST_ReceiptTypeBAL balMST_ReceiptType = new MST_ReceiptTypeBAL();
			MST_ReceiptTypeENT entMST_ReceiptType = new MST_ReceiptTypeENT();
			entMST_ReceiptType = balMST_ReceiptType.SelectPK(CommonFunctions.DecryptBase64Int32(Request.QueryString["ReceiptTypeID"]));

			if (!entMST_ReceiptType.ReceiptTypeName.IsNull)
				txtReceiptTypeName.Text = entMST_ReceiptType.ReceiptTypeName.Value.ToString();

			if (!entMST_ReceiptType.PrintName.IsNull)
				txtPrintName.Text = entMST_ReceiptType.PrintName.Value.ToString();

			if (!entMST_ReceiptType.IsDefault.IsNull)
				cbIsDefault.Checked = entMST_ReceiptType.IsDefault.Value;

			if (!entMST_ReceiptType.HospitalID.IsNull)
				ddlHospitalID.SelectedValue = entMST_ReceiptType.HospitalID.Value.ToString();

			if (!entMST_ReceiptType.Remarks.IsNull)
				txtRemarks.Text = entMST_ReceiptType.Remarks.Value.ToString();

		}
	}
	
	#endregion 14.0 FillControls By PK 

	#region 15.0 Save Button Event 

	protected void btnSave_Click(object sender, EventArgs e)
	{
		Page.Validate();
		if (Page.IsValid)
		{
			try
			{
				MST_ReceiptTypeBAL balMST_ReceiptType = new MST_ReceiptTypeBAL();
				MST_ReceiptTypeENT entMST_ReceiptType = new MST_ReceiptTypeENT();

				#region 15.1 Validate Fields 

				String ErrorMsg = String.Empty;
				if (txtReceiptTypeName.Text.Trim() == String.Empty)
					ErrorMsg += " - " + CommonMessage.ErrorRequiredField("Receipt Type Name");
				if (ddlHospitalID.SelectedIndex == 0)
					ErrorMsg += " - " + CommonMessage.ErrorRequiredFieldDDL("Hospital");

				if (ErrorMsg != String.Empty)
				{
					ErrorMsg = CommonMessage.ErrorPleaseCorrectFollowing() + ErrorMsg;
					ucMessage.ShowError(ErrorMsg);
					return;
				}
				
				#endregion 15.1 Validate Fields

				#region 15.2 Gather Data 


				if (txtReceiptTypeName.Text.Trim() != String.Empty)
					entMST_ReceiptType.ReceiptTypeName = txtReceiptTypeName.Text.Trim();

				if (txtPrintName.Text.Trim() != String.Empty)
					entMST_ReceiptType.PrintName = txtPrintName.Text.Trim();

				entMST_ReceiptType.IsDefault = Convert.ToBoolean(cbIsDefault.Checked);

				if (ddlHospitalID.SelectedIndex > 0)
					entMST_ReceiptType.HospitalID = Convert.ToInt32(ddlHospitalID.SelectedValue);

				if (txtRemarks.Text.Trim() != String.Empty)
					entMST_ReceiptType.Remarks = txtRemarks.Text.Trim();

				entMST_ReceiptType.UserID  =  Convert.ToInt32(Session["UserID"]);

				entMST_ReceiptType.Created  =  DateTime.Now;

				entMST_ReceiptType.Modified  =  DateTime.Now;

				
				#endregion 15.2 Gather Data 


				#region 15.3 Insert,Update,Copy 

				if (Request.QueryString["ReceiptTypeID"] != null && Request.QueryString["Copy"] == null) 
				{
					entMST_ReceiptType.ReceiptTypeID = CommonFunctions.DecryptBase64Int32(Request.QueryString["ReceiptTypeID"]);
					if (balMST_ReceiptType.Update(entMST_ReceiptType))
					{
						Response.Redirect("MST_ReceiptTypeList.aspx");
					}
					else
					{
						ucMessage.ShowError(balMST_ReceiptType.Message);
					}
				}
				else
				{
					if (Request.QueryString["ReceiptTypeID"] == null || Request.QueryString["Copy"] != null)
					{
						if (balMST_ReceiptType.Insert(entMST_ReceiptType))
						{
							ucMessage.ShowSuccess(CommonMessage.RecordSaved());
							ClearControls();
						}
					}
				}
				
				#endregion 15.3 Insert,Update,Copy

			}
			catch (Exception ex)
			{
				ucMessage.ShowError(ex.Message);
			}
		}
	}
	
	#endregion 15.0 Save Button Event 

	#region 16.0 Clear Controls 

	private void ClearControls()
	{
		txtReceiptTypeName.Text = String.Empty;
		txtPrintName.Text = String.Empty;
		cbIsDefault.Checked = false;
		ddlHospitalID.SelectedIndex = 0;
		txtRemarks.Text = String.Empty;
		txtReceiptTypeName.Focus();
	}
	
	#endregion 16.0 Clear Controls 

}