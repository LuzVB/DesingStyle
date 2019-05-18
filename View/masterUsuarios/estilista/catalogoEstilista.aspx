<%@ Page Title="" Language="C#" MasterPageFile="~/View/masterUsuarios/masterUsuarios.master" AutoEventWireup="true" CodeFile="~/Controller/masterUsuarios/estilista/catalogoEstilista.aspx.cs" Inherits="View_masterUsuarios_estilista_catalogoEstilista" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <style type="text/css">
                          
         .auto-style14 {
            padding-top:15%;
            font-size: 95%;
        }
         .auto-style15 {
             height: 78px;
         }
        
         .auto-style16 {
             text-align: center;
             height: 52px;
         }
         .auto-style17 {
             font-size: large;
         }
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="w-100">
        <tr>
            <td class="auto-style16">
                <h1>Catalogo</h1>
            </td>
        </tr>
        <tr>
            <td class="auto-style15">
                <h2>Agregue o Elimine Imagenes de su catalogo</h2>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView_Catalogo" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="ODS_catalogo" AllowPaging="True" OnSelectedIndexChanged="GridView_Catalogo_SelectedIndexChanged" ShowHeaderWhenEmpty="True" CellPadding="3" ForeColor="#333333" GridLines="None" PageSize="3" Width="80%" CssClass="auto-style14"   style="font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField HeaderText="imagenes  del catalogo">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("imagen") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Image ID="Image1" runat="server" Height="160px" ImageUrl='<%# Eval("imagen") %>' Width="28%" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="Eliminar" Width="100%" CssClass="auto-style17"></asp:LinkButton>
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
                <asp:ObjectDataSource ID="ODS_catalogo" runat="server" OnSelecting="ODS_catalogo_Selecting" SelectMethod="mostrarcatalogo2" TypeName="DAOPerfilEstilista" DeleteMethod="eliminarImagen_Catalogo">
                    <DeleteParameters>
                        <asp:Parameter Name="id" Type="Int32" />
                    </DeleteParameters>
                    <SelectParameters>
                        <asp:SessionParameter DefaultValue="id" Name="id" SessionField="user_id" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td>
                <asp:RequiredFieldValidator ID="RFV_Catalogo" runat="server" ControlToValidate="FU_Catalogo" ErrorMessage="Agregar Imagen (*)"  class="alert alert-danger" ValidationGroup="VG_Imagen"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="RFV_Catalogo0" runat="server" ControlToValidate="FU_Catalogo" ErrorMessage="Agregar Imagen (*)"  class="alert alert-danger" ValidationGroup="VG_Imagen"></asp:RequiredFieldValidator>
                <br />
                <br />
                <asp:FileUpload ID="FU_Catalogo" runat="server" BorderColor="#0099FF" />
                </td>
        </tr>
        <tr>
            <td>
                <br />
                <asp:Button ID="Bt_GuardarImg" runat="server" Text="Guardar Imagen" BorderColor="#0099FF" Height="30px" Width="20%" OnClick="Bt_GuardarImg_Click" ValidationGroup="VG_Imagen" class="btn btn-primary"  />
                </td>
        </tr>
    </table>
    <br />
</asp:Content>

