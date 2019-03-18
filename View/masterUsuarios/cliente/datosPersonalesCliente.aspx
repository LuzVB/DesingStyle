<%@ Page Title="" Language="C#" MasterPageFile="~/View/masterUsuarios/masterUsuarios.master" AutoEventWireup="true" CodeFile="~/Controller/masterUsuarios/cliente/datosPersonalesCliente.aspx.cs" Inherits="View_masterUsuarios_cliente_datosPersonalesCliente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style9 {
            width: 50%;
        }
        .auto-style10 {
            width: 50%;
            padding-top:0.5%;
            padding-bottom:0.5%;
        }
        .imgCli{
            width:50%;
            height:150px;
            margin:1%;
            object-fit:cover;
        }
        .auto-style11 {
            width: 50%;
            font-size: 150%;
            font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
            padding-bottom:1%;
        }
        .auto-style16{
            width: 50%;
            font-size: 150%;
            font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
            padding-top:1%;
            padding-bottom:0.2%;
        }
        .auto-style12 {
            width: 50%;
            font-size: 120%;
            font-family: Verdana, Geneva, Tahoma, sans-serif;
        }
        
        .tablaCli{
           padding-left:5%;
           padding-right:5%;
        }
        .auto-style8 {
            font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
            font-size: 180%;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      
    <table class="tablaCli">
        <tr>
            <td class="auto-style9">
                <asp:Image ID="Image1" runat="server" class="imgCli" ImageUrl="~/Imagenes/administrador/datosAdm.jpg"/>
            </td>
            <td class="auto-style10">
                <table class="auto-style1">
                    <tr>
                        <td>
                            <asp:Label ID="L_Alerta" runat="server" CssClass="auto-style8" Text="[L_Alerta]"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                <asp:Label ID="L_Bienvenida" runat="server" CssClass="auto-style8"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td class="auto-style11"><strong>DATOS PERSONALES</strong></td>
            <td class="auto-style10">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style12">Nombre<asp:RequiredFieldValidator ID="RFV_NombreCliente" runat="server" BackColor="White" ControlToValidate="Tx_ClienteNombre" ErrorMessage="(*)" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style12">Apellido<asp:RequiredFieldValidator ID="RFV_ApellidoCliente" runat="server" ControlToValidate="Tx_ClienteApellido" ErrorMessage="(*)" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style9"><asp:TextBox ID="Tx_ClienteNombre" runat="server" BorderColor="#0099FF" Width="95%" Height="25px"></asp:TextBox></td>
            <td class="auto-style9"><asp:TextBox ID="Tx_ClienteApellido" runat="server" BorderColor="#0099FF" Width="95%" Height="25px"></asp:TextBox></td>
        </tr>
        <tr>
            <td class="auto-style12">Teléfono<asp:RequiredFieldValidator ID="RFV_TelefonoCliente" runat="server" ControlToValidate="Tx_ClienteTelefono" ErrorMessage="(*)" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style12">Correo<asp:RequiredFieldValidator ID="RFV_CorreoCliente" runat="server" ControlToValidate="Tx_ClienteCorreo" ErrorMessage="(*)" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style9"><asp:TextBox ID="Tx_ClienteTelefono" runat="server" BorderColor="#0099FF" Width="95%" Height="25px"></asp:TextBox></td>
            <td class="auto-style9"><asp:TextBox ID="Tx_ClienteCorreo" runat="server" BorderColor="#0099FF" Width="95%" Height="25px"></asp:TextBox></td>
        </tr>
        <tr>
            <td class="auto-style9">&nbsp;</td>
            <td class="auto-style10"><asp:Button ID="BT_GuardarCliente" runat="server" Text="Guardar cambios" BorderColor="#0099FF" Font-Bold="True" Font-Size="86%" Height="30px" Width="96%" /></td>
        </tr>
        <tr>
            <td class="auto-style16"><strong>CAMBIAR CONTRASEÑA</strong></td>
            <td class="auto-style10">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style12">Contraseña actual<asp:RequiredFieldValidator ID="RFV_ContrasenaActual" runat="server" ControlToValidate="Tx_CliCActual" ErrorMessage="(*)" Font-Size="90%" ForeColor="Red" ValidationGroup="VG_AContraseña" SetFocusOnError="True"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style12">Contraseña nueva<asp:RequiredFieldValidator ID="RFV_ContrasenaNueva" runat="server" ControlToValidate="Tx_CliCNueva" ErrorMessage="(*)" Font-Size="90%" ForeColor="Red" ValidationGroup="VG_AContraseña" SetFocusOnError="True"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td class="auto-style9"><asp:TextBox ID="Tx_CliCActual" runat="server" BorderColor="#0099FF" Width="95%" Height="25px"></asp:TextBox>
            </td>
            <td class="auto-style9"><asp:TextBox ID="Tx_CliCNueva" runat="server" BorderColor="#0099FF" Width="95%" Height="25px"></asp:TextBox></td>
           
        </tr>
        <tr>
            <td class="auto-style9">&nbsp;</td>
            <td class="auto-style10"><asp:Button ID="BT_GuardarContraCliente" runat="server" Text="Guardar cambios" BorderColor="#0099FF" Font-Bold="True" Font-Size="86%" Height="30px" Width="96%" ValidationGroup="VG_AContraseña" /></td>
        </tr>
        <tr>
            <td  class="footerDatos"colspan="2">&nbsp;</td>
        </tr>
    </table>
</asp:Content>

