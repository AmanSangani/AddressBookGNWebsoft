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

namespace AddressBook.AdminPanel.City
{
    public partial class CityAddEdit : System.Web.UI.Page
    {
        #region Page Load
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                FillCountryDropDown();

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
                        if(Page.RouteData.Values["CityID"] != null)
                        {
                            btnAdd.Text = "Save";
                            String decryptCityID = AddressBook.HelperClass.EncryptDecrypt.Decrypt(Page.RouteData.Values["CityID"].ToString().Trim());
                            FillDetails(decryptCityID);
                        }
                        else
                        {
                            Response.Redirect("~/AdminPanel/City/List");
                        }
                    }
                    #endregion Edit Route

                    #region Invalid Route
                    else
                    {
                        Response.Redirect("~/AdminPanel/Country/List");
                    }
                    #endregion Invalid Route

                }

                #endregion Routes
            }

        }
        #endregion Page Load

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

        #region Fill Details on Edit
        private void FillDetails(string CityID)
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

                cmdObj.CommandText = "PR_City_SelectByPK";

                cmdObj.Parameters.AddWithValue("@UserID", Session["UserID"]);

                cmdObj.Parameters.AddWithValue("@CityID", CityID);

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
                            ddlCountry.Enabled = false;
                            FillStateDropDown(ddlCountry.SelectedValue);
                        }
                        if(!sdrObj["StateID"].Equals(DBNull.Value))
                        {
                            ddlState.SelectedValue = sdrObj["StateID"].ToString();
                        }
                        if(!sdrObj["CityCode"].Equals(DBNull.Value))
                        {
                            txtCityCode.Text = sdrObj["CityCode"].ToString();
                        }
                        if(!sdrObj["CityName"].Equals(DBNull.Value))
                        {
                            txtCityName.Text = sdrObj["CityName"].ToString();
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
            SqlString CityName = SqlString.Null;
            SqlString CityCode = SqlString.Null;
            String StateID = "";
            #endregion Variable Declaration

            #region Server side validation

            if(txtCityCode.Text.Trim() == "" ||
                txtCityName.Text.Trim() == "" ||
                ddlCountry.SelectedValue == "-1")
            {
                lblMsj.Text = "Please Fill Proper Details";
                return;
            }
            else
            {
                CityName = txtCityName.Text.ToString();
                CityCode = txtCityCode.Text.ToString();
                StateID = ddlState.SelectedValue;
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
                cmdObj.Parameters.AddWithValue("@CityName", CityName);
                cmdObj.Parameters.AddWithValue("@CityCode", CityCode);
                cmdObj.Parameters.AddWithValue("@StateID", StateID);

                #region Edit Mode
                if(Page.RouteData.Values["CityID"] != null)
                {
                    cmdObj.CommandText = "PR_City_UpdateByPK";

                    String decryptCityID = AddressBook.HelperClass.EncryptDecrypt.Decrypt(Page.RouteData.Values["CityID"].ToString().Trim());
                    cmdObj.Parameters.AddWithValue("@CityID", decryptCityID);

                    cmdObj.ExecuteNonQuery();

                    Response.Redirect("~/AdminPanel/City/List");
                }
                #endregion Edit Mode

                #region Add Mode
                else
                {
                    cmdObj.CommandText = "PR_City_Insert";

                    cmdObj.ExecuteNonQuery();

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

                txtCityCode.Text = "";
                txtCityName.Text = "";
                ddlCountry.SelectedIndex = 0;
                ddlState.SelectedIndex = 0;
            }
            #endregion Close Connection
        }
        #endregion Button : Add/Edit

        #region Button : Cancel
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/AdminPanel/City/List");
        }
        #endregion Button : Cancel
    }
}