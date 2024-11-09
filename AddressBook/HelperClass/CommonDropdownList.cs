using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace AddressBook.HelperClass
{
    public class CommonDropdownList
    {
        #region FillCountryDropDown
        public static void FillCountryDropDown(DropDownList ddl, String UserID)
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

                cmdObj.CommandText = "PR_Country_SelectForDropDown";

                cmdObj.Parameters.AddWithValue("@UserID", UserID);

                SqlDataReader sdrObj = cmdObj.ExecuteReader();

                #endregion Store Procedure and execute

                #region Assign Data to DropDown
                if(sdrObj.HasRows)
                {
                    ddl.DataSource = sdrObj;
                    ddl.DataTextField = "CountryName";
                    ddl.DataValueField = "CountryID";
                    ddl.DataBind();
                }

                ddl.Items.Insert(0, new ListItem("Select Country", "-1"));
                #endregion Assign Data to DropDown

            }
            #region Exception Handling
            catch(SqlException sqlEx)
            {
            }
            catch(Exception ex)
            {
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
        #endregion FillCountryDropDown

        #region FillStateDropDown
        public static void FillStateDropDown(DropDownList ddl, String CountryID, String UserID)
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

                cmdObj.CommandText = "PR_State_SelectForDropDown";

                cmdObj.Parameters.AddWithValue("@UserID", UserID);

                cmdObj.Parameters.AddWithValue("@CountryID", CountryID);

                SqlDataReader sdrObj = cmdObj.ExecuteReader();

                #endregion Store Procedure and execute

                #region Assign Data to DropDown
                if(sdrObj.HasRows)
                {
                    ddl.DataSource = sdrObj;
                    ddl.DataTextField = "StateName";
                    ddl.DataValueField = "StateID";
                    ddl.DataBind();
                }

                ddl.Items.Insert(0, new ListItem("Select State", "-1"));
                #endregion Assign Data to DropDown

            }
            #region Exception Handling
            catch(SqlException sqlEx)
            {
            }
            catch(Exception ex)
            {
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
        #endregion FillStateDropDown

        #region FillCityDropDown
        public static void FillCityDropDown(DropDownList ddl, String StateID, String UserID)
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

                cmdObj.CommandText = "PR_City_SelectForDropDown";

                cmdObj.Parameters.AddWithValue("@UserID", UserID);

                cmdObj.Parameters.AddWithValue("@StateID", StateID);

                SqlDataReader sdrObj = cmdObj.ExecuteReader();

                #endregion Store Procedure and execute

                #region Assign Data to DropDown
                if(sdrObj.HasRows)
                {
                    ddl.DataSource = sdrObj;
                    ddl.DataTextField = "CityName";
                    ddl.DataValueField = "CityID";
                    ddl.DataBind();
                }

                ddl.Items.Insert(0, new ListItem("Select City", "-1"));
                #endregion Assign Data to DropDown

            }
            #region Exception Handling
            catch(SqlException sqlEx)
            {
            }
            catch(Exception ex)
            {
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
        #endregion FillCityDropDown

        #region FillCityDropDown
        public static void FillUserDropDown(DropDownList ddl)
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

                cmdObj.CommandText = "PR_User_SelectForDropDown";

                SqlDataReader sdrObj = cmdObj.ExecuteReader();

                #endregion Store Procedure and execute

                #region Assign Data to DropDown
                if(sdrObj.HasRows)
                {
                    ddl.DataSource = sdrObj;
                    ddl.DataTextField = "DisplayName";
                    ddl.DataValueField = "UserID";
                    ddl.DataBind();
                }

                ddl.Items.Insert(0, new ListItem("Select User", "-1"));
                #endregion Assign Data to DropDown

            }
            #region Exception Handling
            catch(SqlException sqlEx)
            {
            }
            catch(Exception ex)
            {
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
        #endregion FillCityDropDown

    }
}