using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PegasusKYCPortal.GenericKYCApi;

namespace PegasusKYCPortal
{
    public partial class CreateRole : System.Web.UI.Page
    {
        KYCApi api = new KYCApi();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                DataTable roles = api.GetRoles();

                rptRoles.DataSource = roles;
                rptRoles.DataBind();

                DataTable departments = api.GetDepartments();
                ddlDepartments.DataSource = departments;
                ddlDepartments.DataTextField = "DepartmentName";
                ddlDepartments.DataValueField = "DepartmentId";
                ddlDepartments.DataBind();

            }

        }

  

        protected void AddRole_Click(object sender, EventArgs e)
        {
            string roleName = txtRoleName.Text;
            string description = txtRoleDescription.Text;
            string dept = ddlDepartments.Text;
            string defaultPage = DefaultPageSetup.SetUpPage(roleName);
            int  userId = int.Parse(Session["UserId"].ToString());

            MessageLiteral.Text = $"Role name is {roleName}";

            if (string.IsNullOrEmpty(roleName))
            {
                DisplayMessage($"Role name cannot be empty", false);

            }else if (string.IsNullOrEmpty(description))
            {
                DisplayMessage($"Role description cannot be empty", false);

            }else if (string.IsNullOrEmpty(dept))
            {
                DisplayMessage($"You must select a department", false);
            }
            else
            {
                DisplayMessage($"Role Created Successfully", true);

                txtRoleDescription.Text = string.Empty;
                txtRoleName.Text = string.Empty;

                int deptId = int.Parse(dept);

                string response = api.CreateRole(roleName, description, userId, deptId, defaultPage);

                if (!response.ToUpper().Contains("SUCCESSFULLY"))
                {
                    DisplayMessage(response, false);
                }
                else
                {
                    DisplayMessage(response, true);

                    Response.Redirect(Request.Url.AbsoluteUri);
                }

            }
        }

        public void DisplayMessage(string message, bool isSuccess)
        {
            string formattedMessage = isSuccess ? $"<div class='bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded mb-4'>{message}</div>" :
                $"<div class='bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded mb-4'>{message}</div>";
            MessageLiteral.Text = formattedMessage;
        }
    }
}