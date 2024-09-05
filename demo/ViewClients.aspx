<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="ViewClients.aspx.cs" Inherits="PegasusKYCPortal.ViewClients" %>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">

    <h2 class="text-center text-[#06498e] font-semibold text-2xl">Business Clients</h2>

    <!-- Business Client Details Table -->
    <div class="bg-white p-6 rounded-lg shadow-md mx-[50px]">
        <div class="overflow-x-auto">
            <table class="min-w-full bg-white">
                <thead>
                    <tr>
                        <th class="px-4 py-2 border-b-2 border-[#06498e] bg-opacity-50 bg-blue-100 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">Name</th>
                        <th class="px-4 py-2 border-b-2 border-[#06498e] bg-opacity-50 bg-blue-100 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">Email</th>
                        <th class="px-4 py-2 border-b-2 border-[#06498e] bg-opacity-50 bg-blue-100 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">Business Type</th>
                        <th class="px-4 py-2 border-b-2 border-[#06498e] bg-opacity-50 bg-blue-100 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">Start Date</th>
                        <th class="px-4 py-2 border-b-2 border-[#06498e] bg-opacity-50 bg-blue-100 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">Years in Operation</th>
                        <th class="px-4 py-2 border-b-2 border-[#06498e] bg-opacity-50 bg-blue-100 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">Status</th>
                        <th class="px-4 py-2 border-b-2 border-[#06498e] bg-opacity-50 bg-blue-100 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">Created On</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="rptBusinesses" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td class="px-4 py-2 border-b border-gray-200 text-sm text-[#06498e] hover:underline">
                                    <%# Eval("Name") %>
                                </td>
                                <td class="px-4 py-2 border-b border-gray-200 text-sm">
                                    <%# Eval("Email") %>
                                </td>
                                <td class="px-4 py-2 border-b border-gray-200 text-sm">
                                    <%# Eval("BusinessType") %>
                                </td>
                                <td class="px-4 py-2 border-b border-gray-200 text-sm">
                                    <%# Eval("StartDate") %>
                                </td>
                                <td class="px-4 py-2 border-b text-center border-gray-200 text-sm">
                                    <%# Eval("YearsInOperation") %>
                                </td>

                                <td class="px-4 py-2 border-b border-gray-200 text-sm">
                                    <%# Eval("Status") %>
                                </td>
                                <td class="px-4 py-2 border-b border-gray-200 text-sm">
                                    <%# Eval("CreatedOn", "{0:yyyy-MM-dd}") %>
                                </td>

                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>
        </div>
    </div>
</asp:Content>
