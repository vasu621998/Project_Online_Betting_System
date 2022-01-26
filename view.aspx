<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="view.aspx.cs" Inherits="Project.view" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            height: 2px;
        }
        .auto-style3 {
            height: 26px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table class="auto-style1">
            <tr>
                <td>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT [player_team], [player_type], [player_name], [player_image] FROM [user_player_db] WHERE ([user_team_id] = @user_team_id) ORDER BY [player_team], [player_name]">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="Label3" Name="user_team_id" PropertyName="Text" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
                <td>
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="home" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Image ID="Image5" runat="server" Height="120px" Width="120px" />
                    <asp:Image ID="Image6" runat="server" Height="80px" ImageUrl="~/images/vs.jpg" Width="80px" />
                    <asp:Image ID="Image7" runat="server" Height="120px" Width="120px" />
                </td>
                <td>
                    <asp:Label ID="Label3" runat="server" Visible="False"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="X-Large" Font-Underline="True"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" RepeatColumns="11" RepeatDirection="Horizontal">
                        <ItemTemplate>
                            <br />
                            <table class="auto-style1">
                                <tr>
                                    <td>
                                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("player_image") %>' Height="120px" Width="120px" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style2"></td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="player_nameLabel" runat="server" Text='<%# Eval("player_name") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="player_typeLabel" runat="server" Text='<%# Eval("player_type") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="player_teamLabel" runat="server" Text='<%# Eval("player_team") %>' />
                                    </td>
                                </tr>
                            </table>
<br />
                        </ItemTemplate>
                    </asp:DataList>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Image ID="Image2" runat="server" Height="50px" ImageUrl="~/images/bats.jpg" Width="50px" />
&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label4" runat="server"></asp:Label>
                </td>
                <td class="auto-style3"></td>
            </tr>
            <tr>
                <td>
                    <asp:Image ID="Image4" runat="server" Height="50px" ImageUrl="~/images/bowl.jpg" Width="50px" />
&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label5" runat="server"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label6" runat="server" Text="Watch live match score here -- " Visible="False" Font-Size="Medium"></asp:Label>
                    <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" Visible="False">Here</asp:LinkButton>
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <div>
            <asp:Button ID="Button2" runat="server" Text="edit" OnClick="Button2_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="delete" />
        </div>
    </form>
</body>
</html>
