<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="points.aspx.cs" Inherits="Project.admin.points" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 189px;
        }
        .auto-style3 {
            width: 108px;
        }
        .auto-style4 {
            width: 88px;
        }
        .auto-style5 {
            width: 87px;
        }
        .auto-style6 {
            width: 103px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table class="auto-style1">
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Visible="False"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT [player_name], [player_points], [player_team], [player_image], [player_type] FROM [event_player] WHERE ([event_id] = @event_id) ORDER BY [player_team], [player_type]">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="Label1" Name="event_id" PropertyName="Text" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:Image ID="Image2" runat="server" Height="120px" Width="120px" />
                    <asp:Image ID="Image3" runat="server" Height="80px" ImageUrl="~/images/vs.jpg" Width="80px" />
                    <asp:Image ID="Image4" runat="server" Height="120px" Width="120px" />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" Width="948px" OnItemCommand="DataList1_ItemCommand">
                        <ItemTemplate>
                            <table class="auto-style1">
                                <tr>
                                    <td class="auto-style3">
                                        <asp:Image ID="Image1" runat="server" Height="100px" ImageUrl='<%# Eval("player_image") %>' />
                                        <asp:Label ID="player_nameLabel" runat="server" Text='<%# Eval("player_name") %>' />
                                    </td>
                                    <td class="auto-style3">Runs-<asp:TextBox ID="TextBox1" runat="server" Height="16px" Width="45px" TextMode="Number" ViewStateMode="Enabled"></asp:TextBox>
                                    </td>
                                    <td class="auto-style4">4s-<asp:TextBox ID="TextBox2" runat="server" Height="16px" Width="45px" TextMode="Number" ViewStateMode="Enabled"></asp:TextBox>
                                    </td>
                                    <td class="auto-style5">6s-<asp:TextBox ID="TextBox3" runat="server" Height="16px" Width="45px" TextMode="Number"></asp:TextBox>
                                    </td>
                                    <td class="auto-style6">wk-<asp:TextBox ID="TextBox4" runat="server" Height="16px" Width="45px" TextMode="Number"></asp:TextBox>
                                    </td>
                                    <td class="auto-style2">runs given-<asp:TextBox ID="TextBox5" runat="server" Height="16px" Width="45px" TextMode="Number"></asp:TextBox>
                                    </td>
                                    <td>maiden-<asp:TextBox ID="TextBox6" runat="server" Height="16px" Width="45px" TextMode="Number"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:Button ID="Button1" runat="server" Text="Submit" CommandName="select" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style3">&nbsp;</td>
                                    <td class="auto-style3">
                                        <asp:Label ID="player_teamLabel" runat="server" Text='<%# Eval("player_team") %>' />
                                    </td>
                                    <td class="auto-style4">Total Points-<asp:Label ID="player_pointsLabel" runat="server" Text='<%# Eval("player_points") %>' />
                                    </td>
                                    <td class="auto-style5">&nbsp;</td>
                                    <td class="auto-style6">&nbsp;</td>
                                    <td class="auto-style2">&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>
                            <br />
                        </ItemTemplate>
                    </asp:DataList>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    Man of the Match&nbsp; :&nbsp;
                    <asp:DropDownList ID="DropDownList1" runat="server"  ViewStateMode="Enabled" AutoPostBack="True">
                    </asp:DropDownList>
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Give Points To Users" />
        <div>
        </div>
    </form>
</body>
</html>
