<%@ Page Title="" Language="C#" MasterPageFile="~/View/masterUsuarios/masterUsuarios.master" AutoEventWireup="true" CodeFile="~/Controller/masterUsuarios/estilista/ReservaEstilista.aspx.cs" Inherits="View_masterUsuarios_estilista_ReservaEstilista" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        
        .auto-style30 {
            width: 449px;
        }

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
        .auto-style32 {
            width: 546px;
        }
        .auto-style33 {
            font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
            font-size: 120%;
            margin-left: 119px;
        }
        .auto-style34 {
            width: 100%;
            margin-bottom: 0px;
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
        <tr>
            <td class="auto-style30">
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
                <br />
                <asp:UpdatePanel ID="UP_Reservas" runat="server">
                    <ContentTemplate>
                        <table class="auto-style34">
                            <tr>
                                <td>
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
                                </td>
                                <td>
                                    <asp:GridView ID="GridView_ReservasEst" runat="server" AutoGenerateColumns="False" BorderStyle="None" BorderWidth="1px" CellPadding="4" CssClass="auto-style14" DataSourceID="ODS_RerservasEstilista" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView_ReservasEst_SelectedIndexChanged" Width="85%" OnRowCommand="GridView_ReservasEst_RowCommand" OnRowDataBound="GridView_ReservasEst_RowDataBound" DataKeyNames="id" OnDataBound="GridView_ReservasEst_DataBound">
                                        <AlternatingRowStyle BackColor="White" />
                                        <Columns>
                                            <asp:TemplateField HeaderText="Servicio">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("nombre_servicio") %>' Width="100%"></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("nombre_servicio") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Hora">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("fecha") %>' Width="100%"></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Hora" runat="server" Text='<%# Bind("fecha") %>'></asp:Label>
                                                    <asp:Label ID="pruebaAsis" runat="server" Text="Prueba" Visible="False"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Nombre Cliente">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("nombre_cliente") %>' Width="100%"></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("nombre_cliente") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Apellido Cliente">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("apellido_cliente") %>' Width="100%"></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("apellido_cliente") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Asistencia">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("alerta") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Alerta" runat="server" Text='<%# Bind("alerta") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Asistencia" ShowHeader="False">
                                                <EditItemTemplate>
                                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Actualizar"></asp:LinkButton>
                                                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar"></asp:LinkButton>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <br />
                                                    <table class="w-100">
                                                        <tr>
                                                            <td>
                                                                <asp:Button ID="Asistio" runat="server" Class="btn btn-success" CommandName="Asistio" Text="Asistio" type="button" Width="100%"  CommandArgument='<%# Bind("id") %>'  />
                                                            </td>
                                                            <td>
                                                                <asp:Button ID="NoAsistio" runat="server" Class="btn btn-danger" CommandName="NoAsistio" Text="No Asistio" type="button" Width="100%" CommandArgument='<%# Bind("id") %>'  />
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
                                </td>
                            </tr>
                        </table>
                        <asp:Label ID="Prueba" runat="server" Text="[Alerta_Fecha]" class="alert-heading" Visible="False"></asp:Label>
                        <asp:Label ID="Alerta_Rerva" runat="server" Text="Alerta_Rerva" class="alert-heading" Visible="False"></asp:Label>
                        <asp:UpdatePanel ID="UP_HoraReserva" runat="server" Visible="False">
                            <ContentTemplate>
                                <div class="alert alert-success" role="alert">
                          <h4 class="alert-heading">Recuerda!</h4>
                          <p> <asp:Label ID="Asistencia" runat="server" Text="Label"></asp:Label></p>
                          <hr>
                          <p class="mb-0"><asp:Label ID="Alerta0" runat="server" Text="Label" Visible="True"></asp:Label></p>
                        </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <br />
                        
                    </ContentTemplate>
                </asp:UpdatePanel>
                <table class="w-100">
                    <tr>
                        <td class="auto-style32">
                        <asp:Calendar ID="C_ReservaHistorial" runat="server" CssClass="auto-style31" Height="162px" OnSelectionChanged="C_ReservaHistorial_SelectionChanged" Width="241px" Visible="False">
                            <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                            <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                            <OtherMonthDayStyle ForeColor="#999999" />
                            <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                            <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                            <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                            <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                            <WeekendDayStyle BackColor="#CCCCFF" />
                        </asp:Calendar>
                        &nbsp;<asp:Label ID="prueba2" runat="server" Text="[Alerta_FechaHo]" Visible="False"></asp:Label>
                            <asp:Label ID="AlertaHistorial" runat="server" Text="[AlertaHistorial]" Visible="False"></asp:Label>
                        </td>
                        <td class="text-center">
                                            <asp:GridView ID="GridView_Historial" runat="server" AutoGenerateColumns="False" CellPadding="4" CssClass="auto-style33"  ForeColor="#333333" GridLines="None"  Width="65%" BorderStyle="None" BorderWidth="1px" DataSourceID="ODS_HistorailDeReservas" OnRowDataBound="GridView_Historial_RowDataBound" Visible="False" DataKeyNames="id"  >
                                                <AlternatingRowStyle BackColor="White" />


                                                <Columns>
                                                    <asp:TemplateField HeaderText="Servicio">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("nombre_servicio") %>' Width="100%"></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("nombre_servicio") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Hora">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("fecha") %>' Width="100%"></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="Hora0" runat="server" Text='<%# Bind("fecha") %>'></asp:Label>
                                                            <asp:Label ID="prueba1" runat="server" Text="Prueba" Visible="False"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Nombre Cliente">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("nombre_cliente") %>' Width="100%"></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("nombre_cliente") %>'></asp:Label>
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
                                                    <asp:TemplateField HeaderText="Asistencia">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("alerta") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="alerta" runat="server" Text='<%# Bind("alerta") %>'></asp:Label>
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
                                            <div class="text-center">
&nbsp;<br />
                                                <asp:ObjectDataSource ID="ODS_HistorailDeReservas" runat="server" SelectMethod="mostrarReservasEstilistaHorario2" TypeName="DAOPerfilEstilista">
                                                    <SelectParameters>
                                                        <asp:SessionParameter DefaultValue="id" Name="id" SessionField="user_id" Type="Int32" />
                                                        <asp:ControlParameter ControlID="prueba2" Name="_fecha" PropertyName="Text" Type="String" />
                                                    </SelectParameters>
                                                </asp:ObjectDataSource>

                                            </div>
                                            </td>
                    </tr>
                </table>
               
                <br />
                
                <br />
            </td>
            <td>
                <asp:UpdatePanel ID="UP_GV" runat="server">
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
</asp:Content>
