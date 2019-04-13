<%@ Page Title="" Language="C#" MasterPageFile="~/View/masterUsuarios/masterUsuarios.master" AutoEventWireup="true" CodeFile="~/Controller/masterUsuarios/administrador/registroServicios.aspx.cs" Inherits="View_masterUsuarios_administrador_registroServicios" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %> 

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style8 {
            width: 50%;
        }
        .auto-style9 {
            width: 50%;
        }
        .auto-style10 {
            width: 50%;
            font-size: 160%;
            font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
        }
        .auto-style11 {
           /*padding-left:20%;*/
        }
        .letra {
         font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
        }
        .auto-style25 {
           padding-bottom:7%;
        
    }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="auto-style1">
        <tr>
            <td class="auto-style10"><strong>SERVICIOS</strong></td>
            <td class="auto-style9">&nbsp;</td>
        </tr>
        <tr>
            <td colspan="2">

                <div class="auto-style11">

                <asp:GridView ID="GV_Estilista" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" PageSize="5" Width="95%" CssClass="auto-style14" ShowHeaderWhenEmpty="True" AllowPaging="True"  style="font-size: 120%; font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif" DataSourceID="ODS_Servicio" AutoGenerateColumns="False" DataKeyNames="id" OnRowUpdating="GV_Estilista_RowUpdating">
                    <Columns>
                        <asp:TemplateField HeaderText="Nombre">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("nombre") %>' CssClass="auto-style26" Width="100%"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("nombre") %>' ></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Descripcion">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("descripcion") %>' CssClass="auto-style26" Width="100%"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("descripcion") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Precio ($)">
                            
                            <EditItemTemplate>
                                <asp:DropDownList ID="DDL_precio" runat="server" SelectedValue='<%# Bind("precio") %>'>
                                
                                                <asp:ListItem Value="10000">$10.000</asp:ListItem>
                                                <asp:ListItem Value="15000">$15.000</asp:ListItem>
                                                <asp:ListItem Value="20000">$20.000</asp:ListItem>
                                                <asp:ListItem Value="25000">$25.000</asp:ListItem>
                                                <asp:ListItem Value="30000">$30.000</asp:ListItem>
                                                <asp:ListItem Value="35000">$35.000</asp:ListItem>
                                                <asp:ListItem Value="40000">$40.000</asp:ListItem>
                                                <asp:ListItem Value="45000">$45.000</asp:ListItem>
                                                <asp:ListItem Value="50000">$50.000</asp:ListItem>
                                                <asp:ListItem Value="55000">$55.000</asp:ListItem>
                                                <asp:ListItem Value="60000">$60.000</asp:ListItem>
                                                <asp:ListItem Value="65000">$65.000</asp:ListItem>
                                                <asp:ListItem Value="70000">$70.000</asp:ListItem>
                                                <asp:ListItem Value="75000">$75.000</asp:ListItem> 
                                                <asp:ListItem Value="80000">$80.000</asp:ListItem>
                                                <asp:ListItem Value="85000">$85.000</asp:ListItem>
                                                <asp:ListItem Value="90000">$90.000</asp:ListItem>
                                                <asp:ListItem Value="95000">$95.000</asp:ListItem>
                                                <asp:ListItem Value="100000">$100.000</asp:ListItem>
                                                <asp:ListItem Value="200000">$200.000</asp:ListItem>
                                                <asp:ListItem Value="300000">$300.000</asp:ListItem>
                                                <asp:ListItem Value="400000">$400.000</asp:ListItem>
                                                <asp:ListItem Value="500000">$500.000</asp:ListItem>
                                                <asp:ListItem Value="600000">$600.000</asp:ListItem>
                                    </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("precio") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Duracion(HH:MM)">
                             <EditItemTemplate>
                                <asp:DropDownList ID="DDL_duracion" runat="server" SelectedValue='<%# Bind("duracion") %>'>
                                                   <asp:ListItem Value="00:15:00">00:15</asp:ListItem>
                                                   <asp:ListItem Value="00:30:00">00:30</asp:ListItem>
                                                   <asp:ListItem Value="00:45:00">00:45</asp:ListItem>
                                                   <asp:ListItem Value="01:00:00">01:00</asp:ListItem>
                                                   <asp:ListItem Value="01:15:00">01:15</asp:ListItem>
                                                   <asp:ListItem Value="01:30:00">01:30</asp:ListItem>
                                                   <asp:ListItem Value="01:45:00">01:45</asp:ListItem>
                                                   <asp:ListItem Value="02:00:00">02:00</asp:ListItem>
                                                   <asp:ListItem Value="02:15:00">02:15</asp:ListItem>
                                                   <asp:ListItem Value="02:30:00">02:30</asp:ListItem>
                                                   <asp:ListItem Value="02:45:00">02:45</asp:ListItem>
                                                   <asp:ListItem Value="03:00:00">03:00</asp:ListItem>
                                                   <asp:ListItem Value="03:15:00">03:15</asp:ListItem>
                                                   <asp:ListItem Value="03:30:00">03:30</asp:ListItem>
                                                   <asp:ListItem Value="03:45:00">03:45</asp:ListItem>
                                                   <asp:ListItem Value="04:00:00">04:00</asp:ListItem>
                                                   <asp:ListItem Value="04:15:00">04:15</asp:ListItem>
                                                   <asp:ListItem Value="04:30:00">04:30</asp:ListItem>
                                                   <asp:ListItem Value="04:45:00">04:45</asp:ListItem>
                                                   <asp:ListItem Value="05:00:00">05:00</asp:ListItem>
                                    </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("duracion") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Estado">
                            <EditItemTemplate>
                                <asp:DropDownList ID="DDL_AEstado" runat="server" SelectedValue='<%# Bind("estado") %>' Width="100%">
                                    <asp:ListItem Value="Disponible">Disponible</asp:ListItem>
                                    <asp:ListItem Value="No disponible">No disponible</asp:ListItem>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("estado") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False">
                            <EditItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Actualizar"></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar"></asp:LinkButton>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Editar" Width="40%"></asp:LinkButton>
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
                </div>
                    <asp:ObjectDataSource ID="ODS_Servicio" runat="server" SelectMethod="mostrarservicio" TypeName="DAOServicio" UpdateMethod="modificarServicico2" DeleteMethod="modificarEstado">
                        <DeleteParameters>
                            <asp:Parameter Name="id" Type="Int32" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="nombre" Type="String" />
                            <asp:Parameter Name="descripcion" Type="String" />
                            <asp:Parameter Name="precio" Type="Int32" />
                            <asp:Parameter Name="duracion" Type="String" />
                            <asp:Parameter Name="estado" Type="String" />
                            <asp:Parameter Name="id" Type="Int32" />
                        </UpdateParameters>
                    </asp:ObjectDataSource>
                </div>
           

            </td>
        </tr>
        <tr>
            <td class="auto-style10"><strong>REGISTRAR SERVICIO</strong></td>
            <td class="auto-style9">
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
            </td>
        </tr>
        <tr>
            <td class="auto-style8"><asp:TextBox ID="Tx_NombreServicio" runat="server" BorderColor="#0099FF" Width="95%" Height="25px" MaxLength="50" ValidationGroup="registroServicio"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RFV_NombreServicio" runat="server" ControlToValidate="Tx_NombreServicio" ErrorMessage="(*)" ForeColor="Red" ValidationGroup="registroServicio" SetFocusOnError="True"></asp:RequiredFieldValidator>
            </td>
                <cc1:TextBoxWatermarkExtender id="TBWEDOB_NombreServicio" runat="server" targetcontrolid="Tx_NombreServicio" watermarktext="Nombre" watermarkcssclass="watermarked"> </cc1:TextBoxWatermarkExtender>
                <cc1:filteredtextboxextender ID="FTBE_NombreServicio" runat="server" FilterType="Custom, UppercaseLetters, LowercaseLetters" TargetControlID="Tx_NombreServicio" InvalidChars=" ñ" />
            <td class="auto-style9">
                <asp:TextBox ID="Tx_descripcionServicio" runat="server" BorderColor="#0099FF" Width="95%" Height="25px" MaxLength="50" ValidationGroup="registroServicio" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="RFV_descripcionServicio" runat="server" ControlToValidate="Tx_descripcionServicio" ErrorMessage="(*)" ForeColor="Red" ValidationGroup="registroServicio" SetFocusOnError="True"></asp:RequiredFieldValidator>
            </td>
                <cc1:TextBoxWatermarkExtender id="TBWEDOB_descripcionServicio" runat="server" targetcontrolid="Tx_descripcionServicio" watermarktext="Descripcion" watermarkcssclass="watermarked"> </cc1:TextBoxWatermarkExtender>
                <cc1:filteredtextboxextender ID="FTBE_descripcionServicio" runat="server" FilterType="Custom, UppercaseLetters, LowercaseLetters" TargetControlID="Tx_descripcionServicio" InvalidChars=" ñ´" />
        </tr>
        <tr>
            <td class="auto-style8">
                <asp:DropDownList ID="DDL_precio" runat="server" Height="25px" Width="95%">
                   <asp:ListItem Value="10000">Precio($)</asp:ListItem>
                                                <asp:ListItem Value="10000">$10.000</asp:ListItem>
                                                <asp:ListItem Value="15000">$15.000</asp:ListItem>
                                                <asp:ListItem Value="20000">$20.000</asp:ListItem>
                                                <asp:ListItem Value="25000">$25.000</asp:ListItem>
                                                <asp:ListItem Value="30000">$30.000</asp:ListItem>
                                                <asp:ListItem Value="35000">$35.000</asp:ListItem>
                                                <asp:ListItem Value="40000">$40.000</asp:ListItem>
                                                <asp:ListItem Value="45000">$45.000</asp:ListItem>
                                                <asp:ListItem Value="50000">$50.000</asp:ListItem>
                                                <asp:ListItem Value="55000">$55.000</asp:ListItem>
                                                <asp:ListItem Value="60000">$60.000</asp:ListItem>
                                                <asp:ListItem Value="65000">$65.000</asp:ListItem>
                                                <asp:ListItem Value="70000">$70.000</asp:ListItem>
                                                <asp:ListItem Value="75000">$75.000</asp:ListItem> 
                                                <asp:ListItem Value="80000">$80.000</asp:ListItem>
                                                <asp:ListItem Value="85000">$85.000</asp:ListItem>
                                                <asp:ListItem Value="90000">$90.000</asp:ListItem>
                                                <asp:ListItem Value="95000">$95.000</asp:ListItem>
                                                <asp:ListItem Value="100000">$100.000</asp:ListItem>
                                                <asp:ListItem Value="200000">$200.000</asp:ListItem>
                                                <asp:ListItem Value="300000">$300.000</asp:ListItem>
                                                <asp:ListItem Value="400000">$400.000</asp:ListItem>
                                                <asp:ListItem Value="500000">$500.000</asp:ListItem>
                                                <asp:ListItem Value="600000">$600.000</asp:ListItem>
                </asp:DropDownList>
            </td>

           <td class="auto-style9">
               <asp:DropDownList ID="DDL_duracion" runat="server" Height="25px" Width="95%">
                   <asp:ListItem Value="00:15">Duracion(HH:MM)</asp:ListItem>
                   <asp:ListItem>00:15</asp:ListItem>
                   <asp:ListItem>00:30</asp:ListItem>
                   <asp:ListItem>00:45</asp:ListItem>
                   <asp:ListItem>01:00</asp:ListItem>
                   <asp:ListItem>01:15</asp:ListItem>
                   <asp:ListItem>01:30</asp:ListItem>
                   <asp:ListItem>01:45</asp:ListItem>
                   <asp:ListItem>02:00</asp:ListItem>
                   <asp:ListItem>02:15</asp:ListItem>
                   <asp:ListItem>02:30</asp:ListItem>
                   <asp:ListItem>02:45</asp:ListItem>
                   <asp:ListItem>03:00</asp:ListItem>
                   <asp:ListItem>03:15</asp:ListItem>
                   <asp:ListItem>03:30</asp:ListItem>
                   <asp:ListItem>03:45</asp:ListItem>
                   <asp:ListItem>04:00</asp:ListItem>
                   <asp:ListItem>04:15</asp:ListItem>
                   <asp:ListItem>04:30</asp:ListItem>
                   <asp:ListItem>04:45</asp:ListItem>
                   <asp:ListItem>05:00</asp:ListItem>
               </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="auto-style8">
                &nbsp;</td>
            <td class="auto-style9">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style8">&nbsp;</td>
            <td class="auto-style25"><asp:ImageButton ID="IB_GuardarServicio" runat="server" Height="62px" Width="15%" ValidationGroup="registroServicio" ImageUrl="~/Imagenes/guardar.png" OnClick="IB_GuardarServicio_Click" /></td>
        </tr>
    </table>
</asp:Content>


