using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics.PerformanceData;
using System.Drawing.Printing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AddressBook.AdminPanel.City;
using AddressBook.Dataset;
using Microsoft.Reporting.WebForms;
using static AddressBook.Dataset.dtCountryList;


namespace AddressBook.AdminPanel.Country
{
    public partial class Print : System.Web.UI.Page
    {

        DataTable dt = new DataTable();
        private dtCountryList dtCountryTemp = new dtCountryList();

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                ShowReport();
            }
        }

        protected void ShowReport()
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
                cmdObj.CommandText = "PR_Country_SelectAll";

                cmdObj.Parameters.AddWithValue("@UserID", Session["UserID"]);
                cmdObj.Parameters.AddWithValue("@PageNumber", 1);
                cmdObj.Parameters.AddWithValue("@PageSize", 50);
                cmdObj.Parameters.AddWithValue("@CountryName", "");
                cmdObj.Parameters.AddWithValue("@CountryCode", "");

                dt.Load(cmdObj.ExecuteReader());

                FillDataSet();

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

        private void FillDataSet()
        {
            foreach(DataRow dr in dt.Rows)
            {

                dtCountryList.dtCountryRow CountryRow = dtCountryTemp.dtCountry.NewdtCountryRow();

                if(!dr["CountryID"].Equals(DBNull.Value))
                {
                    CountryRow.CountryID = Convert.ToString(dr["CountryID"]);
                }

                if(!dr["CountryName"].Equals(DBNull.Value))
                {
                    CountryRow.CountryName = Convert.ToString(dr["CountryName"]);
                }

                if(!dr["CountryCode"].Equals(DBNull.Value))
                {
                    CountryRow.CountryCode = Convert.ToString(dr["CountryCode"]);
                }

                if(!dr["CountryCapital"].Equals(DBNull.Value))
                {
                    CountryRow.CountryCapital = Convert.ToString(dr["CountryCapital"]);
                }

                dtCountryTemp.dtCountry.Rows.Add(CountryRow);
            }

            SetReportParameters();
            rvCountryList.LocalReport.DataSources.Clear();
            rvCountryList.LocalReport.DataSources.Add(new ReportDataSource("Country", (DataTable)dtCountryTemp.dtCountry));
            rvCountryList.LocalReport.Refresh();
        }

        private void SetReportParameters()
        {
            String ReportTitle = "Country List";
            ReportParameter rptReportTitle = new ReportParameter("ReportTitle", ReportTitle);

            rvCountryList.LocalReport.SetParameters(new ReportParameter[] { rptReportTitle });
        }

    }
}