<%@ Page Title="Bean's Reporting" Language="C#" MasterPageFile="~/MasterPages/Donation.master" AutoEventWireup="true" CodeFile="Reporting.aspx.cs" Inherits="Reporting" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=9.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
<p>Report: Donation Waste</p>
    <rsweb:ReportViewer ID="ReportViewer5" runat="server" Font-Names="Verdana" 
        Font-Size="8pt" Height="400px" Width="800px">
        <LocalReport ReportPath="BeansDonationReportWaste.rdlc">
            <DataSources>
                <rsweb:ReportDataSource DataSourceId="ObjectDataSource5" 
                    Name="BeansDataSet_DonationWasteReport" />
            </DataSources>
        </LocalReport>
    </rsweb:ReportViewer>
    <asp:ObjectDataSource ID="ObjectDataSource5" runat="server" 
        SelectMethod="GetData" 
        TypeName="BeansDataSetTableAdapters.DonationWasteReportTableAdapter">
    </asp:ObjectDataSource>
<p>Report: Food Donations</p>
    <rsweb:ReportViewer ID="ReportViewer4" runat="server" Font-Names="Verdana" 
        Font-Size="8pt" Height="400px" Width="800px">
        <LocalReport ReportPath="BeansDonationReportFoodOnly.rdlc">
            <DataSources>
                <rsweb:ReportDataSource DataSourceId="ObjectDataSource4" 
                    Name="BeansDataSet_DonationFood" />
            </DataSources>
        </LocalReport>
    </rsweb:ReportViewer>
    <asp:ObjectDataSource ID="ObjectDataSource4" runat="server" 
        SelectMethod="GetData" 
        TypeName="BeansDataSetTableAdapters.DonationFoodTableAdapter">
    </asp:ObjectDataSource>
<p>Report: NonFood Donations</p>
    <rsweb:ReportViewer ID="ReportViewer3" runat="server" Font-Names="Verdana" 
        Font-Size="8pt" Height="400px" Width="800px">
        <LocalReport ReportPath="BeansDonationReportNonFood.rdlc">
            <DataSources>
                <rsweb:ReportDataSource DataSourceId="ObjectDataSource3" 
                    Name="BeansDataSet_DonationNonFood" />
            </DataSources>
        </LocalReport>
    </rsweb:ReportViewer>
    <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" 
        SelectMethod="GetData" 
        TypeName="BeansDataSetTableAdapters.DonationNonFoodTableAdapter">
    </asp:ObjectDataSource>
    <p>Report: Food Bank</p>
    <rsweb:ReportViewer ID="ReportViewer2" runat="server" Font-Names="Verdana" 
        Font-Size="8pt" Height="400px" Width="800px">
        <LocalReport ReportPath="BeansDonationReportFoodBank.rdlc">
            <DataSources>
                <rsweb:ReportDataSource DataSourceId="ObjectDataSource2" 
                    Name="BeansDataSet_DonationFoodBank" />
            </DataSources>
        </LocalReport>
    </rsweb:ReportViewer>
    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" 
        SelectMethod="GetData" 
        TypeName="BeansDataSetTableAdapters.DonationFoodBankTableAdapter">
    </asp:ObjectDataSource>
    <p>Report: All Donations</p>
    <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" 
        Font-Size="8pt" Height="400px" Width="800px">
        <LocalReport ReportPath="BeansDonationReportAll.rdlc">
            <DataSources>
                <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" 
                    Name="BeansDataSet_DonationAll" />
            </DataSources>
        </LocalReport>
    </rsweb:ReportViewer>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
        TypeName="BeansDataSetTableAdapters.DonationAllTableAdapter">
    </asp:ObjectDataSource>
</asp:Content>

