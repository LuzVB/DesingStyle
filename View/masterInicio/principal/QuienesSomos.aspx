<%@ Page Title="" Language="C#" MasterPageFile="~/View/masterInicio/paginaPrincipal.master" AutoEventWireup="true" CodeFile="~/Controller/masterInicio/principal/QuienesSomos.aspx.cs" Inherits="View_masterInicio_principal_QuienesSomos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    
  .Mapa_img{
       width:70%;
       margin:1%;
       filter:brightness(90%);
       object-fit:cover;
   }
   .Mapa_img:hover{
       filter:brightness(100%);
   }
   
   .galeria_img{
       width:70%;
       margin:1%;
       filter:brightness(90%);
       object-fit:cover;
   }
   .galeria_img:hover{
       filter:brightness(100%);
   }

        .auto-style7 {
            width: 70%;
            color: #018BDE;
        }
        .auto-style8 {
            text-align:center;
             font-family: "Gill Sans", "Gill Sans MT", Calibri, "Trebuchet MS", sans-serif;
             color: #018BDE;
             margin-right: 0px;
        }
        .auto-style9 {           
            text-align: center;
            width: 50%;
        }
        .auto-style10 {
            font-size: 130%;
        }
        .auto-style11 {
            color: #000000;
        }
        .auto-style12 {
            font-size: 160%;
        }
        .auto-style13 {
            width: 70%;
            font-family: "Gill Sans", "Gill Sans MT", Calibri, "Trebuchet MS", sans-serif;
            text-align: left;
        }
        .auto-style14 {
            text-align: justify;
            padding-right:20%;
        }
        .auto-style15 {
            width: 70%;
            font-family: "Gill Sans", "Gill Sans MT", Calibri, "Trebuchet MS", sans-serif;
            text-align: left;
            color: #0099FF;
        }
        .auto-style16 {
            font-size: 160%;
            color: #0099FF;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="auto-style1">
        <tr>
            <td class="auto-style7">
                <table class="auto-style1">
                    <tr>
                        <td class="auto-style9">
                            <asp:Image ID="I_QuienesSomos" runat="server" ImageUrl="~/Imagenes/paginaInicio/quienesSomos/salon.png" class="galeria_img" Width="50%" />
                        </td>
                        <td class="auto-style13">
                            <h2 class="auto-style16">¿Quienes Somos?</h2>
                            <div class="auto-style14">
                            <br />
                                <span class="auto-style11"><span class="auto-style10">Somos un espacio dedicado a hombres, mujeres y niños donde podran accedeer a los mas altos estadandares de belleza y calidad con las ultimas tendencias mundiales ,ofrecemos productos de gran calidad para el cuidado del cabello, un área privada para el lavado y estaciones de peinado perzonalizadas.Ademas de un elegante mostrador de manicura&nbsp; y dos estaciones de pedicura.<br />
                                
                                </span>
                                
                                <h2 class="auto-style15">Horarios De Atencion</h2>
                                
                                <span class="auto-style11">
                                
                                <br />
                                8:00 am&nbsp; A 17:00 pm
                                <br />
                                Lunes a Domingo<br />
                                </span>
                                </span></div>
                        </td>
                    </tr>
                </table>
                <br />
               </td>
        </tr>
        <tr>
            <td class="auto-style8">
                <h2 class="auto-style12">¿Donde nos econtramos?</h2>
            </td>
        </tr>
        <tr>
            <td class="auto-style8"><iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3975.656560607624!2d-74.35677318573673!3d4.828900141878364!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8e3f7c543cc319e7%3A0x8e67599097ae1e80!2sUniversidad+de+Cundinamarca!5e0!3m2!1ses!2sco!4v1552693640827" width="50%" height="450" frameborder="0" style="border:0" allowfullscreen></iframe></td>
        </tr>
    </table>
</asp:Content>
