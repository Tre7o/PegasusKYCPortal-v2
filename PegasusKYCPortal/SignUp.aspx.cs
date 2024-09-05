using PegasusKYCPortal.GenericKYCApi;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PegasusKYCPortal
{
    public partial class SignUp : System.Web.UI.Page
    {
        KYCApi api = new KYCApi();
        
        //ClientManager
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            // Validate inputs
            if (txtPassword.Text != txtConfirmPassword.Text)
            {
                MessageLiteral.Text = "<span style='color: red;'>Passwords do not match!</span>";
                return;
            }

            string email = txtEmail.Text;
            string password = txtPassword.Text;
            string username = txtUsername.Text;
            // Call the SignUp method from ClientManager
            var response = api.SignupClient(email, password,username);

            // Check the response and handle success or failure
            if (response.StatusCode == "200")
            {
                // Registration successful, redirect to login page
                MessageLiteral.Text = "<span style='color: green;'>Registration successful! Redirecting to login...</span>";
                Response.Redirect("ClientLogin.aspx");
            }
            else
            {
                // Registration failed, show error message
                MessageLiteral.Text = $"<span style='color: red;'>Error: {response.StatusDescription}</span>";
            }
            Response.Redirect("ClientLogin.aspx");
        }
    }
}