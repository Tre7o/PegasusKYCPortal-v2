using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PegasusKYCPortal
{
    public class SessionManager
    {
        public static void CheckSession(HttpContext context)
        {
            if (context.Session["UserId"] == null)
            {
                // Prevent caching of pages
                context.Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
                context.Response.Cache.SetCacheability(HttpCacheability.NoCache);
                context.Response.Cache.SetNoStore();
                context.Response.AppendHeader("Pragma", "no-cache");
                context.Response.AppendHeader("Cache-Control", "no-cache, no-store, must-revalidate");
                context.Response.AppendHeader("Expires", "0");

                context.Response.Redirect("Login.aspx");
            }
        }
    }
}
