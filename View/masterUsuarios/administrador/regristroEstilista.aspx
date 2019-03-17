<%@ Page Title="" Language="C#" MasterPageFile="~/View/masterUsuarios/masterUsuarios.master" AutoEventWireup="true" CodeFile="~/Controller/masterUsuarios/administrador/regristroEstilista.aspx.cs" Inherits="View_masterUsuarios_administrador_regristroEstilista" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %> 

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style8 {
            width: 33%;
        }
        .auto-style9 {
            width: 33%;
        }
        .auto-style10 {
            width: 33%;
        }
        .auto-style11 {
            padding-left:20%;
        }
    .auto-style12 {
        width: 33%;
        font-size: 160%;
        font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
        padding-bottom:2%;
        padding-top:1%;
    }
    .auto-style13 {
        font-size: 160%;
        font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
     
    }
    .auto-style14 {
        font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
        font-size: 120%;
    }
    .auto-style15 {
            width: 33%;
            text-align: center;
    }
    .auto-style25 {
           padding-bottom:7%;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="auto-style1">
    <tr>
        <td colspan="3" class="auto-style13"><strong>ESTILISTAS</strong> </td>
    </tr>
    <tr>
        <td colspan="3" class="auto-style11">
            <asp:GridView ID="GV_Estilista" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" PageSize="5" Width="80%" CssClass="auto-style14" ShowHeaderWhenEmpty="True" AllowPaging="True" >
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
            
        </td>
    </tr>
    <tr>
        <td class="auto-style12"><strong>REGISTRAR ESTILISTA</strong></td>
        <td colspan="2">
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
        </td>
    </tr>
    <tr>
        <td class="auto-style8"><asp:TextBox ID="Tx_CodigoEstilista" runat="server" BorderColor="#0099FF" Width="95%" Height="25px" MaxLength="10" ValidationGroup="registroEstilista"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RFV_ICodigoEstilista" runat="server" ControlToValidate="Tx_CodigoEstilista" ErrorMessage="(*)" ForeColor="Red" ValidationGroup="registroEstilista" SetFocusOnError="True"></asp:RequiredFieldValidator>
        </td>
        <cc1:TextBoxWatermarkExtender id="TBWEDOB_codigoEstilista" runat="server" targetcontrolid="Tx_CodigoEstilista" watermarktext="Cedula" watermarkcssclass="watermarked"> </cc1:TextBoxWatermarkExtender>
        <cc1:filteredtextboxextender ID="FTBE_CodigoEstilista" runat="server" FilterType="Numbers" TargetControlID="Tx_CodigoEstilista" />
        <td class="auto-style9"><asp:TextBox ID="Tx_NombreEstilista" runat="server" BorderColor="#0099FF" Width="95%" Height="25px" ValidationGroup="registroEstilista"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RFV_INombreEstilista" runat="server" ControlToValidate="Tx_NombreEstilista" ErrorMessage="(*)" ForeColor="Red" ValidationGroup="registroEstilista" SetFocusOnError="True"></asp:RequiredFieldValidator>
        </td>
        <cc1:TextBoxWatermarkExtender id="TBWEDOB_NombreEstilista" runat="server" targetcontrolid="Tx_NombreEstilista" watermarktext="Nombre" watermarkcssclass="watermarked"> </cc1:TextBoxWatermarkExtender>
        <cc1:filteredtextboxextender ID="FTBE_NombreEstilista" runat="server" FilterType="Custom, UppercaseLetters, LowercaseLetters" ValidChars="ñ" TargetControlID="Tx_NombreEstilista" />
        <td class="auto-style10"><asp:TextBox ID="Tx_ApellidoEstilista" runat="server" BorderColor="#0099FF" Width="95%" Height="25px"  ValidationGroup="registroEstilista"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RFV_IApellidoEstilista" runat="server" ControlToValidate="Tx_ApellidoEstilista" ErrorMessage="(*)" ForeColor="Red" ValidationGroup="registroEstilista" SetFocusOnError="True"></asp:RequiredFieldValidator>
        </td>
        <cc1:TextBoxWatermarkExtender id="TBWEDOB_ApellidoEstilista" runat="server" targetcontrolid="Tx_ApellidoEstilista" watermarktext="Apellido" watermarkcssclass="watermarked"> </cc1:TextBoxWatermarkExtender>
        <cc1:filteredtextboxextender ID="FTBE_ApellidoEstilista" runat="server" FilterType="Custom, UppercaseLetters, LowercaseLetters" ValidChars="ñ" TargetControlID="Tx_ApellidoEstilista" />

    </tr>
    <tr>
        <td class="auto-style8"><asp:TextBox ID="Tx_TelefonoEstilista" runat="server" BorderColor="#0099FF" Width="95%" Height="25px" ValidationGroup="registroEstilista"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RFV_ITelefonoEstilista" runat="server" ControlToValidate="Tx_TelefonoEstilista" ErrorMessage="(*)" ForeColor="Red" ValidationGroup="registroEstilista" SetFocusOnError="True"></asp:RequiredFieldValidator>
        </td>
        <cc1:TextBoxWatermarkExtender id="TBWEDOB_TelefonoEstilista" runat="server" targetcontrolid="Tx_TelefonoEstilista" watermarktext="Telefono" watermarkcssclass="watermarked"> </cc1:TextBoxWatermarkExtender>
        <cc1:filteredtextboxextender ID="FTBE_TelefonoEstilista" runat="server" FilterType="Numbers" TargetControlID="Tx_TelefonoEstilista" />
        <td class="auto-style9"><asp:TextBox ID="Tx_CorreoEstilista" runat="server" BorderColor="#0099FF" Width="95%" Height="25px" TextMode="Email" ValidationGroup="registroEstilista"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RFV_ICorreoEstilista" runat="server" ControlToValidate="Tx_CorreoEstilista" ErrorMessage="(*)" ForeColor="Red" ValidationGroup="registroEstilista" SetFocusOnError="True"></asp:RequiredFieldValidator>
        </td>
         <cc1:TextBoxWatermarkExtender id="TBWEDOB_Tx_CorreoEstilista" runat="server" targetcontrolid="Tx_CorreoEstilista" watermarktext="Correo" watermarkcssclass="watermarked"> </cc1:TextBoxWatermarkExtender>
         <cc1:filteredtextboxextender ID="FTBE_CorreoEstilista" runat="server" FilterType="Numbers,LowercaseLetters, UppercaseLetters, Custom" ValidChars=" _-ñ" TargetControlID="Tx_CorreoEstilista" />
        <td class="auto-style10"><asp:TextBox ID="Tx_ServicioEstilista" runat="server" BorderColor="#0099FF" Width="95%" Height="25px" ValidationGroup="registroEstilista"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RFV_IServicioEstilista" runat="server" ControlToValidate="Tx_ServicioEstilista" ErrorMessage="(*)" ForeColor="Red" ValidationGroup="registroEstilista" SetFocusOnError="True"></asp:RequiredFieldValidator>
        </td>
         <cc1:TextBoxWatermarkExtender id="TBWEDOB_Tx_ServicioEstilista" runat="server" targetcontrolid="Tx_ServicioEstilista" watermarktext="Servicio" watermarkcssclass="watermarked"> </cc1:TextBoxWatermarkExtender>
         <cc1:filteredtextboxextender ID="FTBE_ServicioEstilista" runat="server" FilterType="Custom, UppercaseLetters, LowercaseLetters" ValidChars=" _-ñ" TargetControlID="Tx_ServicioEstilista" />
    </tr>
    <tr>
        <td class="auto-style8"><asp:TextBox ID="Tx_ContraseñaEstilista" runat="server" BorderColor="#0099FF" Width="95%" Height="25px" ValidationGroup="registroEstilista"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RFV_IContraseñaEstilista" runat="server" ControlToValidate="Tx_ContraseñaEstilista" ErrorMessage="(*)" ForeColor="Red" ValidationGroup="registroEstilista" SetFocusOnError="True"></asp:RequiredFieldValidator>     
        </td>
         <cc1:TextBoxWatermarkExtender id="TBWEDOB_Tx_ContraseñaEstilista" runat="server" targetcontrolid="Tx_ContraseñaEstilista" watermarktext="Contraseña" watermarkcssclass="watermarked"> </cc1:TextBoxWatermarkExtender>
        <cc1:filteredtextboxextender ID="FTBE_ContraseñaEstilista" runat="server" FilterType="Numbers,LowercaseLetters, UppercaseLetters, Custom" ValidChars=" _-ñ" TargetControlID="Tx_ContraseñaEstilista" />
        <td class="auto-style9">&nbsp;</td>
        <td class="auto-style10"><asp:ImageButton ID="IB_GuardarEstilista" runat="server" Height="50px" Width="15%" ValidationGroup="registroEstilista" ImageUrl="~/Imagenes/guardar.png" />
        </td>
    </tr>
    <tr>
        <td class="auto-style8">&nbsp;</td>
        <td class="auto-style9">&nbsp;</td>
        <td class="auto-style25"></td>
    </tr>
</table>
</asp:Content>

