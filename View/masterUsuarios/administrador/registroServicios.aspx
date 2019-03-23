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
           /*padding-left:20%;*/
        }
        .letra {
         font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
        }
        .auto-style25 {
           padding-bottom:7%;
        
    }
        .auto-style26 {
            font-size: 100%;
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

                <asp:GridView ID="GV_Estilista" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" PageSize="5" Width="95%" CssClass="auto-style14" ShowHeaderWhenEmpty="True" AllowPaging="True"  style="font-size: 120%; font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif" DataSourceID="ODS_Servicio" AutoGenerateColumns="False" DataKeyNames="id">
                    <Columns>
                        <asp:TemplateField HeaderText="Nombre">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("nombre") %>' CssClass="auto-style26" Width="100%"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("nombre") %>' ></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Descripcion">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("descripcion") %>' CssClass="auto-style26" Width="100%"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("descripcion") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Precio">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("precio") %>' CssClass="auto-style26" Width="100%"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("precio") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Duracion">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("duracion") %>' CssClass="auto-style26" Width="100%"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("duracion") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Estado">
                            <EditItemTemplate>
                                <asp:DropDownList ID="DDL_AEstado" runat="server" SelectedValue='<%# Bind("estado") %>' Width="100%">
                                    <asp:ListItem Value="Disponible">Disponible</asp:ListItem>
                                    <asp:ListItem Value="No disponible">No disponible</asp:ListItem>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("estado") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False">
                            <EditItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Actualizar"></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar"></asp:LinkButton>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Editar" Width="40%"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
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
                    <asp:ObjectDataSource ID="ODS_Servicio" runat="server" SelectMethod="mostrarservicio" TypeName="DAOServicio" UpdateMethod="modificarServicico2" DeleteMethod="modificarEstado">
                        <DeleteParameters>
                            <asp:Parameter Name="id" Type="Int32" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="nombre" Type="String" />
                            <asp:Parameter Name="descripcion" Type="String" />
                            <asp:Parameter Name="precio" Type="Int32" />
                            <asp:Parameter Name="duracion" Type="String" />
                            <asp:Parameter Name="estado" Type="String" />
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
                <cc1:TextBoxWatermarkExtender id="TBWEDOB_descripcionServicio" runat="server" targetcontrolid="Tx_descripcionServicio" watermarktext="Descripcion" watermarkcssclass="watermarked"> </cc1:TextBoxWatermarkExtender>
                <cc1:filteredtextboxextender ID="FTBE_descripcionServicio" runat="server" FilterType="Custom, UppercaseLetters, LowercaseLetters" TargetControlID="Tx_descripcionServicio" InvalidChars=" ñ´" />
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
                <cc1:TextBoxWatermarkExtender id="TBWEDOB_duracionServicio" runat="server" targetcontrolid="Tx_duracionServicio" watermarktext="Duracion" watermarkcssclass="watermarked"> </cc1:TextBoxWatermarkExtender>
                <cc1:filteredtextboxextender ID="FTBE_duracionServicio" runat="server" FilterType="Numbers,Custom, UppercaseLetters, LowercaseLetters" TargetControlID="Tx_duracionServicio" InvalidChars=" ñ´:" />
        </tr>
        <tr>
            <td class="auto-style8">
                <asp:Label ID="desactivar" runat="server" Text="Label"></asp:Label>
            </td>
            <td class="auto-style9">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style8">&nbsp;</td>
            <td class="auto-style25"><asp:ImageButton ID="IB_GuardarServicio" runat="server" Height="62px" Width="15%" ValidationGroup="registroServicio" ImageUrl="~/Imagenes/guardar.png" OnClick="IB_GuardarServicio_Click" /></td>
        </tr>
    </table>
</asp:Content>


