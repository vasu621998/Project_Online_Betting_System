<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="team.aspx.cs" Inherits="Project.team" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style3 {
            width: 941px;
        }
        .auto-style6 {
            height: 26px;
            width: 224px;
        }
        .auto-style7 {
            height: 27px;
        }
        .auto-style9 {
            height: 3px;
        }
        .auto-style12 {
            height: 3px;
            width: 224px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <table class="auto-style1">
            <tr>
                <td>&nbsp;</td>
                <td class="auto-style3">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;</td>
                <td class="auto-style3">
                    &nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td class="auto-style3">
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT [player_name], [player_value], [player_image], [player_type], [player_team] FROM [event_player] WHERE ([event_id] = @event_id)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="Label5" Name="event_id" PropertyName="Text" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
                <td class="auto-style3">
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td class="auto-style3">
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT [player_team], [player_type], [player_name], [player_value], [player_image] FROM [user_player_db] WHERE ([user_team_id] = @user_team_id) ORDER BY [player_team], [player_type]">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="Label6" Name="user_team_id" PropertyName="Text" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
                <td class="auto-style3">
                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT [player_team] FROM [event_player] WHERE ([event_id] = @event_id)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="Label5" Name="event_id" PropertyName="Text" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td class="auto-style3">
                    <asp:Image ID="Image1" runat="server" Height="120px" Width="120px" />
                    <asp:Image ID="Image2" runat="server" Height="80px" ImageUrl="~/images/vs.jpg" Width="80px" />
                    <asp:Image ID="Image3" runat="server" Height="120px" Width="120px" />
                </td>
                <td class="auto-style3">
                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT [player_type] FROM [player_db]"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td class="auto-style3">
                    <asp:Label ID="Label18" runat="server" Font-Size="X-Large" Visible="False"></asp:Label>
                </td>
                <td class="auto-style3">
                    &nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td class="auto-style3">
                    &nbsp;</td>
                <td class="auto-style3">
                    &nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td class="auto-style3">
                    <asp:Wizard ID="Wizard1" runat="server" ActiveStepIndex="0" Height="150px" Width="664px" Visible="False" OnFinishButtonClick="Wizard1_FinishButtonClick" >
                        <WizardSteps>
                            <asp:WizardStep runat="server" title="Enter Team Name">
                                <asp:Label ID="Label17" runat="server" Text="New" Visible="False"></asp:Label>
                                &nbsp;Team Name:<asp:TextBox ID="TextBox1" runat="server" OnTextChanged="TextBox1_TextChanged" ViewStateMode="Enabled"></asp:TextBox>
                            </asp:WizardStep>
                            <asp:WizardStep runat="server" title="Select Team">
                                <br />
                                <table class="auto-style1">
                                    <tr>
                                        <td>
                                            <table class="auto-style1">
                                                <tr>
                                                    <td>&nbsp;</td>
                                                    <td>
                                                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Validate Team" />
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="Label13" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;<table class="auto-style1">
                                            <tr>
                                                <td>Team Name<asp:Label ID="Label15" runat="server"></asp:Label>
                                                </td>
                                                <td>Remaining Points:<asp:Label ID="Label14" runat="server"></asp:Label>
                                                    &nbsp; </td>
                                            </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <table class="auto-style1">
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Label7" runat="server" ForeColor="Green" Text="5 batsman remaining"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="Label8" runat="server" ForeColor="Green" Text="1 wicket-keeper remaining"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="Label9" runat="server" ForeColor="Green" Text="1 all-rounder remaining"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="Label10" runat="server" ForeColor="Green" Text="4 bowlers remaining"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="Label11" runat="server" ForeColor="Green">Select Maximam 6 players from 1 team</asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:DataList ID="DataList2" runat="server" CssClass="auto-style5" DataSourceID="SqlDataSource2" Height="183px" OnItemCommand="DataList2_ItemCommand" RepeatColumns="11" RepeatDirection="Horizontal" Width="216px">
                                                <ItemTemplate>
                                                    <br />
                                                    <table class="auto-style1">
                                                        <tr>
                                                            <td class="auto-style6">
                                                                <asp:ImageButton ID="ImageButton2" runat="server" CommandName="select" ImageAlign="Middle" ImageUrl='<%# Eval("player_image") %>' Height="120px" Width="120px" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="auto-style12"></td>
                                                        </tr>
                                                        <tr>
                                                            <td class="auto-style7">
                                                                <asp:Label ID="player_nameLabel" runat="server" Text='<%# Eval("player_name") %>' />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="player_teamLabel" runat="server" Text='<%# Eval("player_team") %>' />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="player_typeLabel" runat="server" Text='<%# Eval("player_type") %>' />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="player_valueLabel" runat="server" Text='<%# Eval("player_value") %>' />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </ItemTemplate>
                                            </asp:DataList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Filter By</td>
                                    </tr>
                                    <tr>
                                        <td>Player Team:<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" ViewStateMode="Enabled">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Player Type:<asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" ViewStateMode="Enabled">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" RepeatColumns="9" RepeatDirection="Horizontal" Width="285px" OnItemCommand="DataList1_ItemCommand" >
                                                <ItemTemplate>
                                                    <br />
                                                    <table class="auto-style1">
                                                        <tr>
                                                            <td>
                                                                <asp:ImageButton ID="ImageButton1" runat="server" ImageAlign="Middle" ImageUrl='<%# Eval("player_image") %>' CommandName="select" CssClass="auto-style7" Height="120px" Width="120px" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="auto-style9"></td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="player_nameLabel" runat="server" Text='<%# Eval("player_name") %>' />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="player_teamLabel" runat="server" Text='<%# Eval("player_team") %>' />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="player_typeLabel" runat="server" Text='<%# Eval("player_type") %>' />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <asp:Label ID="player_valueLabel" runat="server" Text='<%# Eval("player_value") %>' />
                                                    <br />
                                                </ItemTemplate>
                                            </asp:DataList>
                                        </td>
                                    </tr>
                                </table>
                                <br />
                            </asp:WizardStep>
                            <asp:WizardStep runat="server" Title="Select star batsman and bowler">
                                <asp:Label ID="Label12" runat="server">Validate Your Team</asp:Label>
                                <br />
                                <br />
                                Star Batsman :<asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged" Visible="False" ViewStateMode="Enabled">
                                </asp:DropDownList>
                                &nbsp;
                                <asp:Label ID="Label19" runat="server" Visible="False"></asp:Label>
                                <br />
                                <br />
                                Star Bowler:<asp:DropDownList ID="DropDownList4" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList4_SelectedIndexChanged" Visible="False" ViewStateMode="Enabled">
                                </asp:DropDownList>
                                &nbsp;
                                <asp:Label ID="Label20" runat="server" Visible="False"></asp:Label>
                            </asp:WizardStep>
                        </WizardSteps>
                    </asp:Wizard>
                </td>
                <td class="auto-style3">
                    &nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td class="auto-style3">
                    <asp:Label ID="Label5" runat="server" Visible="False"></asp:Label>
                    <asp:Label ID="Label6" runat="server" Visible="False"></asp:Label>
                </td>
                <td class="auto-style3">&nbsp;</td>
            </tr>
            </table>
        <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </div>
    </form>
</body>
</html>
