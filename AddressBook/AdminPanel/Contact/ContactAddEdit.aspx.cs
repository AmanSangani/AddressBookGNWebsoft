using AddressBook.HelperClass;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;

namespace AddressBook.AdminPanel.Contact
{
    public partial class ContactAddEdit : System.Web.UI.Page
    {
        #region Page Load
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                FillCountryDropDown();

                FillContactCategoryCheckBoxList();

                #region Routes

                if(Page.RouteData.Values["OperationName"] != null)
                {
                    #region Add Route
                    if(Page.RouteData.Values["OperationName"].ToString() == "Add")
                    {
                        
                    }
                    #endregion Add Route

                    #region Edit Route
                    else if(Page.RouteData.Values["OperationName"].ToString() == "Edit")
                    {
                        if(Page.RouteData.Values["ContactID"] != null)
                        {
                            btnAdd.Text = "Save";
                            String decryptContactID = AddressBook.HelperClass.EncryptDecrypt.Decrypt(Page.RouteData.Values["ContactID"].ToString().Trim());
                            FillDetails(decryptContactID);
                        }
                        else
                        {
                            Response.Redirect("~/AdminPanel/Contact/List");
                        }
                    }
                    #endregion Edit Route

                    #region Invalid Route
                    else
                    {
                        Response.Redirect("~/AdminPanel/Contact/List");
                    }
                    #endregion Invalid Route

                }

                #endregion Routes
            }
        }
        #endregion Page Load

        #region FillContactCategoryCheckBoxList

        private void FillContactCategoryCheckBoxList()
        {
            #region Establish Connection

            SqlConnection connObj = new SqlConnection();
            connObj.ConnectionString = ConfigurationManager.ConnectionStrings["AddressBookConnectionString"].ConnectionString;

            #endregion Establish Connection

            try
            {
                #region Connection Open and command obj
                if(connObj.State != ConnectionState.Open)
                {
                    connObj.Open();
                }

                SqlCommand cmdObj = connObj.CreateCommand();

                cmdObj.CommandType = CommandType.StoredProcedure;

                #endregion Connection Open and command obj

                #region Store Procedure and execute

                cmdObj.CommandText = "PR_ContactCategory_SelectAll";

                cmdObj.Parameters.AddWithValue("@UserID", Session["UserID"]);

                SqlDataReader sdrObj = cmdObj.ExecuteReader();

                #endregion Store Procedure and execute

                #region Assign Values to Controls
                if(sdrObj.HasRows)
                {
                    cblContactCategory.DataSource = sdrObj;
                    cblContactCategory.DataTextField = "ContactCategoryName";
                    cblContactCategory.DataValueField = "ContactCategoryID";
                    cblContactCategory.DataBind();
                }
                #endregion Assign Values to Controls

            }
            #region Exception Handling
            catch(SqlException sqlEx)
            {
                Response.Write(sqlEx.Message);
            }
            catch(Exception ex)
            {
                Response.Write(ex.Message);
            }
            #endregion Exception Handling

            #region Close Connection
            finally
            {
                if(connObj.State == ConnectionState.Open)
                {
                    connObj.Close();
                }
            }
            #endregion Close Connection
        }

        #endregion FillContactCategoryCheckBoxList

        #region FillCountryDropDown
        private void FillCountryDropDown()
        {
            CommonDropdownList.FillCountryDropDown(ddlCountry, Session["UserID"].ToString());
        }

        #endregion FillCountryDropDown

        #region DropDownList Selection Change
        protected void ddlCountry_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(Request.QueryString["CityCode"] == null)
            {
                ddlState.Items.Clear();

                String str = "";

                str = ddlCountry.SelectedValue;

                FillStateDropDown(str);
            }
        }
        #endregion DropDownList Selection Change

        #region FillStateDropDown
        private void FillStateDropDown(String CountryID)
        {
            CommonDropdownList.FillStateDropDown(ddlState, CountryID, Session["UserID"].ToString());
        }

        #endregion FillStateDropDown

        #region DropDownList Selection Change
        protected void ddlState_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(Request.QueryString["ContactID"] == null)
            {
                ddlCity.Items.Clear();

                String str = "";

                str = ddlState.SelectedValue;

                FillCityDropDown(str);
            }
        }
        #endregion DropDownList Selection Change

        #region FillCityDropDown
        private void FillCityDropDown(String StateID)
        {
            CommonDropdownList.FillCityDropDown(ddlCity, StateID, Session["UserID"].ToString());
        }

        #endregion FillCityDropDown

        #region Fill Details on Edit
        private void FillDetails(string ContactID)
        {
            #region Establish Connection

            SqlConnection connObj = new SqlConnection();
            connObj.ConnectionString = ConfigurationManager.ConnectionStrings["AddressBookConnectionString"].ConnectionString;

            #endregion Establish Connection

            try
            {
                #region Connection Open and command obj
                if(connObj.State != ConnectionState.Open)
                {
                    connObj.Open();
                }

                SqlCommand cmdObj = connObj.CreateCommand();

                cmdObj.CommandType = CommandType.StoredProcedure;

                #endregion Connection Open and command obj

                #region Store Procedure and execute

                cmdObj.CommandText = "PR_Contact_SelectByPK";

                cmdObj.Parameters.AddWithValue("@UserID", Session["UserID"]);

                cmdObj.Parameters.AddWithValue("@ContactID", ContactID);

                SqlDataReader sdrObj = cmdObj.ExecuteReader();

                #endregion Store Procedure and execute

                #region Assign Values to Controls
                if(sdrObj.HasRows)
                {
                    while(sdrObj.Read())
                    {
                        if(!sdrObj["CountryID"].Equals(DBNull.Value))
                        {
                            ddlCountry.SelectedValue = sdrObj["CountryID"].ToString();
                            FillStateDropDown(ddlCountry.SelectedValue);
                        }
                        if(!sdrObj["StateID"].Equals(DBNull.Value))
                        {
                            ddlState.SelectedValue = sdrObj["StateID"].ToString();
                            FillCityDropDown(ddlState.SelectedValue);
                        }
                        if(!sdrObj["CityID"].Equals(DBNull.Value))
                        {
                            ddlCity.SelectedValue = sdrObj["CityID"].ToString();
                        }
                        if(!sdrObj["Name"].Equals(DBNull.Value))
                        {
                            txtName.Text = sdrObj["Name"].ToString();
                        }
                        if(!sdrObj["MobileNo"].Equals(DBNull.Value))
                        {
                            txtMobile.Text = sdrObj["MobileNo"].ToString();
                        }
                        if(!sdrObj["WhatsAppNo"].Equals(DBNull.Value))
                        {
                            txtWhatsapp.Text = sdrObj["WhatsAppNo"].ToString();
                        }
                        if(!sdrObj["Gender"].Equals(DBNull.Value))
                        {
                            rblGender.SelectedValue = sdrObj["Gender"].ToString();
                        }
                        if(!sdrObj["DoB"].Equals(DBNull.Value))
                        {
                            txtDOB.Text = Convert.ToDateTime(sdrObj["DoB"]).ToString("yyyy-MM-dd");
                        }
                        if(!sdrObj["BloodGroup"].Equals(DBNull.Value))
                        {
                            ddlBloodGroup.SelectedValue = sdrObj["BloodGroup"].ToString();
                        }
                        if(!sdrObj["EmailID"].Equals(DBNull.Value))
                        {
                            txtEmail.Text = sdrObj["EmailID"].ToString();
                        }
                        if(!sdrObj["Address"].Equals(DBNull.Value))
                        {
                            txtAddress.Text = sdrObj["Address"].ToString();
                        }
                        if(!sdrObj["FacebookID"].Equals(DBNull.Value))
                        {
                            txtFacebook.Text = sdrObj["FacebookID"].ToString();
                        }
                        if(!sdrObj["InstagramID"].Equals(DBNull.Value))
                        {
                            txtInstagram.Text = sdrObj["InstagramID"].ToString();
                        }
                        break;
                    }
                }
                #endregion Assign Values to Controls

            }
            #region Exception Handling
            catch(SqlException sqlEx)
            {
                Response.Write(sqlEx.Message);
            }
            catch(Exception ex)
            {
                Response.Write(ex.Message);
            }
            #endregion Exception Handling

            #region Close Connection
            finally
            {
                if(connObj.State == ConnectionState.Open)
                {
                    connObj.Close();
                }
            }
            #endregion Close Connection
        }
        #endregion Fill Details on Edit

        #region Button : Add/Edit
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            #region Variable Declaration
            String CountryID = null;
            String StateID = null;
            String CityID = null;
            String Name = null;
            String Gender = null;
            String MobileNo = null;
            String WhatsappNo = null;
            String EmailID = null;
            String Address = null;
            String DOB = null;
            String FacebookID = null;
            String InstagramID = null;
            String BloodGroup = null;
            #endregion Variable Declaration

            #region Server side validation

            if(txtName.Text.Trim() == "" ||
                rblGender.Text.Trim() == "" ||
                txtMobile.Text.Trim() == "" ||
                ddlCountry.SelectedValue == "-1" ||
                ddlState.SelectedValue == "-1" ||
                ddlCity.SelectedValue == "-1")
            {
                lblMsj.Text = "Please Fill Proper Details";
                return;
            }
            else
            {
                CountryID = ddlCountry.SelectedValue.ToString();
                StateID = ddlState.SelectedValue.ToString();
                CityID = ddlCity.SelectedValue.ToString();
                Name = txtName.Text.ToString();
                Gender = rblGender.SelectedValue.ToString();
                MobileNo = txtMobile.Text.ToString();
                WhatsappNo = txtWhatsapp.Text.ToString();
                EmailID = txtEmail.Text.ToString();
                Address = txtAddress.Text.ToString();
                DOB = txtDOB.Text.ToString();
                FacebookID = txtFacebook.Text.ToString();
                InstagramID = txtInstagram.Text.ToString();
                BloodGroup = ddlBloodGroup.SelectedValue.ToString();
            }

            #endregion Server side validation

            #region Establish Connection
            SqlConnection connObj = new SqlConnection();
            connObj.ConnectionString = ConfigurationManager.ConnectionStrings["AddressBookConnectionString"].ConnectionString;
            #endregion Establish Connection

            try
            {
                #region Connection and Command Object

                if(connObj.State != ConnectionState.Open)
                {
                    connObj.Open();
                }

                SqlCommand cmdObj = connObj.CreateCommand();

                cmdObj.CommandType = CommandType.StoredProcedure;

                #endregion Connection and Command Object

                #region Store Procedure, Parameters and execute

                cmdObj.Parameters.AddWithValue("@UserID", Session["UserID"]);

                cmdObj.Parameters.AddWithValue("@CountryID", CountryID);
                cmdObj.Parameters.AddWithValue("@StateID", StateID);
                cmdObj.Parameters.AddWithValue("@CityID", CityID);
                cmdObj.Parameters.AddWithValue("@Name", Name);
                cmdObj.Parameters.AddWithValue("@Gender", Gender);
                cmdObj.Parameters.AddWithValue("@MobileNo", MobileNo);
                cmdObj.Parameters.AddWithValue("@WhatsappNo", WhatsappNo);
                cmdObj.Parameters.AddWithValue("@EmailID", EmailID);
                cmdObj.Parameters.AddWithValue("@Address", Address);
                cmdObj.Parameters.AddWithValue("@DoB", DOB);
                cmdObj.Parameters.AddWithValue("@FacebookID", FacebookID);
                cmdObj.Parameters.AddWithValue("@InstagramID", InstagramID);
                cmdObj.Parameters.AddWithValue("@BloodGroup", BloodGroup);

                #region Edit Mode
                if(Page.RouteData.Values["ContactID"] != null)
                {
                    cmdObj.CommandText = "PR_Contact_UpdateByPK";

                    String decryptContactID = AddressBook.HelperClass.EncryptDecrypt.Decrypt(Page.RouteData.Values["ContactID"].ToString().Trim());
                    cmdObj.Parameters.AddWithValue("@ContactID", decryptContactID);

                    cmdObj.ExecuteNonQuery();

                    Response.Redirect("~/AdminPanel/Contact/list");
                }
                #endregion Edit Mode

                #region Add Mode
                else
                {
                    cmdObj.CommandText = "PR_Contact_Insert";

                    cmdObj.Parameters.Add("@ContactID", SqlDbType.Int, 4);
                    cmdObj.Parameters["@ContactID"].Direction = ParameterDirection.Output;

                    cmdObj.ExecuteNonQuery();

                    String ContactID = cmdObj.Parameters["@ContactID"].Value.ToString();


                    foreach(ListItem listCategory in cblContactCategory.Items)
                    {
                        if(listCategory.Selected)
                        {
                            SqlCommand cmdCategoryWiseContact = connObj.CreateCommand();
                            cmdCategoryWiseContact.CommandType = CommandType.StoredProcedure;
                            cmdCategoryWiseContact.Parameters.AddWithValue("@UserID", Session["UserID"]);
                            cmdCategoryWiseContact.Parameters.AddWithValue("@ContactID", ContactID);
                            cmdCategoryWiseContact.Parameters.AddWithValue("@ContactCategoryID", listCategory.Value.ToString());
                            cmdCategoryWiseContact.CommandText = "PR_ContactWiseContactCategoryID_Insert";
                            cmdCategoryWiseContact.ExecuteNonQuery();
                        }
                    }

                    lblMsj.ForeColor = System.Drawing.Color.Green;
                    lblMsj.Text = "Data inserted successfully...";
                }
                #endregion Add Mode

                #endregion Store Procedure, Parameters and execute
            }
            #region Exception Handling
            catch(SqlException sqlEx)
            {
                Response.Write(sqlEx.Message);
            }
            catch(Exception ex)
            {
                Response.Write(ex.Message);
            }
            #endregion Exception Handling

            #region Close Connection
            finally
            {
                if(connObj.State == ConnectionState.Open)
                {
                    connObj.Close();
                }

                ddlCountry.SelectedValue = "-1";
                ddlState.SelectedValue = "-1";
                ddlCity.SelectedValue = "-1";
                txtName.Text = "";
                rblGender.ClearSelection();
                txtMobile.Text = "";
                txtWhatsapp.Text = "";
                txtEmail.Text = "";
                txtAddress.Text = "";
                txtDOB.Text = "";
                txtFacebook.Text = "";
                txtInstagram.Text = "";
                ddlBloodGroup.SelectedValue = "-1";
                cblContactCategory.ClearSelection();
            }
            #endregion Close Connection
        }
        #endregion Button : Add/Edit

        #region Button : Cancel
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/AdminPanel/Contact/List");
        }
        #endregion Button : Cancel
    }
}