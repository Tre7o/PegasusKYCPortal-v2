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
                    <span>Name:</span>
                    <asp:Label runat="server" ID="lblCompanyName"></asp:Label>
                </div>
                <div>
                    <span>Business Type:</span>
                    <asp:Label runat="server" ID="lblBusinessType"></asp:Label>
                </div>
                <div>
                    <span>Email:</span>
                    <asp:Label runat="server" ID="lblEmail"></asp:Label>
                </div>
                <div>
                    <span>Telephone:</span>
                    <asp:Label runat="server" ID="lblTelephone"></asp:Label>
                </div>
                <div>
                    <span>Location:</span>
                    <asp:Label runat="server" ID="lblLocation"></asp:Label>
                </div>
                <div>
                    <span>Start Date:</span>
                    <asp:Label runat="server" ID="lblStartDate"></asp:Label>
                </div>
                <div>
                    <span>Years in Operation:</span>
                    <asp:Label runat="server" ID="lblYearsInOperation"></asp:Label>
                </div>
                <div>
                    <span>Number of Employees:</span>
                    <asp:Label runat="server" ID="lblNumberOfEmployees"></asp:Label>
                </div>
            </div>
        </section>

        <!-- Company Directors Section -->
        <section class="bg-white shadow-md rounded-lg p-6 mb-6 mx-[50px]">
            <h2 class="text-xl font-semibold mb-1 text-[#06498e]">Directors Details</h2>
            <table class="min-w-full bg-white border border-gray-200">
                <thead class="bg-blue-50 bg-opacity-50">
                    <tr>
                        <th class="py-2 px-4 border-b text-left border-[#06498e]">Name</th>
                        <th class="py-2 px-4 border-b text-left border-[#06498e]">Email</th>
                        <th class="py-2 px-4 border-b text-left border-[#06498e]">Sanction Status</th>
                        <th class="py-2 px-4 border-b border-[#06498e]">Sanction Score</th>
                        <th class="py-2 px-4 border-b border-[#06498e] text-left">National ID</th>
                        <th class="py-2 px-4 border-b border-[#06498e]">Valid ID</th>
                    </tr>
                </thead>
                <tbody id="rptDirectors2" class="text-gray-700">
                    <asp:Repeater ID="rptDirectors" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td class="px-4 py-2 border-b border-gray-200 text-sm">
                                    <%# Eval("Name") %>
                                </td>
                                <td class="px-4 py-2 border-b border-gray-200 text-sm">
                                    <%# Eval("Email") %>
                                </td>
                                <td class="px-4 py-2 border-b border-gray-200 text-sm">
                                    <%# Eval("SanctionStatus") %>
                                </td>
                                <td class="px-4 py-2 border-b border-gray-200 text-center text-sm">
                                    <%# Eval("SanctionScore") %>
                                </td>
                                <td class="px-4 py-2 border-b border-gray-200 text-left text-sm">
                                    <%# Eval("NIN") %>
                                </td>
                                <td class="px-4 py-2 border-b border-gray-200 text-sm">
                                    <%# Eval("ValidStatus") %>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>
        </section>

        <!-- Uploaded Documents Section -->
        <div class="grid grid-cols-2 gap-4 md:grid-cols-4 mx-[50px]">
            <asp:PlaceHolder ID="documentsPlaceholder" runat="server"></asp:PlaceHolder>
        </div>

        <!--  <section class="bg-white shadow-md rounded-lg p-6 mx-[50px]">
            <h2 class="text-xl font-semibold mb-2 text-[#06498e]">Uploaded Documents</h2>
            <div class="grid grid-cols-2 gap-4 md:grid-cols-4">

                <div class="bg-white border border-gray-200 rounded-lg p-1 flex flex-col justify-center items-center">
                    <a href="<%=CompanyName%>" class="block" target="_blank">
                        <img src="pdf-placeholder.png" alt="Document Image" class="size-[50px] object-cover mb-4 rounded-lg" />
                    </a>
                    <h3 class="text-lg font-semibold mb-2">Bank Letter</h3>
                    <div class="flex justify-between mb-4">
                        <button class="bg-green-700 text-white py-1 px-4 rounded hover:bg-green-800">Approve</button>
                        <button class="bg-[#d71a21] text-white py-1 px-4 rounded hover:bg-[#d71a21]">Reject</button>
                    </div>
                </div>
            </div>
        </section> -->


    </asp:Panel>

</asp:Content>
