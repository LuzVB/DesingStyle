<%@ Page Title="" Language="C#" MasterPageFile="~/View/masterUsuarios/masterUsuarios.master" AutoEventWireup="true" CodeFile="~/Controller/masterUsuarios/estilista/catalogoEstilista.aspx.cs" Inherits="View_masterUsuarios_estilista_catalogoEstilista" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <style type="text/css">
        .auto-style1 {
            width: 70%;
            margin-right: 0px;
            font-family: "Gill Sans", "Gill Sans MT", Calibri, "Trebuchet MS", sans-serif;
            color: #018BDE;
        
    }
         .auto-style8 {
             width: 70%;
             text-align: left;
         }
         .auto-style9 {
             width: 70%;
             height: 119px;
             text-align: center;
         }
        
         .auto-style10 {
             text-align: center;
         }
                 
         .auto-style12 {
             color: #000000;
             font-weight: normal;
         }
         .auto-style13 {
            font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
            /*padding-left:17%;*/
            height: 215px;
        width: 321px;
    }
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="auto-style13">
        <tr>
            <td class="auto-style9">
                <h3 class="auto-style5">Catalogo</h3>
                <div class="auto-style10">
                    <h4 class="auto-style12">Agregue o Elime Imagenes de su catalogo</h4>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView_Catalogo" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="ODS_catalogo" AllowPaging="True" OnSelectedIndexChanged="GridView_Catalogo_SelectedIndexChanged" ShowHeaderWhenEmpty="True" CellPadding="4" ForeColor="#333333" GridLines="None" PageSize="3">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField HeaderText="imagenes  del catalogo">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("imagen") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Image ID="Image1" runat="server" Height="100px" ImageUrl='<%# Eval("imagen") %>' Width="40%" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="Eliminar"></asp:LinkButton>
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
            <td class="auto-style8"><br />
                <asp:RequiredFieldValidator ID="RFV_Catalogo" runat="server" ControlToValidate="FU_Catalogo" ErrorMessage="Agregar Imagen (*)"  class="alert alert-danger" ValidationGroup="VG_Imagen"></asp:RequiredFieldValidator>
                <br />
                <br />
                <br />
                <asp:FileUpload ID="FU_Catalogo" runat="server" BorderColor="#0099FF" />
                <br />
                <br />
                <asp:Button ID="Bt_GuardarImg" runat="server" Text="Guardar Imagen" BorderColor="#0099FF" Height="30px" Width="40%" OnClick="Bt_GuardarImg_Click" ValidationGroup="VG_Imagen" />
                <br />
                <br />
            </td>
        </tr>
    </table>
</asp:Content>

