<%@ Page Title="" Language="C#" MasterPageFile="~/View/masterUsuarios/masterUsuarios.master" AutoEventWireup="true" CodeFile="~/Controller/masterUsuarios/administrador/reservaEstilista.aspx.cs" Inherits="View_masterUsuarios_administrador_reservaEstilista" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style8 {
            font-size: 160%;
            font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
            text-align: center;
        }
        .auto-style9 {
            width: 50%;
        }
        .auto-style10 {
            width: 50%;
        }
        .auto-style11 {
            font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
        }
        .auto-style12 {
            width: 50%;
            padding-left:10%;
        }
        .auto-style25 {
           padding-bottom:10%;
        text-align: left;
       }
       .imgNoRegistro{
           text-align: center;
       }
        .auto-style26 {
            /*padding-left: 10%;*/
        }
    .auto-style27 {
        padding-left: 10%;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="auto-style1">
        <tr>
            <td colspan="2" class="auto-style8"><strong>Reservas de los estilistas </strong> </td>
        </tr>
        <tr>
            <td class="auto-style12">
                Seleccione un estilista:</td>
            <td class="auto-style10"> 
                Seleccione una fecha </td>
        </tr>
        <tr>
            <td class="auto-style12">
                <asp:DropDownList ID="DDL_Estilistas" runat="server" AutoPostBack="True" DataSourceID="ODS_estilistas" DataTextField="nombre_estilista" DataValueField="id" OnDataBound="DDL_Estilistas_DataBound" OnSelectedIndexChanged="DDL_Estilistas_SelectedIndexChanged">
                </asp:DropDownList>
                <asp:ObjectDataSource ID="ODS_estilistas" runat="server" SelectMethod="mostrarEstilistas" TypeName="DAOAdmin"></asp:ObjectDataSource>
                <asp:Label ID="LB_Seleccione" runat="server" ForeColor="Red"></asp:Label>
            </td>
            <td class="auto-style10"> 
                <asp:Calendar ID="C_Fecha" runat="server" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="190px" Width="50%" OnSelectionChanged="C_Fecha_SelectionChanged" >
                    <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" /><%--Height="200px" Width="70%"--%>
                    <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                    <OtherMonthDayStyle ForeColor="#999999" />
                    <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                    <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                    <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                    <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                    <WeekendDayStyle BackColor="#CCCCFF" />
                </asp:Calendar>
         

            </td>
        </tr>
        <tr>
            <td class="auto-style26" colspan="2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style27" colspan="2">
                <asp:Label ID="LB_NombreEstilista" runat="server" Text="Label" Visible="False"></asp:Label>
         

            </td>
        </tr>
        <tr>
            <td class="auto-style27" colspan="2">
                <div class="auto-style11">

                <asp:GridView ID="GV_reservasEstilistas" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" Width="80%" CssClass="auto-style14" AllowPaging="True"  style="font-size: 120%; font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif" AutoGenerateColumns="False" DataSourceID="ODS_Reservas" >
                    <Columns>
                        <asp:TemplateField HeaderText="Cliente">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("nombre_cliente") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("nombre_cliente") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Servicio">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("nombre_servicio") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("nombre_servicio") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Hora Inicio">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("_hora_inicio") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("_hora_inicio", "{0:t}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Hora Final">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("__hora_final") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("__hora_final", "{0:t}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Fecha">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("_fecha") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("_fecha", "{0:d}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                <EmptyDataTemplate>
                            <asp:Image ID="noRegistro" runat="server" ImageUrl="~/Imagenes/no-encontrado.png" Width="20%" CssClass="imgNoRegistro" />
                            No hay reservas
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
                    <asp:ObjectDataSource ID="ODS_Reservas" runat="server" SelectMethod="mostrarReservas" TypeName="DAOAdmin">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DDL_Estilistas" DefaultValue="0" Name="id" PropertyName="SelectedValue" Type="Int32" />
                            <asp:ControlParameter ControlID="C_Fecha" DefaultValue="0" Name="fecha_adm" PropertyName="SelectedDate" Type="String" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </div>
         

            </td>
        </tr>
        <tr>
            <td class="auto-style9">&nbsp;</td>
            <td class="auto-style25">&nbsp;</td>
        </tr>
    </table>
</asp:Content>

