<%@ Page Title="" Language="C#" MasterPageFile="~/View/masterUsuarios/masterUsuarios.master" AutoEventWireup="true" CodeFile="~/Controller/masterUsuarios/administrador/inasistenciaEstilista.aspx.cs" Inherits="View_masterUsuarios_administrador_inasistenciaEstilista" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style8 {
            width: 40%;
        }
        .auto-style9 {
            width: 40%;
            height: 23px;
            font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
            font-size: 120%;
            padding-left:20%;
            padding-top:1%;
        }
        .auto-style13 {
            font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
            font-size: 140%;
            padding-left:20%;
            padding-top:2%;
            padding-bottom:2%;
        }
        .auto-style28 {
            font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
            font-size: 160%;
            padding-bottom:3%;
            text-align: center;
        }
        .auto-style15 {
            width: 60%;
            text-align: left;
        }
        .auto-style16 {
            width: 60%;
            height: 26px;
        }
        .auto-style14 {
            padding-top:15%;
        }
        .auto-style18 {
            padding-left:20%;
            font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
            font-size: 120%;
           
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="auto-style1">
        <tr>
            <td class="auto-style28" colspan="2">INASISTENCIA</td>
        </tr>
        
        <tr>
            <td class="auto-style18" colspan="2"> 
                 <div class="auto-style21">

                <asp:GridView ID="GV_reservasEstilistas" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" Width="80%" CssClass="auto-style14" AllowPaging="True"  style="font-size: 120%; font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="ODS_inasistencia" >
                    <Columns>
                        <asp:TemplateField HeaderText="Nombre Estilista">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("nombre_estilista") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("nombre_estilista") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Apellido Estilista">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("apellido_estilista") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("apellido_estilista") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Fecha">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("fecha") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("fecha","{0:d}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Servicio">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("servicio") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("servicio") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                <EmptyDataTemplate>
                            <asp:Image ID="noRegistro" runat="server" ImageUrl="~/Imagenes/no-encontrado.png" Width="20%" CssClass="imgNoRegistro" />
                            No hay inasistencias
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
                     <asp:ObjectDataSource ID="ODS_inasistencia" runat="server" SelectMethod="mostrarEstilistaInasistencia" TypeName="DAORegistroEstilista"></asp:ObjectDataSource>
                </div>
            
            </td>
        </tr>
        <tr>
            <td class="auto-style13" colspan="2">Seleccione el estilista y fecha</td>
        </tr>
        <tr>
            <td class="auto-style9">Estilistas</td>
            <td class="auto-style8">
                <asp:DropDownList ID="DDL_EstilistaInasistencia" runat="server" Height="25px" Width="70%" DataSourceID="ODS_estilista" DataTextField="nombre_estilista" DataValueField="id">
                </asp:DropDownList>
                <asp:ObjectDataSource ID="ODS_estilista" runat="server" SelectMethod="obtenerEstilista" TypeName="DAORegistroEstilista" OnSelecting="ODS_estilista_Selecting"></asp:ObjectDataSource>
                <asp:RequiredFieldValidator ID="RFV_EstilistaInasistencia" runat="server" ControlToValidate="DDL_EstilistaInasistencia" ErrorMessage="(*)" ForeColor="Red" ValidationGroup="registroInasistencia" SetFocusOnError="True"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style9">Fecha</td>
            <td class="auto-style16">
                <asp:TextBox ID="Tx_FechaInasistencia" runat="server" BorderColor="#0099FF" Width="69%" Height="25px" MaxLength="10" ValidationGroup="registroInasistencia" OnTextChanged="Tx_FechaInasistencia_TextChanged" TextMode="Date"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RFV_FechaInasistencia" runat="server" ControlToValidate="Tx_FechaInasistencia" ErrorMessage="(*)" ForeColor="Red" ValidationGroup="registroInasistencia" SetFocusOnError="True"></asp:RequiredFieldValidator>
            </td>
               

        </tr>
        <tr>
            <td class="auto-style8">&nbsp;</td>
            <td class="auto-style15">
                <asp:Button ID="BT_Insasitencia" runat="server" Height="30px" Text="Enviar" Width="70%" ValidationGroup="registroInasistencia" OnClick="BT_Insasitencia_Click" />
            </td>
        </tr>
        <tr>
            <td colspan="2" class="auto-style14">
                <asp:Label ID="fecha" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>

