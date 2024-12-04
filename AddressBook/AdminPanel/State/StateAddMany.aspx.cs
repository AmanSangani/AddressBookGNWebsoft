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

namespace AddressBook.AdminPanel.State
{
    public partial class StateAddMany : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        #region Button : Load
        protected void btnLoad_Click(object sender, EventArgs e)
        {
            columnDisplay.Attributes.Add("class", "row display");
            int numRows = Convert.ToInt32(txtNumOfRow.Text);
            if(numRows > 0)
            {
                List<object> rows = new List<object>();
                for(int i = 0; i < numRows; i++)
                {
                    rows.Add(new { });
                }
                rptLoadRows.DataSource = rows;
                rptLoadRows.DataBind();

                foreach(RepeaterItem item in rptLoadRows.Items)
                {
                    DropDownList ddlCountry = (DropDownList)item.FindControl("ddlCountry");
                    CommonDropdownList.FillCountryDropDown(ddlCountry, Session["UserID"].ToString());
                }
            }
        }

        #endregion Button : Load

        #region Button : Save
        protected void btnSave_Click(object sender, EventArgs e)
        {
            #region Validation
            bool atLeastOneRow = false;

            foreach(RepeaterItem item in rptLoadRows.Items)
            {
                DropDownList ddlCountry = (DropDownList)item.FindControl("ddlCountry");
                TextBox txtStateName = (TextBox)item.FindControl("txtStateName");
                TextBox txtStateCode = (TextBox)item.FindControl("txtStateCode");
                TextBox txtStateCapital = (TextBox)item.FindControl("txtStateCapital");

                bool isRowEmpty = ddlCountry.SelectedValue == "-1" &&
                                  string.IsNullOrWhiteSpace(txtStateName.Text) &&
                                  string.IsNullOrWhiteSpace(txtStateCode.Text) &&
                                  string.IsNullOrWhiteSpace(txtStateCapital.Text);

                if(isRowEmpty)
                {
                    continue;
                }

                bool isRowCompletelyFilled = ddlCountry.SelectedValue != "-1" &&
                                             !string.IsNullOrWhiteSpace(txtStateName.Text) &&
                                             !string.IsNullOrWhiteSpace(txtStateCode.Text) &&
                                             !string.IsNullOrWhiteSpace(txtStateCapital.Text);

                if(isRowCompletelyFilled)
                {
                    atLeastOneRow = true;
                }
                else
                {
                    lblErrMsj.Text = "Please complete all fields or leave them empty.";
                    lblErrMsj.ForeColor = System.Drawing.Color.Red;
                    return;
                }
            }

            if(!atLeastOneRow)
            {
                lblErrMsj.Text = "At least one row must be completely filled.";
                lblErrMsj.ForeColor = System.Drawing.Color.Red;
                return;
            }
            #endregion Validation

            #region Save Data
            foreach(RepeaterItem item in rptLoadRows.Items)
            {
                DropDownList ddlCountry = (DropDownList)item.FindControl("ddlCountry");
                TextBox txtStateName = (TextBox)item.FindControl("txtStateName");
                TextBox txtStateCode = (TextBox)item.FindControl("txtStateCode");
                TextBox txtStateCapital = (TextBox)item.FindControl("txtStateCapital");

                bool isRowCompletelyFilled = ddlCountry.SelectedValue != "-1" && 
                                             !string.IsNullOrWhiteSpace(txtStateName.Text) &&
                                             !string.IsNullOrWhiteSpace(txtStateCode.Text) &&
                                             !string.IsNullOrWhiteSpace(txtStateCapital.Text);

                if(isRowCompletelyFilled)
                {
                    saveStateData(ddlCountry.SelectedValue, txtStateName.Text, txtStateCode.Text, txtStateCapital.Text);
                }
            }
            #endregion Save Data

            Response.Redirect("~/AdminPanel/State/List");
        }
        #endregion Button : Save

        #region Save State Data
        private void saveStateData(String CountryID, String StateName, String StateCode, String StateCapital)
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

                #region Store Procedure, parameters and execute

                cmdObj.Parameters.AddWithValue("@UserID", Session["UserID"]);
                cmdObj.Parameters.AddWithValue("@CountryID", CountryID);
                cmdObj.Parameters.AddWithValue("@StateName", StateName);
                cmdObj.Parameters.AddWithValue("@StateCode", StateCode);
                cmdObj.Parameters.AddWithValue("@StateCapital", StateCapital);


                #region Add-mode

                cmdObj.CommandText = "PR_State_Insert";

                cmdObj.ExecuteNonQuery();

                lblErrMsj.ForeColor = System.Drawing.Color.Green;
                lblErrMsj.Text = "Data Inserted Successfully...";

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
            }
            #endregion Close Connection
        }
        #endregion Save State Data

    }
}