using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PegasusKYCPortal
{
    public partial class Layout : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SessionManager.CheckSession(HttpContext.Current);

            string role = Session["RoleId"].ToString();
            if (string.IsNullOrEmpty(role))
            {
                Response.Redirect("Login.aspx");

            }


            int roleId = int.Parse(Session["RoleId"].ToString());
          

            lblUsername.Text = Session["Name"].ToString();
            lblEmail.Text = Session["Email"].ToString();

            if (roleId == 1)
            {
                pnlSuperAdmin.Visible = true;
                pnlBusinessTeam.Visible = false;
                pnlLegal.Visible = false;
            }
            else if (roleId == 3)
            {
                pnlBusinessTeam.Visible = true;
                pnlSuperAdmin.Visible = false;
                pnlLegal.Visible = false;
            }
            else if (roleId == 2)
            {
                pnlLegal.Visible = true;
                pnlBusinessTeam.Visible = false;
                pnlSuperAdmin.Visible = false;
            }
            else
            {

            }

        }

        protected string GetActiveClass(string pageName)
        {
            string currentPage = System.IO.Path.GetFileName(Request.Url.AbsolutePath);
            return currentPage.Equals(pageName, StringComparison.OrdinalIgnoreCase) ? "bg-[#d71a21] text-white font-semibold" : "";
        }

        protected void Logout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();

            // Prevent caching of the page
            Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetNoStore();
            Response.AppendHeader("Pragma", "no-cache");
            Response.AppendHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            Response.AppendHeader("Expires", "0");

            Response.Redirect("Login.aspx");
        }
    }
}