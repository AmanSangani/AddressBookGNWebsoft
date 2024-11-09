using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AddressBook.Content
{
    public partial class AddressBookMasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["UserID"] == null)
            {
                Response.Redirect("~/AdminPanel/Auth/Login.aspx");
            }
            else
            {
                lblDisplayName.Text = "Hello " + Session["DisplayName"].ToString() + " ";
            }
        }

        protected void lbtnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("~/AdminPanel/Auth/Login.aspx");
        }
    }
}