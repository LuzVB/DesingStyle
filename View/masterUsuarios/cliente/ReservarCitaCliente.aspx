<%@ Page Title="" Language="C#" MasterPageFile="~/View/masterUsuarios/masterUsuarios.master" AutoEventWireup="true" CodeFile="~/Controller/masterUsuarios/cliente/ReservarCitaCliente.aspx.cs" Inherits="View_masterUsuarios_cliente_ReservarCitaCliente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
              
        .auto-style11 {
            width: 30%;
            text-align: right;
        }
        .auto-style12 {
            height: 48px;
            font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
            font-size: 160%;
        }
        .auto-style21 {
            margin-left: 0px;
            font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
        }
        .auto-style23 {
            font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
            font-size: 140%;
            height: 40px;
        }
        .auto-style24 {
            height: 39px;
            font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
            font-size: 160%;
        }
        .auto-style26 {
            width: 70%;
            font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
            font-size: 160%;
        }
        .img_perfil{
            object-fit:cover;
        }
        .auto-style28 {
            font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
            padding-left:17%;
            height: 215px;
        }
        .auto-style31 {
            font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
            font-size: 100%;
        }
        .auto-style32 {
            width: 70%;
            font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
            font-size: 160%;
            height: 77px;
        }
        .auto-style33 {
            width: 30%;
            height: 77px;
        }
        .auto-style34 {
            height: 76px;
        }
        .auto-style35 {
            height: 40px;
            font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
            font-size: 160%;
        }
        .auto-style36 {
            height: 41px;
            font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
            font-size: 160%;
        }
        .auto-style37 {
            height: 35px;
            font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
            font-size: 160%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <table class="auto-style1">
    <tr>
        <td class="auto-style32">RESERVAR CITA</td>
        <td class="auto-style33"><asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager></td>
    </tr>
    <tr>
        <td colspan="2" class="auto-style34">
            <asp:Label ID="LB_nombreEstilista" runat="server" CssClass="auto-style26">Servicio,Dia,Hora y Estilista</asp:Label>
        </td>
    </tr>
    <tr>
        <td class="auto-style12" colspan="2">
            Seleccione el servicio</td>
    </tr>
    <tr>
        <td class="auto-style35" colspan="2">
            <asp:Label ID="L_servicio" runat="server" Text="Servicio"></asp:Label>
            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="(*)" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:DropDownList ID="DropDownList_servicio" runat="server" Height="25px" Width="30%">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td class="auto-style24" colspan="2">Seleccione el dia que quiere reservar&nbsp; </td>
    </tr>
    <tr>
        <td class="auto-style28" colspan="2">
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
    </tr>
    <tr>
        <td class="auto-style36" colspan="2">
            Seleccione la hora que quiere reservar</td>
    </tr>
    <tr>
        <td colspan="2" class="auto-style37">
            <asp:Label ID="L_Hora" runat="server" Text="Hora"></asp:Label>
&nbsp;
            <asp:RequiredFieldValidator ID="RFV_Hora" runat="server" ControlToValidate="DropDownList_Hora" ErrorMessage="(*)" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:DropDownList ID="DropDownList_Hora" runat="server" Height="25px" Width="30%">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td class="auto-style23" colspan="2">Seleccione el estilista</td>
    </tr>
    <tr>
        <td class="auto-style36" colspan="2">

            <asp:Label ID="L_estilista" runat="server" CssClass="auto-style31" Text="Estilista" Width="104px"></asp:Label>
            <asp:RequiredFieldValidator ID="RFV_Estilista" runat="server" ErrorMessage="(*)" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:DropDownList ID="DropDownList_Estilista" runat="server" Height="25px" Width="30%">
            </asp:DropDownList>
    </tr>
    <tr>
        <td class="auto-style3">&nbsp;</td>
        <td class="auto-style11">
            <asp:Button ID="BT_GuardarReserva" runat="server" Text="Reservar" BorderColor="#0099FF" Font-Bold="True" Font-Size="86%" Height="30px" Width="64%" ValidationGroup="VG_cambioContraseña" CssClass="auto-style21" />
        </td>
    </tr>
</table>
</asp:Content>

