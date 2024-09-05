using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PegasusKYCPortal.GenericKYCApi;

namespace PegasusKYCPortal
{
    public partial class CreateUser : System.Web.UI.Page
    {
        KYCApi api = new KYCApi();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDepartmentsAndRoles();
            }

        }

        protected void AddUser_Click(object sender, EventArgs e)
        {
            string _firstName = firstName.Text;
            string _lastName = lastName.Text;
            string _email = txtEmail.Text;
            string _password = password.Text;
            string _confPassword = confirmPassword.Text;
            string _username = userName.Text;
            int deptID = int.Parse(ddlDepartments.Text);
            int roleId = int.Parse(ddlRoles.Text);
            bool isValid = true;

            if (!_confPassword.Equals(_password))
            {
                if (_password.Length < 8)
                {

                    DisplayMessage($"Password is too short. Please enter a longer password", false);
                }
                else
                {
                    DisplayMessage($"Passwords do not match. Please enter matching passwords", false);

                }
            }
            else if (string.IsNullOrEmpty(_firstName))
            {
                DisplayMessage($"First name is required", false);

            }
            else if (string.IsNullOrEmpty(_lastName))
            {
                DisplayMessage($"Last name is required", false);

            }
            else if (string.IsNullOrEmpty(_email))
            {
                DisplayMessage($"Email is required", false);

            }
            else if (string.IsNullOrEmpty(_username))
            {
                DisplayMessage($"Username is required", false);

            }
            else if (string.IsNullOrEmpty(roleId.ToString()))
            {
                DisplayMessage($"You must select a role", false);

            }
            else if (string.IsNullOrEmpty(deptID.ToString()))
            {
                DisplayMessage($"You must select a department", false);

            }
           else
            {

                int userId = int.Parse(Session["UserId"].ToString());

                string response = api.CreateUser(_firstName, _lastName, _email, _username, deptID, roleId, userId, _password);

                if (!response.ToUpper().Contains("SUCCESSFULLY"))
                {
                    DisplayMessage(response, true);
                    return;
                }
                else
                {
                    firstName.Text = string.Empty;
                    lastName.Text = string.Empty;
                    txtEmail.Text = string.Empty;
                    password.Text = string.Empty;
                    userName.Text = string.Empty;
                    confirmPassword.Text = string.Empty;

                    DisplayMessage($"User Created Successfully", true);
                }
              

            }
          
        }


        public void DisplayMessage(string message, bool isSuccess)
        {
            string formattedMessage = isSuccess ? $"<div class='bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded mb-4'>{message}</div>" :
                $"<div class='bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded mb-4'>{message}</div>";
            MessageLiteral.Text = formattedMessage;
        }

        public void LoadDepartmentsAndRoles()
        {
            DataTable depts = api.GetDepartments();

            ddlDepartments.DataSource = depts;
            ddlDepartments.DataTextField = "DepartmentName";
            ddlDepartments.DataValueField = "DepartmentId";
            ddlDepartments.DataBind();


            DataTable roles = api.GetRoles();

            ddlRoles.DataSource = roles;
            ddlRoles.DataTextField = "RoleName";
            ddlRoles.DataValueField = "RoleId";

            ddlRoles.DataBind();
        }

    }

   
}
