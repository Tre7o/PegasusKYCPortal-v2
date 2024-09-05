<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="ViewClients.aspx.cs" Inherits="PegasusKYCPortal.ViewClients" %>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">

    <h2 class="text-center text-[#06498e] font-semibold text-2xl">Business Clients</h2>

    <div class="grid gap-2 grid-cols-4 text-center mx-[50px] mt-[20px] mb-[5px]">
        <asp:Button runat="server" ID="Pending" Text="Pending" OnClick="Pending_Click" CssClass="py-2 rounded-md bg-[#fecb01] cursor-pointer text-white font-semibold"></asp:Button>
        <asp:Button runat="server" ID="OnHold" Text="On-Hold"  OnClick="OnHold_Click" CssClass="py-2 rounded-md bg-[#06498e] cursor-pointer  font-semibold text-white"></asp:Button>
        <asp:Button runat="server" ID="Approved" Text="Approved" OnClick="Approved_Click" CssClass="py-2 rounded-md bg-[#004B49] cursor-pointer font-semibold text-white"></asp:Button>
        <asp:Button runat="server" ID="Rejected" Text="Rejected" OnClick="Rejected_Click" CssClass="py-2 rounded-md bg-[#d71a21] cursor-pointer  text-white font-semibold"></asp:Button>
    </div>

    <!-- Business Client Details Table -->
    <div class="bg-white p-6 rounded-lg shadow-md mx-[50px] mb-[100px]">
        <div class="overflow-x-auto">
            <table class="min-w-full bg-white">
                <thead>
                    <tr>
                        <th class="px-4 py-2 border-b-2 border-[#06498e] bg-opacity-50 bg-blue-100 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">Name</th>
                        <th class="px-4 py-2 border-b-2 border-[#06498e] bg-opacity-50 bg-blue-100 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">Email</th>
                        <th class="px-4 py-2 border-b-2 border-[#06498e] bg-opacity-50 bg-blue-100 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">Business Type</th>
                        <th class="px-4 py-2 border-b-2 border-[#06498e] bg-opacity-50 bg-blue-100 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">Start Date</th>
                        <th class="px-4 py-2 border-b-2 border-[#06498e] bg-opacity-50 bg-blue-100 text-center text-xs font-semibold text-gray-700 uppercase tracking-wider">Years in Operation</th>
                        <th class="px-4 py-2 border-b-2 border-[#06498e] bg-opacity-50 bg-blue-100 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">Status</th>
                        <th class="px-4 py-2 border-b-2 border-[#06498e] bg-opacity-50 bg-blue-100 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">Created On</th>
                        <th class="px-4 py-2 border-b-2 border-[#06498e] bg-opacity-50 bg-blue-100 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="rptBusinesses" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td class="px-4 py-2 border-b border-gray-200 text-sm text-[#06498e] hover:underline">
                                    <%# Eval("CompanyName") %>
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
                                    <%# Eval("CreatedOn") %>
                                </td>

                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>
        </div>
    </div>
</asp:Content>
