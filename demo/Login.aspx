<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="PegasusKYCPortal.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>KYC Portal - Login</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
    <div class="flex items-center justify-center p-12">
        <form id="form1" runat="server">
            <main class="login-container">
                <section class="flex flex-col justify-center items-center" aria-labelledby="aspnetTitle">
                    <div class=" text-center mb-2 flex justify-center items-center flex-col">
                        <img src="pegasus.jpg" alt="Pegasus KYC Portal Logo" class=" size-[200px] mr-2 mb-4" />
                        <h1 class="text-2xl font-medium text-[#06498e] mb-2"> KYC <span class="text-[#d71a21]">Portal</span></h1>
                        <p class="lead fw-normal mb-5">Login to your account</p>
                    </div>

                    <div class="">

                        <asp:Literal ID="MessageLiteral" runat="server"></asp:Literal>

                        <!-- <form method="post" class="login-form p-5 shadow-sm rounded"> -->
                        <asp:Panel class="d-flex flex-column gap-3" ID="pnlForm" Visible="True" runat="server">
                            <div class="mb-3">
                                <asp:Label ID="lblUsername" runat="server" Text="Username:" CssClass="form-label  "></asp:Label>
                                <asp:TextBox ID="txtUsername" runat="server" CssClass="w-full rounded-md border border-[#e0e0e0] bg-white py-3 px-6 text-base font-medium text-[#6B7280] outline-none focus:border-[#6A64F1] focus:shadow-md" /></asp:TextBox>
                            </div>
                            <div class="mb-3">
                                <asp:Label ID="lblPassword" runat="server" Text="Password:" CssClass="form-label"></asp:Label>
                                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="w-full rounded-md border border-[#e0e0e0] bg-white py-3 px-6 text-base font-medium text-[#6B7280] outline-none focus:border-[#6A64F1] focus:shadow-md" /></asp:TextBox>
                            </div>

                            <asp:Button ID="login" runat="server" CssClass="hover:shadow-form w-full rounded-md bg-[#06498e] py-3 px-8 text-center text-base font-semibold text-white outline-none" Text="Login" OnClick="login_Click" />
                        </asp:Panel>

                        <!-- OTP Section -->
                        <asp:Panel ID="pnlOTP" runat="server" Visible="False">
                            <asp:Label ID="lblOTP" runat="server" Text="Enter OTP:" CssClass="form-label"></asp:Label>
                            <asp:TextBox ID="txtOTP" runat="server" CssClass="w-full rounded-md border border-[#e0e0e0] bg-white py-3 px-6 text-base font-medium text-[#6B7280] outline-none focus:border-[#6A64F1] focus:shadow-md"></asp:TextBox>
                            <br />
                            <br />
                            <asp:Button ID="btnSubmitOTP" CssClass="hover:shadow-form w-full rounded-md bg-[#06498e] py-3 px-8 text-center text-base font-semibold text-white outline-none" runat="server" Text="Submit OTP" OnClick="btnSubmitOTP_Click" />
                        </asp:Panel>

                        <!--  </form> -->

                    </div>
                </section>
            </main>
        </form>
    </div>
</body>
</html>
