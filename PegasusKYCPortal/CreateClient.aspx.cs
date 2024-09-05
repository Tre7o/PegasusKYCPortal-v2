using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.IO;
using System.Security.Policy;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;
using PegasusKYCPortal.GenericKYCApi;
using static System.Net.WebRequestMethods;

namespace PegasusKYCPortal
{
    public partial class CreateClient : System.Web.UI.Page
    {
        KYCApi kycApi = new KYCApi();

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["UserId"] == null)
            {

                Response.Redirect("Login.aspx");
            }
        }

        protected void SaveBusinessDetails_Click(object sender, EventArgs e)
        {
            string name = txtCompanyName.Text;
            string email = txtEmail.Text;
            string regNo = txtRegistrationNumber.Text;
            string bizType = txtBusinessType.Text;
            string licenseNo = txtLicenseNumber.Text;
            string startDate = txtStartDate.Text;
            string yearsInOperation = txtOperationYears.Text;
            string telephone = txtTelephone.Text;
            string employees = txtEmployees.Text;
            string bizActivity = txtBusinessActivity.Text;
            string industry = txtIndustry.Text;
            string address = txtAddress.Text;
            string tin = txtTIN.Text;
            string profileOrWebsite = txtWebsite.Text;

            Session["CompanyName"] = name;

  

            if (string.IsNullOrEmpty(name))
            {
               DisplayMessage("Company name is required", false);
 
            }
            else if (string.IsNullOrEmpty(regNo))
            {
                DisplayMessage("Company registration number is required", false);
  
            }
            else if (string.IsNullOrEmpty(email))
            {
                DisplayMessage("Company email address is required", false);
            }
            else if (string.IsNullOrEmpty(bizType))
            {
                DisplayMessage("Business type is required", false);

            }
            else if (string.IsNullOrEmpty(licenseNo))
            {
                DisplayMessage("Company license number is required", false);
            }

            else if (string.IsNullOrEmpty(startDate))
            {
                DisplayMessage("Company license number is required", false);
            }
            else if (string.IsNullOrEmpty(yearsInOperation))
            {
                DisplayMessage("Company license number is required", false);
            }
            else if (string.IsNullOrEmpty(telephone))
            {
                DisplayMessage("telephone is required", false);

            }
            else if (string.IsNullOrEmpty(employees))
            {
                DisplayMessage("Number of employees is required", false);
            }

            else if (string.IsNullOrEmpty(industry))
            {
                DisplayMessage("Industry is required", false);
            }
            else if (string.IsNullOrEmpty(address))
            {
                DisplayMessage("Address  is required", false);
              
            }
            else if (string.IsNullOrEmpty(profileOrWebsite))
            {
                DisplayMessage("Profile Or Website is required", false);
               
            }
            else
            {
                string userID = Session["UserId"].ToString();
                string deptID = Session["DepartmentId"].ToString();


                DataTable dataTable = kycApi.CreateNewBusiness(name, regNo, bizType, licenseNo, tin, startDate, address,
                                                           address, email, telephone, profileOrWebsite, bizActivity, industry,
                                                           int.Parse(yearsInOperation), int.Parse(employees), int.Parse(userID),
                                                           int.Parse(deptID)
                                                           );

                DataRow row = dataTable.Rows[0];
                int businessId = int.Parse(row["BusinessId"].ToString());

                if (businessId >= 0)
                {

                    Session["CompanyID"] = businessId;
                    DisplayMessage("Company details saved successfully", true);
                    pnlBusinessDetails.Visible = false;
                    pnlDirectorDetails.Visible = true;
                }
                else
                {
                    DisplayMessage("Failed to create Business details, Please try again!", false);
                    pnlBusinessDetails.Visible = true;
                }
            }
        }


        protected void SaveAndAddAnother_Click(object sender, EventArgs e)
        {
            SaveDirectorDetails();
            pnlDirectorDetails.Visible = true;
            pnlBusinessDetails.Visible = false;
            pnlBusinessDocuments.Visible = false;
        }

        protected void SaveAndContinue_Click(object sender, EventArgs e)
        {
            SaveDirectorDetails();
            pnlBusinessDocuments.Visible = true;
            pnlDirectorDetails.Visible = false;
            pnlBusinessDetails.Visible = false;
        }

        protected void SaveDocuments_Click(object sender, EventArgs e)
        {


            SaveDocuments.Enabled = false;
            SaveDocuments.Text = "Submitting Documents. Please wait...";
            SaveDocuments.CssClass = "bg-opacity-50 bg-[#06498e] hover:bg-[#06498e] text-white font-bold py-2 px-4 rounded";
            try
            {
                string companyID = Session["CompanyID"].ToString();
                string userID = Session["UserId"].ToString();
                string companyName = Session["CompanyName"].ToString();

                var fileUploads = new[]
                {
                    new { FileUpload = fileBeneficiaryForm, DocumentType = "Beneficiary Form" },
                    new { FileUpload = fileMemosAndArticles, DocumentType = "Memorandum and Articles" },
                    new { FileUpload = fileCertOfIncorp, DocumentType = "Certificate Of Incorporation" },
                    new { FileUpload = fileForm20, DocumentType = "Company Form 20" },
                    new { FileUpload = fileTradingLicense, DocumentType = "Trading License" },
                    new { FileUpload = fileTaxRegCert, DocumentType = "Tax Registration Certificate" },
                    new { FileUpload = fileBankLetter, DocumentType = "Bank Letter" },
                    new { FileUpload = fileRevenueProjects, DocumentType = "Revenue Projects" }
                };

                APIResponse response = new APIResponse();

                foreach (var fileUpload in fileUploads)
                {
                    if (fileUpload.FileUpload.HasFile)
                    {
                        string fileName = fileUpload.FileUpload.FileName;
                        byte[] fileData = fileUpload.FileUpload.FileBytes;

                        // 1. TODO: Saving the file 
                        if (!Directory.Exists($@"D:\kycDocuments\{companyName}"))
                        {
                            Directory.CreateDirectory($@"D:\kycDocuments\{companyName}");
                        }
                        string path = $@"D:\kycDocuments\{companyName}\" + fileUpload.DocumentType + $"{Path.GetExtension(fileUpload.FileUpload.FileName)}";
                        fileUpload.FileUpload.SaveAs(path);
                      
                        Debug.WriteLine($"File with category {fileUpload.DocumentType} uploaded successfully");

                        // TODO: Call The API to save the file details in the database
                        response = kycApi.SaveDocumentDetails(int.Parse(companyID), companyName, fileName, path, fileUpload.DocumentType);

                        if (response.Success)
                        {
                            DisplayMessage($"{fileUpload.DocumentType} uploaded successfully.", true);
                        }
                        else
                        {
                            DisplayMessage($"Failed to upload {fileUpload.DocumentType}: {response}", false);

                        }

                    }
                    else
                    {
                        DisplayMessage($"Please select a {fileUpload.DocumentType} to upload.", false);
                    }
                }

                if (response.Success)
                {
                  

                    int nextDepartmentId = int.Parse(Session["DepartmentId"].ToString());
                    List<int> departments = new List<int>() { 5, 8, 9, 10, 18 };

                    if (departments.Contains(int.Parse(Session["DepartmentId"].ToString())))
                    {
                        int nextIndex = departments.IndexOf(int.Parse(Session["DepartmentId"].ToString())) + 1;
                        nextDepartmentId = departments[nextIndex];
                    }
                    ResponseWithDataTable _response = kycApi.GetUsersByDepartmentId(nextDepartmentId);

                    if (_response.StatusCode == "200")
                    {

                        DataTable dt = _response.DataTable;
                        DataRow row = dt.Rows[0];
                        if (dt.Rows.Count > 0)
                        {
                            foreach (DataRow rw in dt.Rows)
                            {
                                string email = rw["Email"].ToString();
                                string subject = "KYC Application Approval";

                                string message = "Hello " + rw["FirstName"] + " " + rw["LastName"] + "a KYC Application has been approved and is now pending approval from your department. Please login to approve application.";
                                kycApi.SendEmail(email, subject, message);
                            }
                        }

                    }

                    DisplayMessage("Business KYC Documents uploaded successfully", true);
                    Response.Redirect("ViewClients.aspx?status=pending");
                    SaveDocuments.Visible = true;

                }
                else
                {
                    DisplayMessage(response.Message, false);
                }

            }
            catch (Exception ex)
            {
                DisplayMessage($"An error occurred: {ex.Message}", false);
            }
        }

        private void SaveDirectorDetails()
        {
            string companyName = txtCompanyName.Text;
            string companyID = Session["CompanyID"].ToString();
            string userID = Session["UserId"].ToString();

            string surName = txtSurname.Text;
            string givenName = txtGivenName.Text;
            string cardNo = txtCardNumber.Text;
            string nin = txtNIN.Text;
            string dob = txtDateOfBirth.Text;

            if (string.IsNullOrEmpty(surName))
            {
                DisplayMessage("Director's surname is required", false);
            }
            else if (string.IsNullOrEmpty(givenName))
            {
                DisplayMessage("Director's given name is required", false);
            }
            else if (string.IsNullOrEmpty(cardNo))
            {
                DisplayMessage("Director's Card Number is required", false);
            }
            else if (string.IsNullOrEmpty(nin))
            {
                DisplayMessage("Director's NIN is required", false);
            }
            else if (string.IsNullOrEmpty(dob))
            {
                DisplayMessage("Director's Date of Birth is required", false);
            }
            else
            {
                try
                {
                    Director director = new Director()
                    {
                        Surname = surName,
                        GivenName = givenName,
                        NIN = nin,
                        DateOfBirth = dob,
                        NiraStatus = "Valid",
                        BusinessID = int.Parse(companyID),
                        CardNumber = cardNo,
                        SanctionStatus = "Unverified"

                    };
                    APIResponse response = kycApi.CreateDirector(director);

                    if (response.Message.ToUpper().Contains("SUCCESSFULLY"))
                    {
                        DisplayMessage("Director details saved successfully", true);
                        ClearDirectorFields();
                    }
                    else
                    {
                        DisplayMessage(response.Message, false);
                    }
                }
                catch (Exception ex)
                {
                    DisplayMessage($"An error occurred: {ex.Message}", false);
                }
            }
        }


        private void ClearDirectorFields()
        {
            txtSurname.Text = string.Empty;
            txtGivenName.Text = string.Empty;
            txtCardNumber.Text = string.Empty;
            txtNIN.Text = string.Empty;
            txtDateOfBirth.Text = string.Empty;
        }

        public void DisplayMessage(string message, bool isSuccess)
        {
            string formattedMessage = isSuccess ?
                $"<div class='bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded mb-4'>{message}</div>" :
                $"<div class='bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded mb-4'>{message}</div>";
            MessageLiteral.Text = formattedMessage;
        }



    }
}
