<%@ Page Title="" Language="C#" MasterPageFile="~/View/masterUsuarios/masterUsuarios.master" AutoEventWireup="true" CodeFile="~/Controller/masterUsuarios/administrador/reportesTabla.aspx.cs" Inherits="View_masterUsuarios_administrador_reportes" %>

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
            <td class="auto-style8">titulo</td>
        </tr>
        <tr>
            <td class="auto-style8">
                <CR:CrystalReportViewer ID="CRV_TablaC" runat="server" AutoDataBind="True" EnableDatabaseLogonPrompt="False" GroupTreeImagesFolderUrl="" Height="1490px" ReportSourceID="CRS_TablaC" ToolbarImagesFolderUrl="" ToolPanelWidth="100px" Width="1004px" />
                <CR:CrystalReportSource ID="CRS_TablaC" runat="server">
                    <Report FileName="C:\Users\Luz\Documents\UDEC\Semestres\Quinto Semestre\Ingenieria de software I\proyecto\construccion\proyecto\Reportes\reporteTabla.rpt">
                    </Report>
                </CR:CrystalReportSource>
            </td>
        </tr>
    </table>
</asp:Content>

