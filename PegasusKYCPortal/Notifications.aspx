<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="Notifications.aspx.cs" Inherits="PegasusKYCPortal.Notifications" %>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">

    <h1 class="text-[#06498e] text-2xl font-semibold text-center">Notifications</h1>
    <section class="bg-white shadow-md rounded-lg p-6 mb-6 mx-[50px]">
        <table class="min-w-full bg-white border border-gray-200">
            <tbody class="text-gray-700" id="notificationPageTableBodyAll">
                <asp:Repeater ID="rptNotifications2" runat="server">
                    <ItemTemplate>
                        <asp:HiddenField ID="hfNotificationId" runat="server" />
                        <table>
                            <tr class='<%# Convert.ToBoolean(Eval("Received")) ? "bg-gray-100" : "bg-white font-semibold text-black" %> px-4 py-2 border-b border-gray-200 text-sm'
                                ">
                                <td class="px-4 py-2 border-b border-gray-200 text-sm">
                                    <%# Eval("FirstName") %> <%# Eval("LastName") %>
                                </td>

                                <td class="px-4 py-2 border-b border-gray-200 text-sm">
                                    <%# Eval("Message") %>
                                </td>
                                <td class="px-4 py-2 border-b border-gray-200 text-sm">
                                    <%# Eval("SentAt") %>
                                </td>
                                <td class="px-4 py-2 border-b border-gray-200 text-sm">
                                    <%# Convert.ToBoolean(Eval("Received")) ? "IsRead" : "Read" %>
                                    <%# Convert.ToBoolean(Eval("Received")) 
               ? "<i class='fas fa-check-circle text-green-500 ml-2'></i>" 
               : "<i class='fas fa-times-circle text-red-500 ml-2'></i>" 
                                    %>
                                </td>
                            </tr>
                        </table>

                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
        </table>
    </section>
</asp:Content>
