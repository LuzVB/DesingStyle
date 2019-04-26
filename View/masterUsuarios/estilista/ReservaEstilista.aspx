<%@ Page Title="" Language="C#" MasterPageFile="~/View/masterUsuarios/masterUsuarios.master" AutoEventWireup="true" CodeFile="~/Controller/masterUsuarios/estilista/ReservaEstilista.aspx.cs" Inherits="View_masterUsuarios_estilista_ReservaEstilista" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style28 {
            font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
            /*padding-left:17%;*/
            height: 215px;
        }

        .auto-style29 {
            width: 100%;
            height: 413px;
            margin-bottom: 0px;
        }

        .auto-style30 {
            width: 449px;
        }

        .auto-style14 {
            font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
            font-size: 120%;
            /*margin-left: 112px;*/
        }

        .auto-style13 {
            font-size: 160%;
            font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
            text-align: center;
            /*width: 449px;*/
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <table class="w-100">
        <tr>
            <td class="auto-style13"><span><strong>RESERVAS&nbsp; ASIGNADAS </strong></span>
                <br />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style30">
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
                <br />
                <asp:UpdatePanel ID="UP_Reservas" runat="server">
                    <ContentTemplate>
                        <asp:Calendar ID="C_Reserva" runat="server" CssClass="auto-style31" Height="162px" OnSelectionChanged="C_Reserva_SelectionChanged" Width="241px">
                            <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                            <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                            <OtherMonthDayStyle ForeColor="#999999" />
                            <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                            <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                            <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                            <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                            <WeekendDayStyle BackColor="#CCCCFF" />
                        </asp:Calendar>
                        <br />
                        <asp:Label ID="Prueba" runat="server" Text="[Alerta_Fecha]" class="alert-heading" Visible="False"></asp:Label>
                        <asp:Label ID="Alerta_Rerva" runat="server" Text="Alerta_Rerva" class="alert-heading" Visible="False"></asp:Label>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <br />
                <br />
            </td>
            <td>
                <asp:UpdatePanel ID="UP_GV" runat="server">
                    <ContentTemplate>
                        <br />
                        <asp:GridView ID="GridView_ReservasEst" runat="server" AutoGenerateColumns="False" CellPadding="4" CssClass="auto-style14" DataSourceID="ODS_RerservasEstilista" ForeColor="#333333" GridLines="None" Width="85%" BorderStyle="None" BorderWidth="1px">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField DataField="nombre_servicio" HeaderText="         Servicio" />
                                <asp:BoundField DataField="fecha" HeaderText="Hora" />
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
                        <asp:ObjectDataSource ID="ODS_RerservasEstilista" runat="server" SelectMethod="mostrarReservasEstilista" TypeName="DAOPerfilEstilista">
                            <SelectParameters>
                                <asp:SessionParameter DefaultValue="id" Name="id" SessionField="user_id" Type="Int32" />
                                <asp:ControlParameter ControlID="Prueba" Name="_fecha" PropertyName="Text" Type="String" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                        <br />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
</asp:Content>
