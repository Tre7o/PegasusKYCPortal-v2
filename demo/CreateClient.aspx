<%@ Page Title="CreateClient" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="CreateClient.aspx.cs" Inherits="PegasusKYCPortal.CreateClient" %>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2 class="text-center font-medium text-2xl text-[#06498e]">Create Business Client</h2>

    <div class="flex items-center justify-center p-12">
        <!-- Author: FormBold Team -->
        <div class="mx-auto w-full max-w-[550px] bg-white">

            <div id="multiStepForm">
                <!-- Step Indicators -->
                <div class="mb-6 flex justify-between">
                    <div id="step1Indicator" class="text-center w-full">
                        <div class="w-10 h-10 mx-auto bg-[#06498e] text-white rounded-full flex justify-center items-center"><span>1</span></div>
                        <span class="text-sm font-medium text-gray-700">Business Details</span>
                    </div>
                    <div id="step2Indicator" class="text-center w-full">
                        <div class="w-10 h-10 mx-auto bg-gray-300 text-white rounded-full flex justify-center items-center"><span>2</span></div>
                        <span class="text-sm font-medium text-gray-700">Director Details</span>
                    </div>
                    <div id="step3Indicator" class="text-center w-full">
                        <div class="w-10 h-10 mx-auto bg-gray-300 text-white flex rounded-full justify-center items-center"><span>3</span></div>
                        <span class="text-sm font-medium text-gray-700">Document Uploads</span>
                    </div>
                </div>


                <asp:Literal ID="MessageLiteral" runat="server"></asp:Literal>
                <!-- Step 1: Business Details -->
                <asp:Panel runat="server" ID="pnlBusinessDetails" Visible="true">
                    <div id="step1" class="step">
                        <h2 class="text-2xl font-semibold mb-5 text-[#06498e]">Business Details</h2>


                        <div class="grid grid-cols-1 md:grid-cols-2 gap-4 mb-1">
                            <!-- Input Fields for Business Details -->
                            <div>
                                <label for="companyName" class="block text-gray-700  mb-0">Company Name</label>
                                <asp:TextBox ID="txtCompanyName" runat="server" CssClass="w-full px-3 py-2 border rounded" />
                            </div>
                            <div>
                                <label for="registrationNumber" class="block text-gray-700  mb-0">Company Registration Number</label>
                                <asp:TextBox ID="txtRegistrationNumber" runat="server" CssClass="w-full px-3 py-2 border rounded" />
                            </div>
                            <!-- Add additional fields as needed -->
                        </div>


                        <div class="mb-1">
                            <label for="businessType" class="block text-gray-700  mb-0">Business Type</label>
                            <asp:TextBox ID="txtBusinessType" runat="server" CssClass="w-full px-3 py-2 border rounded" />
                        </div>

                        <div class="mb-1">
                            <label for="email" class="block text-gray-700  mb-0">Company Email</label>
                            <asp:TextBox ID="txtEmail" TextMode="Email" runat="server" CssClass="w-full px-3 py-2 border rounded" />
                        </div>

                        <div class="grid grid-cols-1 md:grid-cols-2 gap-4 mb-1">

                            <div>
                                <label for="companyLicenseNumber" class="block text-gray-700 mb-0">License Number</label>
                                <asp:TextBox ID="txtLicenseNumber" runat="server" CssClass="w-full px-3 py-2 border rounded" />
                            </div>
                            <div>
                                <label for="companyTIN" class="block text-gray-700  mb-0">TIN</label>
                                <asp:TextBox ID="txtTIN" runat="server" CssClass="w-full px-3 py-2 border rounded" />
                            </div>

                        </div>

                        <div class="grid grid-cols-1 md:grid-cols-2 gap-4 mb-1">

                            <div>
                                <label for="startDate" class="block text-gray-700  mb-0">Start Date</label>
                                <asp:TextBox ID="txtStartDate" TextMode="Date" runat="server" CssClass="w-full px-3 py-2 border rounded" />
                            </div>
                            <div>
                                <label for="operationYears" class="block text-gray-700  mb-0">Years in Operation</label>
                                <asp:TextBox ID="txtOperationYears" TextMode="Number" runat="server" CssClass="w-full px-3 py-2 border rounded" />
                            </div>

                        </div>

                        <div class="grid grid-cols-1 md:grid-cols-2 gap-4 mb-1">

                            <div>
                                <label for="telephone" class="block text-gray-700 mb-0">Telephone</label>
                                <asp:TextBox ID="txtTelephone" runat="server" CssClass="w-full px-3 py-2 border rounded" />
                            </div>
                            <div>
                                <label for="numberOfEmployees" class="block text-gray-700  mb-0">Number Of employees</label>
                                <asp:TextBox ID="txtEmployees" TextMode="Number" runat="server" CssClass="w-full px-3 py-2 border rounded" />
                            </div>

                        </div>

                        <div class="grid grid-cols-1 md:grid-cols-2 gap-4 mb-1">

                            <div>
                                <label for="bizActivity" class="block text-gray-700  mb-0">Business Activity</label>
                                <asp:TextBox ID="txtBusinessActivity" runat="server" CssClass="w-full px-3 py-2 border rounded" />
                            </div>
                            <div>
                                <label for="industry" class="block text-gray-700  mb-0">Industry</label>
                                <asp:TextBox ID="txtIndustry" runat="server" CssClass="w-full px-3 py-2 border rounded" />
                            </div>

                        </div>

                        <div class="mb-1">
                            <label for="address" class="block text-gray-700  mb-0">Company Address</label>
                            <asp:TextBox ID="txtAddress" runat="server" CssClass="w-full px-3 py-2 border rounded" />
                        </div>

                        <div class="mb-1">
                            <label for="address" class="block text-gray-700  mb-0">Company Profile/Website</label>
                            <asp:TextBox ID="txtWebsite" runat="server" CssClass="w-full px-3 py-2 border rounded" />
                        </div>

                        <div class="mt-6 flex justify-center">
                            <asp:Button ID="SaveBusinessDetails" runat="server" Text="Save Business Details" OnClick="SaveBusinessDetails_Click" CssClass="cursor-pointer bg-[#06498e] hover:bg-[#06498e] text-white font-bold py-2 px-4 rounded"></asp:Button>
                        </div>
                    </div>
                </asp:Panel>

                <!-- Step 2: Director Details -->
                <asp:Panel runat="server" ID="pnlDirectorDetails" Visible="false">
                    <div id="step2" class="step">
                        <h2 class="text-2xl font-semibold bg-[#06498e] mb-6">Director Details</h2>
                        <div id="directorDetailsContainer">
                            <div class="directorDetail grid grid-cols-1 md:grid-cols-2 gap-4 mb-4">
                                <!-- Input Fields for Director Details -->
                                <div>
                                    <label for="surname" class="block text-gray-700 font-bold mb-2">Surname</label>
                                    <asp:TextBox ID="txtSurname" runat="server" CssClass="w-full px-3 py-2 border rounded" />
                                </div>
                                <div>
                                    <label for="givenName" class="block text-gray-700 font-bold mb-2">Given Name</label>
                                    <asp:TextBox ID="txtGivenName" runat="server" CssClass="w-full px-3 py-2 border rounded" />
                                </div>
                                <!-- Add additional fields as needed -->
                            </div>

                            <div>
                                <label for="cardNumber" class="block text-gray-700 font-bold mb-2">Card Number</label>
                                <asp:TextBox ID="txtCardNumber" TextMode="Number" runat="server" CssClass="w-full px-3 py-2 border rounded" />
                            </div>

                            <div>
                                <label for="nin" class="block text-gray-700 font-bold mb-2">NIN</label>
                                <asp:TextBox ID="txtNIN" runat="server" CssClass="w-full px-3 py-2 border rounded" />
                            </div>

                            <div>
                                <label for="dob" class="block text-gray-700 font-bold mb-2">Date Of Birth</label>
                                <asp:TextBox ID="txtDateOfBirth" TextMode="Date" runat="server" CssClass="w-full px-3 py-2 border rounded" />
                            </div>



                        </div>
                        <div class="flex justify-between mt-6">
                            <asp:Button ID="SaveAndAddAnother" runat="server" OnClick="SaveAndAddAnother_Click" Text="Save & Add Another Director" class="cursor-pointer bg-[#06498e] hover:bg-[#06498e] text-white font-bold py-2 px-4 rounded"></asp:Button>
                            <asp:Button ID="SaveAndContinue" runat="server" OnClick="SaveAndContinue_Click" Text="Save And Continue" class=" cursor-pointer bg-[#06498e] hover:bg-[#06498e] text-white font-bold py-2 px-4 rounded"></asp:Button>
                        </div>
                    </div>
                </asp:Panel>

                <!-- Step 3: Document Uploads -->
                <asp:Panel runat="server" ID="pnlBusinessDocuments" Visible="false">
                    <div id="step3" class="step">
                        <h2 class="text-2xl font-semibold text-[#06498e] mb-6">Document Uploads</h2>
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                            <!-- Input Fields for Document Uploads -->
                            <div>
                                <label for="beneficiaryForm" class="block text-gray-700 mb-0">Business Beneficiary Form</label>
                                <asp:FileUpload ID="fileBeneficiaryForm" runat="server" CssClass="w-full px-3 py-2 border rounded" />
                            </div>
                            <div>
                                <label for="articles" class="block text-gray-700  mb-0">Memorandum and Articles</label>
                                <asp:FileUpload ID="fileMemosAndArticles" runat="server" CssClass="w-full px-3 py-2 border rounded" />
                            </div>
                            <div>
                                <label for="beneficiaryForm" class="block text-gray-700  mb-0">Certificate Of Incorporation</label>
                                <asp:FileUpload ID="fileCertOfIncorp" runat="server" CssClass="w-full px-3 py-2 border rounded" />
                            </div>
                            <div>
                                <label for="articles" class="block text-gray-700  mb-0">Company Form 20</label>
                                <asp:FileUpload ID="fileForm20" runat="server" CssClass="w-full px-3 py-2 border rounded" />
                            </div>
                            <div>
                                <label for="beneficiaryForm" class="block text-gray-700  mb-0">Trading License</label>
                                <asp:FileUpload ID="fileTradingLicense" runat="server" CssClass="w-full px-3 py-2 border rounded" />
                            </div>
                            <div>
                                <label for="articles" class="block text-gray-700  mb-2">Tax Registration Certificate</label>
                                <asp:FileUpload ID="fileTaxRegCert" runat="server" CssClass="w-full px-3 py-2 border rounded" />
                            </div>
                            <div>
                                <label for="beneficiaryForm" class="block text-gray-700  mb-0">Bank Letter</label>
                                <asp:FileUpload ID="fileBankLetter" runat="server" CssClass="w-full px-3 py-2 border rounded" />
                            </div>
                            <div>
                                <label for="articles" class="block text-gray-700  mb-0">Revenue Projects</label>
                                <asp:FileUpload ID="fileRevenueProjects" runat="server" CssClass="w-full px-3 py-2 border rounded" />
                            </div>
                            <!-- Add additional fields as needed -->
                        </div>

                        <div class="flex justify-center mt-6">
                            <asp:Button ID="SaveDocuments" runat="server" OnClick="SaveDocuments_Click" Text="Save Documents" class="cursor-pointer bg-[#06498e] hover:bg-[#06498e] text-white font-bold py-2 px-4 rounded"></asp:Button>
                        </div>
                    </div>
                </asp:Panel>
            </div>

        </div>
    </div>


    <script type="text/javascript">
        function showNextStep(step) {
            document.querySelectorAll('.step').forEach(function (element) {
                element.classList.add('hidden');
            });
            document.getElementById('step' + step).classList.remove('hidden');
            updateStepIndicator(step);
        }

        function showPreviousStep(step) {
            document.querySelectorAll('.step').forEach(function (element) {
                element.classList.add('hidden');
            });
            document.getElementById('step' + step).classList.remove('hidden');
            updateStepIndicator(step);
        }

        function updateStepIndicator(step) {
            for (let i = 1; i <= 3; i++) {
                let indicator = document.getElementById('step' + i + 'Indicator');
                if (i === step) {
                    indicator.querySelector('div').classList.remove('bg-gray-300');
                    indicator.querySelector('div').classList.add('bg-[#06498e]');
                } else {
                    indicator.querySelector('div').classList.add('bg-gray-300');
                    indicator.querySelector('div').classList.remove('bg-#06498e-500');
                }
            }
        }

        function addDirector() {
            var container = document.getElementById('directorDetailsContainer');
            var newDirector = document.querySelector('.directorDetail').cloneNode(true);
            container.appendChild(newDirector);
        }
    </script>
</asp:Content>
