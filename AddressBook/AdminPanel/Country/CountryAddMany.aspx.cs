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

namespace AddressBook.AdminPanel.Country
{
    public partial class CountryAddMany : System.Web.UI.Page
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
            }
        }

        #endregion Button : Load

        #region Button : Save
        protected void btnSave_Click(object sender, EventArgs e)
        {

            foreach(RepeaterItem item in rptLoadRows.Items)
            {
                TextBox txtCountryName = (TextBox)item.FindControl("txtCountryName");
                TextBox txtCountryCode = (TextBox)item.FindControl("txtCountryCode");
                TextBox txtCountryCapital = (TextBox)item.FindControl("txtCountryCapital");

                if(txtCountryName != null && txtCountryCode != null && txtCountryCapital != null)
                {
                    saveCountryData(txtCountryName.Text, txtCountryCode.Text, txtCountryCapital.Text);
                }
            }

        }

        #endregion Button : Save

        #region Save Country Data
        private void saveCountryData(String CountryName, String CountryCode, String CountryCapital)
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
                cmdObj.Parameters.AddWithValue("@CountryName", CountryName);
                cmdObj.Parameters.AddWithValue("@CountryCode", CountryCode);
                cmdObj.Parameters.AddWithValue("@CountryCapital", CountryCapital);


                #region Add-mode

                cmdObj.CommandText = "PR_Country_Insert";

                cmdObj.ExecuteNonQuery();

                lblMsj.ForeColor = System.Drawing.Color.Green;
                lblMsj.Text = "Data Inserted Successfully...";
                
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
        #endregion Save Country Data
    }
}