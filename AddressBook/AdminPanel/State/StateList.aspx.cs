using AddressBook.HelperClass;
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
using System.Web.UI.HtmlControls;

namespace AddressBook.AdminPanel.State
{
    public partial class StateList : System.Web.UI.Page
    {
        #region Page Load
        protected void Page_Load(object sender, EventArgs e)
        {
            errDisplay.Attributes.Add("class", "display-none");
            if(Session["UserID"] == null)
            {
                Response.Redirect("~/AdminPanel/Auth/Login.aspx");
            }
            if(!Page.IsPostBack)
            {
                FillCountryDropDown();
            }
        }
        #endregion Page Load

        #region FillCountryDropDown
        private void FillCountryDropDown()
        {
            CommonDropdownList.FillCountryDropDown(ddlCountry, Session["UserID"].ToString());
        }

        #endregion FillCountryDropDown

        #region Button : Display
        protected void btnDisplay_Click(object sender, EventArgs e)
        {
            if(ddlCountry.SelectedValue != "-1")
            {
                String Country = ddlCountry.SelectedValue;
                FillGridView(Country);
            }
        }
        #endregion Button : Display

        #region FillGridView
        private void FillGridView(String Country)
        {

            #region Variable Declaration
            String StateName = null;
            String StateCode = null;
            String StateCapital = null;
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

                cmdObj.CommandText = "PR_State_SelectByCountryIDAndSearch";

                StateName = txtStateNameSearch.Text;
                StateCode = txtStateCodeSearch.Text;
                StateCapital = txtStateCapitalSearch.Text;

                cmdObj.Parameters.AddWithValue("@UserID", Session["UserID"]);
                cmdObj.Parameters.AddWithValue("@CountryID", Country);
                cmdObj.Parameters.AddWithValue("@StateName", StateName);
                cmdObj.Parameters.AddWithValue("@StateCode", StateCode);
                cmdObj.Parameters.AddWithValue("@StateCapital", StateCapital);

                SqlDataReader sdrObj = cmdObj.ExecuteReader();

                rptState.DataSource = sdrObj;
                rptState.DataBind();

                if(sdrObj.HasRows)
                {
                    tableDisplay.Attributes.Add("class", "display row mt-5");
                }
                else
                {
                    tableDisplay.Attributes.Add("class", "display-none");
                    errDisplay.Attributes.Add("class", "display alert alert-danger");
                    lblInfo.Text = "No Data";
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
        #endregion FillGridView

        #region Row-Command
        protected void rptState_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            #region Delete Record
            if(e.CommandName == "DeleteRecord")
            {
                if(e.CommandArgument.ToString() != "")
                {
                    DeleteStateRecord(e.CommandArgument.ToString().Trim());
                    String Country = ddlCountry.SelectedValue;
                    FillGridView(Country);
                }
            }
            #endregion Delete Record
        }
        #endregion Row-Command

        #region Delete Country Record
        private void DeleteStateRecord(SqlString CountryID)
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
                cmdObj.CommandText = "PR_State_DeleteByPK";

                cmdObj.Parameters.AddWithValue("@UserID", Session["UserID"]);

                cmdObj.Parameters.AddWithValue("@StateID", CountryID);

                cmdObj.ExecuteNonQuery();

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
        #endregion Delete Country Record

        #region Multiple Delete
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            foreach(RepeaterItem rpt in rptState.Items)
            {
                HtmlInputCheckBox chk = (HtmlInputCheckBox)rpt.FindControl("chkRow");
                HiddenField hf = (HiddenField)rpt.FindControl("hfStateID");
                if(chk.Checked)
                {
                    DeleteStateRecord(hf.Value);
                }
            }
            String Country = ddlCountry.SelectedValue;
            FillGridView(Country);
        }
        #endregion Multiple Delete
    }
}