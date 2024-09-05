using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PegasusKYCPortal
{
    public class DefaultPageSetup
    {

        public static string SetUpPage(string roleName)
        {

            string defaultPage;

            switch (roleName.ToUpper())
            {
                case "SUPERADMIN":
                    defaultPage = "AdminDashboard.aspx";
                    break;

                case "LEGAL AND COMPLIANCE":
                    defaultPage = "ViewClients.aspx";
                    break;

                case "BUSINESS DEVELOPMENT":
                    defaultPage = "ViewClients.aspx";
                    break;

                case "FINANCE":
                    defaultPage = "ViewClients.aspx";
                    break;

                case "SECURITY":
                    defaultPage = "ViewClients.aspx";
                    break;
                case "TECHNICAL":
                    defaultPage = "ViewClients.aspx";
                    break;
                case "MANAGEMENT":
                    defaultPage = "ViewClients.aspx";
                    break;

                default:
                    defaultPage = "Login.aspx";
                    break;
            }

            return defaultPage;
        }
    }
}