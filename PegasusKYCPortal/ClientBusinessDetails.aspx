<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="ClientBusinessDetails.aspx.cs" Inherits="PegasusKYCPortal.ClientBusinessDetails" %>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="flex justify-center items-center">
        <asp:Label runat="server" CssClass="text-center text-[#06498e] font-semibold text-2xl" ID="CompanyName"></asp:Label>
    </div>

    <asp:Panel ID="businessSelected" runat="server" Visible="false">
        <section class="bg-white shadow-md rounded-lg p-6 mb-6 mx-[50px]">
            <h2 class="text-xl font-semibold mb-2 text-[#06498e]">Company Details</h2>
            <div class="grid grid-cols-2 gap-4">
                <div>
                    <span class="font-medium">Name:</span>
                    <asp:Label runat="server" ID="lblCompanyName"></asp:Label>
                </div>
                <div>
                    <span class="font-medium">Business Type:</span>
                    <asp:Label runat="server" ID="lblBusinessType"></asp:Label>
                </div>
                <div>
                    <span class="font-medium">Email:</span>
                    <asp:Label runat="server" ID="lblEmail"></asp:Label>
                </div>
                <div>
                    <span class="font-medium">Telephone:</span>
                    <asp:Label runat="server" ID="lblTelephone"></asp:Label>
                </div>
                <div>
                    <span class="font-medium">Location:</span>
                    <asp:Label runat="server" ID="lblLocation"></asp:Label>
                </div>
                <div>
                    <span class="font-medium">Start Date:</span>
                    <asp:Label runat="server" ID="lblStartDate"></asp:Label>
                </div>
                <div>
                    <span class="font-medium">Years in Operation:</span>
                    <asp:Label runat="server" ID="lblYearsInOperation"></asp:Label>
                </div>
                <div>
                    <span class="font-medium">Number of Employees:</span>
                    <asp:Label runat="server" ID="lblNumberOfEmployees"></asp:Label>
                </div>
                <div>
                    <span class="font-medium">Website:</span>
                    <asp:Label runat="server" ID="lblWebsite"></asp:Label>
                </div>
                <div>
                    <span class="font-medium">Business Activity:</span>
                    <asp:Label runat="server" ID="lblBusinessActivity"></asp:Label>
                </div>
                <div>
                    <span class="font-medium">Industry:</span>
                    <asp:Label runat="server" ID="lblIndustry"></asp:Label>
                </div>
                <div>
                    <span class="font-medium">Application Status:</span>
                    <asp:Label runat="server" ID="lblStatus"></asp:Label>
                </div>
                <div class="flex flex-col gap-1">
                    <span class="block font-medium">Rejection or hold reasons:</span>
                    <asp:Label runat="server" ID="lblReason"></asp:Label>
                </div>
                <div class="">
                    <span class="font-medium">Application Level:</span>
                    <asp:Label runat="server" ID="lblApplicationLevel"></asp:Label>
                </div>
            </div>
        </section>

        <!-- Company Directors Section -->
        <section class="bg-white shadow-md rounded-lg p-6 mb-6 mx-[50px] ">
            <h2 class="text-xl font-semibold mb-1 text-[#06498e]">Directors Details</h2>

            <asp:Literal ID="lblRevalidateStatus" runat="server"></asp:Literal>

            <table class="min-w-full bg-white border border-gray-200">
                <thead class="bg-blue-50 bg-opacity-50">
                    <tr>
                        <th class="py-2 px-4 border-b text-left border-[#06498e]">Name</th>
                        <th class="py-2 px-4 border-b text-left border-[#06498e]">Sanction Status</th>
                        <th class="py-2 px-4 border-b border-[#06498e]">Sanction Score (%)</th>
                        <th class="py-2 px-4 border-b border-[#06498e] text-left">National ID</th>
                        <th class="py-2 px-4 border-b border-[#06498e] text-left">Valid ID</th>
                        <th class="py-2 px-4 border-b border-[#06498e] text-center">Action</th>
                    </tr>
                </thead>
                <tbody id="rptDirectors2" class="text-gray-700">
                    <asp:Repeater ID="rptDirectors" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td class="px-4 py-2 border-b border-gray-200 text-sm">
                                    <%# Eval("Name") %>
                                </td>



                                <%# Convert.ToBoolean(Eval("Sanctioned").ToString().Equals("True")) ?   $@"<td class='px-4 py-2 border-b border-gray-200 text-sm bg-red-200 text-red-800 text-semibold'>Sanctioned
                                      </td>" :  $@"<td class='px-4 py-2 border-b border-gray-200 text-sm  text-semibold bg-green-200 text-green-800'>Not Sanctioned
                                      </td>"
                                %>

                                <td class="px-4 py-2 border-b border-gray-200 text-center text-sm">
                                    <%# string.IsNullOrEmpty(Eval("SanctionScore").ToString()) ? "0" : Eval("SanctionScore")  %>
                                </td>
                                <td class="px-4 py-2 border-b border-gray-200 text-left text-sm">
                                    <%# Eval("NIN") %>
                                </td>
                                <td class="px-4 py-2 border-b border-gray-200 text-sm text-left">
                                    <%# Eval("NationalIdStatus") %>
                                </td>
                                <td class="px-4 py-2 border-b border-gray-200 text-sm text-left grid gap-2 grid-cols-2">
                                    <asp:Button ID="RevalidateNIN" runat="server" Text="Revalidate NIN" CssClass="cursor-pointer bg-[#06498e] px-2 py-1.5 text-white rounded-md" OnClick="RevalidateNIN_Click" CommandArgument='<%# Eval("DirectorId").ToString() %>' />
                                    <asp:Button ID="RevalidateSanctionStatus" runat="server" Text="Recheck Sanction status" CssClass="cursor-pointer bg-[#06498e] rounded-md px-2 py-1.5 text-white" OnClick="RevalidateSanctionStatus_Click" CommandArgument='<%# Eval("DirectorId").ToString() %>' />
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>
        </section>

        <!-- Uploaded Documents Section -->

            <h2 class="text-xl font-semibold mb-1 text-[#06498e] mx-[70px]">KYC Documents</h2>
        <div class="grid grid-cols-2 gap-4 md:grid-cols-4 mx-[50px]">

            <asp:PlaceHolder ID="documentsPlaceholder" runat="server"></asp:PlaceHolder>
        </div>

        <!-- Approve, Reject Or Put Application on Hold -->

        <asp:Panel runat="server" ID="pnlLegal" Visible="false">

            <div class="flex justify-center items-center gap-4 mt-[40px]">
                <div>
                    <asp:Button ID="ApproveApplication" runat="server" CssClass="cursor-pointer rounded-md text-white bg-green-600 hover:bg-green-700 px-4 py-1.5 font-semibold" Text="Approve" OnClick="ApproveApplication_Click" />
                </div>
                <div>
                    <asp:Button ID="RejectApplication" runat="server" CssClass="cursor-pointer rounded-md text-white bg-red-600 hover:bg-red-700 px-4 py-1.5 font-semibold" Text="Reject" OnClick="RejectApplication_Click" />
                </div>
                <div>
                    <asp:Button ID="PutOnHold" runat="server" CssClass="cursor-pointer rounded-md text-white bg-[#06498e] px-4 py-2 font-semibold" Text="Put on Hold" OnClick="PutOnHold_Click" />
                </div>
            </div>

            <asp:Panel ID="pnlRejection" runat="server" Visible="false" CssClass="w-[40%] mb-[100px] mt-[30px] mx-[50px]">
                <div class="mb-0">
                    <asp:Label ID="lblRejection" runat="server" Text="Reason" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="txtRejectionReason" runat="server" TextMode="MultiLine" Rows="3" Placeholder="Please provide a reason as to why you are either rejecting  this application on hold" CssClass="w-full rounded-md border border-[#e0e0e0] bg-white py-3 px-6 text-base font-medium text-[#6B7280] outline-none focus:border-[#6A64F1] focus:shadow-md" />
                </div>

                <asp:Button ID="SubmitRejectionReason" runat="server" CssClass="cursor-pointer hover:shadow-form w-full rounded-md bg-[#06498e] py-3 px-8 text-center text-base font-semibold text-white outline-none" Text="Submit Reason" OnClick="SubmitRejectionReason_Click" />
            </asp:Panel>

            <asp:Panel ID="pnlOnHold" runat="server" Visible="false" CssClass="w-[40%] mb-[100px] mt-[30px] mx-[50px]">
                <div class="mb-0">
                    <asp:Label ID="Label1" runat="server" Text="Reason" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="txtOnHoldReason" runat="server" TextMode="MultiLine" Rows="3" Placeholder="Please provide a reason as to why you are putting this application on hold" CssClass="w-full rounded-md border border-[#e0e0e0] bg-white py-3 px-6 text-base font-medium text-[#6B7280] outline-none focus:border-[#6A64F1] focus:shadow-md" />
                </div>

                <asp:Button ID="SubmitOnHoldReason" runat="server" CssClass="cursor-pointer hover:shadow-form w-full rounded-md bg-[#06498e] py-3 px-8 text-center text-base font-semibold text-white outline-none" Text="Submit Reason" OnClick="SubmitOnHoldReason_Click" />
            </asp:Panel>
        </asp:Panel>
    </asp:Panel>

</asp:Content>
