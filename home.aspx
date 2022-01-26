<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="Project._default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            height: 49px;
        }
        .auto-style10 {
            width: 1248px;
        }
        .auto-style11 {
            width: 127px;
        }
        .auto-style12 {
            width: 138px;
        }
        .auto-style14 {
            width: 75px;
        }
        .auto-style15 {
            width: 144px;
        }
        .auto-style16 {
            width: 173px;
        }
        .auto-style17 {
            width: 145px;
        }
        .auto-style19 {
            width: 57px;
        }
        .auto-style20 {
            width: 137px;
        }
        .auto-style21 {
            margin-bottom: 0px;
            margin-right: 52px;
        }
        .auto-style18 {
            width: 155px;
        }
        .auto-style23 {
            height: 49px;
            width: 254px;
        }
        .auto-style24 {
            width: 254px;
        }
        .auto-style28 {
            width: 254px;
            height: 105px;
        }
        .auto-style30 {
            height: 105px;
        }
        .auto-style31 {
            height: 105px;
            width: 211px;
        }
        .auto-style32 {
            width: 211px;
        }
        .auto-style33 {
            height: 49px;
            width: 211px;
        }
        .auto-style34 {
            width: 254px;
            height: 44px;
        }
        .auto-style35 {
            width: 211px;
            height: 44px;
        }
        .auto-style36 {
            height: 44px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <table class="auto-style1">
            <tr>
                <td class="auto-style28">
                    Welcome&nbsp;&nbsp;&nbsp;
                    <asp:LoginName ID="LoginName1" runat="server" />
                </td>
                <td class="auto-style31">
                    <asp:LoginView ID="LoginView1" runat="server">
                        <AnonymousTemplate>
                                            To register yourself
                                            <a href="signup.aspx">Click Here</a>
                                        </AnonymousTemplate>
                    </asp:LoginView>
                </td>
                <td class="auto-style30">
                    <asp:LoginStatus ID="LoginStatus1" runat="server" OnLoggedOut="LoginStatus1_LoggedOut" />
                </td>
            </tr>
            <tr>
                <td class="auto-style34"></td>
                <td class="auto-style35">
                    <asp:Menu ID="Menu1" runat="server" Orientation="Horizontal" BackColor="#FFFBD6" DynamicHorizontalOffset="2" Font-Bold="False" Font-Names="Verdana" Font-Size="Large" ForeColor="#990000" ItemWrap="True" StaticSubMenuIndent="10px" Width="1300px">
                        <DynamicHoverStyle BackColor="#990000" ForeColor="White" />
                        <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                        <DynamicMenuStyle BackColor="#FFFBD6" />
                        <DynamicSelectedStyle BackColor="#FFCC66" />
                        <Items>
                            <asp:MenuItem NavigateUrl="home.aspx?Mode=Upcoming" Text="Upcoming" Value="Upcoming"></asp:MenuItem>
                            <asp:MenuItem NavigateUrl="home.aspx?Mode=Ongoing" Text="Ongoing" Value="Ongoing"></asp:MenuItem>
                            <asp:MenuItem NavigateUrl="home.aspx?Mode=Resulted" Text="Resulted" Value="Resulted"></asp:MenuItem>
                        </Items>
                        <StaticHoverStyle BackColor="#990000" ForeColor="White" />
                        <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                        <StaticSelectedStyle BackColor="#FFCC66" />
                    </asp:Menu>
                </td>
                <td class="auto-style36"></td>
            </tr>
            <tr>
                <td class="auto-style24">&nbsp;</td>
                <td class="auto-style32">
                    <asp:MultiView ID="MultiView1" runat="server">
                        <asp:View ID="View1" runat="server">
                            <asp:DataList ID="DataList1" runat="server" DataKeyField="event_id" DataSourceID="SqlDataSource1" Height="964px" OnItemCommand="DataList1_ItemCommand" RepeatLayout="Flow" Width="1042px" CssClass="auto-style21">
                                <ItemTemplate>
                                    <br />
                                    <table class="auto-style10">
                                        <tr>
                                            <td class="auto-style11">
                                                <asp:Label ID="event_idLabel" runat="server" Text='<%# Eval("event_id") %>' />
                                            </td>
                                            <td class="auto-style20">
                                                <asp:Image ID="Image1" runat="server" Height="100px" ImageUrl='<%# Eval("img1") %>' Width="80px" />
                                                <br />
                                                <asp:Label ID="event_team_1Label" runat="server" Text='<%# Eval("event_team_1") %>' />
                                            </td>
                                            <td class="auto-style20">
                                                <asp:Image ID="Image7" runat="server" Height="60px" ImageUrl="~/images/vs.jpg" Width="60px" />
                                            </td>
                                            <td class="auto-style12">
                                                <asp:Image ID="Image2" runat="server" Height="100px" ImageUrl='<%# Eval("img2") %>' Width="80px" />
                                                <br />
                                                <asp:Label ID="event_team_2Label" runat="server" Text='<%# Eval("event_team_2") %>' />
                                            </td>
                                            <td class="auto-style14">
                                                <asp:Label ID="event_dateLabel" runat="server" Text='<%# Eval("event_date") %>' />
                                            </td>
                                            <td class="auto-style15">
                                                <asp:Label ID="event_labelLabel" runat="server" Text='<%# Eval("event_label") %>' />
                                            </td>
                                            <td class="auto-style16">
                                                <asp:Label ID="event_lockLabel" runat="server" Text='<%# Eval("event_lock") %>' />
                                            </td>
                                            <td class="auto-style17">
                                                <asp:Label ID="event_statusLabel" runat="server" Text='<%# Eval("event_status") %>' />
                                            </td>
                                            <td class="auto-style19">
                                                <asp:Button ID="Button1" runat="server" CommandName="select" Text="Enter" />
                                            </td>
                                        </tr>
                                    </table>
                                    <br />
                                </ItemTemplate>
                                <SelectedItemStyle BorderStyle="None" />
                            </asp:DataList>
                        </asp:View>
                        <asp:View ID="View2" runat="server">
                            <asp:DataList ID="DataList2" runat="server" DataKeyField="event_id" DataSourceID="SqlDataSource2" Height="966px" OnItemCommand="DataList2_ItemCommand" RepeatLayout="Flow" Width="1059px">
                                <ItemTemplate>
                                    <br />
                                    <table class="auto-style10">
                                        <tr>
                                            <td class="auto-style11">
                                                <asp:Label ID="event_idLabel" runat="server" Text='<%# Eval("event_id") %>' />
                                            </td>
                                            <td class="auto-style20">
                                                <asp:Image ID="Image1" runat="server" Height="100px" ImageUrl='<%# Eval("img1") %>' Width="80px" />
                                                <br />
                                                <asp:Label ID="event_team_1Label" runat="server" Text='<%# Eval("event_team_1") %>' />
                                            </td>
                                            <td class="auto-style20">
                                                <asp:Image ID="Image7" runat="server" Height="60px" ImageUrl="~/images/vs.jpg" Width="60px" />
                                            </td>
                                            <td class="auto-style12">
                                                <asp:Image ID="Image2" runat="server" Height="100px" ImageUrl='<%# Eval("img2") %>' Width="80px" />
                                                <br />
                                                <asp:Label ID="event_team_2Label" runat="server" Text='<%# Eval("event_team_2") %>' />
                                            </td>
                                            <td class="auto-style15">
                                                <asp:Label ID="event_dateLabel" runat="server" Text='<%# Eval("event_date") %>' />
                                            </td>
                                            <td class="auto-style16">
                                                <asp:Label ID="event_labelLabel" runat="server" Text='<%# Eval("event_label") %>' />
                                            </td>
                                            <td class="auto-style17">
                                                <asp:Label ID="event_statusLabel" runat="server" Text='<%# Eval("event_status") %>' />
                                            </td>
                                            <td class="auto-style19">
                                                <asp:Button ID="Button1" runat="server" CommandName="select" Text="View" />
                                            </td>
                                        </tr>
                                    </table>
                                    <br />
                                </ItemTemplate>
                                <SelectedItemStyle BorderStyle="None" />
                            </asp:DataList>
                        </asp:View>
                        <asp:View ID="View3" runat="server">
                            <asp:DataList ID="DataList3" runat="server" DataKeyField="event_id" DataSourceID="SqlDataSource3" Height="922px" OnItemCommand="DataList3_ItemCommand" RepeatLayout="Flow" Width="1056px">
                                <ItemTemplate>
                                    <table class="auto-style10">
                                        <tr>
                                            <td class="auto-style11">
                                                <asp:Label ID="event_idLabel" runat="server" Text='<%# Eval("event_id") %>' />
                                            </td>
                                            <td class="auto-style20">
                                                <asp:Image ID="Image1" runat="server" Height="100px" ImageUrl='<%# Eval("img1") %>' Width="80px" />
                                                <br />
                                                <asp:Label ID="event_team_1Label" runat="server" Text='<%# Eval("event_team_1") %>' />
                                            </td>
                                            <td class="auto-style20">
                                                <asp:Image ID="Image7" runat="server" Height="60px" ImageUrl="~/images/vs.jpg" Width="60px" />
                                            </td>
                                            <td class="auto-style12">
                                                <asp:Image ID="Image2" runat="server" Height="100px" ImageUrl='<%# Eval("img2") %>' Width="80px" />
                                                <br />
                                                <asp:Label ID="event_team_2Label" runat="server" Text='<%# Eval("event_team_2") %>' />
                                            </td>
                                            <td class="auto-style16">
                                                <asp:Label ID="event_dateLabel" runat="server" Text='<%# Eval("event_date") %>' />
                                            </td>
                                            <td class="auto-style17">
                                                <asp:Label ID="event_labelLabel" runat="server" Text='<%# Eval("event_label") %>' />
                                            </td>
                                            <td class="auto-style18">
                                                <asp:Label ID="event_statusLabel" runat="server" Text='<%# Eval("event_status") %>' />
                                            </td>
                                            <td class="auto-style19">
                                                <asp:Button ID="Button1" runat="server" CommandName="select" Text="Results" />
                                            </td>
                                        </tr>
                                    </table>
                                    <br />
                                </ItemTemplate>
                                <SelectedItemStyle BorderStyle="None" />
                            </asp:DataList>
                        </asp:View>
                    </asp:MultiView>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style24">
                    <asp:Label ID="Label1" runat="server" Visible="False"></asp:Label>
                </td>
                <td class="auto-style32">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style23">
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT e.event_team_1,e.event_team_2 ,e.event_lock, e.event_label, e.event_status, CONVERT (nvarchar(10), e.event_date, 105) AS event_date, e.event_id, t1.team_image AS img1, t2.team_image AS img2 FROM event_db AS e INNER JOIN team_db AS t1 ON e.event_team_1 = t1.team_name INNER JOIN team_db AS t2 ON e.event_team_2 = t2.team_name WHERE (e.event_status = @event_status) ORDER BY e.event_lock">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="open" Name="event_status" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
                <td class="auto-style33">
                    &nbsp;</td>
                <td class="auto-style2">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style24">
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT e.event_id, e.event_team_1,e.event_team_2,CONVERT (nvarchar(10), e.event_date, 105) AS event_date, e.event_label, e.event_status, t1.team_image as img1, t2.team_image AS img2
 FROM event_db AS e INNER JOIN team_db AS t1 ON e.event_team_1 = t1.team_name INNER JOIN team_db AS t2 ON e.event_team_2 = t2.team_name WHERE (e.event_status = @event_status) AND (e.event_id IN (SELECT event_id FROM user_team_db WHERE (user_id = @user_id)))">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="locked" Name="event_status" Type="String" />
                            <asp:ControlParameter ControlID="Label1" DefaultValue="" Name="user_id" PropertyName="Text" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
                <td class="auto-style32">
                    &nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style24">&nbsp;</td>
                <td class="auto-style32">
                    &nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style24">&nbsp;</td>
                <td class="auto-style32">
                    &nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style24">&nbsp;</td>
                <td class="auto-style32">
                    &nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <div>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT e.event_id, e.event_team_1,e.event_team_2,CONVERT (nvarchar(10), e.event_date, 105) AS event_date, e.event_label, e.event_status, t1.team_image as img1, t2.team_image AS img2
 FROM event_db AS e INNER JOIN team_db AS t1 ON e.event_team_1 = t1.team_name INNER JOIN team_db AS t2 ON e.event_team_2 = t2.team_name WHERE (e.event_status = @event_status) AND (e.event_id IN (SELECT event_id FROM user_team_db WHERE (user_id = @user_id)))">
                <SelectParameters>
                    <asp:Parameter DefaultValue="closed" Name="event_status" Type="String" />
                    <asp:ControlParameter ControlID="Label1" DefaultValue="" Name="user_id" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
