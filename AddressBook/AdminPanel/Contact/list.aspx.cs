using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlTypes;
using AddressBook.HelperClass;

namespace AddressBook.AdminPanel.Contact
{
    public partial class list : System.Web.UI.Page
    {
        #region Page Load
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                FillCountryDropDown();
                FillUserDropDown();
                FillGridView();
            }
        }
        #endregion Page Load

        #region FillGridView
        private void FillGridView()
        {

            #region Variable Declaration
            String ContactName = null;
            String ContactNo = null;
            String Email = null;
            String CountryID = null;
            String StateID = null;
            String CityID = null;
            #endregion Variable Declaration

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

                cmdObj.CommandText = "PR_Contact_SelectForSearch";

                ContactName = txtContactNameSearch.Text;
                ContactNo = txtContactNoSearch.Text;    
                Email = txtEmailSearch.Text;

                if(ddlCountry.SelectedValue != "-1")
                {
                    CountryID = ddlCountry.SelectedValue.ToString();
                    cmdObj.Parameters.AddWithValue("@CountryID", CountryID);
                }
                else
                {
                    cmdObj.Parameters.AddWithValue("@CountryID", DBNull.Value);
                }
                if(ddlState.SelectedValue != "-1")
                {
                    StateID = ddlState.SelectedValue.ToString();
                    cmdObj.Parameters.AddWithValue("@StateID", StateID);
                }
                else
                {
                    cmdObj.Parameters.AddWithValue("@StateID", DBNull.Value);

                }
                if(ddlCity.SelectedValue != "-1")
                {
                    CityID = ddlCity.SelectedValue.ToString();
                    cmdObj.Parameters.AddWithValue("@CityID", CityID);
                }
                else
                {
                    cmdObj.Parameters.AddWithValue("@CityID", DBNull.Value);
                }

                cmdObj.Parameters.AddWithValue("@UserID", Session["UserID"]);
                cmdObj.Parameters.AddWithValue("@ContactName", ContactName);
                cmdObj.Parameters.AddWithValue("@ContactNo", ContactNo);
                cmdObj.Parameters.AddWithValue("@Email", Email);
                


                SqlDataReader sdrObj = cmdObj.ExecuteReader();

                rptContact.DataSource = sdrObj;
                rptContact.DataBind();

                #endregion Store Procedure and execute

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
        #endregion FillGridView

        #region Button : Show
        protected void btnShow_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            String ContactID = btn.CommandArgument;

            LoadContactDetails(ContactID);

            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "$('#todo-task-modal').modal('show');", true);
        }
        #endregion Button : Show

        #region FillUserDropDown
        private void FillUserDropDown()
        {
            CommonDropdownList.FillUserDropDown(ddlUser);
            ddlUser.SelectedValue = Session["UserID"].ToString();
            ddlUser.Enabled = false;
        }

        #endregion FillUserDropDown

        #region FillCountryDropDown
        private void FillCountryDropDown()
        {
            CommonDropdownList.FillCountryDropDown(ddlCountry, Session["UserID"].ToString());
            ddlState.Items.Insert(0, new ListItem("Select State", "-1"));
            ddlCity.Items.Insert(0, new ListItem("Select City", "-1"));
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
            ddlCity.Items.Clear();
            CommonDropdownList.FillStateDropDown(ddlState, CountryID, Session["UserID"].ToString());
            ddlCity.Items.Insert(0, new ListItem("Select City", "-1"));
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

        #region LoadContactDetails
        private void LoadContactDetails(String ContactID)
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

                if(sdrObj.Read())
                {
                    lblCountryName.Text = sdrObj["CountryName"].ToString();
                    lblStateName.Text = sdrObj["StateName"].ToString();
                    lblCityName.Text = sdrObj["CityName"].ToString();
                    lblName.Text = sdrObj["Name"].ToString();
                    lblGender.Text = sdrObj["Gender"].ToString();
                    lblMobileNo.Text = sdrObj["MobileNo"].ToString();
                    lblWhatsappNo.Text = sdrObj["WhatsappNo"].ToString();
                    lblEmail.Text = sdrObj["EmailID"].ToString();
                    lblAddress.Text = sdrObj["Address"].ToString();
                    lblDoB.Text = sdrObj["DoB"].ToString();
                    lblFacebook.Text = sdrObj["FaceBookID"].ToString();
                    lblInstagram.Text = sdrObj["InstagramID"].ToString();
                    lblBloodGroup.Text = sdrObj["BloodGroup"].ToString();
                }

                #endregion Store Procedure and execute

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
        #endregion LoadContactDetails

        #region Button : Delete
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            #region Delete Record
            LinkButton btn = (LinkButton)sender;
            String ContactID = btn.CommandArgument;

            DeleteContactRecord(ContactID);
            #endregion Delete Record
        }
        #endregion Button : Delete

        #region Delete Contact Record
        private void DeleteContactRecord(SqlString ContactID)
        {
            #region Establish Connection
            SqlConnection connObj = new SqlConnection(ConfigurationManager.ConnectionStrings["AddressBookConnectionString"].ConnectionString);
            #endregion Establish Connection

            try
            {
                #region Connection and Command Object
                if(connObj.State != ConnectionState.Open)
                {
                    connObj.Open();
                }

                SqlCommand cmdObj = connObj.CreateCommand();
                SqlCommand cmdObj2 = connObj.CreateCommand();

                cmdObj.CommandType = CommandType.StoredProcedure;
                cmdObj2.CommandType = CommandType.StoredProcedure;

                #endregion Connection and Command Object

                #region Store Procedure, Parameters and Execute
                cmdObj.CommandText = "PR_ContactWiseContactCategory_DeleteByPK";

                cmdObj.Parameters.AddWithValue("@UserID", Session["UserID"]);

                cmdObj.Parameters.AddWithValue("@ContactID", ContactID);

                cmdObj.ExecuteNonQuery();

                #endregion Store Procedure, Parameters and Execute

                #region Store Procedure, Parameters and Execute
                cmdObj2.CommandText = "PR_Contact_DeleteByPK";

                cmdObj2.Parameters.AddWithValue("@UserID", Session["UserID"]);

                cmdObj2.Parameters.AddWithValue("@ContactID", ContactID);

                cmdObj2.ExecuteNonQuery();

                #endregion Store Procedure, Parameters and Execute
            }
            #region Exception Handling
            catch(SqlException sqlEx)
            {
                Response.Write("SQL Error: " + sqlEx.Message);
            }
            catch(Exception ex)
            {
                Response.Write("Error: " + ex.Message);
            }
            #endregion Exception Handling

            #region Close Connection
            finally
            {
                connObj.Close();

                Response.Redirect("~/AdminPanel/Contact/list.aspx");
            }
            #endregion Close Connection

        }
        #endregion Delete Contact Record

        #region Button : Search
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            FillGridView();
        }
        #endregion Button : Search

        #region Button : Clear
        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtContactNameSearch.Text = "";
            txtContactNoSearch.Text = "";
            txtEmailSearch.Text = "";
            ddlCountry.SelectedIndex = -1;
            ddlState.SelectedIndex = -1;
            ddlCity.SelectedIndex = -1;

            FillGridView();
        }
        #endregion Button : Clear

    }
}