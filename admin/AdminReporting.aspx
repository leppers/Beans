<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.master" AutoEventWireup="true" CodeFile="AdminReporting.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

   

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
    
    <div id="ReportControls">
        <asp:Panel ID="pnlWhichSystem" runat="server">
            <div id="divWhichSystemControl">
            Select System:
                <asp:RadioButtonList ID="rblChooseSystem" runat="server"  
                    onselectedindexchanged="rblChooseSystem_SelectedIndexChanged" AutoPostBack="true">
                    <asp:ListItem Value="Inventory">Inventory</asp:ListItem>
                    <asp:ListItem Value="Volunteer">Volunteer</asp:ListItem>
                    <asp:ListItem Value="Donation">Donation</asp:ListItem>
                    
                </asp:RadioButtonList>
            </div>
             
             <div id="divCalendarControl">
                &nbsp;&nbsp;
                  
               <%--  <asp:DropDownList ID="ddlWhichYear" runat="server"  
                     >
                     <asp:ListItem>2010</asp:ListItem>
                     <asp:ListItem>2011</asp:ListItem>
                     <asp:ListItem>2012</asp:ListItem>
                     <asp:ListItem>2013</asp:ListItem>
                     <asp:ListItem>2014</asp:ListItem>
                     <asp:ListItem>2015</asp:ListItem>
                     <asp:ListItem>2016</asp:ListItem>
                     <asp:ListItem>2017</asp:ListItem>
                     <asp:ListItem>2018</asp:ListItem>
                     <asp:ListItem>2019</asp:ListItem>
                     <asp:ListItem>2020</asp:ListItem>
                 </asp:DropDownList>--%>
                 
                 <br />
                 </div>
                <%--Commenting out all dynamic date controls and ajax due to possible conflict

                 Get data by: 
                 <asp:RadioButtonList ID="rblWhichTimeFrame" runat="server" 
                     onselectedindexchanged="rblWhichTimeFrame_SelectedIndexChanged" autopostback="true">
                     <asp:ListItem>Year</asp:ListItem>
                     <asp:ListItem Value="Quarter"></asp:ListItem>
                     <asp:ListItem Value="Month"></asp:ListItem>
                     <asp:ListItem Text="Date Range" Value="Date Range">Date Range</asp:ListItem>
                 </asp:RadioButtonList>
                 
                 
                 
            </div>
            
            <div ID="divTimeFrameChoice" runat="server">
                <asp:Panel ID="pnlChooseQuarter" runat="server" Visible="false">
                    <asp:DropDownList ID="ddlChooseQuarter" runat="server" AutoPostBack="True" 
                        onselectedindexchanged="ddlChooseQuarter_SelectedIndexChanged">
                        <asp:ListItem Value="1">First Quarter</asp:ListItem>
                        <asp:ListItem Value="2">Second Quarter</asp:ListItem>
                        <asp:ListItem Value="3">Third Quarter</asp:ListItem>
                        <asp:ListItem Value="4">Forth Quarter</asp:ListItem>
                    </asp:DropDownList>
                </asp:Panel>
                
                <asp:Panel ID="pnlChooseMonth" runat="server" Visible="false">
                    <asp:DropDownList ID="ddlChooseMonth" runat="server" AutoPostBack="True" 
                        onselectedindexchanged="ddlChooseMonth_SelectedIndexChanged">
                        <asp:ListItem Value="1">January</asp:ListItem>
                        <asp:ListItem Value="2">February</asp:ListItem>
                        <asp:ListItem Value="3">March</asp:ListItem>
                        <asp:ListItem Value="4">April</asp:ListItem>
                        <asp:ListItem Value="5">May</asp:ListItem>
                        <asp:ListItem Value="6">June</asp:ListItem>
                        <asp:ListItem Value="7">July</asp:ListItem>
                        <asp:ListItem Value="8">August</asp:ListItem>
                        <asp:ListItem Value="9">September</asp:ListItem>
                        <asp:ListItem Value="10">October</asp:ListItem>
                        <asp:ListItem Value="11">November</asp:ListItem>
                        <asp:ListItem Value="12">December</asp:ListItem>
                    </asp:DropDownList>

                </asp:Panel>
                
                <asp:Panel ID="pnlChooseDateRange" runat="server" Visible="true">
                <div id="divStartDateRange">
                     Start Date:<asp:TextBox ReadOnly="true" ID="tbStartDate" runat="server" 
                         AutoPostBack="False" MaxLength="20" ></asp:TextBox>
       
                     <asp:CalendarExtender ID="tbStartDate_CalendarExtender" runat="server" 
                         Enabled="True" TargetControlID="tbStartDate">
                     </asp:CalendarExtender>
       
                     
                    <br />
                     
                </div>
                  
                <div id="divEndDateRange">
                End Date :<asp:TextBox ID="tbEndDate" readonly="true" runat="server" AutoPostBack="False"></asp:TextBox>

                    
                    <asp:CalendarExtender ID="tbEndDate_CalendarExtender" runat="server" 
                        Enabled="True" TargetControlID="tbEndDate">
                    </asp:CalendarExtender>

                    
                    <br />
                    <asp:Button ID="btnDateRange" runat="server" Text="Use These Dates" 
                        Visible="false" onclick="btnDateRange_Click" />
                    
                    <asp:RoundedCornersExtender ID="btnDateRange_RoundedCornersExtender" 
                        runat="server" Enabled="True" TargetControlID="btnDateRange" Radius="6" Corners="All" Color="Brown">
                        
                    </asp:RoundedCornersExtender>
                    
                </div>
   
            </div>--%>
            
        </asp:Panel>

        </div>
         
        <div id="divResults">
        <asp:Panel ID="pnlInventory" runat="server" Visible="false">
        Inventory Waste
            <rsweb:ReportViewer ID="rv_InvWaste" runat="server" Font-Names="Verdana" 
                Font-Size="8pt" InteractiveDeviceInfos="(Collection)" CssClass="ReportViewer" 
                WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt">

                <LocalReport ReportPath="rpt_StaticInvWaste2010.rdlc">
                    <DataSources>
                        <rsweb:ReportDataSource DataSourceId="DS_InvWaste2010" Name="DataSet1" />
                    </DataSources>
                </LocalReport>

            </rsweb:ReportViewer>
        
        
            <asp:ObjectDataSource ID="DS_InvWaste2010" runat="server" 
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetWasteDate2010" 
                TypeName="Beans_DB_v5DataSetTableAdapters.StaticInvWasteTableAdapter">
            </asp:ObjectDataSource>
        </asp:Panel>
        
         <%-- <rsweb:ReportViewer ID="rv_newInvWaste" runat="server" Font-Names="Verdana" 
                Font-Size="8pt" InteractiveDeviceInfos="(Collection)" 
                WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" AsyncRendering="false">
                        <LocalReport ReportPath="rpt_NewInvWaste.rdlc.rdlc">
                            <DataSources>
                                <rsweb:ReportDataSource DataSourceId="DS_NewInvWaste" Name="DS_Waste" />
                            </DataSources>
                        </LocalReport>
                        </rsweb:ReportViewer>

            <asp:ObjectDataSource ID="DS_NewInvWaste" runat="server" 
                SelectMethod="GetInventoryWaste_ByDateRange" 
                TypeName="Beans_DB_v5DataSetTableAdapters.InventoryWasteInfoTableAdapter" 
                OldValuesParameterFormatString="original_{0}">
                <SelectParameters>
                    <asp:Parameter DefaultValue="1/1/2000" Name="startDate" Type="DateTime" />
                    <asp:Parameter DefaultValue="1/1/2020" Name="endDate" Type="DateTime" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <asp:Accordion ID="accInvntory" runat="server" AutoSize="Fill" 
                FadeTransitions="true" FramesPerSecond="40" SelectedIndex="0" 
                TransitionDuration="250">
                <Panes>
                    <asp:AccordionPane ID="ap_InvWaste" runat="server">
                        <Header>
                            <a href="" onclick="return false;">Inventory Waste Report</a>
                        </Header>
                        <Content>
                             <rsweb:ReportViewer ID="rv_InvWaste" runat="server" Font-Names="Verdana" 
                Font-Size="8pt" Height="400px" Width="400px">
                <LocalReport ReportPath="rpt_InventoryWaste_byDateRange.rdlc">
                    <DataSources>
                        <rsweb:ReportDataSource DataSourceId="DS_InvWaste" 
                            Name="Beans_DB_v5DataSet_InventoryWasteInfo" />
                    </DataSources>
                </LocalReport>
            </rsweb:ReportViewer>
            
            <asp:ObjectDataSource ID="DS_InvWaste" runat="server" 
                SelectMethod="GetInventoryWaste_ByDateRange" 
                TypeName="Beans_DB_v5DataSetTableAdapters.InventoryWasteInfoTableAdapter" 
                OldValuesParameterFormatString="original_{0}">
                <SelectParameters>
                    <asp:ControlParameter ControlID="tbStartDate" Name="startDate" 
                        PropertyName="Text" Type="DateTime" />
                    <asp:ControlParameter ControlID="tbEndDate" Name="endDate" PropertyName="Text" 
                        Type="DateTime" />
                </SelectParameters>
            </asp:ObjectDataSource> 
                        </Content>
                    </asp:AccordionPane>
                    <asp:AccordionPane ID="ap_InvOnHand" runat="server">
                        <Header>
                            <a href="" onclick="return false;">Inventory On Hand (Last PIC)</a>
                        </Header>
                        <Content>
                            
                        </Content>
                    </asp:AccordionPane>
                </Panes>
            </asp:Accordion>--%>
    
         
           
        <asp:Panel ID="pnlVolunteer" runat="server" Visible="False">
        <div id="div_Volunteer">
            <rsweb:ReportViewer ID="rv_Volunter2010" runat="server" Font-Names="Verdana" CssClass="ReportViewer"  
                Font-Size="8pt" InteractiveDeviceInfos="(Collection)" 
                WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt">
                <LocalReport ReportPath="rpt_StaticVol2010.rdlc">
                    <DataSources>
                        <rsweb:ReportDataSource DataSourceId="DS_VOl2010" Name="DataSet1" />
                    </DataSources>
                </LocalReport>
            </rsweb:ReportViewer>
            <asp:ObjectDataSource ID="DS_VOl2010" runat="server" 
                SelectMethod="GetVolunteers2010" 
                TypeName="Beans_DB_v5DataSetTableAdapters.staticVolunteer2010TableAdapter" 
                OldValuesParameterFormatString="original_{0}">
            </asp:ObjectDataSource>
        </div>
           <%-- <rsweb:ReportViewer ID="rv_VolunteerHours" runat="server" Font-Names="Verdana" 
                Font-Size="8pt" Height="400px" Width="400px">
                <LocalReport ReportPath="rpt_VolunteerHours_revised.rdlc">
                    <DataSources>
                        <rsweb:ReportDataSource DataSourceId="DS_volunteerHours" 
                            Name="Beans_DB_v5DataSet_sp_VolunteerEntityHours_byDateRange" />
                    </DataSources>
                </LocalReport>
            </rsweb:ReportViewer>
           
            
        
            <asp:ObjectDataSource ID="DS_volunteerHours" runat="server" 
                SelectMethod="GetData" 
                TypeName="Beans_DB_v5DataSetTableAdapters.sp_VolunteerEntityHours_byDateRangeTableAdapter" 
                OldValuesParameterFormatString="original_{0}">
                <SelectParameters>
                    <asp:ControlParameter ControlID="tbStartDate" Name="startDate" 
                        PropertyName="Text" Type="DateTime" />
                    <asp:ControlParameter ControlID="tbEndDate" Name="endDate" PropertyName="Text" 
                        Type="DateTime" />
                </SelectParameters>
            </asp:ObjectDataSource> -->
        
        <br />--%>
        
        </asp:Panel>
           <%-- <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" 
                Font-Size="8pt" InteractiveDeviceInfos="(Collection)" 
                WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt">
                <LocalReport ReportPath="rpt_newDonIndNewNew.rdlc">
                    <DataSources>
                        <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="DataSet1" />
                    </DataSources>
                </LocalReport>
            </rsweb:ReportViewer>
        
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
                OldValuesParameterFormatString="original_{0}" 
                SelectMethod="GetDonationsfromIndividuals" 
                TypeName="Beans_DB_v5DataSetTableAdapters.sp_GetDonationsByIndividualTableAdapter">
                <SelectParameters>
                    <asp:ControlParameter ControlID="tbStartDate" Name="startDate" 
                        PropertyName="Text" Type="Datetime" />
                    <asp:ControlParameter ControlID="tbEndDate" Name="endDate" PropertyName="Text" 
                        Type="Datetime" />
                </SelectParameters>
            </asp:ObjectDataSource>--%>
        
        <asp:Panel ID="pnlDonation" runat="server" Visible="true">

        <div id="div_indDonations">
        Individual Donations to Beans
            <rsweb:ReportViewer ID="rv_DonationsIND2010" runat="server" Visible="true" CssClass="ReportViewer" 
                Font-Names="Verdana" Font-Size="8pt" InteractiveDeviceInfos="(Collection)" 
                WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt">
                <LocalReport ReportPath="rpt_staticDonInd2010.rdlc">
                    <DataSources>
                        <rsweb:ReportDataSource DataSourceId="DS_donInd2010" Name="DataSet1" />
                    </DataSources>
                </LocalReport>
            </rsweb:ReportViewer>

            <asp:ObjectDataSource ID="DS_donInd2010" runat="server" 
                OldValuesParameterFormatString="original_{0}" 
                SelectMethod="GetDonationsForIndividividuals2010" 
                TypeName="Beans_DB_v5DataSetTableAdapters.StaticDonationsTableAdapter">
            </asp:ObjectDataSource>

            </div>

        <div  id="div_orgDonations">
        Oganization Donations to Beans  
            <rsweb:ReportViewer ID="rv_donOrg2010" runat="server" Font-Names="Verdana" CssClass="ReportViewer" 
                Font-Size="8pt" InteractiveDeviceInfos="(Collection)" 
                WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt">
                <LocalReport ReportPath="rpt_staticDonOrg2010.rdlc">
                    <DataSources>
                        <rsweb:ReportDataSource DataSourceId="DS_DonORG2010" Name="DataSet1" />
                    </DataSources>
                </LocalReport>
            </rsweb:ReportViewer>
      
      <asp:ObjectDataSource ID="DS_DonORG2010" runat="server" 
                OldValuesParameterFormatString="original_{0}" 
                SelectMethod="GetDonationsOrg2010" 
                TypeName="Beans_DB_v5DataSetTableAdapters.StaticDonationsOrgTableAdapter" >
               
            </asp:ObjectDataSource>
        
        </div>


         <%-- <rsweb:ReportViewer ID="rv_NewDonationIndividual" runat="server" 
                Font-Names="Verdana" Font-Size="8pt" InteractiveDeviceInfos="(Collection)" 
                WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt">
                <LocalReport ReportPath="rpt_NewDonationInd.rdlc">
                    <DataSources>
                        <rsweb:ReportDataSource DataSourceId="DS_DonationIndividual" Name="DS_DonInd" />
                    </DataSources>
                </LocalReport>
            </rsweb:ReportViewer>
        
        
         
        
            <asp:ObjectDataSource ID="DS_DonationIndividual" runat="server" 
                SelectMethod="GetIndividualDonors_byDateRange" 
                TypeName="Beans_DB_v5DataSetTableAdapters.DonationInfoTableAdapter" 
                OldValuesParameterFormatString="original_{0}">
                <SelectParameters>
                    <asp:ControlParameter ControlID="tbStartDate" DefaultValue="1/1/2000 12:00:00 AM" 
                        Name="startDate" PropertyName="Text" Type="DateTime" />
                    <asp:ControlParameter ControlID="tbEndDate" DefaultValue="12/31/2020 12:00:00 AM" 
                        Name="endDate" PropertyName="Text" Type="DateTime" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <asp:Accordion ID="ac_Donation" runat="server" AutoSize="Fill" 
                FadeTransitions="true" FramesPerSecond="40" SelectedIndex="0" 
                TransitionDuration="250">
                <Panes>
                    <asp:AccordionPane ID="ap_DonOrg" runat="server">
                        <Header>
                            <a href="" onclick="return false;">Donation From Organizations Report</a>
                        </Header>
                        <Content>
                          <rsweb:ReportViewer ID="rv_DonOrgByDate" runat="server" Font-Names="Verdana" 
                             Font-Size="8pt" Height="400px" Width="400px">
                        <LocalReport ReportPath="rpt_DonationsOrganizations_byDateRange.rdlc">
                            <DataSources>
                                <rsweb:ReportDataSource DataSourceId="DS_DonOrg" 
                                    Name="Beans_DB_v5DataSet_DonationInfo" />
                            </DataSources>
                        </LocalReport>
                        </rsweb:ReportViewer>
        
            <asp:ObjectDataSource ID="DS_DonOrg" runat="server" 
                SelectMethod="GetOrganizationDonationsByDateRange" 
                TypeName="Beans_DB_v5DataSetTableAdapters.DonationInfoTableAdapter" 
                OldValuesParameterFormatString="original_{0}">
                <SelectParameters>
                    <asp:ControlParameter ControlID="tbStartDate" Name="startDate" 
                        PropertyName="Text" Type="DateTime" />
                    <asp:ControlParameter ControlID="tbEndDate" Name="endDate" PropertyName="Text" 
                        Type="DateTime" />
                </SelectParameters>
            </asp:ObjectDataSource> 
                        </Content>
                    </asp:AccordionPane>
                    <asp:AccordionPane ID="ap_DonInd" runat="server">
                        <Header>
                            <a href="" onclick="return false;">Donations from Individuals</a>
                        </Header>
                        <Content>
                            <rsweb:ReportViewer ID="rv_DonationInd_byDate" runat="server" Font-Names="Verdana" 
                Font-Size="8pt" Height="400px" Width="400px">
            <LocalReport ReportPath="rpt_DonationInd_byDate.rdlc">
                <DataSources>
                    <rsweb:ReportDataSource DataSourceId="DS_DonInd" 
                        Name="Beans_DB_v5DataSet_DonationInfo" />
                </DataSources>
            </LocalReport>
            </rsweb:ReportViewer> 
        
          <asp:ObjectDataSource ID="DS_DonInd" runat="server" 
                SelectMethod="GetIndividualDonors_byDateRange" 
                TypeName="Beans_DB_v5DataSetTableAdapters.DonationInfoTableAdapter" 
                OldValuesParameterFormatString="original_{0}">
             <SelectParameters>
                 <asp:ControlParameter ControlID="tbStartDate" Name="startDate" 
                     PropertyName="Text" Type="DateTime" />
                 <asp:ControlParameter ControlID="tbEndDate" Name="endDate" PropertyName="Text" 
                     Type="DateTime" />
             </SelectParameters>
            </asp:ObjectDataSource>
                        </Content>
                    </asp:AccordionPane>
                    <asp:AccordionPane ID="AccordionPane1" runat="server">
                        <Header>
                            <a href="" onclick="return false;">Beans Donations To Others</a>
                        </Header>
                        <Content>
                              <rsweb:ReportViewer ID="rpt_DonationsToOthers" runat="server">
                        </rsweb:ReportViewer>
                    <rsweb:ReportViewer ID="rv_DonationsToOthers" runat="server" Font-Names="Verdana" 
                Font-Size="8pt" Height="400px" Width="400px">
                <LocalReport ReportPath="rpt_DonationsToOthers.rdlc">
                    <DataSources>
                        <rsweb:ReportDataSource DataSourceId="DS_DonToOthers" 
                            Name="Beans_DB_v5DataSet_DonationInfo" />
                    </DataSources>
                </LocalReport>
            </rsweb:ReportViewer>
        <asp:ObjectDataSource ID="DS_DonToOthers" runat="server" 
                SelectMethod="GetDonationsToOthers" 
                TypeName="Beans_DB_v5DataSetTableAdapters.DonationInfoTableAdapter" 
                OldValuesParameterFormatString="original_{0}">
            <SelectParameters>
                <asp:ControlParameter ControlID="tbStartDate" Name="startDate" 
                    PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="tbEndDate" Name="endDate" PropertyName="Text" 
                    Type="DateTime" />
            </SelectParameters>
            </asp:ObjectDataSource>
                        </Content>
                    </asp:AccordionPane>
                </Panes>
            </asp:Accordion>--%>
        </asp:Panel>
       
        </div>
</asp:Content>

