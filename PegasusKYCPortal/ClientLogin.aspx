<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ClientLogin.aspx.cs" Inherits="PegasusKYCPortal.ClientLogin" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>KYC Portal - Login</title>
    <link href="pegasus.jpg" rel="shortcut icon" type="image/x-icon" />

    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
    <div class="flex items-center justify-center p-12">
        <form id="form1" runat="server">
            <main class="login-container">
                <section class="flex flex-col justify-center items-center" aria-labelledby="aspnetTitle">
                    <div class=" text-center mb-2 flex justify-center items-center flex-col">
                        <img src="pegasus.jpg" alt="Pegasus KYC Portal Logo" class=" size-[200px] mr-2 mb-4" />
                        <h1 class="text-2xl font-medium text-[#06498e] mb-2">KYC <span class="text-[#d71a21]">Portal</span></h1>
                        <p class="lead fw-normal mb-5">Login to your account</p>
                    </div>

                    <div class="">

                        <asp:Literal ID="MessageLiteral" runat="server"></asp:Literal>

                        <!-- Login Form -->
                        <asp:Panel class="flex flex-col gap-3" ID="pnlForm" Visible="True" runat="server">
                            <div class="mb-0">
                                <asp:Label ID="lblUsername" runat="server" Text="Email" CssClass="form-label  "></asp:Label>
                                <asp:TextBox ID="txtEmail" Placeholder="Enter your email here.." runat="server" CssClass="w-full rounded-md border border-[#e0e0e0] bg-white py-3 px-6 text-base font-medium text-[#6B7280] outline-none focus:border-[#6A64F1] focus:shadow-md" />
                            </div>
                            <div class="mb-0">
                                <asp:Label ID="lblPassword" runat="server" Text="Password" CssClass="form-label"></asp:Label>
                                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="w-full rounded-md border border-[#e0e0e0] bg-white py-3 px-6 text-base font-medium text-[#6B7280] outline-none focus:border-[#6A64F1] focus:shadow-md" />
                            </div>

                            <asp:Button ID="login" runat="server" CssClass="cursor-pointer hover:shadow-form w-full rounded-md bg-[#06498e] py-3 px-8 text-center text-base font-semibold text-white outline-none" Text="Login" OnClick="login_Click" />

                            <div class="text-sm">
                                <span>Forgot your password? Click here to </span>
                                <asp:Button ID="btnSendResetLink" runat="server" Text="reset." CssClass="text-[#06498e] hover:underline cursor-pointer" OnClick="btnSendResetLink_Click" />
                            </div>

                            <!-- Sign Up Link -->
                            <div class="text-sm text-center mt-4">
                                <span>Don't have an account? </span>
                                <asp:HyperLink ID="hlSignUp" NavigateUrl="~/SignUp.aspx" CssClass="text-[#06498e] hover:underline cursor-pointer" runat="server">Sign Up here.</asp:HyperLink>
                            </div>
                        </asp:Panel>

                        <!-- OTP Section -->
                        <asp:Panel ID="pnlOTP" class="flex flex-col gap-2" runat="server" Visible="False">
                            <div class="">
                                <asp:Label ID="lblOTP" runat="server" Text="Enter OTP:" CssClass="form-label"></asp:Label>
                                <asp:TextBox ID="txtOTP" Placeholder="Enter the OTP here..." runat="server" CssClass="w-full rounded-md border border-[#e0e0e0] bg-white py-3 px-6 text-base font-medium text-[#6B7280] outline-none focus:border-[#6A64F1] focus:shadow-md"></asp:TextBox>
                            </div>
                            <div class="flex justify-between items-center gap-5">
                                <asp:Button ID="btnSubmitOTP" CssClass="hover:shadow-form w-full rounded-md bg-[#06498e] py-3 px-8 text-center text-base font-semibold text-white outline-none cursor-pointer" runat="server" Text="Submit OTP" OnClick="btnSubmitOTP_Click" />
                                <asp:Button ID="btnResendOTP" CssClass="hover:shadow-form w-full rounded-md bg-[#06498e] py-3 px-8 text-center text-base font-semibold text-white outline-none cursor-pointer" runat="server" Text="Resend OTP" OnClick="btnResendOTP_Click" />
                            </div>
                        </asp:Panel>

                        <!-- Password Reset -->
                        <asp:Panel class="flex flex-col gap-2" ID="pnlPasswordReset" Visible="false" runat="server">
                            <div class="">
                                <asp:Label ID="lblResetEmail" runat="server" Text="Username" CssClass="form-label"></asp:Label>
                                <asp:TextBox ID="txtResetEmail" runat="server" Placeholder="Enter your email here..." CssClass="w-full rounded-md border border-[#e0e0e0] bg-white py-3 px-6 text-base text-[#6B7280] outline-none focus:border-[#6A64F1] focus:shadow-md" />
                            </div>
                            <div class="">
                                <asp:Label ID="lblNewPassword" runat="server" Text="New Password" CssClass="form-label"></asp:Label>
                                <asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password" Placeholder="Enter new password here.." CssClass="w-full rounded-md border border-[#e0e0e0] bg-white py-3 px-6 text-base text-[#6B7280] outline-none focus:border-[#6A64F1] focus:shadow-md" />
                            </div>
                            <div class="">
                                <asp:Label ID="lblConfirmPass" runat="server" Text="Confirm New Password" CssClass="form-label"></asp:Label>
                                <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" Placeholder="Confirm your password..." CssClass="w-full rounded-md border border-[#e0e0e0] bg-white py-3 px-6 text-base text-[#6B7280] outline-none focus:border-[#6A64F1] focus:shadow-md" />
                            </div>
                            <asp:Button ID="btnResetPassword" CssClass="cursor-pointer hover:shadow-form w-full rounded-md bg-[#06498e] py-3 px-8 text-center text-base font-semibold text-white outline-none" runat="server" Text="Reset Password" OnClick="btnResetPassword_Click" />
                        </asp:Panel>

                    </div>
                </section>
            </main>
        </form>
    </div>
</body>
</html>
