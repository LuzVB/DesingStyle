<%@ Page Title="" Language="C#" MasterPageFile="~/View/masterUsuarios/masterUsuarios.master" AutoEventWireup="true" CodeFile="~/Controller/masterUsuarios/administrador/registroServicios.aspx.cs" Inherits="View_masterUsuarios_administrador_registroServicios" %>

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
            font-size: 160%;
            font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
        }
        .auto-style11 {
           padding-left:20%;
        }
        .letra {
         font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
        }
        .auto-style25 {
           padding-bottom:7%;
        
    }
        .auto-style26 {
            text-align: center;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="auto-style1">
        <tr>
            <td class="auto-style10"><strong>SERVICIOS</strong></td>
            <td class="auto-style9">&nbsp;</td>
        </tr>
        <tr>
            <td colspan="2">

                <div class="auto-style11">

                <asp:GridView ID="GV_Estilista" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" PageSize="5" Width="80%" CssClass="auto-style14" ShowHeaderWhenEmpty="True" AllowPaging="True"  style="font-size: 120%; font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif">
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
                    <asp:ObjectDataSource ID="ODS_Servicio" runat="server" SelectMethod="mostrarservicio" TypeName="DAOServicio" UpdateMethod="modificarServicico" DeleteMethod="modificarEstado">
                        <DeleteParameters>
                            <asp:Parameter Name="id" Type="Int32" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="nombre" Type="String" />
                            <asp:Parameter Name="descripcion" Type="String" />
                            <asp:Parameter Name="precio" Type="Int32" />
                            <asp:Parameter Name="duracion" Type="String" />
                            <asp:Parameter Name="id" Type="Int32" />
                        </UpdateParameters>
                    </asp:ObjectDataSource>
                </div>
           

            </td>
        </tr>
        <tr>
            <td class="auto-style10"><strong>REGISTRAR SERVICIO</strong></td>
            <td class="auto-style9">
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
            </td>
        </tr>
        <tr>
            <td class="auto-style8"><asp:TextBox ID="Tx_NombreServicio" runat="server" BorderColor="#0099FF" Width="95%" Height="25px" MaxLength="10" ValidationGroup="registroServicio"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RFV_NombreServicio" runat="server" ControlToValidate="Tx_NombreServicio" ErrorMessage="(*)" ForeColor="Red" ValidationGroup="registroServicio" SetFocusOnError="True"></asp:RequiredFieldValidator>
            </td>
                <cc1:TextBoxWatermarkExtender id="TBWEDOB_NombreServicio" runat="server" targetcontrolid="Tx_NombreServicio" watermarktext="Nombre" watermarkcssclass="watermarked"> </cc1:TextBoxWatermarkExtender>
                <cc1:filteredtextboxextender ID="FTBE_NombreServicio" runat="server" FilterType="Custom, UppercaseLetters, LowercaseLetters" TargetControlID="Tx_NombreServicio" InvalidChars=" ñ" />
            <td class="auto-style9">
                <asp:TextBox ID="Tx_descripcionServicio" runat="server" BorderColor="#0099FF" Width="95%" Height="25px" MaxLength="10" ValidationGroup="registroServicio" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="RFV_descripcionServicio" runat="server" ControlToValidate="Tx_descripcionServicio" ErrorMessage="(*)" ForeColor="Red" ValidationGroup="registroServicio" SetFocusOnError="True"></asp:RequiredFieldValidator>
            </td>
                <cc1:TextBoxWatermarkExtender id="TBWEDOB_descripcionServicio" runat="server" targetcontrolid="Tx_descripcionServicio" watermarktext="Descripción" watermarkcssclass="watermarked"> </cc1:TextBoxWatermarkExtender>
                <cc1:filteredtextboxextender ID="FTBE_descripcionServicio" runat="server" FilterType="Custom, UppercaseLetters, LowercaseLetters" TargetControlID="Tx_descripcionServicio" InvalidChars=" ñ" />
        </tr>
        <tr>
            <td class="auto-style8"><asp:TextBox ID="Tx_PrecioServicio" runat="server" BorderColor="#0099FF" Width="95%" Height="25px" MaxLength="10" ValidationGroup="registroServicio"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RFV_PrecioServicio" runat="server" ControlToValidate="Tx_PrecioServicio" ErrorMessage="(*)" ForeColor="Red" ValidationGroup="registroServicio" SetFocusOnError="True"></asp:RequiredFieldValidator>
            </td>
                <cc1:TextBoxWatermarkExtender id="TBWEDOB_PrecioServicio" runat="server" targetcontrolid="Tx_PrecioServicio" watermarktext="Precio" watermarkcssclass="watermarked"> </cc1:TextBoxWatermarkExtender>
                <cc1:filteredtextboxextender ID="FTBE_PrecioServicio" runat="server" FilterType="Numbers" TargetControlID="Tx_PrecioServicio" />

           <td class="auto-style9">
               <asp:TextBox ID="Tx_duracionServicio" runat="server" BorderColor="#0099FF" Width="95%" Height="25px" MaxLength="10" ValidationGroup="registroServicio"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RFV_duracionServicio" runat="server" ControlToValidate="Tx_duracionServicio" ErrorMessage="(*)" ForeColor="Red" ValidationGroup="registroServicio" SetFocusOnError="True"></asp:RequiredFieldValidator>
            </td>
                <cc1:TextBoxWatermarkExtender id="TBWEDOB_duracionServicio" runat="server" targetcontrolid="Tx_duracionServicio" watermarktext="Duración" watermarkcssclass="watermarked"> </cc1:TextBoxWatermarkExtender>
                <%--<cc1:filteredtextboxextender ID="FTBE_duracionServicio" runat="server" FilterType="Custom, UppercaseLetters, LowercaseLetters" TargetControlID="Tx_duracionServicio" InvalidChars=" ñ" />--%>
        </tr>
        <tr>
            <td class="auto-style8">
                <asp:Label ID="desactivar" runat="server" Text="Label"></asp:Label>
            </td>
            <td class="auto-style9">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style8">&nbsp;</td>
            <td class="auto-style25"><asp:ImageButton ID="IB_GuardarServicio" runat="server" Height="62px" Width="15%" ValidationGroup="registroServicio" ImageUrl="~/Imagenes/guardar.png" /></td>
        </tr>
    </table>
</asp:Content>


