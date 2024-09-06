using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PegasusKYCPortal
{
    public partial class ClientLayout : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ClientEmail"]==null)
            {
                Response.Redirect("ClientLogin.aspx");
            }

            lblUsername.Text = Session["Name"].ToString();
            lblEmail.Text = Session["ClientEmail"].ToString();


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

            Response.Redirect("ClientLogin.aspx");
        }
    }
}