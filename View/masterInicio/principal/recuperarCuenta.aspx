<%@ Page Title="" Language="C#" MasterPageFile="~/View/masterInicio/paginaPrincipal.master" AutoEventWireup="true" CodeFile="~/Controller/masterInicio/principal/recuperarCuenta.aspx.cs" Inherits="View_masterInicio_principal_recuperarCuenta" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">

        .auto-style1 {
            width:100%;
        }
   

        .auto-style9 {
            font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
            font-size: 100%;
            width: 70%;
            padding-left:43%;
        }
        .auto-style9 a:link{
            color:#0099FF;
        }

        .auto-style9 a:visited{
            color:#9b8cd9;
        }

        .auto-style9 a:hover{
            color:#ce9ee1;
        }

        .auto-style10 {
            font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
        }

        .auto-style11 {
            font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
            font-size: 160%;
            text-align: center;
            }
        .auto-style12 {
            font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
            font-size: 97%;
            padding-left:36%;
            padding-top:2%;
            }
        .auto-style14 {
            font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
            font-size: 110%;
        }
        .auto-style18 {
            text-align: right;
            width: 70%;
            padding-top:1%;
        }
        .auto-style28 {
            text-align: right;
            width: 70%;
        }
        .auto-style19 {
            width: 70%;
            
        }
        .auto-style20 {
            text-align: left;
            width: 70%;
            padding-left:35%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="auto-style1">
        <tr>
            <td class="auto-style11" colspan="2"><strong>RECUPERAR CUENTA</strong></td>
        </tr>
        <tr>
            <td class="auto-style12" colspan="2">Ingrese una contraseña para su nuevo ingreso.</td>
        </tr>

         <tr>
            <td class="auto-style28">
                <asp:TextBox ID="Tx_NuevaContraseña" runat="server" BorderColor="#0099FF" Width="50%" Height="25px" ValidationGroup="VG_RecuperarCuenta" CssClass="auto-style10"></asp:TextBox>
                <cc1:filteredtextboxextender ID="FTBE_nuevaContraseña" runat="server" FilterType="Numbers,LowercaseLetters, UppercaseLetters, Custom" ValidChars=" _-ñ@." TargetControlID="Tx_NuevaContraseña" /></td>
                <cc1:TextBoxWatermarkExtender id="TBWEDOB_nuevaContraseña" runat="server" targetcontrolid="Tx_NuevaContraseña" watermarktext="Nueva Contraseña" watermarkcssclass="watermarked"> </cc1:TextBoxWatermarkExtender>
            <td class="auto-style15">
                <asp:RequiredFieldValidator ID="RFV_nuevaContraseña" runat="server" ErrorMessage="(*)" ControlToValidate="Tx_NuevaContraseña" ForeColor="Red" ValidationGroup="VG_RecuperarCuenta" SetFocusOnError="True"></asp:RequiredFieldValidator>
         </td>
        </tr>
         <tr>
            <td class="auto-style28">
                <asp:TextBox ID="Tx_ConfirmarContraseña" runat="server" BorderColor="#0099FF" Width="50%" Height="25px" ValidationGroup="VG_RecuperarCuenta" CssClass="auto-style10"></asp:TextBox>
                <cc1:filteredtextboxextender ID="FTBE_ConfirmarContraseña" runat="server" FilterType="Numbers,LowercaseLetters, UppercaseLetters, Custom" ValidChars=" _-ñ@." TargetControlID="Tx_ConfirmarContraseña" /></td>
                <cc1:TextBoxWatermarkExtender id="TBWEDOB_ConfirmarContraseña" runat="server" targetcontrolid="Tx_ConfirmarContraseña" watermarktext="Confirmar Contraseña" watermarkcssclass="watermarked"> </cc1:TextBoxWatermarkExtender>
            <td class="auto-style15">
                <asp:RequiredFieldValidator ID="RFV_ConfirmarContraseña" runat="server" ErrorMessage="(*)" ControlToValidate="Tx_ConfirmarContraseña" ForeColor="Red" ValidationGroup="VG_RecuperarCuenta" SetFocusOnError="True"></asp:RequiredFieldValidator>
         </td>
        </tr>
       
        <tr>
            <td class="auto-style18">
                <asp:Button ID="Bt_recuperarCuenta" runat="server" BorderColor="#0099FF" Text="Recuperar contraseña" ValidationGroup="VG_RecuperarCuenta" Height="35px" Width="50%" Font-Bold="True" CssClass="auto-style10" OnClick="Bt_GuardarContraseña_Click" />
            </td>
            <td >&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style20">
                 <asp:Label ID="LB_RContraseñaError" runat="server" ForeColor="Red" CssClass="auto-style14" ></asp:Label>
                                   
             </td>
            
            <td >&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style9"><a href="Registro.aspx">¿No tiene cuenta?, regístrese</a></td>
            <td >&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style19" >&nbsp;</td>
            <td >&nbsp;</td>
        </tr>
    </table>
   
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
        
</asp:Content>

