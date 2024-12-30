using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AddressBook.AdminPanel.Auth
{
    public partial class ChangePassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        #region Button : Check/Validate
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if(txtPassword.Text != "" || txtConfirmPassword.Text != "" || Request.QueryString["UserID"] != null)
            {
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

                    SqlCommand cmdObj = new SqlCommand();

                    cmdObj.Connection = connObj;

                    cmdObj.CommandType = CommandType.StoredProcedure;

                    #endregion Connection and Command Object

                    #region Store Procedure, Parameters and Execute 

                    cmdObj.CommandText = "PR_User_UpdatePassword";

                    String encryptPassword = AddressBook.HelperClass.EncryptDecrypt.encrypt(txtPassword.Text);

                    cmdObj.Parameters.AddWithValue("@Password", encryptPassword);
                    cmdObj.Parameters.AddWithValue("@UserID", AddressBook.HelperClass.EncryptDecrypt.Decrypt(Request.QueryString["UserID"].ToString()));

                    cmdObj.ExecuteNonQuery();

                    Response.Redirect("~/AdminPanel/Auth/Login.aspx");

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
                    if(connObj.State == ConnectionState.Open)
                    {
                        connObj.Close();
                    }
                }
                #endregion Close Connection
            }
            else
            {
                lblMessage.Text = "Enter Required Details...";
            }
        }
        #endregion Button : Check/Validate
    }

}