<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Weather.aspx.cs" Inherits="MarkvarteLatvianWeatherNews.Weather" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
    <asp:DropDownList ID="DropDownList1" runat="server">
    </asp:DropDownList>
    <asp:Button ID="Button1" runat="server" Text="show weather" Class="btn btn-primary" OnClick="ShowCurrentSityWeather" />
        <div><asp:Image ID="Image1" runat="server" /></div>
        <br> Weather table:
    <asp:GridView ID="GridView1" class="table" runat="server" HtmlEncode="false">
    </asp:GridView>
    <br> Coordinates table:
    <asp:GridView ID="GridView2" class="table" runat="server">
    </asp:GridView>
    <br> Main table:
    <asp:GridView ID="GridView3" class="table" runat="server">
    </asp:GridView>
    <br> Wind table:
    <asp:GridView ID="GridView4" class="table" runat="server">
    </asp:GridView>
    <br> Sys table:
    <asp:GridView ID="GridView5" class="table" runat="server">
    </asp:GridView>
    </div>
</asp:Content>
