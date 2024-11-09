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

namespace AddressBook.AdminPanel.Auth
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        #region Button : Register
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if(txtUsername.Text != "" || txtPassword.Text != "" ||
                txtEmail.Text != "" || txtDisplayName.Text != "")
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

                    String encryptPass = EncryptDecrypt.encrypt(txtPassword.Text.ToString());

                    cmdObj.CommandText = "PR_User_Insert";

                    cmdObj.Parameters.AddWithValue("@Username", txtUsername.Text);
                    cmdObj.Parameters.AddWithValue("@Password", encryptPass);
                    cmdObj.Parameters.AddWithValue("@Email", txtEmail.Text);
                    cmdObj.Parameters.AddWithValue("@DisplayName", txtDisplayName.Text);

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
        #endregion Button : Register

    }
}