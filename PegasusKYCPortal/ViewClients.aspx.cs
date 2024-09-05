using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PegasusKYCPortal.GenericKYCApi;

namespace PegasusKYCPortal
{
    public partial class ViewClients : System.Web.UI.Page
    {
        KYCApi api = new KYCApi();

        DataTable allBusinesses = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string status = Request.QueryString["status"];
                Session["status"] = status.ToUpper();
                if (!string.IsNullOrEmpty(status))
                {
                    string departmentId = Session["DepartmentId"].ToString();
                    ResponseWithDataTable resp = null;
                    //ResponseWithDataTable resp = api.GetAllBusinessesNew();
                    
                    //geting all applications on the next level because they can only go to next level if they are approved
                    if (status == "approved")
                    {
                        List<int> departments = new List<int>(){5,8,9,10,18};

                        if (departments.Contains(int.Parse(departmentId)))
                        {
                            int nextIndex = departments.IndexOf(int.Parse(departmentId)) +1 ;
                            int nextDepartmentId = departments[nextIndex];
                            
                            resp = api.GetClientApplicationsByStatus(nextDepartmentId, "PENDING");
                            
                        }
                    }
                    //return all applications on current level based on status.
                    else
                    {
                        resp = api.GetClientApplicationsByStatus(int.Parse(departmentId), status.ToUpper());
                    }


                    allBusinesses = resp.DataTable;

                    PopulateBusinessTable(allBusinesses);
                }

            }
        }

        private void PopulateBusinessTable(DataTable dataT)
        {
            DataTable _businessDetails = LoadBusinessDetails(dataT);
            rptBusinesses.DataSource = _businessDetails;
            rptBusinesses.DataBind();
        }

        private DataTable LoadBusinessDetails(DataTable dataT)
        {
            KYCApi api = new KYCApi();

            // ResponseWithDataTable response = api.GetAllBusinessesNew();
            DataTable datatable = dataT;

            DataTable table = new DataTable();

            foreach (DataColumn column in dataT.Columns)
            {
                Debug.WriteLine(column.ColumnName);
            }

            table.Columns.Add("CompanyName", typeof(string));
            table.Columns.Add("Email", typeof(string));
            table.Columns.Add("BusinessType", typeof(string));
            table.Columns.Add("StartDate", typeof(string));
            table.Columns.Add("YearsInOperation", typeof(string));
            table.Columns.Add("Status", typeof(string));
            table.Columns.Add("CreatedOn", typeof(DateTime));

            for (int i = 0; i < datatable.Rows.Count; i++)
            {
                DataRow row = datatable.Rows[i];
                table.Rows.Add($@"<a href='ClientBusinessDetails.aspx?name={row["CompanyName"]}'>{row["CompanyName"]}</a>", row["BusinessEmail"], row["BusinessType"], row["StartDate"], row["YearsInOperation"], row["ApplicationStatus"], row["BusinessCreatedDate"]);
            }
            return table;

        }


        private DataTable GetBusinessDetails2()
        {
            // Placeholder for actual database query
            DataTable table = new DataTable();

            table.Columns.Add("CompanyName", typeof(string));
            table.Columns.Add("Email", typeof(string));
            table.Columns.Add("BusinessType", typeof(string));
            table.Columns.Add("StartDate", typeof(string));
            table.Columns.Add("YearsInOperation", typeof(int));
            table.Columns.Add("Status", typeof(string));
            table.Columns.Add("CreatedOn", typeof(string));

            // Example data
            table.Rows.Add($"<a href='ClientBusinessDetails.aspx?name=Jacobson and Sons 2'>Jacobson and Sons</a>", "jas@example.com", "Sports Betting", DateTime.Now.AddYears(-7).ToString(), 5, "PENDING", DateTime.Now.AddHours(-1)).ToString();
            table.Rows.Add($"<a href='ClientBusinessDetails.aspx?name=Pixy and Daughters'>Pixy and Daughters</a>", "pixy@example.com", "BANK", DateTime.Now.AddYears(-10).ToString(), 5, "CLEARED", DateTime.Now.AddHours(-1).ToString());

            return table;
        }

        protected void Pending_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewClients.aspx?status=pending");
        }

        protected void OnHold_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewClients.aspx?status=hold");
        }

        protected void Approved_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewClients.aspx?status=approved");
        }

        protected void Rejected_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewClients.aspx?status=rejected");
        }

        private void LoadBusinessDetailsNew(DataRow[] rows)
        {

            DataTable table = new DataTable();

            table.Columns.Add("CompanyName", typeof(string));
            table.Columns.Add("Email", typeof(string));
            table.Columns.Add("BusinessType", typeof(string));
            table.Columns.Add("StartDate", typeof(string));
            table.Columns.Add("YearsInOperation", typeof(string));
            table.Columns.Add("Status", typeof(string));
            table.Columns.Add("CreatedOn", typeof(DateTime));

            foreach (DataRow row in rows)
            {
                // DataRow row = rows[i];
                table.Rows.Add($@"<a href='ClientBusinessDetails.aspx?name={row["CompanyName"]}'>{row["CompanyName"]}</a>", row["Email"], row["BusinessType"], row["StartDate"], row["YearsInOperation"], row["Status"], row["CreatedDate"]);
            }
            rptBusinesses.DataSource = table;
            rptBusinesses.DataBind();
            // return table;

        }



    }
}