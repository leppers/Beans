<%@ Page Title="Create User" Language="C#" MasterPageFile="~/MasterPages/Admin.master" AutoEventWireup="true" CodeFile="users.aspx.cs" Inherits="users" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
    <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" BackColor="Transparent" 
    BorderColor="#CCCC99" BorderStyle="Solid" BorderWidth="1px" 
    Font-Names="Verdana" Font-Size="10pt" Height="342px" Width="516px">
    <SideBarStyle BackColor="#7C6F57" BorderWidth="0px" Font-Size="0.9em" 
        VerticalAlign="Top" />
    <SideBarButtonStyle BorderWidth="0px" Font-Names="Verdana" 
        ForeColor="#FFFFFF" />
    <ContinueButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" 
        BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" 
        ForeColor="#284775" />
    <NavigationButtonStyle BackColor="White" BorderColor="#CCCCCC" 
        BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" 
        ForeColor="#284775" />
    <HeaderStyle BackColor="#782222" Font-Bold="True" ForeColor="#FFFFFF" 
        HorizontalAlign="Center" />
    <CreateUserButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" 
        BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" 
        ForeColor="#284775" />
    <TitleTextStyle BackColor="#6B696B" Font-Bold="True" ForeColor="#FFFFFF" />
    <StepStyle BorderWidth="0px" />
    <WizardSteps>
        <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server" >
               
               
            <ContentTemplate>
                <table border="0" 
                    style="font-family:Verdana;font-size:100%;height:342px;width:516px;">
                    <tr>
                        <td align="center" colspan="2" 
                            style="color:White;background-color:#a37832;font-weight:bold;">
                            Sign Up for Your New Account</td>
                    </tr>
                    <tr>
                        <td align="right">
                          <h5>  <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name:</asp:Label></h5>
                        </td>
                        <td>
                            <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                                ControlToValidate="UserName" ErrorMessage="User Name is required." 
                                ToolTip="User Name is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                           <h5>  <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label></h5> 
                        </td>
                        <td>
                            <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" 
                                ControlToValidate="Password" ErrorMessage="Password is required." 
                                ToolTip="Password is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                           <h5>  <asp:Label ID="ConfirmPasswordLabel" runat="server" 
                                AssociatedControlID="ConfirmPassword">Confirm Password:</asp:Label></h5> 
                        </td>
                        <td>
                            <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" 
                                ControlToValidate="ConfirmPassword" 
                                ErrorMessage="Confirm Password is required." 
                                ToolTip="Confirm Password is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                          <h5>   <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email">E-mail:</asp:Label></h5> 
                        </td>
                        <td>
                            <asp:TextBox ID="Email" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="EmailRequired" runat="server" 
                                ControlToValidate="Email" ErrorMessage="E-mail is required." 
                                ToolTip="E-mail is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                          <h5>   <asp:Label ID="QuestionLabel" runat="server" AssociatedControlID="Question">Security Question:</asp:Label></h5> 
                        </td>
                        <td>
                            <asp:TextBox ID="Question" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="QuestionRequired" runat="server" 
                                ControlToValidate="Question" ErrorMessage="Security question is required." 
                                ToolTip="Security question is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                          <h5>   <asp:Label ID="AnswerLabel" runat="server" AssociatedControlID="Answer">Security Answer:</asp:Label></h5> 
                        </td>
                        <td>
                            <asp:TextBox ID="Answer" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="AnswerRequired" runat="server" 
                                ControlToValidate="Answer" ErrorMessage="Security answer is required." 
                                ToolTip="Security answer is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" colspan="2">
                            <asp:CompareValidator ID="PasswordCompare" runat="server" 
                                ControlToCompare="Password" ControlToValidate="ConfirmPassword" 
                                Display="Dynamic" 
                                ErrorMessage="The Password and Confirmation Password must match." 
                                ValidationGroup="CreateUserWizard1"></asp:CompareValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" colspan="2" style="color:Red;">
                            <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
               
               
        </asp:CreateUserWizardStep>
        <asp:WizardStep ID="WizardStep1" runat="server" AllowReturn="False" 
                OnActivate="AssignUserToRoles_Activate"              
                OnDeactivate="AssignUserToRoles_Deactivate">
            <table>
            <tr>
            <td>
            <h5>   Select one or more roles for the user:</h5> 
            </td>
            </tr>
            <tr>
               <td>
               <asp:ListBox ID="AvailableRoles" runat="server" 
                            SelectionMode="Multiple" >
               </asp:ListBox>
             </td>
             </tr>
            </table>
        </asp:WizardStep>
 

        
        <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server"  >
            
            <ContentTemplate>
                <table border="0" 
                    style="font-family:Verdana;font-size:100%;height:342px;width:516px;">
                    <tr>
                        <td align="center" 
                            style="color:White;background-color:#a37832;font-weight:bold;">
                            Complete</td>
                    </tr>
                    <tr>
                        <td>
                          <h5>  Your account has been successfully created!</h5></td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Button ID="ContinueButton" runat="server" BackColor="#FFFBFF" 
                                BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" 
                                CausesValidation="False" CommandName="Continue" Font-Names="Verdana" 
                                ForeColor="#284775" onclick="ContinueButton_Click" Text="Continue" 
                                ValidationGroup="CreateUserWizard1" />
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
            
        </asp:CompleteWizardStep>
    </WizardSteps>
</asp:CreateUserWizard>
</asp:Content>


