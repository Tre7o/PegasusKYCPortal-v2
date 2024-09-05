using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PegasusKYCPortal.GenericKYCApi;

namespace PegasusKYCPortal
{
    public partial class Profile : System.Web.UI.Page
    {
        KYCApi api = new KYCApi();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {

                if (Session["UserID"] == null)
                {
                    Response.Redirect("Login.aspx");
                    return;
                }

                // Fetch and display profile details
                int userId = Convert.ToInt32(Session["UserID"]);
                FetchAndDisplayProfileDetails(userId);
            }
        }

        private void FetchAndDisplayProfileDetails(int userId)
        {
            try
            {

                ProfileDetails profile = api.FetchProfileDetails(userId);

                if (profile != null)
                {
                    lblFullName.Text = profile.FullName;
                    lblEmail.Text = profile.Email;
                    lblRole.Text = profile.Role;
                    lblDepartment.Text = profile.Department;
                    lblUsername.Text = profile.Username;
                }
                else
                {
                    DisplayMessage("Profile details could not be retrieved.", false);
                }
            }
            catch (Exception ex)
            {
                DisplayMessage("An error occurred while fetching profile details: " + ex.Message, false);
            }
        }

        protected void btnResetPassword_Click(object sender, EventArgs e)
        {
            int userId = Convert.ToInt32(Session["UserID"]);
            string oldPasswordHash = txtOldPassword.Text.Trim();


            string newPasswordHash = txtNewPassword.Text.Trim();
            string confirmPasswordHash = txtConfirmPassword.Text.Trim();

            if (newPasswordHash != confirmPasswordHash)
            {
                DisplayMessage("New password and confirmation do not match.", false);
                return;
            }

            try
            {

                bool isPasswordReset = api.ResetUserPassword(userId, oldPasswordHash, newPasswordHash);

                if (isPasswordReset)
                {
                    DisplayMessage("Password has been successfully reset.", true);
                }
                else
                {
                    DisplayMessage("Failed to reset the password. Ensure the old password is correct.", false);
                }
            }
            catch (Exception ex)
            {
                DisplayMessage("An error occurred while resetting the password: " + ex.Message, false);
            }
        }

        public void DisplayMessage(string message, bool isSuccess)
        {
            string formattedMessage = isSuccess
                ? $"<div class='bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded mb-4'>{message}</div>"
                : $"<div class='bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded mb-4'>{message}</div>";

            MessageLiteral.Text = formattedMessage;
        }
    }

}