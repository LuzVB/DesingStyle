<%@ Page Title="" Language="C#" MasterPageFile="~/View/masterUsuarios/masterUsuarios.master" AutoEventWireup="true" CodeFile="~/Controller/masterUsuarios/administrador/reportePerfilEstilista.aspx.cs" Inherits="View_masterUsuarios_administrador_reportes" %>

<%@ Register assembly="CrystalDecisions.Web, Version=13.0.3500.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style8 {
            width: 1034px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="w-100">
        <tr>
            <td class="auto-style8">Reportes</td>
        </tr>
        <tr>
            <td class="auto-style8">
                <br />
                <table class="w-100">
                    <tr>
                        <td>
                            <asp:Button ID="BT_ServiciosAdq" runat="server" OnClick="BT_ServiciosAdq_Click" Text="Servicios Más Adquiridos" class="btn btn-primary" />
                        </td>
                        <td>
                            <asp:Button ID="BT_ReservasEstilistas" runat="server"  Text="Reservas de los Estilistas" class="btn btn-primary" OnClick="BT_ReservasEstilistas_Click"/>
                        </td>
                        <td>
                            <asp:Button ID="BT_UsuariosSinRegistro" runat="server" OnClick="BT_UsuariosSinRegistro_Click" Text="Usuarios Sin Registro" class="btn btn-primary" />
                        </td>
                    </tr>
                </table>
                <br />
                <CR:CrystalReportViewer ID="CRV_PerfilEstilista" runat="server" AutoDataBind="True" EnableDatabaseLogonPrompt="False" GroupTreeImagesFolderUrl="" Height="50px" ReportSourceID="CRS_PerfilEstilista" ToolbarImagesFolderUrl="" ToolPanelWidth="100px" Width="350px" />
                <CR:CrystalReportSource ID="CRS_PerfilEstilista" runat="server">
                    <Report FileName="~\Reportes\reportePerfilEstilista.rpt">
                    </Report>
                </CR:CrystalReportSource>
            </td>
        </tr>
    </table>
</asp:Content>

