﻿<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="xmlRakendus.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
        <main>
    <h1>XML: Reisid</h1>
    <div>
        <asp:Xml runat="server"
            DocumentSource="~/reis.xml"
            TransformSource="~/reis.xslt">
        </asp:Xml>
    </div>
</main>
</asp:Content>
