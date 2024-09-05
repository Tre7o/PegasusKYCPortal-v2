using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PegasusKYCPortal.GenericKYCApi;
using System.Xml.Linq;
using System.IO;
using System.Data.Common;
using System.Diagnostics;
using System.Threading;


namespace PegasusKYCPortal
{
    public partial class ClientBusinessDetails : System.Web.UI.Page
    {
        KYCApi api = new KYCApi();

        string queryString = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            queryString = Request.QueryString["name"];

            if (!IsPostBack)
            {

                string value = Request.QueryString["name"];

                // Check if the value is null or empty
                if (string.IsNullOrEmpty(value))
                {
                    CompanyName.Text = $"No business selected. Please a company to view its details";
                    businessSelected.Visible = false;

                    // Fetch business details based on ID
                }
                else
                {
                    LoadAllDetails(value);
                }
            }
        }

        public void LoadAllDetails(string value) {

            businessSelected.Visible = true; // Making the company details visible since at this point business was selected

            int roleID = int.Parse(Session["RoleId"].ToString());

            if (roleID == 2)
            {
                pnlLegal.Visible = true;
            }
            else
            {
                pnlLegal.Visible = false;
            }

            CompanyName.Text = $"{value} Details";
            LoadBusinessDetails(value);

            DataTable businessDetails = LoadDirectors(value);

            rptDirectors.DataSource = businessDetails;
            rptDirectors.DataBind();
            //  LoadDocuments(value);
            LoadBusinessDocuments(value);

            if (Session["status"].ToString() == "approved".ToUpper())
            {
                pnlLegal.Visible = false;
            }

        }

        private void LoadBusinessDetails(string bizName)
        {

            ResponseWithDataTable response = api.GetNewClientApplicationDetailsById(bizName);

            DataTable dt = response.DataTable;

            if (dt.Rows.Count > 0)
            {
                DataRow row = dt.Rows[0];
                Session["ApplicationId"] = row["ApplicationId"].ToString();
                Session["ApplicationDepartmentId"] = row["DepartmentId"].ToString();

                Session["BussinessId"] = row["BusinessId"].ToString();
                lblCompanyName.Text = row["CompanyName"].ToString();
                lblBusinessType.Text = row["BusinessType"].ToString();
                lblEmail.Text = row["Email"].ToString();
                lblTelephone.Text = row["Phone"].ToString();
                lblLocation.Text = row["Address"].ToString();
                lblStartDate.Text = row["StartDate"].ToString();
                lblYearsInOperation.Text = row["YearsInOperation"].ToString();
                lblNumberOfEmployees.Text = row["NumberOfEmployees"].ToString();
                lblWebsite.Text = row["Website"].ToString();
                lblNumberOfEmployees.Text = row["NumberOfEmployees"].ToString();
                lblBusinessActivity.Text = row["MainBusinessActivity"].ToString();
                lblIndustry.Text = row["Industry"].ToString();
                lblStatus.Text = row["ApplicationStatus"].ToString();
                lblReason.Text = row["Reason"].ToString();
                lblApplicationLevel.Text = "At " + row["DepartmentName"].ToString();
            }
        }

        private DataTable LoadDirectors(string companyName)
        {
            //TODO: Fetch directors here
            DataTable dt = api.GetCompanyDirectors(companyName);


            DataTable table = new DataTable();
            table.Columns.Add("DirectorId", typeof(string));
            table.Columns.Add("Name", typeof(string));
            table.Columns.Add("Sanctioned", typeof(string));
            table.Columns.Add("SanctionScore", typeof(string));
            table.Columns.Add("NIN", typeof(string));
            table.Columns.Add("NationalIdStatus", typeof(string));

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                DataRow row = dt.Rows[i];
                table.Rows.Add(row["DirectorId"], row["Surname"].ToString() + " " + row["GivenName"].ToString(), row["Sanctioned"].ToString(), row["SanctionScore"].ToString() ?? 0.ToString(), row["NIN"].ToString(), int.Parse(row["NiraStatus"].ToString()) == 320 ? "Invalid" : "Valid");
            }

            return table;

        }

        private void LoadBusinessDocuments(string businessName)
        {

            DataTable dt = api.GetBusinessDocuments(businessName);

            // Initializing a list to hold the documents
            var documents_ = new List<dynamic>();

            // Loop through each row in the DataTable
            foreach (DataRow row in dt.Rows)
            {
                // Extract the DocumentType, FilePath, and FileName (with extension)
                string documentType = row["DocumentType"].ToString();
                string filePath = row["FilePath"].ToString();
                string fileName = row["DocumentName"].ToString();

                // Extract the file name with extension

                // Extract the business name by splitting the FilePath
                string[] pathParts = filePath.Split('\\');
                string extractedBusinessName = pathParts[2];  // Assuming the business name is the third part

                //Extract the file extension by splitting file path
                string[] docNameParts = filePath.Split('.');
                string extension = docNameParts[1];  // Assuming the business name is the third part

                // Generate the document URL
                string documentUrl = $@"http://localhost/kycDocuments/{extractedBusinessName}/{documentType}.{extension}";

                documents_.Add(new { Name = documentType, Url = documentUrl, FileType = Path.GetExtension(fileName) });


            }
            foreach (var document in documents_)
            {


                /*
                 * NOTE: To enable serving of files from local system
                 * 1. I went to Internet Information Services Manager
                 * 2. Created a virtual directory called kycDocuments under the Default Web Site
                 * 3. Clicked on the virtual directory
                 * 4. Double clicked on directory browsing and enabled directory browsing  
                 * 4. Got the path and hard coded it adding the file name at the end with its extension http://localhost/kycDocuments/
                 */

                var cardHtml = $@"
                                <div class='bg-white border border-gray-200 rounded-lg p-1 flex flex-col justify-center items-center'>
                                    <a href='{document.Url}' class='block' target='_blank'>
                                        <img src='pdf-placeholder.png' alt='Document Image' class='size-[50px] object-cover mb-4 rounded-lg' />
                                    </a>
                                    <h3 class='text-lg text-[#06498e] font-medium mb-2'>{document.Name}</h3>
                                </div>";

                // Assuming you have a Placeholder control in your .aspx file
                documentsPlaceholder.Controls.Add(new LiteralControl(cardHtml));
            }
        }

        protected void ApproveApplication_Click(object sender, EventArgs e)
        {
         
            int applicationId = int.Parse(Session["ApplicationId"].ToString()); 
            int departmentId = int.Parse(Session["ApplicationDepartmentId"].ToString());
            int bussinessId = int.Parse(Session["BussinessId"].ToString());
            int userId = int.Parse(Session["UserId"].ToString());
            api.ApproveApplicationToNextLevel(applicationId,departmentId,"PENDING" ,bussinessId,userId);

            ResponseWithDataTable response = api.GetUsersByDepartmentId(departmentId);

            if(response.StatusCode == "200")
            {
                DataTable dt = response.DataTable;
                DataRow row = dt.Rows[0];
                if(dt.Rows.Count > 0)
                {
                    foreach(DataRow rw in dt.Rows)
                    {
                        string email = rw["Email"].ToString();
                        string subject = "KYC Application Approval";

                        string message = "Hello " + rw["FirstName"]+" " + rw["LastName"] +"a KYC Application has been approved and is now pending approval from your department. Please login to approve application.";
                       api.SendEmail(email, subject, message);
                      //  api.SendSystemNotification(userId, int.Parse(rw["UserId"].ToString()), message,email, Session["Email"].ToString(), subject);
                    }
                }

                LoadAllDetails(queryString);



            }
        }

        protected void RejectApplication_Click(object sender, EventArgs e)
        {
            pnlRejection.Visible = true;
            pnlOnHold.Visible = false;

        }

        protected void PutOnHold_Click(object sender, EventArgs e)
        {
            pnlOnHold.Visible = true;
            pnlRejection.Visible = false;

        }

        protected void SubmitRejectionReason_Click(object sender, EventArgs e)
        {
            string rejectionReason = txtRejectionReason.Text;
            int applicationId = int.Parse(Session["ApplicationId"].ToString());
            int userId = int.Parse(Session["UserId"].ToString());

            api.RejectApplication(applicationId, userId, rejectionReason);
            LoadAllDetails(queryString);

        }

        protected void SubmitOnHoldReason_Click(object sender, EventArgs e)
        {
            string onHoldReason = txtOnHoldReason.Text;
            int applicationId = int.Parse(Session["ApplicationId"].ToString());
            int userId = int.Parse(Session["UserId"].ToString());

            api.PlaceApplicationOnHold(applicationId,userId,onHoldReason);
            LoadAllDetails(queryString);

        }

        protected void RevalidateSanctionStatus_Click(object sender, EventArgs e)
        {

            string directorId = ((Button)sender).CommandArgument;

            ResponseWithDataTable result = api.GetDirectorDetailsById(int.Parse(directorId));

            if (result.DataTable.Rows.Count > 0)
            {
                Debug.WriteLine($"In the response: {result.DataTable.Rows[0]["Surname"]}");
                DataRow row = result.DataTable.Rows[0];

                string name = row["Surname"].ToString() + " " + row["GivenName"].ToString();

                SanctionsResponse resp = api.CheckUserSanctionStatus(name);

                string message = resp.Sanctioned ? $@"Company director - {name} is Sanctioned with a score of {resp.Score}% " : $@"Company director - {name} is not sanctioned and has a sanction score of 0%";
               
                if (resp.StatusCode.Equals("0"))
                {
                    Debug.WriteLine("Unable to get status code 0 in sanction status");
                    DisplayRevalidateMessage(message, false);


                }
                else
                {
                    DisplayRevalidateMessage(message, true);
                }

                LoadAllDetails(queryString);
            }
        }

        protected void RevalidateNIN_Click(object sender, EventArgs e)
        {
            string directorId = ((Button)sender).CommandArgument;

            ResponseWithDataTable result = api.GetDirectorDetailsById(int.Parse(directorId));

            if (result.DataTable.Rows.Count > 0)
            {
                DataRow row = result.DataTable.Rows[0];

                string givenName = row["GivenName"].ToString();
                string surname = row["Surname"].ToString();
                string nin = row["NIN"].ToString();
                string cardNo = row["CardNumber"].ToString();
                string dob = row["DateOfBirth"].ToString();


                NationalIDValidationResponse ninResp = api.ValidateNationalId(dob,cardNo,givenName,nin, surname);

                string message = ninResp.Message.Equals("False") ? $@"Company director {surname} {givenName}'s details not found. NIN: {nin} " : $@"Company director {surname} {givenName}'s details found and valid!";

                if (ninResp.StatusCode.Equals("320"))
                {
                    DisplayRevalidateMessage(message, false);
                }
                else
                {
                    DisplayRevalidateMessage(message, true);
                }

                LoadAllDetails(queryString);


                // This will trigger the client side js function to hide the message after 5 seconds.
                //  ClientScript.RegisterStartupScript(this.GetType(), "hideMessageScript", "hideMessage();", true);
            }

        }

        public void DisplayRevalidateMessage(string message, bool isSuccess)
        {
            string formattedMessage = isSuccess ?
                $"<div class='bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded mb-4'>{message}</div>" :
                $"<div class='bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded mb-4'>{message}</div>";
            lblRevalidateStatus.Text = formattedMessage;
          //  lblRevalidateStatus.Visible = true;

        }
    }
}