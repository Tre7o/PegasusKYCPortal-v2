<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="CreateUser.aspx.cs" Inherits="PegasusKYCPortal.CreateUser" %>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="w-full">
        <h1 class="text-center font-semibold text-2xl text-[#06498e]">Create System User</h1>
        <div class="flex items-center justify-center p-12">
            <div class="mx-auto w-full max-w-[550px] bg-white">

                <asp:Literal ID="MessageLiteral" runat="server"></asp:Literal>
                <div class="-mx-3 flex flex-wrap mb-1">
                    <div class="w-full px-3 sm:w-1/2">
                        <div class="">
                            <label for="date" class="mb-0 block text-base font-medium text-[#07074D]">
                                First Name
                            </label>
                            <asp:TextBox ID="firstName" runat="server" CssClass="w-full rounded-md border border-[#e0e0e0] bg-white py-3 px-6 text-base font-medium text-[#6B7280] outline-none focus:border-[#6A64F1] focus:shadow-md" /></asp:TextBox>

                        </div>
                    </div>
                    <div class="w-full px-3 sm:w-1/2">
                        <div class="">
                            <label for="time" class="mb-0 block text-base font-medium text-[#07074D]">
                                Last Name
                            </label>
                            <asp:TextBox ID="lastName" runat="server" CssClass="w-full rounded-md border border-[#e0e0e0] bg-white py-3 px-6 text-base font-medium text-[#6B7280] outline-none focus:border-[#6A64F1] focus:shadow-md" /></asp:TextBox>
                           
                        </div>
                    </div>
                </div>
                <div class="mb-2">
                    <label for="phone" class="mb-0 block text-base font-medium text-[#07074D]">
                        Email
                    </label>
                    <asp:TextBox ID="txtEmail" Placeholder="Please enter a valid email address here..." TextMode="Email" runat="server" CssClass="w-full rounded-md border border-[#e0e0e0] bg-white py-3 px-6 text-base font-medium text-[#6B7280] outline-none focus:border-[#6A64F1] focus:shadow-md" /></asp:TextBox>

                </div>
                <div class="mb-2">
                    <label for="phone" class="mb-0 block text-base font-medium text-[#07074D]">
                        Username
                    </label>
                    <asp:TextBox ID="userName" Placeholder="Enter user's username here..." runat="server" CssClass="w-full rounded-md border border-[#e0e0e0] bg-white py-3 px-6 text-base font-medium text-[#6B7280] outline-none focus:border-[#6A64F1] focus:shadow-md" /></asp:TextBox>

                </div>
                <div class="mb-2">
                    <label for="phone" class="mb-0 block text-base font-medium text-[#07074D]">
                        Password
                    </label>
                    <asp:TextBox ID="password" Placeholder="Enter a strong password here..." runat="server" CssClass="w-full rounded-md border border-[#e0e0e0] bg-white py-3 px-6 text-base font-medium text-[#6B7280] outline-none focus:border-[#6A64F1] focus:shadow-md" /></asp:TextBox>

                </div>
                <div class="mb-2">
                    <label for="phone" class="mb-0 block text-base font-medium text-[#07074D]">
                        Confirm Password
                    </label>
                    <asp:TextBox ID="confirmPassword" Placeholder="Enter a matching password here..." TextMode="Password" runat="server" CssClass="w-full rounded-md border border-[#e0e0e0] bg-white py-3 px-6 text-base font-medium text-[#6B7280] outline-none focus:border-[#6A64F1] focus:shadow-md" /></asp:TextBox>

                </div>

                <div class="-mx-3 flex flex-wrap mb-1">
                    <div class="w-full px-3 sm:w-1/2">
                        <div class="">
                            <label for="date" class="mb-0 block text-base font-medium text-[#07074D]">
                                Department
                            </label>
                            <asp:DropDownList ID="ddlDepartments" runat="server" CssClass="w-full rounded-md border border-[#e0e0e0] bg-white py-3 px-6 text-base font-medium text-[#6B7280] outline-none focus:border-[#6A64F1] focus:shadow-md">
                                <asp:ListItem Text="Select an department" Value="" />
                                <asp:ListItem Text="Department 1" Value="1" />
                                <asp:ListItem Text="Department 2" Value="2" />
                                <asp:ListItem Text="Department 3" Value="3" />
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="w-full px-3 sm:w-1/2">
                        <div class="">
                            <label for="time" class="mb-0 block text-base font-medium text-[#07074D]">
                                Role
                            </label>
                            <asp:DropDownList ID="ddlRoles" runat="server" CssClass="w-full rounded-md border border-[#e0e0e0] bg-white py-3 px-6 text-base font-medium text-[#6B7280] outline-none focus:border-[#6A64F1] focus:shadow-md">
                                <asp:ListItem Text="Select a role" Value="" />
                                <asp:ListItem Text="Role 1" Value="1" />
                                <asp:ListItem Text="Role 2" Value="2" />
                                <asp:ListItem Text="Role 3" Value="3" />
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>

                <div class="mt-3">
                    <div class="flex">
                        <asp:Button ID="AddUser" runat="server" Text="Save User" CssClass="cursor-pointer hover:shadow-form w-full rounded-md bg-[#06498e] py-3 px-8 text-center text-base font-semibold text-white outline-none" OnClick="AddUser_Click"></asp:Button>
                    </div>

                </div>

            </div>
        </div>
    </div>

</asp:Content>
