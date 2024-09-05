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
    public partial class Departments : System.Web.UI.Page
    {
        KYCApi api = new KYCApi();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                DataTable departments = api.GetDepartments();

                rptDepartments.DataSource = departments;
                rptDepartments.DataBind();
            }

        }



        protected void CreateDepartment_Click(object sender, EventArgs e)
        {
            string deptName = dept.Text;

            if (string.IsNullOrEmpty(deptName))
            {
                DisplayMessage($"Department name cannot be empty", false);

            }
            else
            {
                int userId = int.Parse(Session["UserId"].ToString());
                string response = api.CreateDepartment(deptName, userId);

                if (!response.ToUpper().Contains("SUCCESSFULLY"))
                {
                DisplayMessage(response, false);

                }
                else
                {
                    DisplayMessage(response, true);
                    Response.Redirect(Request.Url.AbsoluteUri);

                    dept.Text = string.Empty;
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