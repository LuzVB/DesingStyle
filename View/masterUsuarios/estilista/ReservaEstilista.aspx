<%@ Page Title="" Language="C#" MasterPageFile="~/View/masterUsuarios/masterUsuarios.master" AutoEventWireup="true" CodeFile="~/Controller/masterUsuarios/estilista/ReservaEstilista.aspx.cs" Inherits="View_masterUsuarios_estilista_ReservaEstilista" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        
        .auto-style14 {
            font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
            font-size: 120%;
            margin-left: 123px;
        }
        
        .auto-style13 {
            font-size: 160%;
            font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
            text-align: center;
            /*width: 449px;*/
        }
        .auto-style31 {
            width: 258px;
        }
       
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <table class="w-100">
        <tr>
            <td class="auto-style13" colspan="2"><span><strong>RESERVAS&nbsp; ASIGNADAS 
                <br />
                </strong>

     <ul class="nav nav-tabs">
        <li class="nav-item">
            <asp:Button ID="BT_Reservas" runat="server" Text="Reservas Asignadas" class="nav-link active" OnClick="BT_Reservas_Click" />
         </li>
         <li class="nav-item">
             <asp:Button ID="BT_Historial" runat="server" Text="Historial" class="nav-link" OnClick="BT_Historial_Click" />
         </li>
     </ul>
                </span>
                <br />
            </td>
        </tr>
    </table>
    <asp:UpdatePanel ID="UP_Reservas" runat="server">
        <ContentTemplate>
            <table class="w-100">
                <tr>
                    <td class="auto-style32">
                        <asp:Calendar ID="C_Reserva" runat="server" CssClass="auto-style31" Height="162px" OnSelectionChanged="C_Reserva_SelectionChanged" Width="241px">
                            <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                            <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                            <OtherMonthDayStyle ForeColor="#999999" />
                            <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                            <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                            <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                            <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                            <WeekendDayStyle BackColor="#CCCCFF" />
                        </asp:Calendar>
                        <asp:ScriptManager ID="ScriptManager2" runat="server">
                        </asp:ScriptManager>
                        <br />
                        <asp:Label ID="Prueba" runat="server" class="alert-heading" Text="[Alerta_Fecha]" Visible="False"></asp:Label>
                        <asp:Label ID="Alerta_Rerva" runat="server" class="alert-heading" Text="Alerta_Rerva" Visible="False"></asp:Label>
                        <br />
                        <br />
                        <asp:UpdatePanel ID="UP_HoraReserva" runat="server" Visible="False" Width="85%">
                            <ContentTemplate>
                                <div class="alert alert-success" role="alert">
                                    <h4 class="alert-heading">Recuerda!</h4>
                                    <p>
                                        <asp:Label ID="Asistencia" runat="server" Text="Label"></asp:Label>
                                    </p>
                                    <hr>
                                    <p class="mb-0">
                                        <asp:Label ID="Alerta" runat="server" Text="Label" Visible="True"></asp:Label>
                                    </p>
                                    </hr>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                    <td>
                        <asp:GridView ID="GridView_ReservasEst" runat="server" AutoGenerateColumns="False" BorderStyle="None" BorderWidth="1px" CellPadding="4" CssClass="auto-style14" DataKeyNames="id" DataSourceID="ODS_RerservasEstilista" ForeColor="#333333" GridLines="None" OnDataBound="GridView_ReservasEst_DataBound" OnRowCommand="GridView_ReservasEst_RowCommand" OnRowDataBound="GridView_ReservasEst_RowDataBound" OnSelectedIndexChanged="GridView_ReservasEst_SelectedIndexChanged" Width="85%">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:TemplateField HeaderText="Servicio">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox13" runat="server" Text='<%# Bind("nombre_servicio") %>' Width="100%"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label9" runat="server" Text='<%# Bind("nombre_servicio") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Hora">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox14" runat="server" Text='<%# Bind("fecha") %>' Width="100%"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Hora" runat="server" Text='<%# Bind("fecha") %>'></asp:Label>
                                        <asp:Label ID="pruebaAsis" runat="server" Text="Prueba" Visible="False"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Nombre Cliente">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox15" runat="server" Text='<%# Bind("nombre_cliente") %>' Width="100%"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label10" runat="server" Text='<%# Bind("nombre_cliente") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Apellido Cliente">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox16" runat="server" Text='<%# Bind("apellido_cliente") %>' Width="100%"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label11" runat="server" Text='<%# Bind("apellido_cliente") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Asistencia">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox17" runat="server" Text='<%# Bind("alerta") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Alerta" runat="server" Text='<%# Bind("alerta") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Asistencia" ShowHeader="False">
                                    <EditItemTemplate>
                                        <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="True" CommandName="Update" Text="Actualizar"></asp:LinkButton>
                                        &nbsp;<asp:LinkButton ID="LinkButton4" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar"></asp:LinkButton>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <br />
                                        <table class="w-100">
                                            <tr>
                                                <td>
                                                    <asp:Button ID="Asistio" runat="server" Class="btn btn-success" CommandArgument='<%# Bind("id") %>' CommandName="Asistio" Text="Asistio" type="button" Width="100%" />
                                                </td>
                                                <td>
                                                    <asp:Button ID="NoAsistio" runat="server" Class="btn btn-danger" CommandArgument='<%# Bind("id") %>' CommandName="NoAsistio" Text="No Asistio" type="button" Width="100%" />
                                                </td>
                                            </tr>
                                        </table>
                                        <br />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <EditRowStyle BackColor="#2461BF" />
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#EFF3FB" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#F5F7FB" />
                            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                            <SortedDescendingCellStyle BackColor="#E9EBEF" />
                            <SortedDescendingHeaderStyle BackColor="#4870BE" />
                        </asp:GridView>
                        <br />
                        <asp:ObjectDataSource ID="ODS_RerservasEstilista" runat="server" SelectMethod="mostrarReservasEstilistaHorario" TypeName="DAOPerfilEstilista">
                            <SelectParameters>
                                <asp:SessionParameter DefaultValue="id" Name="id" SessionField="user_id" Type="Int32" />
                                <asp:ControlParameter ControlID="Prueba" Name="_fecha" PropertyName="Text" Type="String" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                        <br />
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
    <br />
                                            <asp:GridView ID="GridView_Historial" runat="server" AutoGenerateColumns="False" CellPadding="3" CssClass="auto-style15"  ForeColor="#333333" GridLines="None"   BorderStyle="None" BorderWidth="1px" DataSourceID="ODS_HistorailDeReservas" OnRowDataBound="GridView_Historial_RowDataBound" Visible="False" DataKeyNames="id" style="font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif" Width="100%"   >
                                                <AlternatingRowStyle BackColor="White" />


                                                <Columns>
                                                    <asp:TemplateField HeaderText="Fecha">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("fecha") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label8" runat="server" Text='<%# Bind("fecha","{0:D}") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Hora">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("hora") %>' Width="100%"></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="Hora" runat="server" Text='<%# Bind("hora","{0:t}") %>'></asp:Label>
                                                            <asp:Label ID="prueba1" runat="server" Text="Prueba" Visible="False"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Servicio">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("nombre_servicio") %>' Width="100%"></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("nombre_servicio") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Asistencia">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("alerta") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="Alerta1" runat="server" Text='<%# Bind("alerta") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Nombre Cliente">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TextBox12" runat="server" Text='<%# Bind("nombre_cliente") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("nombre_cliente") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Apellido Cliente">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("apellido_cliente") %>' Width="100%"></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("apellido_cliente") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                                <EditRowStyle BackColor="#2461BF" />
                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                                <RowStyle BackColor="#EFF3FB" />
                                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                                <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                            </asp:GridView>
                                            <br />
                                                <asp:ObjectDataSource ID="ODS_HistorailDeReservas" runat="server" SelectMethod="mostrarReservasEstilistaHorario2" TypeName="DAOPerfilEstilista">
                                                    <SelectParameters>
                                                        <asp:SessionParameter DefaultValue="id" Name="id" SessionField="user_id" Type="Int32" />
                                                    </SelectParameters>
                                                </asp:ObjectDataSource>

                                            </asp:Content>
