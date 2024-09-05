<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="PegasusKYCPortal.AdminDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h2 class="text-center text-3xl font-bold text-[#06498e]">Dashboard</h2>

    <div class="container">
        <!-- Top Cards Section -->
        <div class="grid grid-cols-1 md:grid-cols-4 gap-6 mb-6 mx-[50px]">
            <div class="bg-white p-6 rounded-lg shadow-md text-center">
                <h2 class="text-xl font-semibold text-gray-700">Total Users</h2>
                <asp:Label ID="ltlTotalUsers" runat="server" CssClass="text-3xl font-semibold text-[#06498e] mt-2"></asp:Label>

            </div>
            <div class="bg-white p-6 rounded-lg shadow-md text-center">
                <h2 class="text-xl font-semibold text-gray-700">Total Departments</h2>
                <asp:Label ID="ltlTotalDepartments" runat="server" CssClass="text-3xl font-semibold text-[#06498e] mt-2"></asp:Label>
            </div>
            <div class="bg-white p-6 rounded-lg shadow-md text-center">
                <h2 class="text-xl font-semibold text-gray-700 ">Total Roles</h2>
                <asp:Label ID="ltlTotalRoles" runat="server" CssClass="text-3xl font-semibold text-[#06498e] mt-2"></asp:Label>
            </div>
        </div>

        <!-- User Details Table -->
        <div class="bg-white p-6 rounded-lg shadow-md mx-[50px]">
            <h2 class="text-2xl font-semibold text-[#06498e] mb-4">User Details</h2>
            <div class="overflow-x-auto">
                <table class="min-w-full bg-white">
                    <thead>
                        <tr>
                            <th class="px-4 py-2 border-b-2 border-[#06498e] bg-opacity-50 bg-blue-100 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">Name</th>
                            <th class="px-4 py-2 border-b-2 border-[#06498e] bg-opacity-50 bg-blue-100 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">Email</th>
                            <th class="px-4 py-2 border-b-2 border-[#06498e] bg-opacity-50 bg-blue-100 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">Department</th>
                            <th class="px-4 py-2 border-b-2 border-[#06498e] bg-opacity-50 bg-blue-100 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">Created At</th>
                            <th class="px-4 py-2 border-b-2 border-[#06498e] bg-opacity-50 bg-blue-100 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">Last Login</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="rptUsers" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td class="px-4 py-2 border-b border-gray-200 text-sm">
                                        <%# Eval("Name") %>
                                    </td>
                                    <td class="px-4 py-2 border-b border-gray-200 text-sm">
                                        <%# Eval("Email") %>
                                    </td>
                                    <td class="px-4 py-2 border-b border-gray-200 text-sm">
                                        <%# Eval("Department") %>
                                    </td>
                                    <td class="px-4 py-2 border-b border-gray-200 text-sm">
                                        <%# Eval("CreatedAt", "{0:yyyy-MM-dd}") %>
                                    </td>
                                    <td class="px-4 py-2 border-b border-gray-200 text-sm">
                                        <%# Eval("LastLogin", "{0:yyyy-MM-dd HH:mm}") %>
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>
            </div>
        </div>

    </div>
</asp:Content>
