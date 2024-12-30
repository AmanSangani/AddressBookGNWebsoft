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
using System.Net.Mail;
using System.Net;

namespace AddressBook.AdminPanel.Auth
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        #region Button : Check/Validate
        protected void btnCheck_Click(object sender, EventArgs e)
        {
            if(txtUsername.Text != "" || txtEmail.Text != "")
            {
                #region Establish Connection

                SqlConnection connObj = new SqlConnection();

                connObj.ConnectionString = ConfigurationManager.ConnectionStrings["AddressBookConnectionString"].ConnectionString;

                #endregion Establish Connection

                try
                {
                    #region Connection and Command Object

                    if(connObj.State != ConnectionState.Open)
                    {
                        connObj.Open();
                    }

                    SqlCommand cmdObj = new SqlCommand();

                    cmdObj.Connection = connObj;

                    cmdObj.CommandType = CommandType.StoredProcedure;

                    #endregion Connection and Command Object

                    #region Store Procedure, Parameters and Execute 

                    cmdObj.CommandText = "PR_User_ChkEmailUsername";

                    cmdObj.Parameters.AddWithValue("@Username", txtUsername.Text);
                    cmdObj.Parameters.AddWithValue("@Email", txtEmail.Text);

                    SqlDataReader sdrObj = cmdObj.ExecuteReader();

                    if(sdrObj.HasRows)
                    {
                        while(sdrObj.Read())
                        {
                            ViewState["UserID"] = sdrObj["UserID"].ToString();

                            DIV_btnCheck.Visible = false;
                            DIV_btnSendOTP.Visible = true;
                            DIV_Username.Disabled = true;
                            DIV_Email.Disabled = true;

                            return;
                        }
                    }
                    else
                    {
                        lblMessage.Text = "Either username or email is incorrect...";
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
                    if(connObj.State == ConnectionState.Open)
                    {
                        connObj.Close();
                    }
                }
                #endregion Close Connection
            }
            else
            {
                lblMessage.Text = "Enter Required Details...";
            }
        }
        #endregion Button : Check/Validate

        #region Button : Send OTP
        protected void btnSendOTP_Click(object sender, EventArgs e)
        {
            SendOTP();
        }
        #endregion Button : Send OTP

        #region SendOTP
        protected void SendOTP()
        {
            string to = txtEmail.Text.ToString().Trim();
            Random generator = new Random();
            string r = generator.Next(0, 1000000).ToString("D6");
            string message = r;
            ViewState["OTP"] = message;
            string subject = "OTP VERIFICATION";

            try
            {
                SendEmail(to, message, subject);
                DIV_OTP.Visible = true;
                DIV_btnVerify.Visible = true;
                DIV_btnSendOTP.Visible = false; 
            }
            catch(Exception ex)
            {

            }
        }
        #endregion SendOTP

        #region Send Email
        protected void SendEmail(string email, string subject, string message)
        {
            var fromAddress = new MailAddress("sanganiaman1310@gmail.com", "GNForm3C");
            var toAddress = new MailAddress(email, "GNForm3C");
            const string fromPassword = "xxxx dnio kyaq nqkv";

            var smtp = new SmtpClient
            {
                Host = "smtp.gmail.com",
                Port = 587,
                EnableSsl = true,
                DeliveryMethod = SmtpDeliveryMethod.Network,
                UseDefaultCredentials = false,
                Credentials = new NetworkCredential(fromAddress.Address, fromPassword)
            };

            try
            {
                using(var temp = new MailMessage(fromAddress, toAddress)
                {
                    Subject = subject,
                    Body = message
                })
                {
                    smtp.Send(temp);
                }
                //smtpClient.Send(mail);
            }
            catch(Exception ex)
            {

            }
        }
        #endregion Send Email

        #region Button : Verify
        protected void btnVerifyOTP_Click(object sender, EventArgs e)
        {
            if(ViewState["UserID"] == null)
            {
                return;
            }
            if(ViewState["OTP"] != null)
            {
                string OTP = ViewState["OTP"].ToString();
                if(txtOTP.Text == OTP)
                {
                    Response.Redirect("~/AdminPanel/Auth/ChangePassword.aspx?UserID=" + AddressBook.HelperClass.EncryptDecrypt.encrypt(ViewState["UserID"].ToString()));
                }
                else
                {
                    lblMessage.Text = "Invalid OTP";
                }
            }
        }
        #endregion Button : Verify


    }
}