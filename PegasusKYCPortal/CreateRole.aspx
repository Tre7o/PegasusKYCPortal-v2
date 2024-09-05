<%@ Page Title="Create Role" Language="C#" AutoEventWireup="true" MasterPageFile="~/Layout.Master" CodeBehind="CreateRole.aspx.cs" Inherits="PegasusKYCPortal.CreateRole" %>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="w-full">
        <h1 class="text-center font-semibold text-2xl text-[#06498e]">System Roles</h1>
        <div class="grid grid-cols-7 gap-1 p-2">
            <div class="mx-auto w-full col-span-2 bg-white">

                <asp:Literal ID="MessageLiteral" runat="server"></asp:Literal>

                <div class="mb-2">
                    <label for="name" class="mb-0 block text-base font-medium text-[#07074D]">
                        Role Name
                    </label>
                    <asp:TextBox ID="txtRoleName" Placeholder="Enter role name here.." runat="server" CssClass="w-full rounded-md border border-[#e0e0e0] bg-white py-3 px-6 text-base  text-[#6B7280] outline-none focus:border-[#6A64F1] focus:shadow-md" /></asp:TextBox>

                </div>
                <div class="mb-2">
                    <label for="phone" class="mb-0 block text-base font-medium text-[#07074D]">
                        Role Description
                    </label>
                    <asp:TextBox ID="txtRoleDescription" Placeholder="Enter role description here..." TextMode="MultiLine" Rows="3" runat="server" CssClass="w-full rounded-md border border-[#e0e0e0] bg-white py-3 px-6 text-base text-[#6B7280] outline-none focus:border-[#6A64F1] focus:shadow-md" /></asp:TextBox>
                   
                </div>

                <div class="mb-2">
                    <label for="date" class="mb-0 block text-base font-medium text-[#07074D]">
                        Department
                    </label>
                    <asp:DropDownList ID="ddlDepartments" runat="server" CssClass="w-full rounded-md border border-[#e0e0e0] bg-white py-3 px-6 text-base font-medium text-[#6B7280] outline-none focus:border-[#6A64F1] focus:shadow-md">
                    </asp:DropDownList>
                </div>


                <div class="flex">
                    <asp:Button ID="AddRole" runat="server" Text="Save Role" CssClass="cursor-pointer hover:shadow-form w-full rounded-md bg-[#06498e] py-3 px-8 text-center text-base font-semibold text-white outline-none" OnClick="AddRole_Click"></asp:Button>
                </div>

            </div>
            <div class="col-span-5">
                <div class="bg-white p-2 rounded-lg shadow-md mx-[50px]">
                    <div class="overflow-x-auto">
                        <table class="min-w-full bg-white">
                            <thead>
                                <tr>
                                    <th class="px-4 py-2 border-b-2 border-[#06498e] bg-opacity-50 bg-blue-100 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">Name</th>
                                    <th class="px-4 py-2 border-b-2 border-[#06498e] bg-opacity-50 bg-blue-100 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">Description</th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="rptRoles" runat="server">
                                    <ItemTemplate>
                                        <tr>
                                            <td class="px-4 py-2 border-b border-gray-200 text-sm">
                                                <%# Eval("RoleName") %>
                                            </td>
                                            <td class="px-4 py-2 border-b border-gray-200 text-sm">
                                                <%# Eval("Description") %>
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
</asp:Content>
