<%@ Page Title="" Language="C#" MasterPageFile="~/View/masterUsuarios/masterUsuarios.master" AutoEventWireup="true" CodeFile="~/Controller/masterUsuarios/estilista/PerfilEstilista.aspx.cs" Inherits="View_masterUsuarios_estilista_PerfilEstilista" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %> 

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style8 {
            width: 70%;
        }
      
        .auto-style11 {
            width: 30%;
        }
        .auto-style12 {
            width: 70%;
            height: 23px;
            text-align: center;
        }
        .auto-style13 {
            width: 30%;
            height: 23px;
        }
        .auto-style21 {
            margin-left: 0px;
            font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
        }
        .auto-style22 {
            height: 23px;
        }
        .auto-style23 {
            width: 70%;
            font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
            font-size: 140%;
        }
        .auto-style24 {
            height: 23px;
            font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
            font-size: 160%;
        }
        .auto-style25 {
            font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
            font-size: 140%;
            padding-left:30%;
        }
        .auto-style26 {
            width: 70%;
            font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
            font-size: 160%;
        }
        .auto-style27 {
            width: 70%;
            text-align: center;
        }
        .img_perfil{
            object-fit:cover;
        }
        .auto-style28 {
            width: 70%;
            font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
            padding-left:17%;
        }
        .auto-style29 {
            width: 70%;
            
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="auto-style1">
    <tr>
        <td class="auto-style26"><strong>PERFIL
        </strong>
        </td>
        <td class="auto-style11"><asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager></td>
    </tr>
    <tr>
        <td class="auto-style29">
            <asp:Label ID="LB_nombreEstilista" runat="server" CssClass="auto-style25"></asp:Label>
        </td>
        <td class="auto-style11">&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style12">
            <asp:Image ID="I_PerfilEstilista" runat="server" class="img_perfil" Height="200px" Width="40%" ImageUrl="~/Imagenes/perfil/estilista1.jpg" />
        </td>
        <td class="auto-style13">                       
            &nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style24">&nbsp;</td>
        <td class="auto-style22">                       
            <asp:Button ID="BT_CambiarImagen" runat="server" Text="Cambiar imagen" BorderColor="#0099FF" Font-Bold="True" Font-Size="86%" Height="30px" Width="64%" ValidationGroup="VG_InicioSesion" CssClass="auto-style21" />
        </td>
    </tr>
    <tr>
        <td class="auto-style24"><strong>BIOGRAFÍA</strong></td>
        <td class="auto-style22">&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style28">Descríbete a ti mismo y tu historia.</td>
        <td class="auto-style11">&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style27">
           <asp:TextBox ID="Tx_IBiografia" runat="server" BorderColor="#0099FF" Width="50%" Height="100px" TextMode="Email" ValidationGroup="VG_Biografia" ></asp:TextBox>
           <cc1:filteredtextboxextender ID="FTBE_IBiografia" runat="server" FilterType="Numbers,LowercaseLetters, UppercaseLetters, Custom" ValidChars="_-ñ." TargetControlID="Tx_IBiografia" /></td>
        <td class="auto-style11">&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style8">&nbsp;</td>
        <td class="auto-style11">
                                   
                                    <asp:Button ID="BT_GuardarBiografia" runat="server" Text="Guardar cambios" BorderColor="#0099FF" Font-Bold="True" Font-Size="86%" Height="30px" Width="64%" ValidationGroup="VG_Biografia" CssClass="auto-style21" />
                                </td>
    </tr>
    <tr>
        <td class="auto-style23"><strong>CAMBIAR CONTRASEÑA</strong></td>
        <td class="auto-style11">&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style27">

            <asp:TextBox ID="Tx_ContraseñaActual" runat="server" BorderColor="#0099FF" Width="30%" Height="25px" TextMode="Email" ValidationGroup="VG_cambioContraseña" TargetControlID="Tx_ContraseñaActual"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RFV_ContraseñaActual" runat="server" ControlToValidate="Tx_ContraseñaActual" ErrorMessage="(*)" ForeColor="Red" ValidationGroup="VG_cambioContraseña" SetFocusOnError="True"></asp:RequiredFieldValidator>
            <cc1:TextBoxWatermarkExtender id="TBWEDOB_contraseñaActual" runat="server" targetcontrolid="Tx_ContraseñaActual" watermarktext="Contraseña actual" watermarkcssclass="watermarked"> </cc1:TextBoxWatermarkExtender>
            <cc1:filteredtextboxextender ID="FTBE_contraseñaActual" runat="server" FilterType="Numbers,LowercaseLetters, UppercaseLetters, Custom" ValidChars=" _-ñ" TargetControlID="Tx_ContraseñaActual" />
            
            <asp:TextBox ID="Tx_ContraseñaNueva" runat="server" BorderColor="#0099FF" Width="30%" Height="25px" TextMode="Email" ValidationGroup="VG_cambioContraseña"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RFV_ContraseñaNueva" runat="server" ControlToValidate="Tx_ContraseñaNueva" ErrorMessage="(*)" ForeColor="Red" ValidationGroup="VG_cambioContraseña" SetFocusOnError="True"></asp:RequiredFieldValidator>
            <cc1:TextBoxWatermarkExtender id="TBWEDOB_contraseñaNueva" runat="server" targetcontrolid="Tx_ContraseñaNueva" watermarktext="Contraseña nueva" watermarkcssclass="watermarked"> </cc1:TextBoxWatermarkExtender>
            <cc1:filteredtextboxextender ID="FTBE_contraseñaNueva" runat="server" FilterType="Numbers,LowercaseLetters, UppercaseLetters, Custom" ValidChars=" _-ñ" TargetControlID="Tx_ContraseñaNueva" />
                                   

        <td class="auto-style11">&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style8">&nbsp;</td>
        <td class="auto-style11">
            <asp:Button ID="BT_GuardarBiografia0" runat="server" Text="Guardar cambios" BorderColor="#0099FF" Font-Bold="True" Font-Size="86%" Height="30px" Width="64%" ValidationGroup="VG_cambioContraseña" CssClass="auto-style21" />
        </td>
    </tr>
</table>
</asp:Content>

