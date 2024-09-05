using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;
using PegasusKYCPortal.GenericKYCApi;

namespace PegasusKYCPortal
{
    public partial class Login : System.Web.UI.Page
    {

        KYCApi api = new KYCApi();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmitOTP_Click(object sender, EventArgs e)
        {
            string email = Session["Email"].ToString();
            string OTP = txtOTP.Text;

            if (string.IsNullOrEmpty(OTP))
            {
                DisplayMessage("OTP cannot be empty", false);
            }
            else if (string.IsNullOrEmpty(OTP))
            {
                DisplayMessage("Email or username not found", false);

            }
            else
            {
                VerifyOTPResponse response = api.VerifyUserOTP(email, OTP);

                if (!response.Message.ToUpper().Contains("SUCCESSFULLY"))
                {
                    DisplayMessage(response.Message, false);

                }
                else
                {
                    DisplayMessage(response.Message, true);
                    txtOTP.Text = string.Empty;

                    Session["RoleId"] = response.userDTO.RoleId;
                    Session["Name"] = response.userDTO.FirstName + " " + response.userDTO.LastName;
                    Session["UserId"] = response.userDTO.UserId;
                    Session["Email"] = response.userDTO.Email;
                    Session["DepartmentId"] = response.userDTO.DepartmentId;

                    if (response.userDTO.RoleId == 1)
                    {
                        Response.Redirect("AdminDashboard.aspx");

                    }
                    else if (response.userDTO.RoleId == 2)
                    {
                        Response.Redirect("ViewClients.aspx?status=pending");

                    }
                    else
                    {
                        Response.Redirect("ViewClients.aspx?status=pending");
                    }
                }
            }

        }

        protected void login_Click(object sender, EventArgs e)
        {
            string email = null;

            string username = txtUsername.Text;
            string password = txtPassword.Text;

            if (string.IsNullOrEmpty(username))
            {
                DisplayMessage("Username cannot be null", false);
            }
            else if (string.IsNullOrEmpty(password))
            {
                DisplayMessage("Please provide a password to continue", false);

            }
            else
            {
                Session["Email"] = txtUsername.Text;
                bool response = api.VerifyUserCredentials(username, password, out email);

                if (response)
                {
                    DisplayMessage("We have sent an OTP to your email address. Check your email and enter it below", true);


                    txtUsername.Text = string.Empty;
                    txtPassword.Text = string.Empty;

                    pnlOTP.Visible = true;
                    pnlForm.Visible = false;
                }
                else
                {
                 //   DisplayMessage("Invalid login Credentials. Try again!", false);
                    DisplayMessage("Invalid login Credentials. Try again!", false);
                }
            }

            Debug.WriteLine($"Email: {password}");
        }

        public void DisplayMessage(string message, bool isSuccess)
        {
            string formattedMessage = isSuccess ?
                $"<div class='bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded mb-4'>{message}</div>" :
                $"<div class='bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded mb-4'>{message}</div>";
            MessageLiteral.Text = formattedMessage;
        }

  

        protected void btnResetPassword_Click(object sender, EventArgs e)
        {
            string output = null;
            string pass = txtNewPassword.Text;
            string confirmPass = txtConfirmPassword.Text;
            string email = txtResetEmail.Text;
            if (string.IsNullOrEmpty(email))
            {
                DisplayMessage("Username is required!", false);
            }
            else if (string.IsNullOrEmpty(pass))
            {
                DisplayMessage("Password field cannot be empty!", false);

            }
            if (pass != confirmPass)
            {
                DisplayMessage("Passwords do not match!", false);
            }
            else if (pass.Length < 8)
            {
                DisplayMessage("Password is too short. Enter a minimum of 8 characters!", false);

            }
            else
            {
                string message = api.ResetPassword(email, pass, out output);

                if (message.ToUpper().Contains("OTP SENT"))
                {
                    Session["Email"] = output;
                    pnlOTP.Visible = true;
                    pnlPasswordReset.Visible = false;
                    pnlForm.Visible = false;

                    DisplayMessage(message, true);
                }
                else
                {
                    DisplayMessage(message, false);
                }
            }
        }

        protected void btnSendResetLink_Click(object sender, EventArgs e)
        {
            // Reser password login
            pnlPasswordReset.Visible = true;
            pnlOTP.Visible = false;
            pnlForm.Visible = false;
        }

        protected void btnResendOTP_Click(object sender, EventArgs e)
        {
            bool sent = api.ResendOTP(Session["Email"].ToString());
            if (sent)
            {
                DisplayMessage("An OTP has been resent to you email address. Enter it below", sent);

            }
            else
            {
                DisplayMessage("Failed to resend OTP. Try again!", sent);

            }

        }
    }
}