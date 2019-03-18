<%@ Page Title="" Language="C#" MasterPageFile="~/View/masterUsuarios/masterUsuarios.master" AutoEventWireup="true" CodeFile="~/Controller/masterUsuarios/cliente/Estilista.aspx.cs" Inherits="View_masterUsuarios_cliente_Estilista" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <style type="text/css">
              
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
        .auto-style23 {
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
        .img_perfil{
            object-fit:cover;
        }
        .auto-style28 {
            font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
            padding-left:17%;
             height: 42px;
         }
        .auto-style29 {
            width: 70%;
            
        }
         .auto-style1 {
          width: 70%;
          font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
          padding-left:17%;
         }
         </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <table class="auto-style1">
    <tr>
        <td class="auto-style26">ESTILISTA</td>
        <td class="auto-style11"><asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager></td>
    </tr>
    <tr>
        <td class="auto-style29">
            <table class="auto-style1">
                <tr>
                    <td>Seleccione el estlista que desea ver </td>
                </tr>
                <tr>
                    <td>Estilista&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:RequiredFieldValidator ID="RFV_Estilista" runat="server" ControlToValidate="DropDownList_Estilista" ErrorMessage="(*)" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:DropDownList ID="DropDownList_Estilista" runat="server">
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>
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
        <td class="auto-style24" colspan="2">
            <asp:Label ID="LB_nombreEstilista" runat="server" CssClass="auto-style25"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="auto-style24"><strong>BIOGRAFÍA</strong></td>
       
    </tr>
    <tr>
        <td class="auto-style28" colspan="2">
            <asp:Label ID="L_Biografia" runat="server" Text="[L_Biografia]"></asp:Label>
        </td>
    </tr>

    <tr>
        <td class="auto-style23" colspan="2">&nbsp;</td>
    </tr>

  
</table>
</asp:Content>

