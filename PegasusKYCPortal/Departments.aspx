<%@ Page Title="Departments" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="Departments.aspx.cs" Inherits="PegasusKYCPortal.Departments" %>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="w-full">
        <h1 class="text-center font-semibold text-2xl text-[#06498e]">Departments</h1>
        <div class="grid grid-cols-7 gap-3 p-12">
            <div class="mx-auto w-full col-span-2 bg-white">

                <asp:Literal ID="MessageLiteral" runat="server"></asp:Literal>
                <div class="mb-2">
                    <label for="name" class="mb-1 block text-base font-medium">
                        Department Name
                    </label>
                    <asp:TextBox ID="dept" runat="server" Placeholder="Enter department name..." CssClass="w-full rounded-md border border-[#06498e] bg-white py-3 px-6 text-base text-[#6B7280] outline-none focus:border-[#6A64F1] focus:shadow-md" /></asp:TextBox>

                </div>

                <div class="flex">
                    <asp:Button ID="CreateDepartment" runat="server" Text="Create Department" CssClass="cursor-pointer hover:shadow-form w-full rounded-md bg-[#06498e] py-3 px-8 text-center text-base font-semibold text-white outline-none" OnClick="CreateDepartment_Click"></asp:Button>
                </div>

            </div>

            <div class="col-span-5">
                <div class="bg-white p-2 rounded-lg shadow-md mx-[50px]">
                    <div class="overflow-x-auto">
                        <table class="min-w-full bg-white">
                            <thead>
                                <tr>
                                    <th class="px-4 py-2 border-b-2 border-[#06498e] bg-opacity-50 bg-blue-100 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">Name</th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="rptDepartments" runat="server">
                                    <ItemTemplate>
                                        <tr>
                                            <td class="px-4 py-2 border-b border-gray-200 text-sm">
                                                <%# Eval("DepartmentName") %>
                                            </td>
                                           
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
</asp:Content>
