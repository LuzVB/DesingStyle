<%@ Page Title="" Language="C#" MasterPageFile="~/View/masterInicio/paginaPrincipal.master" AutoEventWireup="true" CodeFile="~/Controller/masterInicio/principal/inicioSesion.aspx.cs" Inherits="View_masterInicio_principal_inicioSesion" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%--validar caracter especiales--%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style5 {
            width: 100%;
            height: 48px;
            color: #000000;
        }

        .imgRegistro {
            width: 50%;
            padding-left: 10%;
            /*height:300px;
        object-fit:cover;*/
        }

        .auto-style13 {
            width: 60%;
        }

        .auto-style14 {
            width: 100%;
            color: #000000;
            font-size: 160%;
            font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
            padding-bottom: 2%;
            text-align: center;
        }

        .auto-style15 {
            width: 40%;
        }

        .auto-style16 {
            width: 100%;
            color: #000000;
            font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
        }

        .auto-style17 {
            text-align: left;
            padding-left: 7%;
        }

        .auto-style18 {
            font-size: 140%;
        }

        .auto-style19 {
            padding: 0.6%;
        }

        .auto-style21 {
            margin-left: 0px;
            font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
        }

        .auto-style22 {
            width: 100%;
            text-align: left;
            padding-left: 20%;
            padding-top: 0.8%;
        }

        .auto-style23 {
            font-size: 100%;
            text-align: center;
        }

            .auto-style23 a:link {
                color: #0099FF;
            }

            .auto-style23 a:visited {
                color: #9b8cd9;
            }

            .auto-style23 a:hover {
                color: #ce9ee1;
            }

        .auto-style24 {
            text-align: center;
            height: 22px;
        }

        .auto-style25 {
            width: 100%;
            text-align: center;
        }

        .auto-style26 {
            height: 22px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table class="auto-style1">
        <tr>
            <td class="auto-style14" colspan="2">
                <strong>INICIAR SESIÓN 

                </strong>

            </td>
        </tr>

        <tr>
            <td class="auto-style13">
                <table class="auto-style16">
                    <td class="auto-style11">
                        <table class="auto-style5">
                            <tr>

                                <td class="auto-style17">
                                    <asp:Label ID="L_Icorreo" runat="server" Text="Correo" CssClass="auto-style18"></asp:Label>
                                    <br />
                                </td>
                                <td class="auto-style25">
                                    <asp:TextBox ID="Tx_Icorreo" runat="server" BorderColor="#0099FF" Width="50%" Height="25px" TextMode="Email" ValidationGroup="VG_InicioSesion" MaxLength="50" AutoCompleteType="Disabled"></asp:TextBox>
                                    <cc1:FilteredTextBoxExtender ID="FTBE_Icorreo" runat="server"  FilterType="Numbers,LowercaseLetters, UppercaseLetters, Custom" ValidChars="_-ñ@."  InvalidChars=" " TargetControlID="Tx_Icorreo" />
                                    <%--validar caracter especiales--%>
                                    <asp:RequiredFieldValidator ID="RFV_ICorreo" runat="server" ErrorMessage="(*)" ControlToValidate="Tx_Icorreo" ForeColor="Red" ValidationGroup="VG_InicioSesion" SetFocusOnError="True"></asp:RequiredFieldValidator>

                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style17">
                                    <asp:Label ID="L_Icontraseña" runat="server" Text="Contraseña" CssClass="auto-style18"></asp:Label>
                                    <br />
                                </td>
                                <td class="auto-style25">
                                    <asp:TextBox ID="Tx_Icontraseña" runat="server" BorderColor="#0099FF" TextMode="Password" Width="50%" Height="25px" ValidationGroup="VG_InicioSesion" AutoCompleteType="Disabled"></asp:TextBox>
                                    <cc1:FilteredTextBoxExtender ID="FTBE_IContraseña" runat="server" FilterType="Numbers,LowercaseLetters, UppercaseLetters, Custom" ValidChars=" _-ñ" TargetControlID="Tx_Icontraseña" />
                                    <%--validar caracter especiales--%>
                                    <asp:RequiredFieldValidator ID="RFV_IContraseña" runat="server" ErrorMessage="(*)" ControlToValidate="Tx_Icontraseña" ForeColor="Red" ValidationGroup="VG_InicioSesion" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style9"></td>
                                <td class="auto-style22">

                                    <asp:Button ID="BT_InicioSesion" runat="server" Text="Iniciar sesión" BorderColor="#0099FF" Font-Bold="True" Font-Size="86%" Height="30px" Width="64%" ValidationGroup="VG_InicioSesion" CssClass="auto-style21" OnClick="BT_InicioSesion_Click" />
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style26"></td>
                                <td class="auto-style24">

                                    <asp:Label ID="LB_IError" runat="server" ForeColor="Red"></asp:Label>

                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style9"></td>
                                <td class="auto-style23"><a href="generarTokenContraseña.aspx">¿Olvido su contraseña?</a></td>
                            </tr>
                            <tr>
                                <td class="auto-style9"></td>
                                <td class="auto-style23"><a href="generarTokenCuenta.aspx">Recuperar cuenta</a></td>
                            </tr>
                        </table>
                    </td>


                    <asp:ScriptManager ID="ScriptManager1" runat="server">
                        <%--validar caracter especiales--%>
                    </asp:ScriptManager>


                </table>
            </td>
            <td class="auto-style15">

                <asp:Image ID="I_Login" runat="server" ImageUrl="~/Imagenes/paginaInicio/registro/login.png" class="imgRegistro" />
            </td>
        </tr>

        <tr>
            <td class="auto-style19" colspan="2">&nbsp;</td>
        </tr>


    </table>
   <%-- <asp:FormView ID="FormView1" runat="server"></asp:FormView>--%>

</asp:Content>

