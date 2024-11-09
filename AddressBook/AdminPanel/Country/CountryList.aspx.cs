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

namespace AddressBook.AdminPanel.Country
{
    public partial class CountryList : System.Web.UI.Page
    {
        #region Page Load
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                FillGridView();
            }
        }
        #endregion Page Load

        #region FillGridView
        private void FillGridView()
        {

            #region Variable Declaration
            String CountryName = null;
            String CountryCode = null;
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

                cmdObj.CommandText = "PR_Country_SelectAll";

                CountryName = txtCountryNameSearch.Text;
                CountryCode = txtCountryCodeSearch.Text;

                cmdObj.Parameters.AddWithValue("@UserID", Session["UserID"]);
                cmdObj.Parameters.AddWithValue("@CountryName", CountryName);
                cmdObj.Parameters.AddWithValue("@CountryCode", CountryCode);

                SqlDataReader sdrObj = cmdObj.ExecuteReader();

                rptCountry.DataSource = sdrObj;
                rptCountry.DataBind();

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
        protected void rptCountry_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            #region Delete Record
            if(e.CommandName == "DeleteRecord")
            {
                if(e.CommandArgument.ToString() != "")
                {
                    DeleteCountryRecord(e.CommandArgument.ToString().Trim());
                    FillGridView();
                }
            }
            #endregion Delete Record
        }
        #endregion Row-Command

        #region Delete Country Record
        private void DeleteCountryRecord(SqlString CountryID)
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
                cmdObj.CommandText = "PR_Country_DeleteByPK";

                cmdObj.Parameters.AddWithValue("@UserID", Session["UserID"]);

                cmdObj.Parameters.AddWithValue("@CountryID", CountryID);

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

        #region Button : Search
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            FillGridView();
        }
        #endregion Button : Search

        #region Button : Clear
        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtCountryNameSearch.Text = "";
            txtCountryCodeSearch.Text = "";
            FillGridView();
        }
        #endregion Button : Clear

        #region Multiple Delete
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            foreach(RepeaterItem rpt in rptCountry.Items)
            {
                HtmlInputCheckBox chk = (HtmlInputCheckBox)rpt.FindControl("chkRow");
                HiddenField hf = (HiddenField)rpt.FindControl("hfCountryID");
                if(chk.Checked)
                {
                    DeleteCountryRecord(hf.Value);
                }
            }
            FillGridView();
        }
        #endregion Multiple Delete
    }
}