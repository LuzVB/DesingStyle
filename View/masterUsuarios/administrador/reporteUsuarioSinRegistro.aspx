<%@ Page Title="" Language="C#" MasterPageFile="~/View/masterUsuarios/masterUsuarios.master" AutoEventWireup="true" CodeFile="~/Controller/masterUsuarios/administrador/reporteUsuarioSinRegistro.aspx .cs" Inherits="View_masterUsuarios_administrador_reportes" %>

<%@ Register assembly="CrystalDecisions.Web, Version=13.0.3500.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style8 {
            width: 1034px;
        }
        .auto-style9 {
            width: 1034px;
            height: 28px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="w-100">
        <tr>
            <td class="auto-style9">Resportes</td>
        </tr>
        <tr>
            <td class="auto-style8">
                <br />
                <table class="w-100">
                    <tr>
                        <td>
                            <asp:Button ID="BT_Servicios" runat="server" Text="Servicios" OnClick="BT_Servicios_Click" class="btn btn-primary" />
                        </td>
                        <td>
                         <asp:Button ID="BT_ReservasEstilistas" runat="server"  Text="Reservas de los Estilistas" class="btn btn-primary" OnClick="BT_ReservasEstilistas_Click"/>
                        </td>
                        <td>
                            <asp:Button ID="BT_PerfilEstilista" runat="server" Text="Perfil De Los Estilista" OnClick="BT_PerfilEstilista_Click" class="btn btn-primary" />
                        </td>
                    </tr>
                </table>
                <br />
                <CR:CrystalReportViewer ID="CRV_UsuarioSinRegistro" runat="server" AutoDataBind="True" EnableDatabaseLogonPrompt="False" GroupTreeImagesFolderUrl="" Height="50px" ReportSourceID="CRS_UsuarioSinRegistro" ToolbarImagesFolderUrl="" ToolPanelWidth="100px" Width="350px" EnableParameterPrompt="False" />
                <CR:CrystalReportSource ID="CRS_UsuarioSinRegistro" runat="server">
                    <Report FileName="C:\Users\Luz\Documents\UDEC\Semestres\Quinto Semestre\Ingenieria de software I\proyecto\construccion\proyecto\Reportes\reporteServicios.rpt">
                    </Report>
                </CR:CrystalReportSource>
            </td>
        </tr>
    </table>
</asp:Content>



