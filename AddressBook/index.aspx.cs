using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Diagnostics.PerformanceData;
using System.Drawing.Printing;
using System.Web.UI.DataVisualization.Charting;
using System.Security.Cryptography.X509Certificates;
using System.Web.UI.HtmlControls;

namespace AddressBook
{
    public partial class index : System.Web.UI.Page
    {

        double countOfCountry = 0;
        double pageSize = 5;
        double numOfPages = 0;
        double PageNumber = 1;

        #region Page Load
        protected void Page_Load(object sender, EventArgs e)
        {
            showCount();

            drawChart();

            FillGridViewState();

            FillGridViewCity();

            if(!Page.IsPostBack)
            {
                FillGridView();
            }

        }
        #endregion Page Load

        #region showCount
        private void showCount()
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
                cmdObj.CommandText = "PR_CSC_GetTotalCountryStateCityCount";

                cmdObj.Parameters.AddWithValue("@UserID", Session["UserID"]);
                
                SqlDataReader sdrObj = cmdObj.ExecuteReader();

                if(sdrObj.Read())
                {
                    int totalCountry = Convert.ToInt32(sdrObj["TotalCountry"]);
                    int totalState = Convert.ToInt32(sdrObj["TotalState"]);
                    int totalCity = Convert.ToInt32(sdrObj["TotalCity"]);

                    countOfCountry = totalCountry;

                    lblCountryTotal.Text = totalCountry.ToString();
                    lblStateTotal.Text = totalState.ToString();
                    lblCityTotal.Text = totalCity.ToString();

                    countOfCountry = Convert.ToInt32(totalCountry);

                    numOfPages = Math.Ceiling(countOfCountry / pageSize);

                }
                #endregion Store Procedure, Parameters and Execute

                #region create Pagination
                List<object> rows = new List<object>();
                for(int i = 1; i <= numOfPages; i++)
                {
                    rows.Add(new { });
                }
                rptPagination.DataSource = rows;
                rptPagination.DataBind();

                int index = 1;
                foreach(RepeaterItem item in rptPagination.Items)
                {
                    LinkButton hlNumOfPage = (LinkButton)item.FindControl("hlNumOfPage");
                    hlNumOfPage.Text = index.ToString();
                    index++;
                }
                #endregion create Pagination

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
        #endregion showCount

        #region Chart
        private void drawChart()
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
                cmdObj.CommandText = "PR_Graph_GetTotalStateCountOnCountry";

                cmdObj.Parameters.AddWithValue("@UserID", Session["UserID"]);

                SqlDataAdapter da = new SqlDataAdapter(cmdObj);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if(dt.Rows.Count > 0)
                {
                    Chart1.Visible = true;
                    Chart1.DataSource = dt;
                    Chart1.Series[0].ChartType = SeriesChartType.Column;
                    Chart1.Legends[0].Enabled = true;
                    Chart1.Series[0].XValueMember = "CountryName";
                    Chart1.Series[0].YValueMembers = "TotalState";
                    Chart1.DataBind();
                }
                else
                {
                    Response.Write("No data found.");
                }

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
        #endregion Chart

        #region Recent States

        private void FillGridViewState()
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

                cmdObj.CommandText = "PR_State_SelectForRecent";

                cmdObj.Parameters.AddWithValue("@UserID", Session["UserID"]);

                SqlDataReader sdrObj = cmdObj.ExecuteReader();

                rpState.DataSource = sdrObj;
                rpState.DataBind();

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

        #endregion Recent States

        #region Recent States

        private void FillDataTreeState(String CountryID)
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

                cmdObj.Parameters.AddWithValue("@UserID", Session["UserID"]);
                cmdObj.Parameters.AddWithValue("@CountryID", CountryID);

                SqlDataReader sdrObj = cmdObj.ExecuteReader();

                foreach(RepeaterItem items in rptCountry.Items)
                {
                    Button btnTree = (Button)items.FindControl("btnTree");
                    Repeater rptState = (Repeater)items.FindControl("rptState");
                    Control StateTree = items.FindControl("StateTree") as Control;
                    HiddenField hdCountryID = (HiddenField)items.FindControl("hdCountryID");

                    if(btnTree.Text == "-")
                    {
                        StateTree.Visible = false;
                        btnTree.Text = "+";
                        return;
                    }

                    if(hdCountryID.Value == CountryID && btnTree.Text == "+")
                    {
                        rptState.DataSource = sdrObj;
                        rptState.DataBind();
                        StateTree.Visible = true;
                        btnTree.Text = "-";
                    }

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

        #endregion Recent States

        #region Recent City

        private void FillGridViewCity()
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

                cmdObj.CommandText = "PR_City_SelectForRecent";

                cmdObj.Parameters.AddWithValue("@UserID", Session["UserID"]);

                SqlDataReader sdrObj = cmdObj.ExecuteReader();

                rpCity.DataSource = sdrObj;
                rpCity.DataBind();

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

        #endregion Recent City

        #region Fill Data Tree

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

                cmdObj.Parameters.AddWithValue("@UserID", Session["UserID"]);
                cmdObj.Parameters.AddWithValue("@PageNumber", PageNumber);
                cmdObj.Parameters.AddWithValue("@PageSize", pageSize);
                cmdObj.Parameters.AddWithValue("@CountryName", "");
                cmdObj.Parameters.AddWithValue("@CountryCode", "");

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

        #endregion Fill Data Tree

        #region Pagination Row-Command
        protected void rptPagination_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            #region Page Number
            if(e.CommandName == "numOfPage")
            {
                if(e.CommandArgument.ToString() != "")
                {
                    PageNumber = Convert.ToInt32(e.CommandArgument.ToString());
                    FillGridView();
                }
            }
            #endregion Page Number
        }
        #endregion Pagination Row-Command

        protected void rptCountry_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            #region Fill States
            if(e.CommandName == "FillStateRecord")
            {
                if(e.CommandArgument.ToString() != "")
                {
                    FillDataTreeState(e.CommandArgument.ToString().Trim());
                }
            }
            #endregion Fill States
        }
    }
}