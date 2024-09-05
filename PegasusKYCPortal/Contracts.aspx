<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="Contracts.aspx.cs" Inherits="PegasusKYCPortal.Contracts" %>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2 class="text-2xl mb-2 font-semibold text-center text-[#06498e]">Uploaded Contracts</h2>

    <div class="mx-[50px]">

        <asp:Literal ID="MessageLiteral" runat="server"></asp:Literal>
        <asp:Button ID="btnAddNew" runat="server" Text="Add Contract Draft" CssClass="bg-[#06498e] text-white px-4 py-2 rounded-md cursor-pointer" OnClick="BtnAddNew_Click" />


        <asp:Panel ID="panelUpload" runat="server" CssClass="mt-4" Visible="false">
            <div class="flex justify-between items-center gap-5 ">

                <div class="w-[400px]">
                    <div>

                        <label for="businessDropdown" class="block">Select Business</label>
                        <asp:DropDownList ID="businessDropdown"  runat="server" CssClass="border rounded-md py-2 px-[10px] w-full">
                        </asp:DropDownList>
                    </div>
                </div>

                <div class="bg-white rounded-md w-full">
                        <label for="businessDropdown" class="block">Choose a file</label>
                    <div class="flex gap-5">

                        <asp:FileUpload ID="fileUpload" runat="server" CssClass="border col-span-3 rounded-md w-full py-2 px-[20px]" />
                        <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="bg-[#06498e] text-white px-4 py-2 rounded-md" OnClick="BtnSave_Click" />
                    </div>

                </div>
            </div>

        </asp:Panel>

        <asp:Panel ID="panelContracts" runat="server" CssClass="mt-8" Visible="false">

            <div class="bg-white p-6 rounded-lg shadow-md mb-[100px]">
                <div class="overflow-x-auto">
                    <table class="min-w-full bg-white">
                        <thead>
                            <tr>
                                <th class="px-4 py-2 border-b-2 border-[#06498e] bg-opacity-50 bg-blue-100 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">Company name</th>
                                <th class="px-4 py-2 border-b-2 border-[#06498e] bg-opacity-50 bg-blue-100 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">Document</th>
                                <th class="px-4 py-2 border-b-2 border-[#06498e] bg-opacity-50 bg-blue-100 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">Uploaded by</th>
                                <th class="px-4 py-2 border-b-2 border-[#06498e] bg-opacity-50 bg-blue-100 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">Status</th>
                                <th class="px-4 py-2 border-b-2 border-[#06498e] bg-opacity-50 bg-blue-100 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">Uploaded on</th>
                                <th class="px-4 py-2 border-b-2 border-[#06498e] bg-opacity-50 bg-blue-100 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="rptContracts" runat="server">
                                <ItemTemplate>

                                    <tr>
                                        <td class="px-4 py-2 border-b border-gray-200 text-sm text-[#06498e] hover:underline">
                                            <%# Eval("CompanyName") %>
                                        </td>
                                        <td class="px-4 py-2 border-b border-gray-200 text-sm">
                                            <%# Eval("DocumentType") %>
                                        </td>
                                        <td class="px-4 py-2 border-b border-gray-200 text-sm">
                                            <%# Eval("CreatedBy") %>
                                        </td>
                                        <td class="px-4 py-2 border-b border-gray-200 text-sm">
                                            <%# Eval("Status") %>
                                        </td>
                                        <td class="px-4 py-2 border-b border-gray-200 text-sm">
                                            <%# Eval("CreatedOn") %>
                                        </td>
                                        <td class="flex px-4 py-2 gap-2 border-b border-gray-200 text-sm">
                                            <asp:Button ID="Button1" runat="server" Text="Approve" CommandArgument='<%# Eval("ContractId") %>' CssClass="" OnClick="btnApprove_Click" />
                                            <asp:Button ID="Button2" runat="server" Text="Reject" CommandArgument='<%# Eval("ContractId") %>' CssClass="" OnClick="btnReject_Click" />
                                            <asp:Button ID="Button3" runat="server" Text="Hold" CommandArgument='<%# Eval("ContractId") %>' CssClass="" OnClick="btnHold_Click" />
                                        </td>

                                    </tr>

                                </ItemTemplate>
                            </asp:Repeater>
                        </tbody>
                    </table>
                </div>
            </div>
        </asp:Panel>

        <asp:Panel ID="panelNoContracts" runat="server" CssClass="mt-8" Visible="false">
            <h4 class="text-center text-xl">There are no uploaded contracts at the moment...</h4>
        </asp:Panel>

    </div>
</asp:Content>
