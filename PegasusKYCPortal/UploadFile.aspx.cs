using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Net.Mime.MediaTypeNames;

namespace PegasusKYCPortal
{
    public partial class UploadFile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

      protected void UploadButton_Click(object sender, EventArgs e)
        {
            string businessName = BusinessName.Text.Trim();
            /*
            string businessName = BusinessName.Text.Trim(); // Replace with actual business name from your application
            string rootDirectory = @"D:\KYC_DOCUMENTS";
            string businessDirectory = Path.Combine(rootDirectory, businessName);

            // Create a directory for the business if it doesn't exist
            if (!Directory.Exists(businessDirectory))
            {
                Directory.CreateDirectory(businessDirectory);
            }

                UploadDocument(File1, "Document Category 1", businessDirectory);
            */

            if (File1.HasFile)
                try
                {
                 
                    if (!Directory.Exists($@"D:\KYC_DOCUMENTS\{businessName}"))
                    {
                        Directory.CreateDirectory($@"D:\KYC_DOCUMENTS\{businessName}");
                    }

                    File1.SaveAs($@"D:\KYC_DOCUMENTS\{businessName}\" + File1.FileName);
                    Message.Text = "File Uploaded Sucessfully !!";

                  //  UploadDocument(File1, )

                    //TODO:  Save file in the directory
                }
                catch (Exception ex)
                {
                    //Log Exception Message
                    Message.Text = "File Upload Failed!!" + ex.Message;
                }
            else
            {
                Message.Text = "Please Select File to Upload";
            }
        }

        private void UploadDocument(FileUpload fileUpload, string documentCategory, string businessDirectory)
        {
            if (fileUpload.HasFile)
            {
                try
                {
                    // Get file properties
                    string fileName = Path.GetFileNameWithoutExtension(fileUpload.FileName);
                    string fileExtension = Path.GetExtension(fileUpload.FileName);
                    string fileType = fileUpload.PostedFile.ContentType;
                    string filePath = Path.Combine(businessDirectory, fileName + fileExtension);

                    // Save the file to the specified business directory
                    fileUpload.SaveAs(filePath);

                    // Save the file details to the database
                    SaveDocumentDetails(fileName, fileType, documentCategory, filePath, fileExtension);
                }
                catch (Exception ex)
                {
                    // Handle exceptions
                    Response.Write("Error: " + ex.Message);
                }
            }
            else
            {
                Response.Write("No file selected.");
            }
        }

        private void SaveDocumentDetails(string fileName, string fileType, string documentCategory, string filePath, string fileExtension)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["YourConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO KYC_BusinessDocuments (BusinessId, DocumentName,FilePath, Status,  DocumentType, CreatedDate, UpdatedDate) " +
                               "VALUES (@BusinessId,@Documentname,@FilePath, @Status, @DocumentCategory, @CreatedDate, @UpdatedDate)";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@BusinessId", 28);
                    cmd.Parameters.AddWithValue("@DocumentName", fileName);
                    cmd.Parameters.AddWithValue("@FilePath", filePath);
                    cmd.Parameters.AddWithValue("@Status", "PENDING");
                    cmd.Parameters.AddWithValue("@DocumentCategory", documentCategory);
                    cmd.Parameters.AddWithValue("@CreatedDate", DateTime.Now);
                    cmd.Parameters.AddWithValue("@UpdatedDate", DateTime.Now);
                  //  cmd.Parameters.AddWithValue("@FileExtension", fileExtension);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                }
            }
        }

        protected void UploadButton2_Click(object sender, EventArgs e)
        {
            HttpFileCollection uploads;
            uploads = HttpContext.Current.Request.Files;

            int countfiles = 0;
            for (int i = 0; i <= (uploads.Count - 1); i++)
            {
                if (uploads[i].ContentLength > 0)
                {
                    string c = System.IO.Path.GetFileName(uploads[i].FileName);
                    string cNoSpace = c.Replace(" ", "-");
                    string c1 = "Serial-" + 1234 + "-" + (countfiles + i + 1) + "-" + cNoSpace;
                    string Path = @"D:\KYC_DOCUMENTS\";
                    File1.PostedFile.SaveAs(Path + "" + c1);
                    //businessl.SaveApplicationFiles(AppCode, (Path + "" + c1), c);
                    countfiles++;
                }
            }
        }
    }
}