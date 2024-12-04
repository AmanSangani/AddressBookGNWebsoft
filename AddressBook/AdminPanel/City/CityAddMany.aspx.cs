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

namespace AddressBook.AdminPanel.City
{
    public partial class CityAddMany : System.Web.UI.Page
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

                    DropDownList ddlState = (DropDownList)item.FindControl("ddlState");
                    ddlState.Items.Insert(0, new ListItem("Select State", "-1"));
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
                DropDownList ddlState = (DropDownList)item.FindControl("ddlState");
                TextBox txtCityName = (TextBox)item.FindControl("txtCityName");
                TextBox txtCityCode = (TextBox)item.FindControl("txtCityCode");

                bool isRowEmpty = ddlCountry.SelectedValue == "-1" &&
                                  ddlState.SelectedValue == "-1" &&
                                  string.IsNullOrWhiteSpace(txtCityName.Text) &&
                                  string.IsNullOrWhiteSpace(txtCityCode.Text);

                if(isRowEmpty)
                {
                    continue;
                }

                bool isRowCompletelyFilled = ddlCountry.SelectedValue != "-1" &&
                                             ddlState.SelectedValue != "-1" &&
                                             !string.IsNullOrWhiteSpace(txtCityName.Text) &&
                                             !string.IsNullOrWhiteSpace(txtCityCode.Text);

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
                DropDownList ddlState = (DropDownList)item.FindControl("ddlState");
                TextBox txtCityName = (TextBox)item.FindControl("txtCityName");
                TextBox txtCityCode = (TextBox)item.FindControl("txtCityCode");

                bool isRowCompletelyFilled = ddlCountry.SelectedValue != "-1" &&
                                             ddlState.SelectedValue != "-1" &&
                                             !string.IsNullOrWhiteSpace(txtCityName.Text) &&
                                             !string.IsNullOrWhiteSpace(txtCityCode.Text);

                if(isRowCompletelyFilled)
                {
                    saveCityData(ddlState.SelectedValue, txtCityName.Text, txtCityCode.Text);
                }
            }
            #endregion Save Data

            //Response.Redirect("~/AdminPanel/City/List");
        }
        #endregion Button : Save

        #region Save City Data
        private void saveCityData(String StateID, String CityName, String CityCode)
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
                cmdObj.Parameters.AddWithValue("@StateID", StateID);
                cmdObj.Parameters.AddWithValue("@CityName", CityName);
                cmdObj.Parameters.AddWithValue("@CityCode", CityCode);


                #region Add-mode

                cmdObj.CommandText = "PR_City_Insert";

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
        #endregion Save City Data

        #region DropDownList Selection Change
        protected void ddlCountry_SelectedIndexChanged(object sender, EventArgs e)
        {
            RepeaterItem item = (sender as DropDownList).NamingContainer as RepeaterItem;

            DropDownList ddlCountry = (DropDownList)item.FindControl("ddlCountry");
            DropDownList ddlState = (DropDownList)item.FindControl("ddlState");

            if(Request.QueryString["CityCode"] == null)
            {
                ddlState.Items.Clear();

                String str = "";

                str = ddlCountry.SelectedValue;

                CommonDropdownList.FillStateDropDown(ddlState, str, Session["UserID"].ToString());
            }
        }
        #endregion DropDownList Selection Change


    }
}