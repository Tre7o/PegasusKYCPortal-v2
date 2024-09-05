using PegasusKYCPortal.GenericKYCApi;
using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PegasusKYCPortal
{
    public partial class Contracts : System.Web.UI.Page
    {

        KYCApi api = new KYCApi();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                string role = Session["RoleId"].ToString();
                if (string.IsNullOrEmpty(role)){
                    Response.Redirect("Login.aspx");

                }
                int roleId = int.Parse(Session["RoleId"].ToString());

   

                if (int.Parse(role) == 3)
                {
                    btnAddNew.Visible = true;
                }
                else
                {
                    btnAddNew.Visible = false;

                }
                // Load businesses into the dropdown
                LoadBusinesses();

                // Load existing contracts
                LoadContracts();
            }
        }

        private void LoadBusinesses()
        {
            // Assume you have a method to fetch businesses
            DataTable businesses = api.GetAllBusinessesNew().DataTable;

            businessDropdown.DataSource = businesses;
            businessDropdown.DataTextField = "CompanyName";
            businessDropdown.DataValueField = "BusinessId";
            businessDropdown.DataBind();
        }

        private void LoadContracts()
        {
            // Fetch and bind the contracts to the repeater
            DataTable contracts = api.GetAllContracts().DataTable;

            if (contracts.Rows.Count > 0)
            {
                rptContracts.DataSource = contracts;
                rptContracts.DataBind();
                panelContracts.Visible = true;
                panelNoContracts.Visible = false;

            }
            else
            {
                panelNoContracts.Visible = true;
                panelContracts.Visible = true;

            }

        }

        private DataTable LoadCotractsDetails(DataTable dataT)
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
            table.Columns.Add("DocumentType", typeof(string));
            table.Columns.Add("CreatedBy", typeof(string));
            table.Columns.Add("Status", typeof(string));
            table.Columns.Add("CreatedOn", typeof(DateTime));

            for (int i = 0; i < datatable.Rows.Count; i++)
            {
                DataRow row = datatable.Rows[i];
                table.Rows.Add(row["CompanyName"], row["DocumentType"], row["CreatedBy"], row["Status"], row["CreatedOn"], row["ApplicationStatus"]);
            }
            return table;

        }

        protected void BtnAddNew_Click(object sender, EventArgs e)
        {
            // Show the upload panel
            panelUpload.Visible = true;
        }

        protected void BtnSave_Click(object sender, EventArgs e)
        {
            string message;

            int userId = int.Parse(Session["UserId"].ToString());
            if (fileUpload.HasFile)
            {
                string businessId = businessDropdown.SelectedValue;
                //  string businessName = api.GetNewClientApplicationDetailsById(int.Parse(businessId));
                string businessName = "Safeboda";
                string fileName = Path.GetFileName(fileUpload.PostedFile.FileName);
                string fileExtension = Path.GetExtension(fileName);
                string filePath = $@"D:\kycDocuments\{businessName}\{fileName}";

                // Save the file to the directory
                fileUpload.SaveAs(filePath);

                // Send file details to the web service
                bool response = api.AddContract(int.Parse(businessId), userId, out message);
                if (response)
                {
                    DisplayMessage(message, true);
                }
                else
                {
                    DisplayMessage(message, false);

                }

                // Reload the contracts to show the newly uploaded one
                LoadContracts();
            }
        }

        public void DisplayMessage(string message, bool isSuccess)
        {
            string formattedMessage = isSuccess ?
                $"<div class='bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded mb-4'>{message}</div>" :
                $"<div class='bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded mb-4'>{message}</div>";
            MessageLiteral.Text = formattedMessage;
        }

        protected void btnApprove_Click(object sender, EventArgs e)
        {

        }

        protected void btnReject_Click(object sender, EventArgs e)
        {

        }

        protected void btnHold_Click(object sender, EventArgs e)
        {

        }
    }
}