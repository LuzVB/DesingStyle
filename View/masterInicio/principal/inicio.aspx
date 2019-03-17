<%@ Page Title="" Language="C#" MasterPageFile="~/View/masterInicio/paginaPrincipal.master" AutoEventWireup="true" CodeFile="~/Controller/masterInicio/principal/inicio.aspx.cs" Inherits="View_masterInicio_principal_inicio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
   .auto-style6 {

    }
   
   .galeria{
       /*display:flex;*/
       width:100%;
       /*justify-content: space-around;
       flex-wrap: wrap;
       max-width:100%;
       margin:auto*/
   }

   .galeria_img{
       
       width:30%;
       height:200px;
       margin:1%;
       filter:brightness(90%);
       object-fit:cover;
   }
   .galeria_img:hover{
       filter:brightness(100%);
   }

        .auto-style7 {
            font-size: 150%;
            font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
        }
        .auto-style8 {
            width: 33%;
            padding-left:5%;
        }

        .auto-style9 {
            text-align: justify;
            width: 33%;
            padding-left:5%;
        }

        .auto-style10 {
             font-size: 90%;
            font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
    <div>
         <asp:ImageButton ID="IB_Inicio1" runat="server" class="galeria_img" />
         <asp:ImageButton ID="IB_Inicio2" runat="server" class="galeria_img" ImageUrl="~/Imagenes/paginaInicio/tintura_1.png"/>
         <asp:ImageButton ID="IB_Inicio3" runat="server" class="galeria_img" ImageUrl="~/Imagenes/paginaInicio/uñas_1.png"/>
    </div>
    <table class="auto-style1">
      
        <tr>
            <td class="auto-style9">
                <br />
                <br />
                <asp:Label ID="L_Inicio1" runat="server" CssClass="auto-style7"></asp:Label>
                <br />
                <strong>
                <asp:Button ID="BT_Reservar1" runat="server" OnClick="BT_Reservar1_Click" Text="Reservar" BackColor="#7DC2EC" CssClass="auto-style10" Height="40px" Width="75%" Font-Bold="True" Font-Size="100%" ForeColor="Black" />
                </strong>
                <br />
                <br />
                <br />
            </td>
            <td class="auto-style8"><br />
                <br />
                <asp:Label ID="L_Inicio2" runat="server" CssClass="auto-style7"></asp:Label>
                <br />
                <strong>
                <asp:Button ID="BT_Reservar2" runat="server" OnClick="BT_Reservar1_Click" Text="Reservar" BackColor="#7DC2EC" CssClass="auto-style10" Height="40px" Width="75%" Font-Bold="True" Font-Size="100%" ForeColor="Black" />
                </strong>
                <br />
                <br />
                <br /></td>
            <td class="auto-style8"> <br />
                <asp:Label ID="L_Inicio3" runat="server" CssClass="auto-style7"></asp:Label>
                <br />
                <strong>
                <asp:Button ID="BT_Reservar3" runat="server" OnClick="BT_Reservar1_Click" Text="Reservar" BackColor="#7DC2EC" CssClass="auto-style10" Height="40px" Width="75%" Font-Bold="True" Font-Size="100%" ForeColor="Black" />
                </strong>
                <br />
                <br />
                <br /></td>
        </tr>
 
    </table>

     <div>
         <asp:ImageButton ID="IB_Inicio4" runat="server" class="galeria_img" ImageUrl="~/Imagenes/paginaInicio/corte_1.jpg" />
         <asp:ImageButton ID="IB_Inicio5" runat="server" class="galeria_img" ImageUrl="~/Imagenes/paginaInicio/barbero.jpg"/>
         <asp:ImageButton ID="IB_Inicio6" runat="server" class="galeria_img" ImageUrl="~/Imagenes/paginaInicio/cara_1.jpg"/>
    </div>
   
</asp:Content>

