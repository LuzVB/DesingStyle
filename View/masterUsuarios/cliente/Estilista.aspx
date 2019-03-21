<%@ Page Title="" Language="C#" MasterPageFile="~/View/masterUsuarios/masterUsuarios.master" AutoEventWireup="true" CodeFile="~/Controller/masterUsuarios/cliente/Estilista.aspx.cs" Inherits="View_masterUsuarios_cliente_Estilista" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     
    <style type="text/css">
        .auto-style8 {
            width: 100%;
            margin:2%;
        }
        .auto-style9 {
            width: 80%;
        }
        .auto-style10 {
            height: 22px;
            font-size: 120%;
            text-align: right;
        }
        .auto-style11 {
            width: 80%;
            height: 22px;
        }
        .img_perfil{
            object-fit:cover;
        }
        .auto-style12 {
            text-align: center;
        }
        .auto-style13 {
            width: 80%;
            text-align: left;
            padding-left: 30%;
        }
        .auto-style14 {
            font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
        }
        .auto-style15 {
            font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
            font-size: 160%;
            text-align: center;
        }
        .auto-style16 {
            font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
            font-size: 140%;
        }
        .auto-style17 {
            font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
            font-size: 120%;
        }
    </style>
     
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  
    <table class="auto-style8">
        <tr>
            <td colspan="2" class="auto-style15"><strong>ESTILISTA</strong></td>
        </tr>
        <tr>
            
            <td colspan="2" class="auto-style16">Seleccione el estlista que desea ver</td>
        </tr>
        <tr>
            <td class="auto-style10"><span class="auto-style17">Estilista 
                </span> 
                <asp:RequiredFieldValidator ID="RFV_Estilista" runat="server" ControlToValidate="DropDownList_Estilista" ErrorMessage="(*)" ForeColor="Red" CssClass="auto-style17"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style11"> 
              <asp:DropDownList ID="DropDownList_Estilista" runat="server" CssClass="auto-style17">
              </asp:DropDownList>

            </td>
              
        </tr>
        <tr>
            <td class="auto-style12" colspan="2">
                <asp:Image ID="I_PerfilEstilista" runat="server" class="img_perfil" Height="200px" Width="50%" ImageUrl="~/Imagenes/perfil/estilista1.jpg" CssClass="auto-style14" />
           </td>
        </tr>
        <tr>
            <td class="auto-style14">&nbsp;</td>
            <td class="auto-style13">
                <asp:Label ID="LB_nombreEstilista" runat="server" CssClass="auto-style25" style="font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif; font-size: 120%"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style16" colspan="2">BIOGRAFÍA</td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Label ID="L_Biografia" runat="server" Text="[L_Biografia]" CssClass="auto-style17"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td class="auto-style9">&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td class="auto-style9">&nbsp;</td>
        </tr>
    </table>
  
</asp:Content>

