<%@ Page Title="" Language="C#" MasterPageFile="~/View/masterUsuarios/masterUsuarios.master" AutoEventWireup="true" CodeFile="~/Controller/masterUsuarios/estilista/ReservaEstilista.aspx.cs" Inherits="View_masterUsuarios_estilista_ReservaEstilista" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style8 {
            width: 70%;
            font-family: "Gill Sans", "Gill Sans MT", Calibri, "Trebuchet MS", sans-serif;
            color: #018BDE;
        }
        .auto-style9 {
            width: 119%;
            height: 582px;
        }
        .auto-style10 {
            text-align: center;
            font-size: 160%;
        }
        .auto-style11 {
            width: 70%;
            font-family: "Gill Sans", "Gill Sans MT", Calibri, "Trebuchet MS", sans-serif;
            color: #018BDE;
            height: 102px;
        }
        .auto-style12 {
            width: 389px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="auto-style9">
        <tr>
            <td class="auto-style11">&nbsp;<h3 class="auto-style10">Reservas</h3>
&nbsp;&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style8">&nbsp;<table class="auto-style1">
                <tr>
                    <td class="auto-style12">
                        <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="200px" Width="220px">
                            <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                            <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                            <OtherMonthDayStyle ForeColor="#999999" />
                            <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                            <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                            <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                            <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                            <WeekendDayStyle BackColor="#CCCCFF" />
                        </asp:Calendar>
                    </td>
                    <td>
                        <asp:GridView ID="GridView_ReservasEst" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField HeaderText="Servicio" />
                                <asp:BoundField HeaderText="Hora" />
                                <asp:BoundField HeaderText="Asistencia" />
                                <asp:CommandField EditText="Actualizar" ShowEditButton="True" />
                            </Columns>
                            <EditRowStyle BackColor="#2461BF" />
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#EFF3FB" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#F5F7FB" />
                            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                            <SortedDescendingCellStyle BackColor="#E9EBEF" />
                            <SortedDescendingHeaderStyle BackColor="#4870BE" />
                        </asp:GridView>
                    </td>
                </tr>
                </table>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
        </tr>
    </table>
</asp:Content>
