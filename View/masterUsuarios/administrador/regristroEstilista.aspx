<%@ Page Title="" Language="C#" MasterPageFile="~/View/masterUsuarios/masterUsuarios.master" AutoEventWireup="true" CodeFile="~/Controller/masterUsuarios/administrador/regristroEstilista.aspx.cs" Inherits="View_masterUsuarios_administrador_regristroEstilista" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        /*.auto-style11 {
            padding-left:20%;
        }*/
        .auto-style12 {
            width: 33%;
            font-size: 160%;
            font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
            padding-bottom: 2%;
            padding-top: 1%;
            height: 58px;
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
            height: 8px;
        }

        .auto-style19 {
            height: 105px;
        }

        .auto-style20 {
            width: 100%;
            margin-bottom: 0px;
        }

        .auto-style22 {
            height: 58px;
        }

        .auto-style23 {
            width: 33%;
            height: 78px;
        }

        .auto-style24 {
            width: 33%;
            height: 71px;
        }

        .auto-style25 {
            font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
            font-size: 120%;
            width: 774px;
        }

        .auto-style26 {
            width: 774px;
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

        .gridRang {
            width: 30%;
            /*padding-left: 5%;*/
        }

        .DDL_HORAS {
            width: 50%;
        }

        .check {
            width: 20%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table class="auto-style1">
        <tr>
            <td colspan="3" class="auto-style13"><strong>ESTILISTAS</strong> </td>
        </tr>
        <tr>
            <td colspan="3" class="auto-style11">

                <asp:GridView ID="GV_Estilista" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" PageSize="5" Width="85%" CssClass="auto-style14" ShowHeaderWhenEmpty="True" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="ODS_Estilista" OnSelectedIndexChanged="GV_Estilista_SelectedIndexChanged" OnRowDataBound="GV_Estilista_RowDataBound" OnDataBound="GV_Estilista_DataBound">
                    <Columns>
                        <asp:TemplateField HeaderText="Documento">
                            <EditItemTemplate>
                                <asp:Label ID="Documento" runat="server" Text='<%# Bind("id") %>' Width="100%"></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label7" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Nombre">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("nombre") %>' Width="100%"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("nombre") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Apellido">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("apellido") %>' Width="100%"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("apellido") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Telefono">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("telefono") %>' Width="100%"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("telefono") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Correo">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("correo") %>' Width="100%"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("correo") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Contraseña">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("contrasena") %>' Width="100%"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("contrasena") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Estado">
                            <EditItemTemplate>
                                <asp:DropDownList ID="DDL_AEstado" runat="server" SelectedValue='<%# Bind("estado") %>' Width="100%">
                                    <asp:ListItem Value="1">Activo</asp:ListItem>
                                    <asp:ListItem Value="2">Despedido</asp:ListItem>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="L_Estado" runat="server" Text='<%# Bind("estado")%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False">
                            <EditItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Actualizar"></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar"></asp:LinkButton>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Editar"></asp:LinkButton>
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
            <td colspan="2" class="auto-style22">
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
            </td>
        </tr>
        <tr>
            <td class="auto-style23">
                <asp:TextBox ID="Tx_CodigoEstilista" runat="server" BorderColor="#0099FF" Width="95%" Height="25px" MaxLength="10" ValidationGroup="registroEstilista"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RFV_ICodigoEstilista" runat="server" ControlToValidate="Tx_CodigoEstilista" ErrorMessage="(*)" ForeColor="Red" ValidationGroup="registroEstilista" SetFocusOnError="True"></asp:RequiredFieldValidator>
                <asp:Label ID="L_cedula" runat="server" ForeColor="Red" Visible="False"></asp:Label>
            </td>
            <cc1:TextBoxWatermarkExtender ID="TBWEDOB_codigoEstilista" runat="server" TargetControlID="Tx_CodigoEstilista" WatermarkText="Cedula" WatermarkCssClass="watermarked"></cc1:TextBoxWatermarkExtender>
            <cc1:FilteredTextBoxExtender ID="FTBE_CodigoEstilista" runat="server" FilterType="Numbers" TargetControlID="Tx_CodigoEstilista" />
            <td class="auto-style23">
                <asp:TextBox ID="Tx_NombreEstilista" runat="server" BorderColor="#0099FF" Width="95%" Height="25px" ValidationGroup="registroEstilista" OnTextChanged="Tx_NombreEstilista_TextChanged"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RFV_INombreEstilista" runat="server" ControlToValidate="Tx_NombreEstilista" ErrorMessage="(*)" ForeColor="Red" ValidationGroup="registroEstilista" SetFocusOnError="True"></asp:RequiredFieldValidator>
                <asp:Label ID="LB_Nombre" runat="server" ForeColor="Red" Text="" Visible="False"></asp:Label>
            </td>
            <cc1:TextBoxWatermarkExtender ID="TBWEDOB_NombreEstilista" runat="server" TargetControlID="Tx_NombreEstilista" WatermarkText="Nombre" WatermarkCssClass="watermarked"></cc1:TextBoxWatermarkExtender>
            <cc1:FilteredTextBoxExtender ID="FTBE_NombreEstilista" runat="server" FilterType="Custom, UppercaseLetters, LowercaseLetters" ValidChars="ñ" TargetControlID="Tx_NombreEstilista" />
            <td class="auto-style23">
                <asp:TextBox ID="Tx_ApellidoEstilista" runat="server" BorderColor="#0099FF" Width="95%" Height="25px" ValidationGroup="registroEstilista"></asp:TextBox>
                <cc1:TextBoxWatermarkExtender ID="TBWEDOB_ApellidoEstilista" runat="server" TargetControlID="Tx_ApellidoEstilista" WatermarkText="Apellido" WatermarkCssClass="watermarked"></cc1:TextBoxWatermarkExtender>
                <cc1:FilteredTextBoxExtender ID="FTBE_ApellidoEstilista" runat="server" FilterType="Custom, UppercaseLetters, LowercaseLetters" ValidChars="ñ" TargetControlID="Tx_ApellidoEstilista" />
                <asp:RequiredFieldValidator ID="RFV_IApellidoEstilista" runat="server" ControlToValidate="Tx_ApellidoEstilista" ErrorMessage="(*)" ForeColor="Red" ValidationGroup="registroEstilista" SetFocusOnError="True"></asp:RequiredFieldValidator>
                <asp:Label ID="LB_apellido" runat="server" ForeColor="Red" Text="" Visible="False"></asp:Label>
            </td>

        </tr>
        <tr>
            <td class="auto-style24">
                <asp:TextBox ID="Tx_TelefonoEstilista" runat="server" BorderColor="#0099FF" Width="95%" Height="25px" ValidationGroup="registroEstilista"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RFV_ITelefonoEstilista" runat="server" ControlToValidate="Tx_TelefonoEstilista" ErrorMessage="(*)" ForeColor="Red" ValidationGroup="registroEstilista" SetFocusOnError="True"></asp:RequiredFieldValidator>
                <asp:Label ID="LB_Telefono" runat="server" ForeColor="Red" Text="" Visible="False"></asp:Label>
            </td>
            <cc1:TextBoxWatermarkExtender ID="TBWEDOB_TelefonoEstilista" runat="server" TargetControlID="Tx_TelefonoEstilista" WatermarkText="Telefono" WatermarkCssClass="watermarked"></cc1:TextBoxWatermarkExtender>
            <cc1:FilteredTextBoxExtender ID="FTBE_TelefonoEstilista" runat="server" FilterType="Numbers" TargetControlID="Tx_TelefonoEstilista" />
            <td class="auto-style24">
                <asp:TextBox ID="Tx_CorreoEstilista" runat="server" BorderColor="#0099FF" Width="95%" Height="25px" TextMode="Email" ValidationGroup="registroEstilista" MaxLength="50"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Tx_CorreoEstilista" ErrorMessage="(*)" ForeColor="Red" ValidationGroup="registroEstilista"></asp:RequiredFieldValidator>
                <asp:Label ID="L_correo" runat="server" ForeColor="Red" Visible="False"></asp:Label>
            </td>
            <cc1:TextBoxWatermarkExtender id="TBWEDOB_Tx_CorreoEstilista" runat="server" targetcontrolid="Tx_CorreoEstilista" watermarktext="Correo" watermarkcssclass="watermarked"> </cc1:TextBoxWatermarkExtender>
            <cc1:FilteredTextBoxExtender ID="FTBE_CorreoEstilista" runat="server" FilterType="Numbers, LowercaseLetters, Custom" ValidChars =".@" TargetControlID="Tx_CorreoEstilista" />
            <td class="auto-style24">
                <asp:DropDownList ID="DDL_servicio" runat="server" DataSourceID="ODS_Servicio" DataTextField="nombre" DataValueField="id" Height="25px" Width="95%" ValidationGroup="registroEstilista">
                    <asp:ListItem Selected="True">Servicios</asp:ListItem>
                </asp:DropDownList>
                <br />
                <asp:ObjectDataSource ID="ODS_Servicio" runat="server" SelectMethod="obtenerServicio" TypeName="DAORegistroEstilista"></asp:ObjectDataSource>
                <asp:Label ID="L_ServicioR" runat="server" ForeColor="Red" Text="Registre el servicio(*)" Visible="False"></asp:Label>

                <br />
            </td>
        </tr>
        <tr>
            <td class="auto-style18">
                <asp:TextBox ID="Tx_ContraseñaEstilista" runat="server" BorderColor="#0099FF" Width="95%" Height="25px" ValidationGroup="registroEstilista" MaxLength="10"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RFV_IContraseñaEstilista" runat="server" ControlToValidate="Tx_ContraseñaEstilista" ErrorMessage="(*)" ForeColor="Red" ValidationGroup="registroEstilista" SetFocusOnError="True"></asp:RequiredFieldValidator>
                <asp:Label ID="L_ErrorContraseña" runat="server" ForeColor="Red" Visible="False"></asp:Label>
            </td>
            <cc1:TextBoxWatermarkExtender ID="TBWEDOB_Tx_ContraseñaEstilista" runat="server" TargetControlID="Tx_ContraseñaEstilista" WatermarkText="Contraseña" WatermarkCssClass="watermarked"></cc1:TextBoxWatermarkExtender>
            <cc1:FilteredTextBoxExtender ID="FTBE_ContraseñaEstilista" runat="server" FilterType="Numbers,LowercaseLetters, UppercaseLetters, Custom" ValidChars=" _-ñ" TargetControlID="Tx_ContraseñaEstilista" />
            <td class="auto-style18">
                <asp:TextBox ID="Tx_FechaNacimiento" runat="server" BorderColor="#0099FF" Width="95%" Height="25px" ValidationGroup="registroEstilista" TextMode="Date"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RFV_FechaNacimiento" runat="server" ControlToValidate="Tx_FechaNacimiento" ErrorMessage="(*)" ForeColor="Red" ValidationGroup="registroEstilista" SetFocusOnError="True"></asp:RequiredFieldValidator>
                <asp:Label ID="L_ErrorFechaNacimiento" runat="server" ForeColor="Red" Text="" Visible="False"></asp:Label>
            </td>
            <%--<cc1:TextBoxWatermarkExtender id="TBWEDOB_Tx_FechaNacimiento" runat="server" targetcontrolid="Tx_FechaNacimiento" watermarktext="Fecha de Nacimiento" watermarkcssclass="watermarked"> </cc1:TextBoxWatermarkExtender>--%>
            <td class="auto-style18">
                <asp:ImageButton ID="IB_GuardarEstilista" runat="server" Height="50px" Width="15%" ValidationGroup="registroEstilista" ImageUrl="~/Imagenes/guardar.png" OnClick="IB_GuardarEstilista_Click" />
                <br />
                <br />
                <asp:Label ID="LB_Datos" runat="server" ForeColor="Red" Text="LB_Datos" Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <table class="auto-style17">
                    <tr>
                        <td class="auto-style16" colspan="2"><strong>REGISTRAR UN SERVICIO ADICIONAL AL ESTILISTA</strong></td>
                    </tr>
                    <tr>
                        <td class="auto-style25">Eliga el documento del estilista<br />
                            <asp:Label ID="L_REstilista" runat="server" ForeColor="Red" Text="Registre el estilista(*)" Visible="False"></asp:Label>
                        </td>
                        <td class="auto-style14">Eliga servicio adicional<br />
                            <asp:Label ID="L_RServicio" runat="server" ForeColor="Red" Text="Registre el servicio(*)" Visible="False"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style26">
                            <asp:ObjectDataSource ID="ODS_Estilista2" runat="server" SelectMethod="obtenerEstilista" TypeName="DAORegistroEstilista"></asp:ObjectDataSource>
                            <asp:DropDownList ID="DDL_Estilistas" runat="server" DataSourceID="ODS_Estilista2" DataTextField="nombre_estilista" DataValueField="id" Height="25px" ValidationGroup="Adicional" Width="96%">
                            </asp:DropDownList>
                            <br />
                        </td>
                        <td>
                            <asp:DropDownList ID="DDL_Aservicio" runat="server" Height="25px" Width="96%" DataSourceID="ODS_Servicio2" DataTextField="nombre" DataValueField="id" ValidationGroup="Adicional">
                            </asp:DropDownList>
                            <asp:ObjectDataSource ID="ODS_Servicio2" runat="server" SelectMethod="obtenerServicio" TypeName="DAORegistroEstilista"></asp:ObjectDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style26">
                            <table class="auto-style20">
                                <tr>
                                    <td class="auto-style19">
                                        <asp:ImageButton ID="ServicioAd" runat="server" Height="50px" ImageUrl="~/Imagenes/guardar.png" OnClick="ServicioAd_Click" Width="10%" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style16"><strong>ELIMINE SERVICIO A UN ESTILISTA</strong></td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>
                            <asp:GridView ID="GV_EstilistaServicio" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" CssClass="auto-style14" DataKeyNames="id" DataSourceID="ODS_Usuario_Servicio" Width="80%" PageSize="5" OnDataBound="GV_EstilistaServicio_DataBound" OnRowCommand="GV_EstilistaServicio_RowCommand">
                                <Columns>
                                    <asp:BoundField DataField="servicio" HeaderText="Servicio" />
                                    <asp:BoundField DataField="nombre_usuario" HeaderText="Nombre Estilista" />
                                    <asp:BoundField DataField="apellido_usuario" HeaderText="Apelido Estilista" />
                                    <asp:TemplateField ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="Eliminar" runat="server" CommandName="Alerta" Width="100%" CommandArgument='<%# Bind("id") %>'>Eliminar</asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <FooterStyle BackColor="White" ForeColor="#000066" />
                                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                                <RowStyle ForeColor="#000066" />
                                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                <SortedAscendingHeaderStyle BackColor="#007DBB" />
                                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                <SortedDescendingHeaderStyle BackColor="#00547E" />
                            </asp:GridView>
                            <asp:ObjectDataSource ID="ODS_Usuario_Servicio" runat="server" SelectMethod="mostrarUsuario_servicio" TypeName="DAORegistroEstilista"></asp:ObjectDataSource>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>

    <cc1:ModalPopupExtender ID="MPE_rangoHorario" runat="server" PopupControlID="P_rangoHorario" TargetControlID="L_Target" BackgroundCssClass="modalBackground"></cc1:ModalPopupExtender>
            <asp:Label ID="L_Target" runat="server" Text=""></asp:Label>
            <asp:Panel ID="P_rangoHorario" runat="server" Width="60%">
                <div class="alert alert-primary" role="alert" style="width: 100%">
                    <h4 class="alert-heading">HORARIO DE TRABAJO DEL ESTILISTA</h4>
                    <div>
                        <table class="w-100">
                            <tr>
                                <td colspan="3">Estilista :
                                    <asp:Label ID="LB_Estilista" runat="server"></asp:Label>
                                    &nbsp;&nbsp; Cedula de ciudadania:
                                    <asp:Label ID="LB_CedulaM" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3">&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="check">Seleccione los dias 
                            <br />
                                    <br />
                                    <asp:CheckBox ID="CB_Lunes" runat="server" AutoPostBack="True" class="form-check-label" OnCheckedChanged="CB_Lunes_CheckedChanged" Text="Lunes" />
                                    <br />
                                    <asp:CheckBox ID="CB_Martes" runat="server" AutoPostBack="True" OnCheckedChanged="CB_Martes_CheckedChanged" Text="Martes" />
                                    <br />
                                    <asp:CheckBox ID="CB_Miercoles" runat="server" AutoPostBack="True" OnCheckedChanged="CB_Miercoles_CheckedChanged" Text="Miercoles" />
                                    <br />
                                    <asp:CheckBox ID="CB_Jueves" runat="server" AutoPostBack="True" OnCheckedChanged="CB_Jueves_CheckedChanged" Text="Jueves" />
                                    <br />
                                    <asp:CheckBox ID="CB_Viernes" runat="server" AutoPostBack="True" OnCheckedChanged="CB_Viernes_CheckedChanged" Text="Viernes" />
                                    <br />
                                    <asp:CheckBox ID="CB_Sabado" runat="server" AutoPostBack="True" OnCheckedChanged="CB_Sabado_CheckedChanged" Text="Sabado" />
                                    <br />
                                    <asp:CheckBox ID="CB_Domingo" runat="server" AutoPostBack="True" OnCheckedChanged="CB_Domingo_CheckedChanged" Text="Domingo" />
                                    <br />
                                    <asp:Label ID="LB_EDias" runat="server" ForeColor="Red"></asp:Label>
                                </td>
                                <td class="DDL_HORAS">
                                    <asp:Label ID="LB_ERango" runat="server" ForeColor="Red"></asp:Label>
                                    <br />
                                    Hora Inicio
                            <br />
                                    <asp:DropDownList ID="DDL_HoraInicio" runat="server" class="form-control" Width="50%">
                                        <asp:ListItem Value="0">Seleccione Hora</asp:ListItem>
                                        <asp:ListItem Value="8">08:00 a.m</asp:ListItem>
                                        <asp:ListItem Value="9">09:00 a.m</asp:ListItem>
                                        <asp:ListItem Value="10">10:00 a.m</asp:ListItem>
                                        <asp:ListItem Value="11">11:00 a.m</asp:ListItem>
                                        <asp:ListItem Value="12">12:00 p.m</asp:ListItem>
                                        <asp:ListItem Value="13">01:00 p.m</asp:ListItem>
                                        <asp:ListItem Value="14">02:00 p.m</asp:ListItem>
                                        <asp:ListItem Value="15">03:00 p.m</asp:ListItem>
                                        <asp:ListItem Value="16">04:00 p.m</asp:ListItem>
                                        <asp:ListItem Value="17">05:00 p.m</asp:ListItem>
                                    </asp:DropDownList>
                                    Hora Final
                                    <asp:DropDownList ID="DDL_HoraFin" runat="server" class="form-control" Width="50%">
                                        <asp:ListItem Value="0">Seleccione hora </asp:ListItem>
                                        <asp:ListItem Value="8">08:00 a.m</asp:ListItem>
                                        <asp:ListItem Value="9">09:00 a.m</asp:ListItem>
                                        <asp:ListItem Value="10">10:00 a.m</asp:ListItem>
                                        <asp:ListItem Value="11">11:00 a.m</asp:ListItem>
                                        <asp:ListItem Value="12">12:00 p.m</asp:ListItem>
                                        <asp:ListItem Value="13">01:00 p.m</asp:ListItem>
                                        <asp:ListItem Value="14">02:00 p.m</asp:ListItem>
                                        <asp:ListItem Value="15">03:00 p.m</asp:ListItem>
                                        <asp:ListItem Value="16">04:00 p.m</asp:ListItem>
                                        <asp:ListItem Value="17">05:00 p.m</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:Button ID="BT_AgregarRango" runat="server" class="btn btn-outline-primary" OnClick="BT_AgregarRango_Click" Text="Agregar" />
                                </td>
                                <td class="gridRang">
                                    <asp:GridView ID="GV_RangoHorario" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" OnRowCommand="GV_RangoHorario_RowCommand" Width="100%" OnRowDataBound="GV_RangoHorario_RowDataBound">
                                        <FooterStyle BackColor="White" ForeColor="#000066" />
                                        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                                        <RowStyle ForeColor="#000066" />
                                        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                        <SortedAscendingHeaderStyle BackColor="#007DBB" />
                                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                        <SortedDescendingHeaderStyle BackColor="#00547E" />
                                        <Columns>
                                            <asp:TemplateField HeaderText="Hora Inicio">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="Tx_HoraInicio" runat="server" Text='<%# Bind("HoraInicio") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="LB_HoraInicio" runat="server" Text='<%# Bind("HoraInicio") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle Width="150px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Hora Final">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="Tx_HoraFinal" runat="server" Text='<%# Bind("HoraFinal") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="LB_HoraFinal" runat="server" Text='<%# Bind("HoraFinal") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle Width="150px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField ShowHeader="False">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="LB_Eliminar" runat="server" CausesValidation="false" CommandName="" Text="Eliminar"></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <hr>
                        <div class="botones">
                            <asp:Button ID="BT_GuardarAgenda" runat="server" class="btn btn-outline-success" OnClick="BT_GuardarAgenda_Click" Text="Guardar Horario" />
                            <%--  <%--<asp:Button ID="BT_Cancelar" runat="server" Text="Cancelar" class="btn btn-outline-primary" />--%>
                        </div>
                    </hr>
                </div>
            </asp:Panel>



    <cc1:ModalPopupExtender ID="MPE_MasHorarios" runat="server" PopupControlID="P_MasHorarios" TargetControlID="L_target2" BackgroundCssClass="modalBackground"></cc1:ModalPopupExtender>
    <asp:Label ID="L_target2" runat="server" Text=""></asp:Label>
    <asp:Panel ID="P_MasHorarios" runat="server" Width="60%">
        <div class="alert alert-primary" role="alert" style="width: 100%">
            <h4 class="alert-heading">HORARIO DE TRABAJO DEL ESTILISTA</h4>
            <div>

                <asp:Label ID="LB_Mensaje" runat="server"></asp:Label>

            </div>
            <hr>
            <div class="botones">
                <asp:Button ID="BT_Si" runat="server" Text="SI" class="btn btn-outline-success" OnClick="BT_Si_Click" />
                <asp:Button ID="BT_Cancelar" runat="server" Text="NO" class="btn btn-outline-primary" OnClick="BT_Cancelar_Click" />
            </div>
        </div>
    </asp:Panel>



</asp:Content>

