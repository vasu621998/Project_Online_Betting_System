<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ahome.aspx.cs" Inherits="Project.admin.ahome" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 341px;
        }
        .auto-style3 {
            width: 456px;
        }
        .auto-style4 {
            width: 341px;
            height: 85px;
        }
        .auto-style5 {
            width: 456px;
            height: 85px;
        }
        .auto-style6 {
            height: 85px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">
                    <asp:LoginStatus ID="LoginStatus1" runat="server" OnLoggedOut="LoginStatus1_LoggedOut" />
                </td>
                <td class="auto-style3">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    &nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [event_db]" DeleteCommand="DELETE FROM [event_db] WHERE [event_id] = @event_id" InsertCommand="INSERT INTO [event_db] ( [event_team_1], [event_team_2], [event_date], [event_start], [event_lock], [event_count], [event_status], [event_mom], [event_label]) VALUES ( @event_team_1, @event_team_2, @event_date, @event_start, @event_lock, @event_count, @event_status, @event_mom, @event_label)" UpdateCommand="UPDATE [event_db] SET  [event_team_1] = @event_team_1, [event_team_2] = @event_team_2, [event_date] = @event_date, [event_start] = @event_start, [event_lock] = @event_lock, [event_count] = @event_count, [event_status] = @event_status, [event_mom] = @event_mom, [event_label] = @event_label WHERE [event_id] = @event_id">
                        <DeleteParameters>
                            <asp:Parameter Name="event_id" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="event_team_1" Type="String" />
                            <asp:Parameter Name="event_team_2" Type="String" />
                            <asp:Parameter DbType="Date" Name="event_date" />
                            <asp:Parameter DbType="Time" Name="event_start" />
                            <asp:Parameter DbType="Time" Name="event_lock" />
                            <asp:Parameter Name="event_count" Type="Int32" />
                            <asp:Parameter Name="event_status" Type="String" />
                            <asp:Parameter Name="event_mom" Type="String" />
                            <asp:Parameter Name="event_label" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="event_team_1" Type="String" />
                            <asp:Parameter Name="event_team_2" Type="String" />
                            <asp:Parameter DbType="Date" Name="event_date" />
                            <asp:Parameter DbType="Time" Name="event_start" />
                            <asp:Parameter DbType="Time" Name="event_lock" />
                            <asp:Parameter Name="event_count" Type="Int32" />
                            <asp:Parameter Name="event_status" Type="String" />
                            <asp:Parameter Name="event_mom" Type="String" />
                            <asp:Parameter Name="event_label" Type="String" />
                            <asp:Parameter Name="event_id" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </td>
                <td class="auto-style5">
                    <asp:Menu ID="Menu1" runat="server" BackColor="#FFFBD6" DynamicHorizontalOffset="2" Font-Names="Verdana" Font-Size="Medium" ForeColor="#990000" StaticSubMenuIndent="10px" Orientation="Horizontal" Height="45px" Width="1370px">
                        <DynamicHoverStyle BackColor="#990000" ForeColor="White" />
                        <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                        <DynamicMenuStyle BackColor="#FFFBD6" />
                        <DynamicSelectedStyle BackColor="#FFCC66" />
                        <Items>
                            <asp:MenuItem Text="Upcoming Events" Value="Upcoming Events" NavigateUrl="~/admin/ahome.aspx?Mode=Upcoming">
                            </asp:MenuItem>
                            <asp:MenuItem Text="Ongoing Events" Value="Ongoing Events" NavigateUrl="~/admin/ahome.aspx?Mode=Ongoing"></asp:MenuItem>
                            <asp:MenuItem Text="Resulted Events" Value="Resulted Events" NavigateUrl="~/admin/ahome.aspx?Mode=Resulted">
                            </asp:MenuItem>
                        </Items>
                        <StaticHoverStyle BackColor="#990000" ForeColor="White" />
                        <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                        <StaticSelectedStyle BackColor="#FFCC66" />
                    </asp:Menu>
                </td>
                <td class="auto-style6"></td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [team_name] FROM [team_db]"></asp:SqlDataSource>
                </td>
                <td class="auto-style3">
                    <asp:MultiView ID="MultiView1" runat="server">
                        <asp:View ID="View1" runat="server">
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="event_id" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowCommand="GridView1_RowCommand" ShowFooter="True">
                                <Columns>
                                    <asp:BoundField DataField="event_id" HeaderText="event_id" InsertVisible="False" ReadOnly="True" SortExpression="event_id" />
                                    <asp:TemplateField HeaderText="event_team_1" SortExpression="event_team_1">
                                        <EditItemTemplate>
                                            <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="SqlDataSource3" DataTextField="team_name" DataValueField="team_name" SelectedValue='<%# Bind("event_team_1") %>'>
                                            </asp:DropDownList>
                                        </EditItemTemplate>
                                        <FooterTemplate>
                                            <asp:DropDownList ID="team1" runat="server" DataSourceID="SqlDataSource3" DataTextField="team_name" DataValueField="team_name">
                                            </asp:DropDownList>
                                        </FooterTemplate>
                                        <ItemTemplate>
                                            <asp:Image ID="Image1" runat="server" Height="80px" ImageUrl='<%# Eval("img1") %>' Width="80px" />
                                            <br />
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("event_team_1") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="event_team_2" SortExpression="event_team_2">
                                        <EditItemTemplate>
                                            <asp:DropDownList ID="DropDownList5" runat="server" DataSourceID="SqlDataSource3" DataTextField="team_name" DataValueField="team_name" SelectedValue='<%# Bind("event_team_2") %>'>
                                            </asp:DropDownList>
                                        </EditItemTemplate>
                                        <FooterTemplate>
                                            <asp:DropDownList ID="team2" runat="server" DataSourceID="SqlDataSource3" DataTextField="team_name" DataValueField="team_name">
                                            </asp:DropDownList>
                                        </FooterTemplate>
                                        <ItemTemplate>
                                            <asp:Image ID="Image2" runat="server" Height="80px" ImageUrl='<%# Eval("img2") %>' Width="80px" />
                                            <br />
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("event_team_2") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="event_date" SortExpression="event_date">
                                        <EditItemTemplate>
                                            <asp:Calendar ID="Calendar2" runat="server" SelectedDate='<%# Bind("event_date") %>'></asp:Calendar>
                                        </EditItemTemplate>
                                        <FooterTemplate>
                                            <asp:Calendar ID="date" runat="server"></asp:Calendar>
                                        </FooterTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("event_date") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="event_label" SortExpression="event_label">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("event_label") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <FooterTemplate>
                                            <asp:TextBox ID="label" runat="server"></asp:TextBox>
                                        </FooterTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("event_label") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="event_start" SortExpression="event_start">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("event_start") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <FooterTemplate>
                                            <asp:TextBox ID="st" runat="server"></asp:TextBox>
                                        </FooterTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("event_start") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="event_lock" SortExpression="event_lock">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("event_lock") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <FooterTemplate>
                                            <asp:TextBox ID="lt" runat="server"></asp:TextBox>
                                        </FooterTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label8" runat="server" Text='<%# Bind("event_lock") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="event_count" SortExpression="event_count">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("event_count") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label9" runat="server" Text='<%# Bind("event_count") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="event_status" SortExpression="event_status">
                                        <EditItemTemplate>
                                            <asp:DropDownList ID="DropDownList6" runat="server" SelectedValue='<%# Bind("event_status") %>'>
                                                <asp:ListItem>--select--</asp:ListItem>
                                                <asp:ListItem>open</asp:ListItem>
                                                <asp:ListItem>hidden</asp:ListItem>
                                            </asp:DropDownList>
                                        </EditItemTemplate>
                                        <FooterTemplate>
                                            <asp:DropDownList ID="status" runat="server">
                                                <asp:ListItem>--select--</asp:ListItem>
                                                <asp:ListItem>open</asp:ListItem>
                                                <asp:ListItem>hidden</asp:ListItem>
                                            </asp:DropDownList>
                                        </FooterTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("event_status") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:CommandField ShowEditButton="True" />
                                    <asp:CommandField ShowDeleteButton="True" />
                                    <asp:TemplateField ShowHeader="False">
                                        <FooterTemplate>
                                            <asp:Button ID="Button2" runat="server" CommandName="Add" Text="Add" />
                                        </FooterTemplate>
                                        <ItemTemplate>
                                            <asp:Button ID="Button1" runat="server" CausesValidation="false" CommandName="select" Text="Modify Players" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </asp:View>
                        <asp:View ID="View2" runat="server">
                            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="event_id" DataSourceID="SqlDataSource4" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" Width="1202px">
                                <Columns>
                                    <asp:BoundField DataField="event_id" HeaderText="event_id" InsertVisible="False" ReadOnly="True" SortExpression="event_id" />
                                    <asp:TemplateField HeaderText="event_team_1" SortExpression="event_team_1">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("event_team_1") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Image ID="Image3" runat="server" Height="80px" ImageUrl='<%# Eval("img1") %>' Width="80px" />
                                            <br />
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("event_team_1") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="event_team_2" SortExpression="event_team_2">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("event_team_2") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Image ID="Image4" runat="server" Height="80px" ImageUrl='<%# Eval("img2") %>' Width="80px" />
                                            <br />
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("event_team_2") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="event_date" HeaderText="event_date" SortExpression="event_date" />
                                    <asp:BoundField DataField="event_label" HeaderText="event_label" SortExpression="event_label" />
                                    <asp:BoundField DataField="event_count" HeaderText="event_count" SortExpression="event_count" />
                                    <asp:BoundField DataField="event_status" HeaderText="event_status" SortExpression="event_status" />
                                    <asp:ButtonField ButtonType="Button" CommandName="select" Text="Allocate Points" />
                                </Columns>
                            </asp:GridView>
                        </asp:View>
                        <asp:View ID="View3" runat="server">
                            <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataKeyNames="event_id" DataSourceID="SqlDataSource5" OnSelectedIndexChanged="GridView3_SelectedIndexChanged" Width="1196px">
                                <Columns>
                                    <asp:BoundField DataField="event_id" HeaderText="event_id" InsertVisible="False" ReadOnly="True" SortExpression="event_id" />
                                    <asp:TemplateField HeaderText="event_team_1" SortExpression="event_team_1">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("event_team_1") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Image ID="Image5" runat="server" Height="80px" ImageUrl='<%# Eval("img1") %>' Width="80px" />
                                            <br />
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("event_team_1") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="event_team_2" SortExpression="event_team_2">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("event_team_2") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Image ID="Image6" runat="server" Height="80px" ImageUrl='<%# Eval("img2") %>' Width="80px" />
                                            <br />
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("event_team_2") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="event_date" HeaderText="event_date" SortExpression="event_date" />
                                    <asp:BoundField DataField="event_label" HeaderText="event_label" SortExpression="event_label" />
                                    <asp:BoundField DataField="event_count" HeaderText="event_count" SortExpression="event_count" />
                                    <asp:BoundField DataField="event_status" HeaderText="event_status" SortExpression="event_status" />
                                    <asp:BoundField DataField="event_mom" HeaderText="event_mom" SortExpression="event_mom" />
                                    <asp:ButtonField ButtonType="Button" CommandName="select" Text="View Results" />
                                </Columns>
                            </asp:GridView>
                        </asp:View>
                    </asp:MultiView>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT e.*, t1.team_image as img1, t2.team_image AS img2
 FROM event_db AS e INNER JOIN team_db AS t1 ON e.event_team_1 = t1.team_name INNER JOIN team_db AS t2 ON e.event_team_2 = t2.team_name WHERE (e.event_status = @event_status) or e.event_status=@event_status2" DeleteCommand="DELETE FROM [event_db] WHERE [event_id] = @event_id" InsertCommand="INSERT INTO [event_db] ( [event_team_1], [event_team_2], [event_date], [event_start], [event_lock], [event_count], [event_status], [event_mom], [event_label]) VALUES ( @event_team_1, @event_team_2, @event_date, @event_start, @event_lock, @event_count, @event_status, @event_mom, @event_label)" UpdateCommand="UPDATE [event_db] SET  [event_team_1] = @event_team_1, [event_team_2] = @event_team_2, [event_date] = @event_date, [event_start] = @event_start, [event_lock] = @event_lock, [event_count] = @event_count, [event_status] = @event_status, [event_mom] = @event_mom, [event_label] = @event_label WHERE [event_id] = @event_id">
                        <DeleteParameters>
                            <asp:Parameter Name="event_id" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="event_team_1" Type="String" />
                            <asp:Parameter Name="event_team_2" Type="String" />
                            <asp:Parameter DbType="Date" Name="event_date" />
                            <asp:Parameter DbType="Time" Name="event_start" />
                            <asp:Parameter DbType="Time" Name="event_lock" />
                            <asp:Parameter Name="event_count" Type="Int32" />
                            <asp:Parameter Name="event_status" Type="String" />
                            <asp:Parameter Name="event_mom" Type="String" />
                            <asp:Parameter Name="event_label" Type="String" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:Parameter DefaultValue="open" Name="event_status" Type="String" />
                            <asp:Parameter DefaultValue="hidden" Name="event_status2" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="event_team_1" Type="String" />
                            <asp:Parameter Name="event_team_2" Type="String" />
                            <asp:Parameter DbType="Date" Name="event_date" />
                            <asp:Parameter DbType="Time" Name="event_start" />
                            <asp:Parameter DbType="Time" Name="event_lock" />
                            <asp:Parameter Name="event_count" Type="Int32" />
                            <asp:Parameter Name="event_status" Type="String" />
                            <asp:Parameter Name="event_mom" Type="String" />
                            <asp:Parameter Name="event_label" Type="String" />
                            <asp:Parameter Name="event_id" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </td>
                <td class="auto-style3">
                    &nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"  SelectCommand="SELECT DISTINCT e.*, t1.team_image as img1, t2.team_image AS img2
 FROM event_db AS e INNER JOIN team_db AS t1 ON e.event_team_1 = t1.team_name INNER JOIN team_db AS t2 ON e.event_team_2 = t2.team_name WHERE (e.event_status = @event_status)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="locked" Name="event_status" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT e.*, t1.team_image as img1, t2.team_image AS img2
 FROM event_db AS e INNER JOIN team_db AS t1 ON e.event_team_1 = t1.team_name INNER JOIN team_db AS t2 ON e.event_team_2 = t2.team_name where event_status=@event_status">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="closed" Name="event_status" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
                <td class="auto-style3">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
        <div>
        </div>
    </form>
</body>
</html>
