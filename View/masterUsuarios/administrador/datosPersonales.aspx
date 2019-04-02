﻿<%@ Page Title="" Language="C#" MasterPageFile="~/View/masterUsuarios/masterUsuarios.master" AutoEventWireup="true" CodeFile="~/Controller/masterUsuarios/administrador/datosPersonales.aspx.cs" Inherits="View_masterUsuarios_administrador_datosPersonales" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style8 {
            font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
            font-size: 180%;
        }
        .auto-style9 {
            width: 50%;
        }
        .auto-style10 {
            width: 50%;
            padding-top:0.5%;
            padding-bottom:0.5%;
        }
        .imgAdmin{
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
        .footerDatos{
            /*padding-bottom:120%;*/
        }
        .tablaAdm{
           padding-left:5%;
           padding-right:5%;
        }
        .auto-style17 {
            padding-left: 5%;
            padding-right: 5%;
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <table class="tablaAdm">
        <tr>
            <td class="auto-style9">
                <asp:Image ID="Image1" runat="server" class="imgAdmin" ImageUrl="~/Imagenes/administrador/datosAdm.jpg"/>
            </td>
            <td class="auto-style10">
                <asp:Label ID="L_Bienvenida" runat="server" CssClass="auto-style8"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style11"><strong>DATOS PERSONALES</strong></td>
            <td class="auto-style10">&nbsp;</td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:FormView ID="FV_datosAdmin" runat="server"  Width="100%" DataSourceID="ODS_Admin">
                <ItemTemplate>
                    <%--<table class="tablaAdm">--%>
                       <tr>
                            <td class="auto-style12">Nombre
                            </td>
                            <td class="auto-style12">Apellido</td>
                        </tr>
                        <tr>
                            <td class="auto-style9"><asp:TextBox ID="Tx_AdmNombre" runat="server" BorderColor="#0099FF" Width="95%" Height="25px" ValidationGroup="VG_DatosPersonales " Text='<%# Bind("nombre") %>'></asp:TextBox></td>
                            <cc1:filteredtextboxextender ID="FTBE_AdmNombre" runat="server" FilterType="LowercaseLetters, UppercaseLetters, Custom" ValidChars=" ñ" TargetControlID="Tx_AdmNombre" />
                            <td class="auto-style9"><asp:TextBox ID="Tx_AdmApellido" runat="server" BorderColor="#0099FF" Width="95%" Height="25px" ValidationGroup="VG_DatosPersonales " Text='<%# Bind("apellido") %>'></asp:TextBox></td>
                            <cc1:filteredtextboxextender ID="FTBE_AdmApellido" runat="server" FilterType="LowercaseLetters, UppercaseLetters, Custom" ValidChars=" ñ" TargetControlID="Tx_AdmApellido" />
                        </tr>
                        <tr>
                            <td class="auto-style12">Teléfono</td>
                            <td class="auto-style12">Correo</td>
                        </tr>
                        <tr>
                            <td class="auto-style9"><asp:TextBox ID="Tx_AdmTelefono" runat="server" BorderColor="#0099FF" Width="95%" Height="25px" ValidationGroup="VG_DatosPersonales " Text='<%# Bind("telefono") %>'></asp:TextBox></td>
                            <cc1:filteredtextboxextender ID="FTBE_AdmTelefono" runat="server" FilterType="Numbers" TargetControlID="Tx_AdmTelefono" />
                            <td class="auto-style9"><asp:TextBox ID="Tx_AdmCorreo" runat="server" BorderColor="#0099FF" Width="95%" Height="25px" TextMode="Email" ValidationGroup="VG_DatosPersonales "  Text='<%# Bind("correo") %>'></asp:TextBox></td>
                            <cc1:filteredtextboxextender ID="FTBE_AdmCorreo" runat="server" FilterType="Numbers,LowercaseLetters, UppercaseLetters, Custom" ValidChars="_-ñ@." TargetControlID="Tx_AdmCorreo" />
                        </tr>
                <%--    </table>--%>
                </ItemTemplate>
                </asp:FormView>
                <asp:ObjectDataSource ID="ODS_Admin" runat="server" SelectMethod="mostrarAdmin" TypeName="DAOAdmin">
                    <SelectParameters>
                        <asp:SessionParameter Name="id" SessionField="user_id" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
        
        <tr>
            <td class="auto-style9">&nbsp;</td>
            <td class="auto-style10"><asp:Button ID="BT_GuardarAdm" runat="server" Text="Guardar cambios" BorderColor="#0099FF" Font-Bold="True" Font-Size="86%" Height="30px" Width="96%" ValidationGroup="VG_DatosPersonales " /></td>
        </tr>
        <tr>
            <td class="auto-style16"><strong>CAMBIAR CONTRASEÑA</strong></td>
            <td class="auto-style10">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style12">Contraseña actual<asp:RequiredFieldValidator ID="RFV_ContrasenaActual" runat="server" ControlToValidate="Tx_AdmCActual" ErrorMessage="(*)" Font-Size="90%" ForeColor="Red" ValidationGroup="VG_AContraseña" SetFocusOnError="True"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style12">Contraseña nueva<asp:RequiredFieldValidator ID="RFV_ContrasenaNueva" runat="server" ControlToValidate="Tx_AdmCNueva" ErrorMessage="(*)" Font-Size="90%" ForeColor="Red" ValidationGroup="VG_AContraseña" SetFocusOnError="True"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td class="auto-style9"><asp:TextBox ID="Tx_AdmCActual" runat="server" BorderColor="#0099FF" Width="95%" Height="25px" ValidationGroup="VG_AContraseña"></asp:TextBox>
            <cc1:filteredtextboxextender ID="FTBE_AdmCActual" runat="server" FilterType="Numbers,LowercaseLetters, UppercaseLetters, Custom" ValidChars=" _-ñ" TargetControlID="Tx_AdmCActual" />
            </td>
            <td class="auto-style9"><asp:TextBox ID="Tx_AdmCNueva" runat="server" BorderColor="#0099FF" Width="95%" Height="25px" ValidationGroup="VG_AContraseña"></asp:TextBox></td>
            <cc1:filteredtextboxextender ID="FTBE_AdmCNueva" runat="server" FilterType="Numbers,LowercaseLetters, UppercaseLetters, Custom" ValidChars=" _-ñ" TargetControlID="Tx_AdmCNueva" />
           
        </tr>
        <tr>
            <td class="auto-style9">
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
            </td>
            <td class="auto-style10"><asp:Button ID="BT_GuardarContraAdm" runat="server" Text="Guardar cambios" BorderColor="#0099FF" Font-Bold="True" Font-Size="86%" Height="30px" Width="96%" ValidationGroup="VG_AContraseña" /></td>
        </tr>
        <tr>
            <td  class="footerDatos"colspan="2">&nbsp;</td>
        </tr>
    </table>
    
</asp:Content>

