using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AddressBook.Country
{
    public partial class CountryAddEdit : System.Web.UI.Page
    {
        #region Page Load
        protected void Page_Load(object sender, EventArgs e)
        {
            //if(!Page.IsPostBack)
            //{
            //    if(Request.QueryString["CountryID"] != null)
            //    {
            //        //lblAddEdit.Text = "Edit";
            //        btnAdd.Text = "Save";
            //        FillDetails(Request.QueryString["CountryID"]);
            //    }
            //}

            if(!Page.IsPostBack)
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
                        if(Page.RouteData.Values["CountryID"] != null)
                        {
                            btnAdd.Text = "Save";
                            String decryptCountryID = AddressBook.HelperClass.EncryptDecrypt.Decrypt(Page.RouteData.Values["CountryID"].ToString().Trim());
                            FillDetails(decryptCountryID);
                        }
                        else
                        {
                            Response.Redirect("~/AdminPanel/Country/List");
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

        #region Fill Details on Edit
        private void FillDetails(string CountryID)
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

                cmdObj.CommandText = "PR_Country_SelectByPK";

                cmdObj.Parameters.AddWithValue("@UserID", Session["UserID"]);

                cmdObj.Parameters.AddWithValue("@CountryID", CountryID);

                SqlDataReader sdrObj = cmdObj.ExecuteReader();

                #endregion Store Procedure and execute

                #region Assign Values to Controls
                if(sdrObj.HasRows)
                {
                    while(sdrObj.Read())
                    {
                        if(!sdrObj["CountryCode"].Equals(DBNull.Value))
                        {
                            txtCountryCode.Text = sdrObj["CountryCode"].ToString();
                        }
                        if(!sdrObj["CountryName"].Equals(DBNull.Value))
                        {
                            txtCountryName.Text = sdrObj["CountryName"].ToString();
                        }
                        if(!sdrObj["CountryCapital"].Equals(DBNull.Value))
                        {
                            txtCountryCapital.Text = sdrObj["CountryCapital"].ToString();
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

        #region Button : Country Add / Save
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            #region Variable Declaration
            SqlString CountryName = SqlString.Null;
            SqlString CountryCode = SqlString.Null;
            SqlString CountryCapital = SqlString.Null;
            #endregion Variable Declaration

            #region Server side validation

            if(txtCountryCode.Text.Trim() == "" || 
                txtCountryName.Text.Trim() == "" ||
                txtCountryCapital.Text.Trim() == "")
            {
                lblMsj.Text = "Please Fill Proper Details";
                return;
            }
            else
            {
                CountryName = txtCountryName.Text.ToString();
                CountryCode = txtCountryCode.Text.ToString();
                CountryCapital = txtCountryCapital.Text.ToString();
            }

            #endregion Server side validation

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

                #region Store Procedure, parameters and execute

                cmdObj.Parameters.AddWithValue("@UserID", Session["UserID"]);
                cmdObj.Parameters.AddWithValue("@CountryName", CountryName);
                cmdObj.Parameters.AddWithValue("@CountryCode", CountryCode);
                cmdObj.Parameters.AddWithValue("@CountryCapital", CountryCapital);

                #region Edit Mode
                if(Page.RouteData.Values["CountryID"] != null)
                {
                    String decryptCountryID = AddressBook.HelperClass.EncryptDecrypt.Decrypt(Page.RouteData.Values["CountryID"].ToString().Trim());
                    cmdObj.Parameters.AddWithValue("@CountryID", decryptCountryID);

                    cmdObj.CommandText = "PR_Country_UpdateByPK";

                    cmdObj.ExecuteNonQuery();

                    Response.Redirect("~/AdminPanel/Country/List");
                }
                #endregion Edit Mode

                #region Add-mode
                else
                {
                    cmdObj.CommandText = "PR_Country_Insert";

                    cmdObj.ExecuteNonQuery();

                    lblMsj.ForeColor = System.Drawing.Color.Green;
                    lblMsj.Text = "Data Inserted Successfully...";
                }
                #endregion Add-mode

                #endregion Store Procedure, parameters and execute

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

                txtCountryName.Text = "";
                txtCountryCode.Text = "";
                txtCountryCapital.Text = "";
            }
            #endregion Close Connection

        }
        #endregion Button : Country Add / Save

        #region Button : Cancel
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/AdminPanel/Country/List");
        }
        #endregion Button : Cancel

    }
}