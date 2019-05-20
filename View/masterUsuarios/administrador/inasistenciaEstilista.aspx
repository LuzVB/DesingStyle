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
            height: 76px;
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
            height: 78px;
        }
        .auto-style16 {
            width: 60%;
            height: 26px;
            text-align: left;
        }
        .auto-style14 {
            padding-top:15%;
            font-size: 95%;
        }
        .auto-style18 {
            
            
            font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
            font-size: 120%;
            text-align: justify;
           
        }
        .auto-style29 {
            width: 40%;
            height: 78px;
        }
        .auto-style30 {
            width: 40%;
            height: 26px;
            font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
            font-size: 120%;
            padding-left: 20%;
            padding-top: 1%;
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

                     <br />
                   
                                                  <asp:DropDownList ID="DD_Estilista" runat="server" DataSourceID="ODS_MEstilista" DataTextField="nombre_estilista" DataValueField="id"  AutoPostBack="True">
                     </asp:DropDownList>
                     <br />
                     <asp:ObjectDataSource ID="ODS_MEstilista" runat="server" SelectMethod="obtenerEstilista" TypeName="DAORegistroEstilista"></asp:ObjectDataSource>
                     <br />
                             <asp:GridView ID="GV_reservasEstilistas" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" CssClass="auto-style14" DataKeyNames="id" DataSourceID="ODS_inasistencia" style="font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif" Width="100%" OnRowCommand="GV_reservasEstilistas_RowCommand" PageSize="4">
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
                                             <asp:Label ID="Fecha" runat="server" Text='<%# Bind("fecha","{0:D}") %>'></asp:Label>
                                         </ItemTemplate>
                                     </asp:TemplateField>
                                     <asp:TemplateField ShowHeader="False">
                                         <ItemTemplate>
                                             <asp:ImageButton ID="IB_Cancelar" runat="server" ImageUrl="~/Imagenes/multiplicar.png" Width="100
                                                 %" CommandArgument='<%# Bind("id") %>' CommandName="Cancelar" />
                                         </ItemTemplate>
                                         <ItemStyle Width="10%" />
                                     </asp:TemplateField>
                                 </Columns>
                                 <EmptyDataTemplate>
                                     <asp:Image ID="noRegistro" runat="server" CssClass="imgNoRegistro" ImageUrl="~/Imagenes/no-encontrado.png" Width="20%" />
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
                                                  <br />
                                                  <br />
                             <asp:Label ID="Eliminar" runat="server" Text="[Eliminar Inasistencia]" class="alert alert-danger" Visible="False" Width="20%"></asp:Label>
                                               <asp:ObjectDataSource ID="ODS_inasistencia" runat="server" SelectMethod="mostrarEstilistaInasistencia" TypeName="DAORegistroEstilista">
                         <SelectParameters>
                             <asp:ControlParameter ControlID="DD_Estilista" DefaultValue="0" Name="id" PropertyName="SelectedValue" Type="Int32" />
                         </SelectParameters>
                     </asp:ObjectDataSource>

                     <br />
                
                     <br />
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
                <asp:ObjectDataSource ID="ODS_estilista" runat="server" SelectMethod="obtenerEstilista" TypeName="DAORegistroEstilista" ></asp:ObjectDataSource>
                <asp:RequiredFieldValidator ID="RFV_EstilistaInasistencia" runat="server" ControlToValidate="DDL_EstilistaInasistencia" ErrorMessage="(*)" ForeColor="Red" ValidationGroup="registroInasistencia" SetFocusOnError="True"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style30">Fecha</td>
            <td class="auto-style16">
                <br />
                <br />
                <br />
                <asp:TextBox ID="Tx_FechaInasistencia" runat="server" BorderColor="#0099FF" Width="70%" Height="25px" MaxLength="10" ValidationGroup="registroInasistencia"  TextMode="Date"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RFV_FechaInasistencia" runat="server" ControlToValidate="Tx_FechaInasistencia" ErrorMessage="(*)" ForeColor="Red" ValidationGroup="registroInasistencia" SetFocusOnError="True"></asp:RequiredFieldValidator>
                <br />
                <br />
                <asp:Label ID="Alerta_Fecha" runat="server" Text="[Alerta_fecha]" class="alert alert-warning" Visible="False"></asp:Label>
                <br />
                <br />
                <asp:Button ID="BT_Insasitencia" runat="server" Height="25px" Text="Enviar" Width="70%" ValidationGroup="registroInasistencia" OnClick="BT_Insasitencia_Click" />
            </td>
               

        </tr>
        <tr>
            <td class="auto-style29">
                &nbsp;</td>
            <td class="auto-style15">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2" class="auto-style14">
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

