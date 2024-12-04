using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace AddressBook
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {
            RegisterRoutes(System.Web.Routing.RouteTable.Routes);
        }

        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }


        public static void RegisterRoutes(System.Web.Routing.RouteCollection routes)
        {
            routes.Ignore("{resource}.axd/{*pathInfo}");

            #region Country Routes

            routes.MapPageRoute("AddressBookCountryList", "AdminPanel/Country/List", "~/AdminPanel/Country/CountryList.aspx");
            
            routes.MapPageRoute("AddressBookCountryAddMany", "AdminPanel/Country/AddMany", "~/AdminPanel/Country/CountryAddMany.aspx");

            routes.MapPageRoute("AddressBookCountryAdd", "AdminPanel/Country/{OperationName}", "~/AdminPanel/Country/CountryAddEdit.aspx");

            routes.MapPageRoute("AddressBookCountryEdit", "AdminPanel/Country/{OperationName}/{CountryID}", "~/AdminPanel/Country/CountryAddEdit.aspx");


            #endregion Country Routes

            #region State Routes

            routes.MapPageRoute("AddressBookStateList", "AdminPanel/State/List", "~/AdminPanel/State/StateList.aspx");

            routes.MapPageRoute("AddressBookStateAddMany", "AdminPanel/State/AddMany", "~/AdminPanel/State/StateAddMany.aspx");

            routes.MapPageRoute("AddressBookStateAdd", "AdminPanel/State/{OperationName}", "~/AdminPanel/State/StateAddEdit.aspx");

            routes.MapPageRoute("AddressBookStateEdit", "AdminPanel/State/{OperationName}/{StateID}", "~/AdminPanel/State/StateAddEdit.aspx");

            #endregion State Routes

            #region City Routes

            routes.MapPageRoute("AddressBookCityList", "AdminPanel/City/List", "~/AdminPanel/City/CityList.aspx");

            routes.MapPageRoute("AddressBookCityAddMany", "AdminPanel/City/AddMany", "~/AdminPanel/City/CityAddMany.aspx");

            routes.MapPageRoute("AddressBookCityAdd", "AdminPanel/City/{OperationName}", "~/AdminPanel/City/CityAddEdit.aspx");

            routes.MapPageRoute("AddressBookCityEdit", "AdminPanel/City/{OperationName}/{CityID}", "~/AdminPanel/City/CityAddEdit.aspx");

            #endregion City Routes

            #region ContactCategory Routes

            routes.MapPageRoute("AddressBookContactCategoryList", "AdminPanel/ContactCategory/List", "~/AdminPanel/ContactCategory/ContactCategoryList.aspx");

            routes.MapPageRoute("AddressBookContactCategoryEdit", "AdminPanel/ContactCategory/{OperationName}/{ContactCategoryID}", "~/AdminPanel/ContactCategory/ContactCategoryList.aspx");

            #endregion ContactCategory Routes

            #region Contact Routes

            routes.MapPageRoute("AddressBookContactList", "AdminPanel/Contact/List", "~/AdminPanel/Contact/list.aspx");

            routes.MapPageRoute("AddressBookContactAdd", "AdminPanel/Contact/{OperationName}", "~/AdminPanel/Contact/ContactAddEdit.aspx");

            routes.MapPageRoute("AddressBookContactEdit", "AdminPanel/Contact/{OperationName}/{ContactID}", "~/AdminPanel/Contact/ContactAddEdit.aspx");

            #endregion Contact Routes

        }
    }
}