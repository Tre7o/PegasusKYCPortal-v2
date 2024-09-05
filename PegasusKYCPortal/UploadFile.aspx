<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="UploadFile.aspx.cs" Inherits="PegasusKYCPortal.UploadFile" %>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">

    <asp:Label ID="Message" runat="server" ></asp:Label>
    <h2>Upload Documents</h2>
    <asp:TextBox ID="BusinessName" runat="server" />

  
     <asp:FileUpload ID="File1" runat="server" /><br />
 
    <asp:Button ID="UploadButton2" runat="server" Text="Upload" OnClick="UploadButton_Click" />
</asp:Content>
