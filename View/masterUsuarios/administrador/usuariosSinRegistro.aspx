<%@ Page Title="" Language="C#" MasterPageFile="~/View/masterUsuarios/masterUsuarios.master" AutoEventWireup="true" CodeFile="~/Controller/masterUsuarios/administrador/usuariosSinRegistro.aspx.cs" Inherits="View_masterUsuarios_administrador_usuariosSinRegistro" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
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
            padding-left: 20%;
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
            font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
            font-size: 160%;
            height: 120px;
        }

        .modalBackground {
            background-color: black;
            filter: alpha(opacity=60);
            opacity: 0.6;
        }

        .botones {
            padding-left: 60%;
        }

        .botones2 {
            padding-left: 90%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table class="auto-style1">
        <tr>
            <td class="auto-style10">CITAS</td>
            <td class="auto-style9">
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <div class="auto-style11">
                    <asp:GridView ID="GV_Estilista" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" PageSize="5" Width="80%" CssClass="auto-style14" ShowHeaderWhenEmpty="True" AllowPaging="True" Style="font-size: 120%; font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif">
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
            <td class="auto-style15" colspan="2">REGISTRAR CITA</td>
        </tr>
        <tr>
            <td class="auto-style13">Cedula del cliente
            </td>
            <td class="auto-style13">Nombre del cliente
            </td>
        </tr>
        <tr>
            <td class="auto-style8">
                <asp:TextBox ID="Tx_cedula" runat="server" BorderColor="#0099FF" Width="95%" Height="25px" MaxLength="10"></asp:TextBox>
                <cc1:FilteredTextBoxExtender ID="FTBE_cedula" runat="server" FilterType="Numbers" TargetControlID="Tx_cedula" />
                <asp:RequiredFieldValidator ID="RFV_Cedula" runat="server" ControlToValidate="Tx_cedula" ErrorMessage="(*)" ForeColor="Red" ValidationGroup="registroClienteSin" SetFocusOnError="True"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style8">
                <asp:TextBox ID="Tx_nombre" runat="server" BorderColor="#0099FF" Width="95%" Height="25px"></asp:TextBox>
                <cc1:FilteredTextBoxExtender ID="FTBE_nombre" runat="server" FilterType="LowercaseLetters, UppercaseLetters, Custom" ValidChars=" ñ" TargetControlID="Tx_nombre" />
                <asp:RequiredFieldValidator ID="RFV_Nombre" runat="server" ControlToValidate="Tx_nombre" ErrorMessage="(*)" ForeColor="Red" ValidationGroup="registroClienteSin" SetFocusOnError="True"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="L_ErrorCedula" runat="server" CssClass="auto-style32" Font-Size="100%" ForeColor="Red" Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style13">Servicio
            </td>
            <td class="auto-style13">Estilista
            </td>
        </tr>
        <tr>
            <td class="auto-style8">
                <asp:DropDownList ID="DDL_Servicio" runat="server" Height="25px" Width="95%" DataSourceID="ODS_Servicio2" DataTextField="nombre_servicio" DataValueField="id" OnDataBound="DDL_Servicio_DataBound" OnSelectedIndexChanged="DDL_Servicio_SelectedIndexChanged" AutoPostBack="True">
                </asp:DropDownList>
                <asp:ObjectDataSource ID="ODS_Servicio2" runat="server" SelectMethod="mostrarServicio" TypeName="DAO_Reserva"></asp:ObjectDataSource>
                <asp:RequiredFieldValidator ID="RFV_Servicio" runat="server" ControlToValidate="DDL_Servicio" ErrorMessage="(*)" ForeColor="Red" ValidationGroup="registroClienteSin" SetFocusOnError="True"></asp:RequiredFieldValidator>
            </td>

            <td class="auto-style8">
                <asp:DropDownList ID="DDL_NombreEstilista" runat="server" Height="25px" Width="95%" DataSourceID="ODS_Estilistas2" DataTextField="nombre_estilista" DataValueField="id">
                </asp:DropDownList>
                <asp:ObjectDataSource ID="ODS_Estilistas2" runat="server" SelectMethod="mostrarEstilistas" TypeName="DAO_Reserva">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DDL_Servicio" DefaultValue="0" Name="id_servicio" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:RequiredFieldValidator ID="RFV_NombreEstilista" runat="server" ControlToValidate="DDL_NombreEstilista" ErrorMessage="(*)" ForeColor="Red" ValidationGroup="registroClienteSin" SetFocusOnError="True"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style13">Precio del servicio
            </td>
            <td class="auto-style13">Duracion del servicio
            </td>
        </tr>
        <tr>
            <td class="auto-style12">
                <asp:UpdatePanel ID="UP_Precio" runat="server">
                    <ContentTemplate>
                        <asp:Label ID="LB_Precio" runat="server" CssClass="auto-style47"></asp:Label>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="DDL_Servicio" EventName="SelectedIndexChanged" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
            <td class="auto-style8">
                <asp:UpdatePanel ID="UP_Duracion" runat="server">
                    <ContentTemplate>
                        <asp:Label ID="L_Duracion" runat="server" Text="" CssClass="auto-style47"></asp:Label>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="DDL_Servicio" EventName="SelectedIndexChanged" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td class="auto-style13">fecha
            </td>
            <td class="auto-style13">Hora
            </td>
        </tr>
        <tr>
            <td class="auto-style12">
                <asp:Label ID="LB_FechaSistema" runat="server" CssClass="auto-style11"></asp:Label>
            </td>
            <td class="auto-style8">
                <asp:DropDownList ID="DDL_HoraCliente" runat="server" Height="25px" Width="95%" DataSourceID="ODS_Horas" DataTextField="horario_estilista" DataValueField="id">
                </asp:DropDownList>
                <asp:ObjectDataSource ID="ODS_Horas" runat="server" SelectMethod="mostrarHorarios2" TypeName="DAO_Reserva">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DDL_NombreEstilista" DefaultValue="0" Name="id_estilista" PropertyName="SelectedValue" Type="Int32" />
                        <asp:ControlParameter ControlID="LB_FechaSistema" DefaultValue="0" Name="hora_inicio" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="DDL_Servicio" DefaultValue="0" Name="id_servicio" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:RequiredFieldValidator ID="RFV_HoraCliente" runat="server" ControlToValidate="DDL_HoraCliente" ErrorMessage="(*)" ForeColor="Red" ValidationGroup="registroClienteSin" SetFocusOnError="True"></asp:RequiredFieldValidator>
            </td>
        </tr>

        <tr>
            <td class="auto-style8">&nbsp;</td>
            <td class="auto-style12">
                <asp:ImageButton ID="IB_GuardarClienteSin" runat="server" Height="62px" Width="15%" ValidationGroup="registroClienteSin" ImageUrl="~/Imagenes/guardar.png" OnClick="IB_GuardarClienteSin_Click" /></td>
        </tr>
    </table>

    <cc1:ModalPopupExtender ID="MPE_confirmarReserva" runat="server" PopupControlID="P_confirmarReserva" CancelControlID="BT_Cancelar" TargetControlID="L_Target" BackgroundCssClass="modalBackground"></cc1:ModalPopupExtender>
    <asp:Label ID="L_Target" runat="server" Text=""></asp:Label>
    <asp:Panel ID="P_confirmarReserva" runat="server" Width="40%">
        <div class="alert alert-info" role="alert" style="width: 100%">
            <h4 class="alert-heading">RESERVAR</h4>
            <div>

                <table class="w-100">
                    <tr>
                        <td>Cliente</td>
                        <td>
                            <asp:Label ID="L_Cliente" runat="server" CssClass="auto-style43"></asp:Label><br />
                        </td>
                    </tr>
                    <tr>
                        <td>Cedula</td>
                        <td>
                            <asp:Label ID="L_Cedula" runat="server" CssClass="auto-style43"></asp:Label><br />
                        </td>
                    </tr>
                    <tr>
                        <td>Servicio</td>
                        <td>
                            <asp:Label ID="L_servicioPanel" runat="server" CssClass="auto-style43"></asp:Label><br />
                        </td>
                    </tr>
                    <tr>
                        <td>Estilista</td>
                        <td>
                            <asp:Label ID="L_estilistaPanel" runat="server" CssClass="auto-style43"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>Fecha</td>
                        <td>
                            <asp:Label ID="L_fechaPanel" runat="server" CssClass="auto-style43"></asp:Label></td>
                    </tr>
                    <tr>
                        <td class="auto-style48">Hora</td>
                        <td class="auto-style48">
                            <asp:Label ID="L_horaPanel" runat="server" CssClass="auto-style43"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>Valor del servicio</td>
                        <td>
                            <asp:Label ID="L_PrecioM" runat="server" CssClass="auto-style43"></asp:Label></td>
                    </tr>
                </table>

            </div>
            <hr>
            <div class="botones">
                <asp:Button ID="BT_Reservar" runat="server" Text="Reservar" class="btn btn-outline-success" OnClick="BT_Reservar_Click" />
                <asp:Button ID="BT_Cancelar" runat="server" Text="Cancelar" class="btn btn-outline-primary" />
                <%--OnClick="BT_Reservar_Click"--%>
            </div>
        </div>
    </asp:Panel>
    <cc1:ModalPopupExtender ID="MPE_ReservaExitosa" runat="server" PopupControlID="P_ReservaExit" TargetControlID="LB_target2" BackgroundCssClass="modalBackground"></cc1:ModalPopupExtender>
    <asp:Label ID="LB_target2" runat="server" Text=""></asp:Label>
    <asp:Panel ID="P_ReservaExit" runat="server" Width="40%">
        <div class="alert alert-info" role="alert" style="width: 100%">
            <h4 class="alert-heading">Su reserva se guardó con éxito</h4>
            <hr>
            <div class="botones">
                <asp:Button ID="BT_Aceptar" runat="server" Text="Aceptar" class="btn btn-outline-success" OnClick="BT_Aceptar_Click" />
            </div>
        </div>
    </asp:Panel>
</asp:Content>

