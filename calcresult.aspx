<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="calcresult.aspx.cs" Inherits="Project.admin.calcresult" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table class="auto-style1">
            <tr>
                <td>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT [user_id], [user_team_name], [user_pts], [user_rank] FROM [result_db] WHERE ([event_id] = @event_id) ORDER BY [user_pts] DESC">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="Label1" Name="event_id" PropertyName="Text" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:Image ID="Image1" runat="server" Height="120px" Width="120px" />
                    <asp:Image ID="Image2" runat="server" Height="80px" ImageUrl="~/images/vs.jpg" Width="80px" />
                    <asp:Image ID="Image3" runat="server" Height="120px" Width="120px" />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Results"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                        <Columns>
                            <asp:BoundField DataField="user_id" HeaderText="user_id" SortExpression="user_id" />
                            <asp:BoundField DataField="user_team_name" HeaderText="user_team_name" SortExpression="user_team_name" />
                            <asp:BoundField DataField="user_pts" HeaderText="user_pts" SortExpression="user_pts" />
                            <asp:BoundField DataField="user_rank" HeaderText="user_rank" SortExpression="user_rank" />
                        </Columns>
                    </asp:GridView>
                </td>
                <td>
                    <asp:Label ID="Label1" runat="server" Visible="False"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="home" />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:GridView ID="GridView2" runat="server">
                    </asp:GridView>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <div>
        </div>
    </form>
</body>
</html>
