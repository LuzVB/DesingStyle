<%@ Page Title="" Language="C#" MasterPageFile="~/View/masterUsuarios/masterUsuarios.master" AutoEventWireup="true" CodeFile="~/Controller/masterUsuarios/cliente/ReservasAgendadas.aspx.cs" Inherits="View_masterUsuarios_cliente_ReservasAgendadas" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style14 {
            padding-top:15%;
            font-size: 95%;
        }
        .auto-style18 {
            /*padding-left:20%;*/
            font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
            font-size: 120%;
            text-align: justify;
        }
        .imgNoRegistro{
           text-align: center;
       }
        .auto-style19 {
            font-size: 110%;
        }

        .modalBackground{
            background-color: black;
            filter: alpha(opacity=60);
            opacity: 0.6;
        }
        .botones2{
            padding-left:90%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <h1>
         Reservas Agendadas 
     </h1>
     <br/>

     <ul class="nav nav-tabs">
        <li class="nav-item">
            <asp:Button ID="BT_Reservas" runat="server" Text="Reservas pendientes" class="nav-link active" OnClick="BT_Reservas_Click" />
         </li>
         <li class="nav-item">
             <asp:Button ID="BT_Historial" runat="server" Text="Historial" class="nav-link" OnClick="BT_Historial_Click" />
         </li>
     </ul>
    <br/>

     
    <table class="auto-style1">
        
        <tr>
            <td class="auto-style18" colspan="2"> 
                  <asp:Label ID="LB_Informacion" runat="server" Text="En caso de que no pueda asistir a su cita, cancele la cita con el botón (x) y reagende una nueva cita. Tenga en cuenta que tiene que cancelar 3 horas antes de su cita, si este no es el caso, no cancela y no asiste se le multara." Width="100%" class="alert alert-warning"  >

                  </asp:Label>
                <div class="auto-style21">
                <asp:GridView ID="GV_reservasAgendadas" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" Width="100%" CssClass="auto-style14" AllowPaging="True"  style="font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="ODS_mostrarReserva" PageSize="5" OnRowCommand="GV_reservasAgendadas_RowCommand" >
                    <Columns>
                        <asp:TemplateField HeaderText="Fecha">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("_fecha") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("_fecha","{0:D}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Hora Inicio">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("_hora_inicio") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("_hora_inicio","{0:t}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Hora Final">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("__hora_final") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("__hora_final","{0:t}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Servicio">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("nombre_servicio") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("nombre_servicio") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Estilista">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("nombre_estilista") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("nombre_estilista") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Precio">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("precio") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("precio" , "{0:C}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Cancelar cita">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:ImageButton ID="IB_Cancelar" runat="server" ImageUrl="~/Imagenes/multiplicar.png" Width="100%" CommandArgument='<%# Bind("id") %>' CommandName="Cancelar" />
                            </ItemTemplate>
                            <ItemStyle Width="10%" />
                        </asp:TemplateField>
                    </Columns>
                <EmptyDataTemplate>
                       <asp:Image ID="noRegistro" runat="server" ImageUrl="~/Imagenes/no-encontrado.png" Width="20%" CssClass="imgNoRegistro" />
                       No hay citas agendadas
                       <asp:Button ID="BT_redirigirCita" runat="server" Text="Reservar cita" BorderColor="#0099FF" Font-Bold="True" Font-Size="86%" Height="30px" Width="64%"  OnClick="BT_redirigirCitan_Click"  />
                </EmptyDataTemplate>
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
            <asp:ObjectDataSource ID="ODS_mostrarReserva" runat="server" SelectMethod="mostrarReservas" TypeName="DAO_Reserva">
               <SelectParameters>
                  <asp:SessionParameter DefaultValue="" Name="id_cliente" SessionField="user_id" Type="Int32" />
               </SelectParameters>
            </asp:ObjectDataSource>


            <asp:GridView ID="GV_Historial" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" Width="100%" CssClass="auto-style14" AllowPaging="True"  style="font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="ODS_Historial" PageSize="6" Visible="False" >
                    <Columns>
                        <asp:TemplateField HeaderText="Fecha">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("_fecha") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("_fecha","{0:D}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Hora Inicio">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("_hora_inicio") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("_hora_inicio","{0:t}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Hora Final">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("__hora_final") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("__hora_final","{0:t}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Servicio">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("nombre_servicio") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("nombre_servicio") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Estilista">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("nombre_estilista") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("nombre_estilista") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Precio">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("precio") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("precio" , "{0:C}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                <EmptyDataTemplate>
                       <asp:Image ID="noRegistro" runat="server" ImageUrl="~/Imagenes/no-encontrado.png" Width="20%" CssClass="imgNoRegistro" />
                       No hay citas reservadas posteriormente 
                       <asp:Button ID="BT_redirigirCita" runat="server" Text="Reservar cita" BorderColor="#0099FF" Font-Bold="True" Font-Size="86%" Height="30px" Width="64%"  OnClick="BT_redirigirCitan_Click"  />
                </EmptyDataTemplate>
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
            <asp:ObjectDataSource ID="ODS_Historial" runat="server" SelectMethod="mostrarHistorial" TypeName="DAO_Reserva">
               <SelectParameters>
                  <asp:SessionParameter DefaultValue="" Name="id_cliente" SessionField="user_id" Type="Int32" />
               </SelectParameters>
            </asp:ObjectDataSource>
          </div>
            
        </td>
     </tr>
  </table>

   <cc1:modalpopupextender ID="MPE_Error" runat="server" PopupControlID="P_Error" CancelControlID="BT_okError"  TargetControlID="LB_target3" BackgroundCssClass="modalBackground"></cc1:modalpopupextender>
    <asp:Label ID="LB_target3" runat="server" Text=""></asp:Label>
    <asp:Panel ID="P_Error" runat="server" Width="40%">
        <div class="alert alert-warning" role="alert" style=" width:100%" >
            <h4 class="alert-heading">ERROR</h4>
            <hr>
            <asp:Label ID="LB_Error" runat="server" Text=""></asp:Label>
           <hr>
            <div class ="botones2">
              <asp:Button ID="BT_okError" runat="server" Text="OK"  class="btn btn-outline-warning"/>
            </div>
        </div>
        
    </asp:Panel>

    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

</asp:Content>

