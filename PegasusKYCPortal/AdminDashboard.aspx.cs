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
    public partial class AdminDashboard : System.Web.UI.Page
    {
        KYCApi api = new KYCApi();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
              
                PopulateAdminDetails();
            }

        }

        private void PopulateAdminDetails()
        {

            DataTable users = api.GetUsers();
            DataTable depts = api.GetDepartments();
            DataTable roles = api.GetRoles();

            rptUsers.DataSource = users;
            rptUsers.DataBind();

            int totalUsers = users.Rows.Count;
            int totalDepartments = depts.Rows.Count;
            int totalRoles = roles.Rows.Count;

            ltlTotalUsers.Text = totalUsers.ToString();
            ltlTotalDepartments.Text = totalDepartments.ToString();
            ltlTotalRoles.Text = totalRoles.ToString();
        }
      
    }
}