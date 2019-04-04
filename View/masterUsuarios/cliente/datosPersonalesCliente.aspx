<%@ Page Title="" Language="C#" MasterPageFile="~/View/masterUsuarios/masterUsuarios.master" AutoEventWireup="true" CodeFile="~/Controller/masterUsuarios/cliente/datosPersonalesCliente.aspx.cs" Inherits="View_masterUsuarios_cliente_datosPersonalesCliente" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  
    <style type="text/css">
        .auto-style9 {
            width: 50%;
        }
        .auto-style10 {
            width: 50%;
            padding-top:0.5%;
            padding-bottom:0.5%;
        }
        .imgCli{
            width:70%;
            height:150px;
            margin:1%;
            object-fit:cover;
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
        
        .tablaCli{
           padding-left:5%;
           padding-right:5%;
        }
        .auto-style8 {
            font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
            font-size: 158%;
        }
        .auto-style17 {
            font-size: 140%;
            font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
        }
        .auto-style18 {
            font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
        }
        .auto-style20 {
            width: 50%;
            padding-top: 0.5%;
            padding-bottom: 0.5%;
            font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
        }
        .auto-style21 {
            font-family: Verdana, Geneva, Tahoma, sans-serif;
        }
        .auto-style22 {
            font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
            font-size: 110%;
        }
        .auto-style23 {
            font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
            font-size: 90%;
        }

        .modalBackground{
            background-color: black;
            filter: alpha(opacity=60);
            opacity: 0.6;
        }

        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      
    <table class="tablaCli">
        <tr>
            <td class="auto-style9">
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
            </td>
            <td class="auto-style10">
                <asp:GridView ID="GV_alertaCliente" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" CssClass="auto-style14" PageSize="1" ShowHeaderWhenEmpty="True" Width="30%" DataKeyNames="id" DataSourceID="ODS_Alerta" style="margin-left: 0px" OnSelectedIndexChanged="GV_alertaCliente_SelectedIndexChanged">
                    <Columns>
                        <asp:BoundField DataField="descripcion" HeaderText="Alerta" />
                        <asp:BoundField DataField="servicio" HeaderText="servico" />
                        <asp:BoundField DataField="apellido_estilista" HeaderText="Estilista" />
                        <asp:CommandField DeleteText="Aceptar" ShowDeleteButton="True" />
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
                <asp:ObjectDataSource ID="ODS_Alerta" runat="server" SelectMethod="Alerta" TypeName="DAOCliente" DeleteMethod="eliminarAlerta">
                    <DeleteParameters>
                        <asp:Parameter Name="id" Type="Int32" />
                    </DeleteParameters>
                    <SelectParameters>
                        <asp:SessionParameter DefaultValue="id" Name="id" SessionField="user_id" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td class="auto-style9">
                <asp:Image ID="Image1" runat="server" class="imgCli" ImageUrl="~/Imagenes/cliente/datosPersonales.jpg"/>
            </td>
            <td class="auto-style10">
                <strong>
                <asp:Label ID="L_Bienvenida" runat="server" CssClass="auto-style8" ForeColor="#018BDE"></asp:Label>
                </strong>
            </td>
        </tr>
        <tr>
            <td class="auto-style18"><strong><span class="auto-style17">DATOS PERSONALES</span></strong></td>
            <td class="auto-style20">&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="P_Alerta" runat="server" Visible="False">
                    <div class="alert alert-warning" role="alert">
                        <asp:Label ID="L_Alerta" runat="server">
                        </asp:Label>
                    </div>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:FormView ID="FV_MostrarCliente" runat="server" DataSourceID="ODS_mostrarCliente" Width="100%">
                    <ItemTemplate>
                        <table class="auto-style1">
                           
                              <tr>
                                <td class="auto-style12">Nombre</td>
                                <td class="auto-style12">Apellido</td>
                             </tr>
                             <tr>
                                <td class="auto-style9"><asp:TextBox ID="Tx_ClienteNombre" runat="server" BorderColor="#0099FF" Width="95%" Height="25px" Text='<%# Bind("nombre") %>' CssClass="auto-style21"></asp:TextBox></td>
                                <cc1:filteredtextboxextender ID="FTBE_ClienteNombre" runat="server" FilterType="LowercaseLetters, UppercaseLetters, Custom" ValidChars=" ñ" TargetControlID="Tx_ClienteNombre" />
                                <td class="auto-style9"><asp:TextBox ID="Tx_ClienteApellido" runat="server" BorderColor="#0099FF" Width="95%" Height="25px" Text='<%# Bind("apellido") %>' CssClass="auto-style21"></asp:TextBox></td>
                                <cc1:filteredtextboxextender ID="FTBE_ClienteApellido" runat="server" FilterType="LowercaseLetters, UppercaseLetters, Custom" ValidChars=" ñ" TargetControlID="Tx_ClienteApellido" />
        
                             </tr>
                             <tr>
                                <td class="auto-style12">Teléfono</td>
                                <td class="auto-style12">Correo</td>
                             </tr>
                             <tr>
                                <td class="auto-style9"><asp:TextBox ID="Tx_ClienteTelefono" runat="server" BorderColor="#0099FF" Width="95%" Height="25px" Text='<%# Bind("telefono") %>' CssClass="auto-style21" MaxLength="10"></asp:TextBox></td>
                                <cc1:filteredtextboxextender ID="FTBE_ClienteTelefono" runat="server" FilterType="Numbers" TargetControlID="Tx_ClienteTelefono" />
                                <td class="auto-style9"><asp:TextBox ID="Tx_ClienteCorreo" runat="server" BorderColor="#0099FF" Width="95%" Height="25px" Text='<%# Bind("correo") %>' CssClass="auto-style21"></asp:TextBox></td>
                                <cc1:filteredtextboxextender ID="FTBE_ClienteCorreo" runat="server" FilterType="Numbers,LowercaseLetters, UppercaseLetters, Custom" ValidChars="_-ñ@." TargetControlID="Tx_ClienteCorreo" />
        
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:FormView>
                <asp:ObjectDataSource ID="ODS_mostrarCliente" runat="server" SelectMethod="mostrarCliente" TypeName="DAOCliente">
                    <SelectParameters>
                        <asp:SessionParameter Name="id" SessionField="user_id" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
        

       
        <tr>
            <td class="auto-style9">
                &nbsp;</td>
            <td class="auto-style10"><asp:Button ID="BT_GuardarCliente" runat="server" Text="Guardar cambios" BorderColor="#0099FF" Font-Bold="True" Font-Size="86%" Height="30px" Width="96%" OnClick="BT_GuardarCliente_Click" /></td>
        </tr>
        <tr>
            <td class="auto-style16"><strong>CAMBIAR CONTRASEÑA</strong></td>
            <td class="auto-style10">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style12">Contraseña actual
            <asp:RequiredFieldValidator ID="RFV_ContrasenaActual" runat="server" ControlToValidate="Tx_ContraseñaActual" ErrorMessage="(*)" Font-Size="90%" ForeColor="Red" ValidationGroup="VG_AContraseña" SetFocusOnError="True"></asp:RequiredFieldValidator>
            
            </td>
            <td class="auto-style12">Contraseña nueva
            <asp:RequiredFieldValidator ID="RFV_ContrasenaNueva" runat="server" ControlToValidate="Tx_ContraseñaNueva" ErrorMessage="(*)" Font-Size="90%" ForeColor="Red" ValidationGroup="VG_AContraseña" SetFocusOnError="True"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td class="auto-style9">
                <asp:TextBox ID="Tx_ContraseñaActual" runat="server" BorderColor="#0099FF" Width="95%" Height="25px"></asp:TextBox>
                <cc1:filteredtextboxextender ID="FTBE_ContraseñaActual" runat="server" FilterType="Numbers,LowercaseLetters, UppercaseLetters, Custom" ValidChars="_-ñ@." TargetControlID="Tx_ContraseñaActual" />
        
            </td>
            <td class="auto-style9">
                <asp:TextBox ID="Tx_ContraseñaNueva" runat="server" BorderColor="#0099FF" Width="95%" Height="25px"></asp:TextBox>
                <cc1:filteredtextboxextender ID="FTBE_ContraseñaNueva" runat="server" FilterType="Numbers,LowercaseLetters, UppercaseLetters, Custom" ValidChars="_-ñ@." TargetControlID="Tx_ContraseñaNueva" />
            </td>
           
        </tr>
        <tr>
            <td class="auto-style9">

                <asp:Label ID="LB_ErrorContraseña" runat="server" ForeColor="Red" CssClass="auto-style22"></asp:Label>

             </td>
            <td class="auto-style10">
                <asp:Button ID="BT_GuardarContraCliente" runat="server" Text="Guardar cambios" BorderColor="#0099FF" Font-Bold="True" Font-Size="86%" Height="30px" Width="96%" ValidationGroup="VG_AContraseña" OnClick="BT_GuardarContraCliente_Click" />

            </td>
        </tr>
        <tr>
            <td class="auto-style16"><strong>ELIMINAR CUENTA</strong></td>
            <td class="auto-style10">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style12">Ingrese su contraseña
            <asp:RequiredFieldValidator ID="RFV_eliminarCuenta" runat="server" ControlToValidate="Tx_EliminarCuenta" ErrorMessage="(*)" Font-Size="90%" ForeColor="Red" ValidationGroup="VG_EliminarCuenta" SetFocusOnError="True">

            </asp:RequiredFieldValidator>

                <asp:Label ID="LB_ErrorEliminar" runat="server" ForeColor="Red" CssClass="auto-style23"></asp:Label>

            </td>
           
        </tr>
        <tr>
            <td class="auto-style9">
                <asp:TextBox ID="Tx_EliminarCuenta" runat="server" BorderColor="#0099FF" Width="95%" Height="25px"></asp:TextBox>
                <cc1:filteredtextboxextender ID="FTBE_EliminarCuenta" runat="server" FilterType="Numbers,LowercaseLetters, UppercaseLetters, Custom" ValidChars="_-ñ@." TargetControlID="Tx_EliminarCuenta" />
        
            </td>
             <td>
                <asp:Button ID="BT_EliminarCuenta" runat="server" Text="Eliminar Cuenta" BorderColor="#0099FF" Font-Bold="True" Font-Size="86%" Height="30px" Width="96%" ValidationGroup="VG_EliminarCuenta" OnClick="BT_EliminarCuenta_Click" />
            </td>
        </tr>
    </table>

    <cc1:ModalPopupExtender ID="MPE_EliminarCuenta" runat="server" PopupControlID="P_eliminarCuenta" CancelControlID="BT_Cancelar" TargetControlID="L_Target" BackgroundCssClass="modalBackground"></cc1:ModalPopupExtender>
    <asp:Label ID="L_Target" runat="server" Text=""></asp:Label>
    <asp:Panel ID="P_eliminarCuenta" runat="server">
        <div class="alert alert-primary" role="alert" style=" width: 80% " >
          <h4 class="alert-heading">Eliminar Cuenta</h4>
          <p>¿Está seguro de que quiere eliminar la cuenta.?</p>
          <hr>
           <asp:Button ID="BT_Eliminar" runat="server" Text="Eliminar"  class="btn btn-danger" OnClick ="eliminarCuenta" />
           <asp:Button ID="BT_Cancelar" runat="server" Text="Cancelar"  class="btn btn-primary"/>
        </div>
    </asp:Panel>
</asp:Content>


