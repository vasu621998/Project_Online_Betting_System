<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="players.aspx.cs" Inherits="Project.admin.players" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 207px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="team1" runat="server" Visible="False"></asp:Label>
                    </td>
                    <td>
                        <asp:Image ID="Image2" runat="server" Height="120px" Width="120px" />
                        <asp:Image ID="Image3" runat="server" Height="80px" ImageUrl="~/images/vs.jpg" Width="80px" />
                        <asp:Image ID="Image4" runat="server" Height="120px" Width="120px" />
&nbsp;&nbsp;
                        <br />
                        <asp:Label ID="Label7" runat="server" Font-Bold="True" Font-Size="XX-Large" Text="Submit Players"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="team2" runat="server" Visible="False"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [player_db] WHERE [player_name] = @player_name AND [team_id] = @team_id" InsertCommand="INSERT INTO [player_db] ([player_name], [player_type], [player_value], [player_status], [player_image], [team_id]) VALUES (@player_name, @player_type, @player_value, @player_status, @player_image, @team_id)" SelectCommand="SELECT p.player_name, p.player_type, p.player_value, p.player_status, p.player_image, p.team_id, t.team_name FROM player_db AS p CROSS JOIN team_db AS t WHERE (p.team_id = @team_id) AND (t.team_id = @team_id) OR (p.team_id = @team_id2) AND (t.team_id = @team_id2) ORDER BY p.team_id, p.player_name" UpdateCommand="UPDATE [player_db] SET [player_type] = @player_type, [player_value] = @player_value, [player_status] = @player_status WHERE [player_name] = @player_name AND [team_id] = @team_id">
                            <DeleteParameters>
                                <asp:Parameter Name="player_name" Type="String" />
                                <asp:Parameter Name="team_id" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="player_name" Type="String" />
                                <asp:Parameter Name="player_type" Type="String" />
                                <asp:Parameter Name="player_value" Type="Double" />
                                <asp:Parameter Name="player_status" Type="String" />
                                <asp:Parameter Name="player_image" Type="String" />
                                <asp:Parameter Name="team_id" Type="Int32" />
                            </InsertParameters>
                            <SelectParameters>
                                <asp:ControlParameter ControlID="team1" Name="team_id" PropertyName="Text" Type="Int32" />
                                <asp:ControlParameter ControlID="team2" Name="team_id2" PropertyName="Text" Type="Int32" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="player_type" Type="String" />
                                <asp:Parameter Name="player_value" Type="Double" />
                                <asp:Parameter Name="player_status" Type="String" />
                                <asp:Parameter Name="player_name" Type="String" />
                                <asp:Parameter Name="team_id" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    </td>
                    <td>
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="player_name,team_id" DataSourceID="SqlDataSource1"  OnRowCommand="GridView1_RowCommand" ShowFooter="True">
                            <Columns>
                                <asp:TemplateField HeaderText="team_id" SortExpression="team_id">
                                    <EditItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("team_id") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <br />
                                    </FooterTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("team_id") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <AlternatingItemTemplate>
                                        <asp:Image ID="Image1" runat="server" Height="100px" ImageUrl='<%# Eval("player_image") %>' Width="100px" />
                                    </AlternatingItemTemplate>
                                    <FooterTemplate>
                                        <asp:FileUpload ID="image" runat="server" />
                                    </FooterTemplate>
                                    <ItemTemplate>
                                        <asp:Image ID="Image1" runat="server" Height="100px" ImageUrl='<%# Eval("player_image") %>' Width="100px" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="player_name" SortExpression="player_name">
                                    <EditItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("player_name") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        Name:<asp:TextBox ID="name" runat="server"></asp:TextBox>
                                        <br />
                                    </FooterTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("player_name") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="team_name" SortExpression="team_name">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("team_name") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        Team :
                                        <asp:DropDownList ID="team" runat="server" DataSourceID="SqlDataSource2" DataTextField="team_name" DataValueField="team_name">
                                        </asp:DropDownList>
                                        <br />
                                    </FooterTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("team_name") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="player_type" SortExpression="player_type">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("player_type") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        Type:<asp:DropDownList ID="type" runat="server">
                                            <asp:ListItem>--select--</asp:ListItem>
                                            <asp:ListItem>batsman</asp:ListItem>
                                            <asp:ListItem>bowler</asp:ListItem>
                                            <asp:ListItem>allrounder</asp:ListItem>
                                            <asp:ListItem>wicketkeeper</asp:ListItem>
                                        </asp:DropDownList>
                                        <br />
                                    </FooterTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("player_type") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="player_value" SortExpression="player_value">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("player_value") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        Value:<asp:TextBox ID="value" runat="server"></asp:TextBox>
                                        <br />
                                    </FooterTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("player_value") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="player_status" SortExpression="player_status">
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="DropDownList1" runat="server" SelectedValue='<%# Bind("player_status") %>'>
                                            <asp:ListItem>--select--</asp:ListItem>
                                            <asp:ListItem>available</asp:ListItem>
                                            <asp:ListItem>unavailable</asp:ListItem>
                                        </asp:DropDownList>
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        &nbsp;Status :
                                        <asp:DropDownList ID="status" runat="server">
                                            <asp:ListItem>--select--</asp:ListItem>
                                            <asp:ListItem>available</asp:ListItem>
                                            <asp:ListItem>unavailable</asp:ListItem>
                                        </asp:DropDownList>
                                        <br />
                                    </FooterTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("player_status") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ShowHeader="False">
                                    <EditItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:Button ID="Button3" runat="server" CommandName="insert" Text="Insert" />
                                    </FooterTemplate>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT [team_name] FROM [team_db]"></asp:SqlDataSource>
                    </td>
                    <td>
                        &nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Submit" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
