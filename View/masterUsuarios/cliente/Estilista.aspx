<%@ Page Title="" Language="C#" MasterPageFile="~/View/masterUsuarios/masterUsuarios.master" AutoEventWireup="true" CodeFile="~/Controller/masterUsuarios/cliente/Estilista.aspx.cs" Inherits="View_masterUsuarios_cliente_Estilista" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <%-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >--%>

    <style type="text/css">
        .auto-style8 {
            width: 100%;
            margin: 2%;
        }

        .img_perfil {
            object-fit: cover;
        }

        .auto-style16 {
            font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
            font-size: 140%;
        }

        .auto-style17 {
            font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
            font-size: 120%;
        }

        .auto-style20 {
            font-size: 120%;
            margin-top: 0px;
        }

        .auto-style22 {
            font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
            font-size: 170%;
            color: #0099FF;
            text-align: center;
        }

        .auto-style23 {
            font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
            font-size: 140%;
            height: 51px;
        }

        .auto-style24 {
            text-align: center;
        }

        .auto-style25 {
            text-align: center;
            height: 261px;
        }

        .auto-style26 {
            font-size: 120%;
            color: #0099FF;
        }

        .auto-style28 {
            height: 488px;
        }

        .auto-style29 {
            position: absolute;
            right: 118;
            bottom: 10px;
            left: 42%;
            z-index: 15;
            display: flex;
            -ms-flex-pack: center;
            justify-content: center;
            list-style-type: none;
            width: 61%;
            text-align: center;
            margin-left: -30%;
            margin-right: 15%;
            padding-left: 0;
            height: 270px;
        }

        .auto-style30 {
            text-align: center;
            height: 101px;
        }

        .auto-style31 {
            color: #0099FF;
            font-size: 150%;
        }

        .auto-style32 {
            width: 137px;
        }

        .auto-style33 {
            color: #0099CC;
            font-size: 120%;
        }

        .imgCli {
            width: 50%;
            height: 250px;
            margin: 1%;
            object-fit: cover;
        }

        .imgperfil {
            width: 20%;
            height: 200px;
            margin: 1%;
            object-fit: cover;
        }

        .carousel-control-prev-icon {
            background-image: url("data:image/svg+xml;charset=utf8,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='%230099FF' viewBox='0 0 8 8'%3E%3Cpath d='M5.25 0l-4 4 4 4 1.5-1.5-2.5-2.5 2.5-2.5-1.5-1.5z'/%3E%3C/svg%3E") !important;
        }

        .carousel-control-next-icon {
            background-image: url("data:image/svg+xml;charset=utf8,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='%230099FF' viewBox='0 0 8 8'%3E%3Cpath d='M2.75 0l-1.5 1.5 2.5 2.5-2.5 2.5 1.5 1.5 4-4-4-4z'/%3E%3C/svg%3E") !important;
        }
    </style>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <table class="auto-style8">
        <tr>
            <td colspan="2" class="auto-style22"><strong>ESTILISTA</strong></td>
        </tr>
        <tr>
            <td colspan="2" class="auto-style23">Seleccione el estlista que desea ver</td>
        </tr>
        <tr>
            <td colspan="2" class="auto-style28">
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
                <br />
                <asp:UpdatePanel ID="UP_PerfilEstilista" runat="server">
                    <ContentTemplate>
                        <br />
                        <table class="w-100">
                            <tr>
                                <td class="auto-style32"><span class="auto-style17">Estilista</span><asp:RequiredFieldValidator ID="RFV_Estilista" runat="server" ControlToValidate="DropDownList_Estilista" CssClass="auto-style17" ErrorMessage="(*)" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                                <td>
                                    <asp:DropDownList ID="DropDownList_Estilista" runat="server" AutoPostBack="True" CssClass="auto-style17" DataSourceID="ODS_Estilista" DataTextField="nombre" DataValueField="id" OnDataBound="DropDownList_Estilista_DataBound" OnSelectedIndexChanged="DropDownList_Estilista_SelectedIndexChanged" Width="20%">
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="ODS_Estilista" runat="server" SelectMethod="mostrarEstilista" TypeName="DAORegistroEstilista"></asp:ObjectDataSource>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <table class="w-100">
                            <tr>
                                <td>
                                    <asp:FormView ID="FV_Estilista" runat="server" CssClass="auto-style20" DataSourceID="ODS_PerEstilista" OnDataBound="FV_Estilista_DataBound" OnPageIndexChanging="FV_Estilista_PageIndexChanging" Width="100%">
                                        <ItemTemplate>
                                            <table class="auto-style1">
                                                <tr>
                                                    <td>
                                                        <table class="w-100">
                                                            <tr>
                                                                <td class="auto-style30">
                                                                    <asp:Label ID="LB_nombreEstilista" runat="server" CssClass="auto-style31" ForeColor="#0099FF" Style="font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;" Text='<%# Bind("nombre") %>'></asp:Label>
                                                                    <asp:Label ID="LB_apellidoEstilista" runat="server" CssClass="auto-style31" ForeColor="#0099FF" Style="font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;" Text='<%# Bind("apellido") %>'></asp:Label>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style25">
                                                        <asp:Image ID="I_PerfilEstilista0" runat="server" class="imgperfil" ImageUrl='<%# Bind("imagen_perfil") %>' Width="50%" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style26"><strong>BIOGRAFÍA</strong></td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style24">
                                                        <asp:Label ID="L_Biografia" runat="server" ForeColor="#333333" Text='<%# Bind("biografia") %>' Width="50%"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>&nbsp;</td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                    </asp:FormView>
                                    <br />
                                    <br />
                                    <asp:ObjectDataSource ID="ODS_PerEstilista" runat="server" SelectMethod="mostrarEstilista" TypeName="DAOCliente">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="DropDownList_Estilista" DefaultValue="0" Name="id" PropertyName="SelectedValue" Type="Int32" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                    <br />
                                    <span class="auto-style33"><strong>CATÁLOGO</strong></span></td>
                            </tr>
                            <tr>
                                <td>&nbsp;
                                   <%-- <td class="auto-style16" colspan="2">
                                        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                 <ol class="auto-style29">
                    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                  </ol>
                 <div class="carousel-inner">   
                <asp:Repeater ID="Catalogo" runat="server" DataSourceID="ODS_Catalogo">
                    <ItemTemplate>
                        <div class='<%# Container.ItemIndex == 0 ? "item active" : "item" %>'  data-interval="10000">
                            <center>
                        <asp:Image ID="I_PerfilEstilista" runat="server" class="imgCli"  ImageUrl='<%# DataBinder.Eval(Container.DataItem,"imagen") %>' />
                          </center>
                        </div>
                      </ItemTemplate>
                </asp:Repeater>
                <asp:ObjectDataSource ID="ODS_Catalogo" runat="server" SelectMethod="mostrarcatalogo2" TypeName="DAOPerfilEstilista">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList_Estilista" DefaultValue="0" Name="id" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
              </div>
                 <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
                  </a>
                  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                  </a>
             </div>--%>

                                    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                                        <ol class="carousel-indicators">
                                            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                                            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                                            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                                        </ol>
                                        <div class="carousel-inner">
                                            
                                                 <div class="carousel-item active">
                                                     <center>
                                                <img src="../../../Imagenes/logo/logo2.png" class="d-block w-50" alt="...">
                                            </center>
                                                 </div>
                                            
                                           

                                            <asp:Repeater ID="Catalogo" runat="server" DataSourceID="ODS_Catalogo">

                                                <ItemTemplate>
                                                    <div class="carousel-item">
                                                        <div class='<%# Container.ItemIndex == 0 ? "item active" : "item" %>' data-interval="10000">
                                                            <center>
                        <asp:Image ID="I_PerfilEstilista" runat="server" class="imgCli"  ImageUrl='<%# DataBinder.Eval(Container.DataItem,"imagen") %>' />
                          </center>
                                                        </div>
                                                    </div>
                                                </ItemTemplate>

                                            </asp:Repeater>
                                            <asp:ObjectDataSource ID="ODS_Catalogo" runat="server" SelectMethod="mostrarcatalogo2" TypeName="DAOPerfilEstilista">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="DropDownList_Estilista" DefaultValue="0" Name="id" PropertyName="SelectedValue" Type="Int32" />
                                                </SelectParameters>
                                            </asp:ObjectDataSource>

                                        </div>
                                        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                            <span class="sr-only">Previous</span>
                                        </a>
                                        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                            <span class="sr-only">Next</span>
                                        </a>
                                    </div>

                                </td>
                            </tr>

                            </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
</asp:Content>

