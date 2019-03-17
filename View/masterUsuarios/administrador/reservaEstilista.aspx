<%@ Page Title="" Language="C#" MasterPageFile="~/View/masterUsuarios/masterUsuarios.master" AutoEventWireup="true" CodeFile="~/Controller/masterUsuarios/administrador/reservaEstilista.aspx.cs" Inherits="View_masterUsuarios_administrador_reservaEstilista" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style8 {
            font-size: 160%;
            font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
            text-align: center;
        }
        .auto-style9 {
            width: 50%;
        }
        .auto-style10 {
            width: 50%;
        }
        .auto-style11 {
            font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
        }
        .auto-style12 {
            width: 50%;
            padding-left:10%;
        }
        .auto-style25 {
           padding-bottom:10%;
        text-align: left;
       }
       .imgNoRegistro{
           text-align: center;
       }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="auto-style1">
        <tr>
            <td colspan="2" class="auto-style8"><strong>Reservas de los estilistas </strong> </td>
        </tr>
        <tr>
            <td class="auto-style12">
                <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="200px" Width="70%">
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
            <td class="auto-style10"> 
                <div class="auto-style11">

                <asp:GridView ID="GV_reservasEstilistas" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" Width="80%" CssClass="auto-style14" AllowPaging="True"  style="font-size: 120%; font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif" AutoGenerateColumns="False" >
                    <Columns>
                        <asp:BoundField DataField="nombre" HeaderText="Estilista" />
                        <asp:BoundField DataField="valor" HeaderText="Hora" />
                    </Columns>
                <EmptyDataTemplate>
                            <asp:Image ID="noRegistro" runat="server" ImageUrl="~/Imagenes/no-encontrado.png" Width="20%" CssClass="imgNoRegistro" />
                            No hay reservas
                </EmptyDataTemplate>
                <FooterStyle BackColor="White" ForeColor="#000066" />
                <HeaderStyle BackColor="#018BDE" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                <RowStyle ForeColor="#000066" />
                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#007DBB" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#00547E" />
                  
            </asp:GridView>
                </div>
         

            </td>
        </tr>
        <tr>
            <td class="auto-style9">&nbsp;</td>
            <td class="auto-style25">&nbsp;</td>
        </tr>
    </table>
</asp:Content>

