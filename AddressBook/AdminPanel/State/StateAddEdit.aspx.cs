using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AddressBook.HelperClass;
using System.Data.SqlTypes;

namespace AddressBook.AdminPanel.State
{
    public partial class StateAddEdit : System.Web.UI.Page
    {
        #region Page Load
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                FillCountryDropDown();

                if(Page.RouteData.Values["StateID"] != null)
                {
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
                            if(Page.RouteData.Values["StateID"] != null)
                            {
                                btnAdd.Text = "Save";
                                String decryptStateID = AddressBook.HelperClass.EncryptDecrypt.Decrypt(Page.RouteData.Values["StateID"].ToString().Trim());
                                FillDetails(decryptStateID);
                            }
                            else
                            {
                                Response.Redirect("~/AdminPanel/State/List");
                            }
                        }
                        #endregion Edit Route

                        #region Invalid Route
                        else
                        {
                            Response.Redirect("~/AdminPanel/State/List");
                        }
                        #endregion Invalid Route
                    }
                    #endregion Routes
                }
            }
        }
        #endregion Page Load

        #region Fill Details on Edit
        private void FillDetails(string StateID)
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

                cmdObj.CommandText = "PR_State_SelectByPK";

                cmdObj.Parameters.AddWithValue("@UserID", Session["UserID"]);

                cmdObj.Parameters.AddWithValue("@StateID", StateID);

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
                        }
                        if(!sdrObj["StateCode"].Equals(DBNull.Value))
                        {
                            txtStateCode.Text = sdrObj["StateCode"].ToString();
                        }
                        if(!sdrObj["StateName"].Equals(DBNull.Value))
                        {
                            txtStateName.Text = sdrObj["StateName"].ToString();
                        }
                        if(!sdrObj["StateCapital"].Equals(DBNull.Value))
                        {
                            txtStateCapital.Text = sdrObj["StateCapital"].ToString();
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

        #region FillCountryDropDown
        private void FillCountryDropDown()
        {
            CommonDropdownList.FillCountryDropDown(ddlCountry, Session["UserID"].ToString());
        }

        #endregion FillCountryDropDown

        #region Button : Add/Edit
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            #region Variable Declaration
            SqlString StateName = SqlString.Null;
            SqlString StateCode = SqlString.Null;
            SqlString StateCapital = SqlString.Null;
            String CountryID = "";
            #endregion Variable Declaration

            #region Server side validation

            if(txtStateCode.Text.Trim() == "" || 
                txtStateName.Text.Trim() == "" ||
                txtStateCapital.Text.Trim() == "" ||
                ddlCountry.SelectedValue == "-1")
            {
                lblMsj.Text = "Please Fill Proper Details";
                return;
            }
            else
            {
                StateName = txtStateName.Text.ToString();
                StateCode = txtStateCode.Text.ToString();
                StateCapital = txtStateCapital.Text.ToString();
                CountryID = ddlCountry.SelectedValue;
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

                cmdObj.Parameters.AddWithValue("@StateName", StateName);
                cmdObj.Parameters.AddWithValue("@StateCode", StateCode);
                cmdObj.Parameters.AddWithValue("@StateCapital", StateCapital);
                cmdObj.Parameters.AddWithValue("@CountryID", CountryID);

                #region Edit Mode
                if(Page.RouteData.Values["StateID"] != null)
                {
                    cmdObj.CommandText = "PR_State_UpdateByPK";

                    cmdObj.Parameters.AddWithValue("@UserID", Session["UserID"]);

                    String decryptStateID = AddressBook.HelperClass.EncryptDecrypt.Decrypt(Page.RouteData.Values["StateID"].ToString().Trim());
                    cmdObj.Parameters.AddWithValue("@StateID", decryptStateID);

                    cmdObj.ExecuteNonQuery();

                    Response.Redirect("~/AdminPanel/State/List");
                }
                #endregion Edit Mode

                #region Add Mode
                else
                {
                    cmdObj.CommandText = "PR_State_Insert";

                    cmdObj.Parameters.AddWithValue("@UserID", Session["UserID"]);

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

                txtStateCode.Text = "";
                txtStateName.Text = "";
                txtStateCapital.Text = "";
                ddlCountry.SelectedIndex = 0;
            }
            #endregion Close Connection
        }
        #endregion Button : Add/Edit

        #region Button : Cancel
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/AdminPanel/State/List");
        }
        #endregion Button : Cancel

    }

}