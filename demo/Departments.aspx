<%@ Page Title="Departments" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="Departments.aspx.cs" Inherits="PegasusKYCPortal.Departments" %>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="w-full">
        <h1 class="text-center font-semibold text-2xl text-[#06498e]">Departments</h1>
        <div class="grid grid-cols-4 gap-3 p-12">
            <div class="mx-auto w-full col-span-1 bg-white">

                  <asp:Literal ID="MessageLiteral" runat="server"></asp:Literal>
                <div class="mb-2">
                    <label for="name" class="mb-1 block text-base font-medium text-[#07074D]">
                        Department Name
                    </label>
                    <asp:TextBox ID="dept" runat="server" Placeholder="Enter role's default page..." CssClass="w-full rounded-md border border-[#e0e0e0] bg-white py-3 px-6 text-base font-medium text-[#6B7280] outline-none focus:border-[#6A64F1] focus:shadow-md" /></asp:TextBox>

                </div>

                <div class="flex">
                    <asp:Button ID="CreateDepartment" runat="server" Text="Create Department" CssClass="cursor-pointer hover:shadow-form w-full rounded-md bg-[#06498e] py-3 px-8 text-center text-base font-semibold text-white outline-none" OnClick="CreateDepartment_Click"></asp:Button>
                </div>

            </div>

            <div class="">
                <h4>Table goes here</h4>
            </div>
        </div>
    </div>
</asp:Content>
