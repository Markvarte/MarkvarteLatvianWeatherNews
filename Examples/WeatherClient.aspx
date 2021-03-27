<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WeatherClient.aspx.cs" Inherits="MarkvarteLatvianWeatherNews.Examples.WeatherClient" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="Label1" runat="server" Height="26px" Text="ievadiet pilsetu" Width="210px"></asp:Label>
    
    <asp:TextBox ID="TextBox1" runat="server" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
    <asp:Button ID="Button1" runat="server" Text="Button" />
    <asp:Xml ID="Xml1" runat="server"></asp:Xml>
</asp:Content>
