<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Lecture4.aspx.cs" Inherits="MarkvarteLatvianWeatherNews.Lecture4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="CityName" DataValueField="CityId" Height="48px" Width="113px"></asp:DropDownList>

<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:WeatherDBConnectionString %>" DeleteCommand="DELETE FROM [tblCity] WHERE [CityId] = @original_CityId AND (([CityName] = @original_CityName) OR ([CityName] IS NULL AND @original_CityName IS NULL)) AND (([Country] = @original_Country) OR ([Country] IS NULL AND @original_Country IS NULL))" InsertCommand="INSERT INTO [tblCity] ([CityName], [CityId], [Country]) VALUES (@CityName, @CityId, @Country)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [CityName], [CityId], [Country] FROM [tblCity] ORDER BY [CityName]" UpdateCommand="UPDATE [tblCity] SET [CityName] = @CityName, [Country] = @Country WHERE [CityId] = @original_CityId AND (([CityName] = @original_CityName) OR ([CityName] IS NULL AND @original_CityName IS NULL)) AND (([Country] = @original_Country) OR ([Country] IS NULL AND @original_Country IS NULL))">
    <DeleteParameters>
        <asp:Parameter Name="original_CityId" Type="Int32" />
        <asp:Parameter Name="original_CityName" Type="String" />
        <asp:Parameter Name="original_Country" Type="String" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="CityName" Type="String" />
        <asp:Parameter Name="CityId" Type="Int32" />
        <asp:Parameter Name="Country" Type="String" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="CityName" Type="String" />
        <asp:Parameter Name="Country" Type="String" />
        <asp:Parameter Name="original_CityId" Type="Int32" />
        <asp:Parameter Name="original_CityName" Type="String" />
        <asp:Parameter Name="original_Country" Type="String" />
    </UpdateParameters>
</asp:SqlDataSource>

</asp:Content>
