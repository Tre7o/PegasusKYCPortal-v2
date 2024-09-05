using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PegasusKYCPortal.GenericKYCApi;

namespace PegasusKYCPortal
{
    public partial class Notifications : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            string userID = Session["userID"].ToString();
            KYCApi api = new KYCApi();
           

            if (!Page.IsPostBack) {
                ResponseWithDataTable resp2 =api.GetAllUserNotifications(int.Parse(userID));
                if (resp2.DataTable != null) {
                    rptNotifications2.DataSource = resp2.DataTable;
                    rptNotifications2.DataBind();
                }
            }
        }

       
        
    }
}