<%@ Page Title="" Language="C#" MasterPageFile="~/View/masterUsuarios/masterUsuarios.master" AutoEventWireup="true" CodeFile="~/Controller/masterUsuarios/administrador/usuariosSinRegistro.aspx.cs" Inherits="View_masterUsuarios_administrador_usuariosSinRegistro" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %> 

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style8 {
            width: 50%;
        }
        .auto-style9 {
            width: 50%;
        }
        .auto-style10 {
            width: 50%;
            font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
            font-size: 160%;
        }
        .auto-style11 {
            font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
            font-size: 120%;
            padding-left:20%;
            
        }
        .auto-style12 {
            width: 50%;
            text-align: left;
        }
    .auto-style13 {
        width: 50%;
        font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
        text-align: left;
        font-size: 110%;
    }
    .auto-style14 {
        width: 50%;
        text-align: center;
        font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
    }
    .auto-style15 {
        width: 50%;
        font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
        font-size: 160%;
        height: 120px;
    }
    .auto-style16 {
        width: 50%;
        height: 120px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="auto-style1">
        <tr>
            <td class="auto-style10">USUARIOS SIN REGISTRO</td>
            <td class="auto-style9">
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <div class="auto-style11">
                <asp:GridView ID="GV_Estilista" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" PageSize="5" Width="80%" CssClass="auto-style14" ShowHeaderWhenEmpty="True" AllowPaging="True" style="font-size: 120%; font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif">
                <FooterStyle BackColor="White" ForeColor="#000066" />
                <HeaderStyle BackColor="#018BDE" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                <RowStyle ForeColor="#000066" />
                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#007DBB" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#00547E" />
            </asp:GridView>
                </div>
            

            </td>
        </tr>
        <tr>
            <td class="auto-style15">REGISTRO USUARIO SIN REGISTRO </td>
            <td class="auto-style16"></td>
        </tr>
        <tr>
             <td class="auto-style13">
                 Hora</td>
            <td class="auto-style13">
                fecha</td>
        </tr>
        <tr>
             <td class="auto-style8">
                <asp:DropDownList ID="DDL_HoraCliente" runat="server" Height="25px" Width="95%">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RFV_HoraCliente" runat="server" ControlToValidate="DDL_HoraCliente" ErrorMessage="(*)" ForeColor="Red" ValidationGroup="registroClienteSin" SetFocusOnError="True"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style12">
                <asp:Label ID="LB_FechaSistema" runat="server" CssClass="auto-style11"></asp:Label>
             </td>
        </tr>
        <tr>
            <td class="auto-style13">
                Estilista</td>

            <td class="auto-style13">
                Servicio</td>
        </tr>
        <tr>
            <td class="auto-style8">
                <asp:DropDownList ID="DDL_NombreEstilista" runat="server" Height="25px" Width="95%">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RFV_NombreEstilista" runat="server" ControlToValidate="DDL_NombreEstilista" ErrorMessage="(*)" ForeColor="Red" ValidationGroup="registroClienteSin" SetFocusOnError="True"></asp:RequiredFieldValidator>
            </td>

            <td class="auto-style8">
                <asp:DropDownList ID="DDL_Servicio" runat="server" Height="25px" Width="95%">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RFV_Servicio" runat="server" ControlToValidate="DDL_Servicio" ErrorMessage="(*)" ForeColor="Red" ValidationGroup="registroClienteSin" SetFocusOnError="True"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style8">&nbsp;</td>
            <td class="auto-style12"><asp:ImageButton ID="IB_GuardarClienteSin" runat="server" Height="62px" Width="15%" ValidationGroup="registroClienteSin" ImageUrl="~/Imagenes/guardar.png" /></td>
        </tr>
    </table>
</asp:Content>

