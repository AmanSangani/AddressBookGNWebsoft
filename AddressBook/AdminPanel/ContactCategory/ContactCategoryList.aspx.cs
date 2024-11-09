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

namespace AddressBook.AdminPanel.ContactCategory
{
    public partial class ContactCategoryList : System.Web.UI.Page
    {
        #region Page Load
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                FillGridView();

                #region Routes

                if(Page.RouteData.Values["OperationName"] != null)
                {
                    #region Edit Route
                    if(Page.RouteData.Values["OperationName"].ToString() == "Edit")
                    {
                        if(Page.RouteData.Values["ContactCategoryID"] != null)
                        {
                            btnAdd.Text = "Save";
                            String decryptContactCategoryID = AddressBook.HelperClass.EncryptDecrypt.Decrypt(Page.RouteData.Values["ContactCategoryID"].ToString().Trim());
                            FillDetails(decryptContactCategoryID);
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
                        Response.Redirect("~/AdminPanel/ContactCategory/List");
                    }
                    #endregion Invalid Route

                }

                #endregion Routes
            }
        }
        #endregion Page Load

        #region FillGridView
        private void FillGridView()
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

                rptContactCategory.DataSource = sdrObj;
                rptContactCategory.DataBind();

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

        #region Fill Details on Edit
        private void FillDetails(string ContactCategoryID)
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

                cmdObj.CommandText = "PR_ContactCategory_SelectByPK";

                cmdObj.Parameters.AddWithValue("@UserID", Session["UserID"]);

                cmdObj.Parameters.AddWithValue("@ContactCategoryID", ContactCategoryID);

                SqlDataReader sdrObj = cmdObj.ExecuteReader();

                #endregion Store Procedure and execute

                #region Assign Values to Controls
                if(sdrObj.HasRows)
                {
                    while(sdrObj.Read())
                    {
                        if(!sdrObj["ContactCategoryName"].Equals(DBNull.Value))
                        {
                            txtContactCategoryName.Text = sdrObj["ContactCategoryName"].ToString();
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
            SqlString ContactCategoryName = SqlString.Null;
            #endregion Variable Declaration

            #region Server side validation

            if(txtContactCategoryName.Text.Trim() == "" )
            {
                lblMsj.Text = "Please Fill Proper Details";
                return;
            }
            else
            {
                ContactCategoryName = txtContactCategoryName.Text.ToString();
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

                cmdObj.Parameters.AddWithValue("@ContactCategoryName", ContactCategoryName);

                #region Edit Mode
                if(Page.RouteData.Values["ContactCategoryID"] != null)
                {
                    String decryptContactCategoryID = AddressBook.HelperClass.EncryptDecrypt.Decrypt(Page.RouteData.Values["ContactCategoryID"].ToString());
                    cmdObj.Parameters.AddWithValue("@ContactCategoryID", decryptContactCategoryID);

                    cmdObj.CommandText = "PR_ContactCategory_UpdateByPK";

                    cmdObj.ExecuteNonQuery();

                    Response.Redirect("~/AdminPanel/ContactCategory/List");
                }
                #endregion Edit Mode

                #region Add-mode
                else
                {
                    cmdObj.CommandText = "PR_ContactCategory_Insert";

                    cmdObj.ExecuteNonQuery();

                    lblMsj.ForeColor = System.Drawing.Color.Green;
                    lblMsj.Text = "Data Inserted Successfully...";

                    FillGridView();
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

                txtContactCategoryName.Text = "";

            }
            #endregion Close Connection

        }
        #endregion Button : Country Add / Save

        #region Button : Cancel
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            txtContactCategoryName.Text = "";
        }
        #endregion Button : Cancel

        #region Row-Command
        protected void rptContactCategory_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            #region Delete Record
            if(e.CommandName == "DeleteRecord")
            {
                if(e.CommandArgument.ToString() != "")
                {
                    DeleteCategoryRecord(e.CommandArgument.ToString().Trim());
                }
            }
            #endregion Delete Record
        }
        #endregion Row-Command

        #region DeleteCategoryRecord
        private void DeleteCategoryRecord(SqlString ContactCategoryID)
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

                cmdObj.CommandType = CommandType.StoredProcedure;

                #endregion Connection and Command Object

                #region Store Procedure, Parameters and Execute
                cmdObj.CommandText = "PR_ContactCategory_DeleteByPK";

                cmdObj.Parameters.AddWithValue("@UserID", Session["UserID"]);

                cmdObj.Parameters.AddWithValue("@ContactCategoryID", ContactCategoryID);

                cmdObj.ExecuteNonQuery();

                FillGridView();

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
            }
            #endregion Close Connection

        }
        #endregion DeleteCategoryRecord
    }
}