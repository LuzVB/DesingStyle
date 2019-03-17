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
         .auto-style11 {
             width: 70%;
             font-family: "Gill Sans", "Gill Sans MT", Calibri, "Trebuchet MS", sans-serif;
             color: #018BDE;
             margin-right: 0px;
         }
        
         .auto-style12 {
             color: #000000;
             font-weight: normal;
         }
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="auto-style11">
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
                <asp:GridView ID="GridView_Catalogo" runat="server" AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundField HeaderText="Imagenes del catalogo" />
                        <asp:CommandField ShowEditButton="True" />
                        <asp:CommandField ShowDeleteButton="True" />
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td class="auto-style8"><br />
                <asp:RequiredFieldValidator ID="RFV_Catalogo" runat="server" ControlToValidate="FU_Catalogo" ErrorMessage="Agregar Imagen (*)"></asp:RequiredFieldValidator>
                <asp:FileUpload ID="FU_Catalogo" runat="server" BorderColor="#0099FF" />
                <br />
                <br />
                <asp:Button ID="Bt_GuardarImg" runat="server" Text="Guardar Imagen" BorderColor="#0099FF" Height="30px" Width="40%" />
            </td>
        </tr>
    </table>
</asp:Content>

