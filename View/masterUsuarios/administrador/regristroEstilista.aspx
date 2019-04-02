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
        /*.auto-style11 {
            padding-left:20%;
        }*/
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
        .auto-style16 {
            width: 33%;
            font-size: 160%;
            font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
            padding-bottom: 2%;
            padding-top: 1%;
            color: #000000;
        }
        .auto-style17 {
            width: 100%;
            margin-top: 32px;
        }
        .auto-style18 {
            width: 33%;
            height: 63px;
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
            
            <asp:GridView ID="GV_Estilista" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" PageSize="5" Width="85%" CssClass="auto-style14" ShowHeaderWhenEmpty="True" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="ODS_Estilista" OnSelectedIndexChanged="GV_Estilista_SelectedIndexChanged" >
                <Columns>
                    <asp:TemplateField HeaderText="Documento">
                        <EditItemTemplate>
                            <asp:Label ID="Documento" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Nombre">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("nombre") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("nombre") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Apellido">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("apellido") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("apellido") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Telefono">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("telefono") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("telefono") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Correo">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("correo") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("correo") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Contraseña">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("contrasena") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("contrasena") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Estado">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DDL_AEstado" runat="server" SelectedValue='<%# Bind("estado") %>' Width="100%">
                                <asp:ListItem Value="1">Disponible</asp:ListItem>
                                <asp:ListItem Value="2">No disponible</asp:ListItem>
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("estado") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ShowEditButton="True" />
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
            
            <br />
            
            <asp:ObjectDataSource ID="ODS_Estilista" runat="server" SelectMethod="mostrarEstilista" TypeName="DAORegistroEstilista" UpdateMethod="modificarEstilista">
                <UpdateParameters>
                    <asp:Parameter Name="nombre" Type="String" />
                    <asp:Parameter Name="apellido" Type="String" />
                    <asp:Parameter Name="telefono" Type="Int32" />
                    <asp:Parameter Name="correo" Type="String" />
                    <asp:Parameter Name="contrasena" Type="String" />
                    <asp:Parameter Name="estado" Type="String" />
                    <asp:Parameter Name="id" Type="Int32" />
                </UpdateParameters>
            </asp:ObjectDataSource>
            
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
        <td class="auto-style8"><asp:TextBox ID="Tx_NombreEstilista" runat="server" BorderColor="#0099FF" Width="95%" Height="25px" ValidationGroup="registroEstilista" OnTextChanged="Tx_NombreEstilista_TextChanged"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RFV_INombreEstilista" runat="server" ControlToValidate="Tx_NombreEstilista" ErrorMessage="(*)" ForeColor="Red" ValidationGroup="registroEstilista" SetFocusOnError="True"></asp:RequiredFieldValidator>
        </td>
        <cc1:TextBoxWatermarkExtender id="TBWEDOB_NombreEstilista" runat="server" targetcontrolid="Tx_NombreEstilista" watermarktext="Nombre" watermarkcssclass="watermarked"> </cc1:TextBoxWatermarkExtender>
        <cc1:filteredtextboxextender ID="FTBE_NombreEstilista" runat="server" FilterType="Custom, UppercaseLetters, LowercaseLetters" ValidChars="ñ" TargetControlID="Tx_NombreEstilista" />
        <td class="auto-style8"><asp:TextBox ID="Tx_ApellidoEstilista" runat="server" BorderColor="#0099FF" Width="95%" Height="25px"  ValidationGroup="registroEstilista"></asp:TextBox>
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
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Tx_CorreoEstilista" ErrorMessage="(*)" ForeColor="Red" ValidationGroup="registroEstilista"></asp:RequiredFieldValidator>
        </td>
         <%--<cc1:TextBoxWatermarkExtender id="TBWEDOB_Tx_CorreoEstilista" runat="server" targetcontrolid="Tx_CorreoEstilista" watermarktext="Correo" watermarkcssclass="watermarked"> </cc1:TextBoxWatermarkExtender>--%>
         <cc1:filteredtextboxextender ID="FTBE_CorreoEstilista" runat="server" FilterType="Numbers,LowercaseLetters, UppercaseLetters, Custom" ValidChars=" _-ñ@." TargetControlID="Tx_CorreoEstilista" />
        <td class="auto-style10">
            <br />
            <asp:Label ID="L_servicio" runat="server" class="auto-style8" Text="Servicio"></asp:Label>
            <br />
            <asp:DropDownList ID="DDL_servicio" runat="server" DataSourceID="ODS_Servicio" DataTextField="nombre" DataValueField="id" Height="25px" Width="95%" ValidationGroup="registroEstilista">
            </asp:DropDownList>
            <br />
            <asp:RequiredFieldValidator ID="RFV_servicio" runat="server" ControlToValidate="DDL_servicio" ErrorMessage="Registre el servicio (*)" ForeColor="#CC0000" InitialValue="&quot; &quot;"></asp:RequiredFieldValidator>
            <asp:ObjectDataSource ID="ODS_Servicio" runat="server" SelectMethod="obtenerServicio" TypeName="DAORegistroEstilista"></asp:ObjectDataSource>
            <br />
        </td>
    </tr>
    <tr>
        <td class="auto-style18"><asp:TextBox ID="Tx_ContraseñaEstilista" runat="server" BorderColor="#0099FF" Width="95%" Height="25px" ValidationGroup="registroEstilista"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RFV_IContraseñaEstilista" runat="server" ControlToValidate="Tx_ContraseñaEstilista" ErrorMessage="(*)" ForeColor="Red" ValidationGroup="registroEstilista" SetFocusOnError="True"></asp:RequiredFieldValidator>     
        </td>
         <cc1:TextBoxWatermarkExtender id="TBWEDOB_Tx_ContraseñaEstilista" runat="server" targetcontrolid="Tx_ContraseñaEstilista" watermarktext="Contraseña" watermarkcssclass="watermarked"> </cc1:TextBoxWatermarkExtender>
        <cc1:filteredtextboxextender ID="FTBE_ContraseñaEstilista" runat="server" FilterType="Numbers,LowercaseLetters, UppercaseLetters, Custom" ValidChars=" _-ñ" TargetControlID="Tx_ContraseñaEstilista" />
        <td class="auto-style18"></td>
        <td class="auto-style18"><asp:ImageButton ID="IB_GuardarEstilista" runat="server" Height="50px" Width="15%" ValidationGroup="registroEstilista" ImageUrl="~/Imagenes/guardar.png" OnClick="IB_GuardarEstilista_Click" />
        </td>
    </tr>
    <tr>
        <td colspan="3">
            <table class="auto-style17">
                <tr>
                    <td class="auto-style16" colspan="2"><strong>REGISTRAR UN SERVICIO ADICIONAL AL ESTILISTA</strong></td>
                </tr>
                <tr>
                    <td  class="auto-style14">Eliga el documento del estilista</td>
                    <td  class="auto-style14">Eliga servicio adicional </td>
                </tr>
                <tr>
                    <td>
                        <asp:DropDownList ID="DDL_estilistas" runat="server" Height="25px" Width="96%" DataSourceID="ODS_Estilista2" DataTextField="id" DataValueField="id" ValidationGroup="Adicional">
                        </asp:DropDownList>
                        <asp:ObjectDataSource ID="ODS_Estilista2" runat="server" SelectMethod="mostrarEstilista" TypeName="DAORegistroEstilista"></asp:ObjectDataSource>
                    </td>
                    <td>
                        <asp:DropDownList ID="DDL_Aservicio" runat="server" Height="25px" Width="96%" DataSourceID="ODS_Servicio2" DataTextField="nombre" DataValueField="id" ValidationGroup="Adicional">
                        </asp:DropDownList>
                        <asp:ObjectDataSource ID="ODS_Servicio2" runat="server" SelectMethod="obtenerServicio" TypeName="DAORegistroEstilista"></asp:ObjectDataSource>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        <asp:ImageButton ID="IB_ServicioAdicional" runat="server" Height="50px" ImageUrl="~/Imagenes/guardar.png" ValidationGroup="Adicional" Width="10%" OnClick="IB_ServicioAdicional_Click" />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
</asp:Content>

