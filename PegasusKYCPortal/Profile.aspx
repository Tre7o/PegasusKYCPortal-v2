<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="PegasusKYCPortal.Profile" %>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <h1 class="text-[#06498e] text-2xl font-semibold text-center">Your Profile</h1>

    <div class="mx-auto w-[800px] h-screen">
        <asp:Literal ID="MessageLiteral" runat="server"></asp:Literal>


        <div class="container mx-auto mt-8 p-4 bg-white rounded shadow-lg">
            <div class="mb-4">
                <label class="block text-gray-700 font-bold mb-2">Full Name:</label>
                <asp:Label ID="lblFullName" runat="server" CssClass="text-gray-900" />
            </div>

            <div class="mb-4">
                <label class="block text-gray-700 font-bold mb-2">Email:</label>
                <asp:Label ID="lblEmail" runat="server" CssClass="text-gray-900" />
            </div>

            <div class="mb-4">
                <label class="block text-gray-700 font-bold mb-2">Role:</label>
                <asp:Label ID="lblRole" runat="server" CssClass="text-gray-900" />
            </div>

            <div class="mb-4">
                <label class="block text-gray-700 font-bold mb-2">Department:</label>
                <asp:Label ID="lblDepartment" runat="server" CssClass="text-gray-900" />
            </div>

            <div class="mb-4">
                <label class="block text-gray-700 font-bold mb-2">UserName:</label>
                <asp:Label ID="lblUsername" runat="server" CssClass="text-gray-900" />
            </div>

            <div class="mt-6">
                <h2 class="text-lg font-semibold text-[#06498e] mb-4">Reset Password</h2>
                <asp:TextBox ID="txtOldPassword" runat="server" TextMode="Password" CssClass="w-full px-3 py-2 border rounded mb-4" Placeholder="Old Password" />
                <asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password" CssClass="w-full px-3 py-2 border rounded mb-4" Placeholder="New Password" />
                <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" CssClass="w-full px-3 py-2 border rounded mb-4" Placeholder="Confirm New Password" />

                <asp:Button ID="btnResetPassword" runat="server" Text="Reset Password" OnClick="btnResetPassword_Click" CssClass="cursor-pointer bg-[#06498e] hover:bg-[#06498e] text-white font-bold py-2 px-4 rounded" />
            </div>

            <asp:Label ID="lblMessage" runat="server" CssClass="text-red-500 mt-4" />
        </div>
    </div>


</asp:Content>
