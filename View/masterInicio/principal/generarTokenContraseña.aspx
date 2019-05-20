<%@ Page Title="" Language="C#" MasterPageFile="~/View/masterInicio/paginaPrincipal.master" AutoEventWireup="true" CodeFile="~/Controller/masterInicio/principal/generarTokenContraseña.aspx.cs" Inherits="View_masterInicio_principal_generarTokenContraseña" %>
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
            <td class="auto-style11" colspan="2"><strong>RECUPERAR CONTRASEÑA</strong></td>
        </tr>
        <tr>
            <td class="auto-style12" colspan="2">Ingrese el correo con el cual se encuentra registrado</td>
        </tr>
        <tr>
            <td class="auto-style28">
                <asp:TextBox ID="Tx_RCorreo" runat="server" BorderColor="#0099FF" Width="50%" Height="25px" TextMode="Email" ValidationGroup="VG_RecuperarContraseña" CssClass="auto-style10" AutoCompleteType="Disabled" ></asp:TextBox>
                <cc1:filteredtextboxextender ID="FTBE_RCorreo" runat="server" TargetControlID="Tx_RCorreo" FilterType="Numbers,LowercaseLetters, UppercaseLetters, Custom" ValidChars="_-ñ@."  InvalidChars=" " /></td>
            <td class="auto-style15">
                <asp:RequiredFieldValidator ID="RFV_RCorreo" runat="server" ErrorMessage="(*)" ControlToValidate="Tx_RCorreo" ForeColor="Red" ValidationGroup="VG_RecuperarContraseña" SetFocusOnError="True"></asp:RequiredFieldValidator>
         </td>
        </tr>
        <tr>
            <td class="auto-style18">
                <asp:Button ID="Bt_RecuperarC" runat="server" BorderColor="#0099FF" Text="Recuperar contraseña" ValidationGroup="VG_RecuperarContraseña" Height="35px" Width="50%" Font-Bold="True" CssClass="auto-style10" OnClick="Bt_RecuperarC_Click" />
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

