<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="PegasusKYCPortal.SignUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>KYC Portal - Sign Up</title>
    <link href="pegasus.jpg" rel="shortcut icon" type="image/x-icon" />
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
    <div class="flex items-center justify-center p-12">
        <form id="form1" runat="server">
            <main class="sign-up-container">
                <section class="flex flex-col justify-center items-center" aria-labelledby="aspnetTitle">
                    <div class="text-center mb-2 flex justify-center items-center flex-col">
                        <img src="pegasus.jpg" alt="Pegasus KYC Portal Logo" class="size-[200px] mr-2 mb-4" />
                        <h1 class="text-2xl font-medium text-[#06498e] mb-2">KYC <span class="text-[#d71a21]">Portal</span></h1>
                        <p class="lead fw-normal mb-5">Create a new account</p>
                    </div>

                    <div class="">
                        <asp:Literal ID="MessageLiteral" runat="server"></asp:Literal>

                        <asp:Panel class="flex flex-col gap-3" ID="pnlSignUpForm" Visible="True" runat="server">
                            <div class="mb-0">
                                <asp:Label ID="lblUsername" runat="server" Text="Username" CssClass="form-label"></asp:Label>
                                <asp:TextBox ID="txtUsername" runat="server" Placeholder="Enter your username here.." CssClass="w-full rounded-md border border-[#e0e0e0] bg-white py-3 px-6 text-base font-medium text-[#6B7280] outline-none focus:border-[#6A64F1] focus:shadow-md" />
                            </div>
                            <div class="mb-0">
                                <asp:Label ID="lblEmail" runat="server" Text="Email" CssClass="form-label"></asp:Label>
                                <asp:TextBox ID="txtEmail" Placeholder="Enter your email here.." runat="server" CssClass="w-full rounded-md border border-[#e0e0e0] bg-white py-3 px-6 text-base font-medium text-[#6B7280] outline-none focus:border-[#6A64F1] focus:shadow-md" />
                            </div>
                            <div class="mb-0">
                                <asp:Label ID="lblPassword" runat="server" Text="Password" CssClass="form-label"></asp:Label>
                                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Placeholder="Enter your password here.." CssClass="w-full rounded-md border border-[#e0e0e0] bg-white py-3 px-6 text-base font-medium text-[#6B7280] outline-none focus:border-[#6A64F1] focus:shadow-md" />
                            </div>
                            <div class="mb-0">
                                <asp:Label ID="lblConfirmPassword" runat="server" Text="Confirm Password" CssClass="form-label"></asp:Label>
                                <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" Placeholder="Confirm your password here.." CssClass="w-full rounded-md border border-[#e0e0e0] bg-white py-3 px-6 text-base font-medium text-[#6B7280] outline-none focus:border-[#6A64F1] focus:shadow-md" />
                            </div>
                            <asp:Button ID="btnSignUp" runat="server" CssClass="cursor-pointer hover:shadow-form w-full rounded-md bg-[#06498e] py-3 px-8 text-center text-base font-semibold text-white outline-none" Text="Sign Up" OnClick="btnSignUp_Click" />
                        </asp:Panel>

                        <div class="text-sm text-center mt-4">
                            <span>Already have an account? </span>
                            <asp:HyperLink ID="hlLogin" NavigateUrl="~/ClientLogin.aspx" CssClass="text-[#06498e] hover:underline cursor-pointer" runat="server">Login here.</asp:HyperLink>
                        </div>
                    </div>
                </section>
            </main>
        </form>
    </div>
</body>
</html>
