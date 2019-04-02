<%@ Page Title="" Language="C#" MasterPageFile="~/View/masterUsuarios/masterUsuarios.master" AutoEventWireup="true" CodeFile="~/Controller/masterUsuarios/cliente/ReservarCitaCliente.aspx.cs" Inherits="View_masterUsuarios_cliente_ReservarCitaCliente" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
              
        .auto-style11 {
            width: 30%;
            text-align: right;
        }
        .auto-style12 {
            height: 48px;
            font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
            font-size: 160%;
        }
        .auto-style21 {
            margin-left: 0px;
            font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
        }
        .auto-style23 {
            font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
            font-size: 140%;
            height: 40px;
        }
        .auto-style24 {
            height: 39px;
            font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
            font-size: 160%;
        }
        .auto-style26 {
            width: 70%;
            font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
            font-size: 160%;
        }
        .img_perfil{
            object-fit:cover;
        }
        .auto-style28 {
            font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
            padding-left:17%;
            height: 215px;
        }
        .auto-style32 {
            width: 36%;
            font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
            font-size: 160%;
            height: 77px;
        }
        .auto-style33 {
            width: 30%;
            height: 77px;
        }
        .auto-style34 {
            height: 76px;
        }
        .auto-style35 {
            height: 40px;
            font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
            font-size: 160%;
        }
        .auto-style36 {
            height: 41px;
            font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
            font-size: 160%;
        }
        .auto-style37 {
            height: 35px;
            font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
            font-size: 160%;
        }
        .auto-style39 {
            height: 41px;
            font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
            font-size: 160%;
            width: 36%;
            text-align: left;
        }
        .auto-style40 {
            width: 36%
        }
        .auto-style41 {
            width: 100%;
            margin-right: 0px;
        }
        .auto-style42 {
            font-size: 70%;
        }
        .auto-style43 {
            color: #000000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <table class="auto-style41">
    <tr>
        <td class="auto-style32">RESERVAR CITA</td>
        <td class="auto-style33"><asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager></td>
    </tr>
    <tr>
        <td colspan="2" class="auto-style34">
            <asp:Label ID="LB_nombreEstilista" runat="server" CssClass="auto-style26">Servicio,Dia,Hora y Estilista</asp:Label>
        </td>
    </tr>
    <tr>
        <td class="auto-style12" colspan="2">
            Seleccione el servicio</td>
    </tr>
    <tr>
        <td class="auto-style35" colspan="2">
            <asp:Label ID="L_servicio" runat="server" Text="Servicio"></asp:Label>
            &nbsp;<asp:RequiredFieldValidator ID="RFV_ServicioReserva" runat="server" ErrorMessage="(*)" ForeColor="Red" ControlToValidate="DDL_servicio"></asp:RequiredFieldValidator>
            <asp:DropDownList ID="DDL_servicio" runat="server" Height="25px" Width="30%" DataSourceID="ODS_servicio" DataTextField="nombre_servicio" DataValueField="id" CssClass="auto-style42" AutoPostBack="True">
            </asp:DropDownList>
            <asp:ObjectDataSource ID="ODS_servicio" runat="server" SelectMethod="mostrarServicio" TypeName="DAO_Reserva"></asp:ObjectDataSource>
        </td>
    </tr>
    <tr>
        <td class="auto-style23" colspan="2">Seleccione el estilista</td>
    </tr>
    <tr>
        <td class="auto-style39" >
            Estilista
            <asp:RequiredFieldValidator ID="RFV_Estilista" runat="server" ErrorMessage="(*)" ForeColor="Red" ControlToValidate="DDL_Estilista" ValidationGroup="VG_reservar"></asp:RequiredFieldValidator>
          
        </td>
        <td class="auto-style36" >
              <asp:UpdatePanel ID="UP_Estilista" runat="server">
                <ContentTemplate>
                    <asp:DropDownList ID="DDL_Estilista" runat="server" DataSourceID="ODS_luz" DataTextField="nombre_estilista" DataValueField="id" Height="25px" Width="70%" CssClass="auto-style42">
                    </asp:DropDownList>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="DDL_servicio" EventName="SelectedIndexChanged" />
                </Triggers>
            </asp:UpdatePanel>
            <asp:ObjectDataSource ID="ODS_luz" runat="server" SelectMethod="mostrarEstilistas" TypeName="DAO_Reserva">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DDL_servicio" DefaultValue="id" Name="id_servicio" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </td>
    </tr>
    <tr>
        <td class="auto-style24" colspan="2">Seleccione el dia que quiere reservar&nbsp; </td>
    </tr>
    <tr>
        <td class="auto-style28" colspan="2">
            <asp:UpdatePanel ID="UP_calendario" runat="server">
                <ContentTemplate>
                    <asp:Calendar ID="C_Reserva" runat="server">
                        <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                        <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                        <OtherMonthDayStyle ForeColor="#999999" />
                        <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                        <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                        <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                        <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                        <WeekendDayStyle BackColor="#CCCCFF" />
                    </asp:Calendar>
                </ContentTemplate>
                
           </asp:UpdatePanel>
        </td>
    </tr>
    <tr>
        <td class="auto-style36" colspan="2">
            Seleccione la hora que quiere reservar</td>
    </tr>

    <tr>
        <td class="auto-style37">
           Hora
            <asp:RequiredFieldValidator ID="RFV_Hora" runat="server" ControlToValidate="DDL_Hora" ErrorMessage="(*)" ForeColor="Red" ValidationGroup="VG_reservar"></asp:RequiredFieldValidator>
           
        </td>
        <td class="auto-style36" >
             <asp:UpdatePanel ID="UP_Hora" runat="server">
                <ContentTemplate>
                    <asp:DropDownList ID="DDL_Hora" runat="server" CssClass="auto-style42" DataSourceID="ODS_PruebaHorarios" DataTextField="horario_estilista" DataValueField="id" Height="25px" Width="70%">
                    </asp:DropDownList>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="C_Reserva" EventName="SelectionChanged" />
                    <asp:AsyncPostBackTrigger ControlID="DDL_Estilista" EventName="SelectedIndexChanged" />
                </Triggers>
            </asp:UpdatePanel>
            <asp:ObjectDataSource ID="ODS_PruebaHorarios" runat="server" SelectMethod="mostrarHorarios" TypeName="DAO_Reserva">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DDL_Estilista" DefaultValue="id" Name="id_estilista" PropertyName="SelectedValue" Type="Int32" />
                    <asp:ControlParameter ControlID="C_Reserva" DefaultValue="1" Name="hora_inicio" PropertyName="SelectedDate" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </td>

    </tr>
    
    <tr>
        <td class="auto-style40">&nbsp;</td>
        <td class="auto-style11">
            <asp:Button ID="BT_GuardarReserva" runat="server" Text="Reservar" BorderColor="#0099FF" Font-Bold="True" Font-Size="86%" Height="30px" Width="64%" ValidationGroup="VG_reservar" CssClass="auto-style21" OnClick="BT_GuardarReserva_Click" />
        </td>
    </tr>
</table>
    <cc1:modalpopupextender ID="MPE_confirmarReserva" runat="server" PopupControlID="P_confirmarReserva" CancelControlID="BT_Cancelar" TargetControlID="L_Target"></cc1:modalpopupextender>
    <asp:Label ID="L_Target" runat="server" Text=""></asp:Label>
    <asp:Panel ID="P_confirmarReserva" runat="server" Width="40%">
        <div class="alert alert-info" role="alert" style=" width:100% " >
          <h4 class="alert-heading">RESERVAR</h4>
            Servicio&nbsp;
            <asp:Label ID="L_servicioPanel" runat="server" CssClass="auto-style43"></asp:Label><br />
            Estilista&nbsp;&nbsp;
            <asp:Label ID="L_estilistaPanel" runat="server" CssClass="auto-style43"></asp:Label><br />
            Fecha&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="L_fechaPanel" runat="server" CssClass="auto-style43"></asp:Label>
            <br />
            Hora&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
            <asp:Label ID="L_horaPanel" runat="server" CssClass="auto-style43"></asp:Label>
          <hr>
            <div>
              <asp:Button ID="BT_Reservar" runat="server" Text="Reservar"  class="btn btn-outline-success" OnClick="BT_Reservar_Click" />
              <asp:Button ID="BT_Cancelar" runat="server" Text="Cancelar"  class="btn btn-outline-primary"/>
            </div>
           
        </div>
    </asp:Panel>


</asp:Content>

