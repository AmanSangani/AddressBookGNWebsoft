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

namespace AddressBook.AdminPanel.Contact
{
    public partial class ContactList : System.Web.UI.Page
    {
        #region Page Load
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                if(Request.QueryString != null)
                {
                    FillGridView(Request.QueryString["ContactID"]);
                }
            }
        }
        #endregion Page Load

        #region FillGridView
        private void FillGridView(String ContactID)
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

                gvContact.DataSource = sdrObj;
                gvContact.DataBind();

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

        #region Row-Command
        protected void gvContact_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            #region Delete Record
            if(e.CommandName == "DeleteRecord")
            {
                if(e.CommandArgument.ToString() != "")
                {
                    DeleteContactRecord(e.CommandArgument.ToString().Trim());
                }
            }
            #endregion Delete Record
        }
        #endregion Row-Command

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
    }
}