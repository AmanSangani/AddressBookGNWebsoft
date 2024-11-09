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
using AddressBook.HelperClass;
using System.Security.Policy;
using System.Web.UI.HtmlControls;

namespace AddressBook.AdminPanel.City
{
    public partial class CityList : System.Web.UI.Page
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

        #region DropDownList Selection Change
        protected void ddlCountry_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(Request.QueryString["CityCode"] == null)
            {
                ddlState.Items.Clear();

                String str = "";

                str = ddlCountry.SelectedValue;

                FillStateDropDown(str);
            }
        }
        #endregion DropDownList Selection Change

        #region FillStateDropDown
        private void FillStateDropDown(String CountryID)
        {
            CommonDropdownList.FillStateDropDown(ddlState, CountryID, Session["UserID"].ToString());
        }

        #endregion FillStateDropDown

        #region Button : Display
        protected void btnDisplay_Click(object sender, EventArgs e)
        {
            if(ddlState.SelectedValue != "-1")
            {
                String StateID = ddlState.SelectedValue;
                FillGridView(StateID);
            }
        }
        #endregion Button : Display

        #region Button : Clear
        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtCityNameSearch.Text = "";
            txtCityCodeSearch.Text = "";
            FillGridView(ddlState.SelectedValue);
        }
        #endregion Button : Clear

        #region FillGridView
        private void FillGridView(String StateID)
        {

            #region Variable Declare
            String CityName = null;
            String CityCode = null;
            #endregion Variable Declare

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

                cmdObj.CommandText = "PR_City_SelectByStateIDAndSearch";

                CityName = txtCityNameSearch.Text;
                CityCode = txtCityCodeSearch.Text;

                cmdObj.Parameters.AddWithValue("@UserID", Session["UserID"]);

                cmdObj.Parameters.AddWithValue("@StateID", StateID);
                cmdObj.Parameters.AddWithValue("@CityName", CityName);
                cmdObj.Parameters.AddWithValue("@CityCode", CityCode);
                     
                SqlDataReader sdrObj = cmdObj.ExecuteReader();

                rptCity.DataSource = sdrObj;
                rptCity.DataBind();

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
        protected void rptCity_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            #region Delete Record
            if(e.CommandName == "DeleteRecord")
            {
                if(e.CommandArgument.ToString() != "")
                {
                    DeleteCityRecord(e.CommandArgument.ToString().Trim());
                    FillGridView(ddlState.SelectedValue);
                }
            }
            #endregion Delete Record
        }
        #endregion Row-Command

        #region Delete City Record
        private void DeleteCityRecord(SqlString CityID)
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
                cmdObj.CommandText = "PR_City_DeleteByPK";

                cmdObj.Parameters.AddWithValue("@UserID", Session["UserID"]);

                cmdObj.Parameters.AddWithValue("@CityID", CityID);

                cmdObj.ExecuteNonQuery();

                String StateID = ddlState.SelectedValue;
                

                #endregion Store Procedure, Parameters and Execute

            }
            #region Exception Handling
            catch(SqlException sqlEx)
            {
                lblMsj.ForeColor = System.Drawing.Color.Red;
                lblMsj.Text = "SQL Error : " + sqlEx.ErrorCode + " - " + sqlEx.Message;
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
        #endregion Delete City Record

        #region Multiple Delete
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            foreach(RepeaterItem rpt in rptCity.Items)
            {
                HtmlInputCheckBox chk = (HtmlInputCheckBox)rpt.FindControl("chkRow");
                HiddenField hf = (HiddenField)rpt.FindControl("hfCityID");
                if(chk.Checked)
                {
                    DeleteCityRecord(hf.Value);
                }
            }
            FillGridView(ddlState.SelectedValue);
        }
        #endregion Multiple Delete
    }
}