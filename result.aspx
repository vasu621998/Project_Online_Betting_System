<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="result.aspx.cs" Inherits="Project.result" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style4 {
            width: 1281px;
        }
        .auto-style5 {
            width: 327px;
        }
        .auto-style9 {
            width: 316px;
        }
        .auto-style10 {
            width: 103px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table class="auto-style4">
            <tr>
                <td class="auto-style5">&nbsp;</td>
                <td class="auto-style9">
                    <table class="auto-style1">
                        <tr>
                            <td>
                                <asp:Image ID="Image12" runat="server" Height="120px" Width="120px" />
                            </td>
                            <td>
                                <asp:Image ID="Image13" runat="server" Height="80px" ImageUrl="~/images/vs.jpg" Width="80px" />
                            </td>
                            <td>
                                <asp:Image ID="Image14" runat="server" Height="120px" Width="120px" />
                            </td>
                        </tr>
                    </table>
                </td>
                <td class="auto-style9">&nbsp;</td>
                <td class="auto-style9">
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Home" />
                </td>
            </tr>
            <tr>
                <td class="auto-style5">
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT player_name, player_team, player_points, player_image, player_type FROM event_player WHERE (event_id = @event_id) AND (player_name IN (SELECT player_name FROM user_player_db WHERE (user_team_id = @user_team_id)))">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="Label1" Name="event_id" PropertyName="Text" />
                            <asp:ControlParameter ControlID="Label2" Name="user_team_id" PropertyName="Text" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
                <td class="auto-style9">
                    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="See Top Users" />
                </td>
                <td class="auto-style9">&nbsp;</td>
                <td class="auto-style9">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style5">
                    &nbsp;</td>
                <td class="auto-style9">
                    <asp:Label ID="Label19" runat="server" Font-Bold="True" Font-Size="Large" Text="Top Users" Visible="False"></asp:Label>
                </td>
                <td class="auto-style9">&nbsp;</td>
                <td class="auto-style9">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style5">&nbsp;</td>
                <td class="auto-style9">
                    <table class="auto-style1">
                        <tr>
                            <td>
                                <asp:Image ID="Image8" runat="server" Height="70px" ImageUrl="~/images/gold.png" Visible="False" Width="70px" />
                            </td>
                            <td>
                                <asp:Label ID="Label13" runat="server" Visible="False"></asp:Label>
                            </td>
                            <td class="auto-style10">
                                <asp:Label ID="Label14" runat="server" Visible="False"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Image ID="Image9" runat="server" Height="70px" ImageUrl="~/images/silver.png" Visible="False" Width="70px" />
                            </td>
                            <td>
                                <asp:Label ID="Label15" runat="server" Visible="False"></asp:Label>
                            </td>
                            <td class="auto-style10">
                                <asp:Label ID="Label16" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Image ID="Image10" runat="server" Height="70px" ImageUrl="~/images/bronze.png" Visible="False" Width="70px" />
                            </td>
                            <td>
                                <asp:Label ID="Label17" runat="server" Visible="False"></asp:Label>
                            </td>
                            <td class="auto-style10">
                                <asp:Label ID="Label18" runat="server" Visible="False"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td class="auto-style10">&nbsp;</td>
                        </tr>
                    </table>
                </td>
                <td class="auto-style9">
                    &nbsp;</td>
                <td class="auto-style9">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style5">
                    &nbsp;</td>
                <td class="auto-style9">
                    <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="Large" Text="Your Team"></asp:Label>
                </td>
                <td class="auto-style9">&nbsp;</td>
                <td class="auto-style9">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style5">&nbsp;</td>
                <td class="auto-style9">
                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2">
                        <Columns>
                            <asp:TemplateField HeaderText="player_image" SortExpression="player_image">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("player_image") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Image ID="Image1" runat="server" Height="100px" ImageUrl='<%# Eval("player_image") %>' Width="100px" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="player_name" HeaderText="player_name" SortExpression="player_name" />
                            <asp:BoundField DataField="player_team" HeaderText="player_team" SortExpression="player_team" />
                            <asp:BoundField DataField="player_type" HeaderText="player_type" SortExpression="player_type" />
                            <asp:BoundField DataField="player_points" HeaderText="player_points" SortExpression="player_points" />
                        </Columns>
                    </asp:GridView>
                </td>
                <td class="auto-style9">
                    &nbsp;</td>
                <td class="auto-style9">
                    <table class="auto-style1">
                        <tr>
                            <td colspan="2">
                    <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Size="Large" Text="Additional Points"></asp:Label>
                            </td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Image ID="Image2" runat="server" Height="100px" ImageUrl="~/images/bats.jpg" Width="100px" />
                            </td>
                            <td aria-live="off">
                                <asp:Image ID="Image5" runat="server" Height="100px" Width="100px" />
                            </td>
                            <td>
                                <asp:Label ID="Label6" runat="server"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="Label7" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Image ID="Image3" runat="server" Height="100px" ImageUrl="~/images/bowl.jpg" Width="100px" />
                            </td>
                            <td>
                                <asp:Image ID="Image6" runat="server" Height="100px" Width="100px" />
                            </td>
                            <td>
                                <asp:Label ID="Label8" runat="server"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="Label9" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Image ID="Image4" runat="server" Height="100px" ImageUrl="~/images/mom.jpg" Visible="False" Width="100px" />
                            </td>
                            <td>
                                <asp:Image ID="Image7" runat="server" Height="100px" Visible="False" Width="100px" />
                            </td>
                            <td>
                                <asp:Label ID="Label10" runat="server" Visible="False"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="Label11" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label20" runat="server" Font-Bold="True" Font-Size="Large" Font-Underline="True" Text="Total Points"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="Label12" runat="server" Font-Bold="True" Font-Size="X-Large" Font-Underline="False"></asp:Label>
                            </td>
                            <td rowspan="2">
                                <asp:Image ID="Image11" runat="server" Height="85px" Width="85px" />
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label21" runat="server" Font-Bold="True" Font-Size="Large" Font-Underline="True" Text="Rank"></asp:Label>
&nbsp;</td>
                            <td> <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="X-Large" Font-Underline="False"></asp:Label>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">
                    <asp:Label ID="Label1" runat="server" Visible="False"></asp:Label>
                    <asp:Label ID="Label2" runat="server" Visible="False"></asp:Label>
                </td>
                <td class="auto-style9">&nbsp;</td>
                <td class="auto-style9">&nbsp;</td>
                <td class="auto-style9">&nbsp;</td>
            </tr>
        </table>
        <div>
        </div>
    </form>
</body>
</html>
