<%@ Page Title="" Language="C#" MasterPageFile="~/View/masterInicio/paginaPrincipal.master" AutoEventWireup="true" CodeFile="~/Controller/masterInicio/principal/Registro.aspx.cs" Inherits="View_masterInicio_principal_Registro" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style5 {
            width: 100%;
            height: 48px;
            color: #000000;
         
        }
                
    .imgRegistro{
        width:50%;
        padding-left:10%;
        /*height:300px;
        object-fit:cover;*/
    }
     .auto-style14 {
         width:100%;
         color: #000000;
         font-size: 160%;
         font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
         padding-bottom:2%;
         text-align: center;
     }
     .auto-style15{
          width: 40%;
            text-align: left;
        }
     .auto-style18 {
            font-size: 140%;
            font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
        }
     .auto-style19 {
         padding:0.6%;
     }
        .auto-style23 {
            width: 90%;
            height: 48px;
            color: #000000;
            text-align: center;
        }
        .auto-style24 {
            width:60%;
        }
        .auto-style26 {
            text-align: left;
            width: 18px;
            height: 35px;
        }
        .auto-style27 {
            width: 27%;
            height: 35px;
        }
        .auto-style28 {
            text-align: left;
            width: 232px;
            height: 35px;
        }
        .auto-style32 {
            font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
        }
        .auto-style33 {
            text-align: left;
            width: 232px;
        }
        .auto-style34 {
            text-align: left;
            width: 18px;
        }
        .auto-style35 {
            width: 232px;
        }
        .auto-style36 {
            width: 18px;
        }
        .auto-style37 {
            width: 60%;
            height: 35px;
        }
     </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="auto-style1">
    <tr>
        <td class="auto-style14" colspan="2">
            <strong>CREAR CUENTA

            </strong> 

        </td>
    </tr>
   
    <tr>
        <%--<td class="auto-style13">--%><%-- <table class="auto-style16">--%>
                    <td class="auto-style11">
                        <table class="auto-style23">
                            <tr>
                                <td class="auto-style28">
                                    <asp:Label ID="L_Nombre" runat="server" Text="Nombre" CssClass="auto-style18"></asp:Label>
                                    <br />
                                </td>
                                <td class="auto-style26">
                                    <asp:RequiredFieldValidator ID="RFV_CrearNombre" runat="server" ControlToValidate="Tx_nombre" ErrorMessage="(*)" ForeColor="Red" SetFocusOnError="True" ValidationGroup="crearCuenta"></asp:RequiredFieldValidator>
                                    </td>
                                <td class="auto-style27">
                                    <asp:TextBox ID="Tx_nombre" runat="server" BorderColor="#0099FF" Width="95%" Height="25px"></asp:TextBox>
                                    <cc1:filteredtextboxextender ID="FTBE_nombre" runat="server" FilterType="LowercaseLetters, UppercaseLetters, Custom" ValidChars=" ñ" TargetControlID="Tx_nombre" />
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style33">
                                    <asp:Label ID="L_Apellidos" runat="server" Text="Apellidos" CssClass="auto-style18"></asp:Label>
                                    <br />
                                </td>
                                <td class="auto-style34">
                                    <asp:RequiredFieldValidator ID="RFV_CrearApellido" runat="server" ControlToValidate="Tx_apellidos" ErrorMessage="(*)" ForeColor="Red" SetFocusOnError="True" ValidationGroup="crearCuenta"></asp:RequiredFieldValidator>
                                </td>
                                <td class="auto-style24">
                                    <asp:TextBox ID="Tx_apellidos" runat="server" BorderColor="#0099FF" Width="95%" Height="25px"></asp:TextBox>
                                    <cc1:filteredtextboxextender ID="FTBE_apellidos" runat="server" FilterType="LowercaseLetters, UppercaseLetters, Custom" ValidChars=" ñ" TargetControlID="Tx_apellidos" />
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style33">
                                    <asp:Label ID="L_correo" runat="server" Text="Correo" CssClass="auto-style18"></asp:Label>
                                    <br />
                                </td>
                                <td class="auto-style34">
                                    <asp:RequiredFieldValidator ID="RFV_CrearCorreo" runat="server" ControlToValidate="Tx_correo" ErrorMessage="(*)" ForeColor="Red" SetFocusOnError="True" ValidationGroup="crearCuenta"></asp:RequiredFieldValidator>
                                </td>
                                <td class="auto-style24">
                                    <asp:TextBox ID="Tx_correo" runat="server" BorderColor="#0099FF" Width="95%" Height="25px" TextMode="Email"></asp:TextBox>
                                    <cc1:filteredtextboxextender ID="FTBE_correo" runat="server" FilterType="Numbers,LowercaseLetters, UppercaseLetters, Custom" ValidChars="_-ñ@." TargetControlID="Tx_correo" />
                                    <br />
                                    <asp:Label ID="L_ErrorCorreo" runat="server" CssClass="auto-style32" Font-Size="100%" ForeColor="Red"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style33">
                                    <asp:Label ID="L_Cedula" runat="server" Text="Cedula de ciudadania" CssClass="auto-style18"></asp:Label>
                                    <br />
                                </td>
                                <td class="auto-style34">
                                    <asp:RequiredFieldValidator ID="RFV_CrearCedula" runat="server" ControlToValidate="Tx_cedula" ErrorMessage="(*)" ForeColor="Red" SetFocusOnError="True" ValidationGroup="crearCuenta"></asp:RequiredFieldValidator>
                                </td>
                                <td class="auto-style24">
                                    <asp:TextBox ID="Tx_cedula" runat="server" BorderColor="#0099FF" Width="95%" Height="25px" MaxLength="10"></asp:TextBox>
                                    <cc1:filteredtextboxextender ID="FTBE_cedula" runat="server" FilterType="Numbers" TargetControlID="Tx_cedula" />
                                    <br />
                                    <asp:Label ID="L_ErrorCedula" runat="server" CssClass="auto-style32" Font-Size="100%" ForeColor="Red"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style33">
                                    <asp:Label ID="L_FechaN" runat="server" Text="Fecha de nacimiento" CssClass="auto-style18"></asp:Label>
                                    <br />
                                </td>
                                <td class="auto-style34">
                                    <asp:RequiredFieldValidator ID="RFV_CrearFecha" runat="server" ControlToValidate="Tx_fecha" ErrorMessage="(*)" ForeColor="Red" SetFocusOnError="True" ValidationGroup="crearCuenta"></asp:RequiredFieldValidator>
                                </td>
                                <td class="auto-style24">
                                    <asp:TextBox ID="Tx_fecha" runat="server" BorderColor="#0099FF" TextMode="Date" Width="95%" Height="25px"></asp:TextBox>
                                    <br />
                                    <asp:Label ID="L_ErrorFechaNacimiento" runat="server" CssClass="auto-style32" Font-Size="100%" ForeColor="Red"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style28">
                                    <asp:Label ID="L_Telefono" runat="server" Text="Telefono" CssClass="auto-style18"></asp:Label>
                                </td>
                                <td class="auto-style26">
                                    <asp:RequiredFieldValidator ID="RFV_CrearTelefono" runat="server" ControlToValidate="Tx_Telefono" ErrorMessage="(*)" ForeColor="Red" SetFocusOnError="True" ValidationGroup="crearCuenta"></asp:RequiredFieldValidator>
                                    <cc1:filteredtextboxextender ID="FTBE_Telefono" runat="server" FilterType="Numbers" TargetControlID="Tx_Telefono" />
                                </td>
                                <td class="auto-style37">
                                    <asp:TextBox ID="Tx_Telefono" runat="server" BorderColor="#0099FF" Width="95%" Height="25px" MaxLength="10"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style33">
                                    <asp:Label ID="L_contraseña" runat="server" Text="Contraseña" CssClass="auto-style18"></asp:Label>
                                    <br />
                                </td>
                                <td class="auto-style34">
                                    <asp:RequiredFieldValidator ID="RFV_CrearContraseña" runat="server" ControlToValidate="Tx_contraseña" ErrorMessage="(*)" ForeColor="Red" SetFocusOnError="True" ValidationGroup="crearCuenta"></asp:RequiredFieldValidator>
                                </td>
                                <td class="auto-style24">
                                    <asp:TextBox ID="Tx_contraseña" runat="server" BorderColor="#0099FF" TextMode="Password" Width="95%" Height="25px"></asp:TextBox>
                                    <cc1:filteredtextboxextender ID="FTBE_contraseña" runat="server" FilterType="Numbers,LowercaseLetters, UppercaseLetters, Custom" ValidChars=" _-ñ" TargetControlID="Tx_contraseña" />
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style35"></td>
                                <td class="auto-style36">&nbsp;</td>
                                <td class="auto-style24">
                                    <asp:Button ID="Bt_CrearU" runat="server" Text="Crear Cuenta" BorderColor="#0099FF" Font-Bold="True" Font-Size="86%" Height="30px" Width="96%" ValidationGroup="crearCuenta" OnClick="Bt_CrearU_Click" />
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style35">
                                    <asp:ScriptManager ID="ScriptManager1" runat="server">
                                    </asp:ScriptManager>
                                </td>
                                <td class="auto-style36">&nbsp;</td>
                                <td class="auto-style24">
                                    <asp:Label ID="L_ErrorCrear" runat="server" CssClass="auto-style32" Font-Size="100%" ForeColor="Red"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                    
                    
            <%--</table>--%><%-- </td>--%>
        <td class="auto-style15">
           
            <asp:Image ID="Image2" runat="server" ImageUrl="~/Imagenes/paginaInicio/registro/registro3.png" class="imgRegistro" />
        </td>
    </tr>

    <tr>
        <td class="auto-style19" colspan="2">
            &nbsp;</td>
    </tr>

                
</table>
</asp:Content>

