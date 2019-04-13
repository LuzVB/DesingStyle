<%@ Page Title="" Language="C#" MasterPageFile="~/View/masterUsuarios/masterUsuarios.master" AutoEventWireup="true" CodeFile="~/Controller/masterUsuarios/estilista/PerfilEstilista.aspx.cs" Inherits="View_masterUsuarios_estilista_PerfilEstilista" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %> 

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style8 {
            width: 70%;
        }
      
        .auto-style11 {
            width: 30%;
        }
        .auto-style12 {
            width: 70%;
            height: 23px;
            text-align: center;
        }
        .auto-style13 {
            width: 30%;
            height: 23px;
        }
        .auto-style21 {
            margin-left: 0px;
            font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
        }
        .auto-style22 {
            height: 23px;
        }
        .auto-style23 {
            width: 70%;
            font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
            font-size: 140%;
        }
        .auto-style24 {
            height: 23px;
            font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
            font-size: 160%;
        }
        .auto-style25 {
            font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
            font-size: 140%;
            padding-left:30%;
        }
        .auto-style26 {
            width: 70%;
            font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
            font-size: 160%;
        }
        .auto-style27 {
            width: 70%;
            text-align: center;
        }
        .img_perfil{
            object-fit:cover;
        }
        .auto-style28 {
            width: 70%;
            font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
            padding-left:17%;
        text-align: center;
        color: #000000;
        font-size: 160%;
    }
        .auto-style29 {
            width: 70%;
            height: 73px;
        }
        .auto-style30 {
            height: 23px;
            font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
            font-size: 160%;
            text-align: center;
        }
        .auto-style31 {
            width: 70%;
            text-align: center;
            height: 97px;
        }
        .auto-style32 {
            width: 30%;
            height: 97px;
        }
    .auto-style33 {
        margin-top: 48px;
    }
        .auto-style34 {
            width: 70%;
            height: 84px;
            text-align: center;
        }
        .auto-style35 {
            width: 30%;
            height: 84px;
        }
        .auto-style36 {
            width: 30%;
            height: 73px;
        }
        .imgCli{
            width:50%;
            height:200px;
            margin:1%;
            object-fit:cover;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="auto-style1">
        
    <tr>
        <td class="auto-style26"><strong>PERFIL
        </strong>
        </td>
        <td class="auto-style11"><asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager></td>
    </tr>
    <tr>
        <td class="auto-style29">
            <asp:Label ID="LB_nombreEstilista" runat="server" CssClass="auto-style25" ForeColor="#0099FF"></asp:Label>
        </td>
        <td class="auto-style36"></td>
    </tr>
    <tr>
        <td class="auto-style12">
            <asp:Image ID="I_PerfilEstilista" runat="server" class="imgCli" ImageUrl="~/Imagenes/perfil/estilista1.jpg" />
        </td>
        <td class="auto-style13">                       
            &nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style30">&nbsp;</td>
        <td class="auto-style22">                       
            <br />
            <br />
            <asp:FileUpload ID="FU_Perfil" runat="server" />
            <br />
            <asp:RequiredFieldValidator ID="RFV_Up" runat="server" ControlToValidate="FU_Perfil" ErrorMessage="Agregue su imagen (*)"  class="alert alert-danger"  ValidationGroup="VG_InicioSesion"></asp:RequiredFieldValidator>
            <br />
            <br />
            <asp:Button ID="BT_CambiarImagen" runat="server" Text="Cambiar imagen" BorderColor="#0099FF" Font-Bold="True" Font-Size="86%" Height="30px" Width="64%" ValidationGroup="VG_InicioSesion" CssClass="auto-style21" OnClick="BT_CambiarImagen_Click" />
        </td>
    </tr>
    <tr>
        <td class="auto-style24"><strong>BIOGRAFÍA</strong></td>
        <td class="auto-style22">&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style28"><strong>Reseña de su biografía</strong></td>
        <td class="auto-style11">&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style27">
            <div class="text-center">
                <asp:FormView ID="FV_Biografia" runat="server" DataSourceID="ODS_biografia" Width="100%" OnPageIndexChanging="FV_Biografia_PageIndexChanging" CssClass="auto-style33">
                    <ItemTemplate>
                        <asp:TextBox ID="Tx_IBiografia" runat="server" BorderColor="#0099FF" Height="100px" Text='<%# Bind("biografia") %>' ValidationGroup="VG_Biografia" Width="50%" TextMode="MultiLine"></asp:TextBox>
                        <br />
                        <br />
                        <br />
                        <asp:RequiredFieldValidator ID="RVF_biografia" runat="server" class="alert alert-danger" ControlToValidate="Tx_IBiografia" ErrorMessage="Registre Su biografia (*)" role="alert" ValidationGroup="VG_Biografia"></asp:RequiredFieldValidator>
                    </ItemTemplate>
                </asp:FormView>
                <asp:ObjectDataSource ID="ODS_biografia" runat="server" SelectMethod="mostrarCliente" TypeName="DAOCliente">
                    <SelectParameters>
                        <asp:SessionParameter DefaultValue="id" Name="id" SessionField="user_id" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </div>
            <asp:UpdatePanel ID="UP_RFV_Biografia" runat="server">
                <ContentTemplate>
                    <asp:Label ID="RFV_Biografia" runat="server" Text="" Visible="False" class="alert alert-warning" role="alert"></asp:Label>
                </ContentTemplate>                
            </asp:UpdatePanel>
            
            <br />
            <%--  <cc1:TextBoxWatermarkExtender id="TBWEDOB_contraseñaNueva" runat="server" targetcontrolid="Tx_ContraseñaNueva" watermarktext="Contraseña nueva" watermarkcssclass="watermarked"> </cc1:TextBoxWatermarkExtender>--%>
        <td class="auto-style11">&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style8">&nbsp;</td>
        <td class="auto-style11">
                                   
        <asp:Button ID="BT_GuardarBiografia" runat="server" Text="Guardar cambios" BorderColor="#0099FF" Font-Bold="True" Font-Size="86%" Height="30px" Width="64%" ValidationGroup="VG_Biografia" CssClass="auto-style21" OnClick="BT_GuardarBiografia_Click" />
        </td>
    </tr>
    <tr>
        <td class="auto-style23"><strong>CAMBIAR CONTRASEÑA</strong></td>
        <td class="auto-style11">&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style31">
            <table class="w-100">
                <tr>
                    <td class="text-center">Contraseña Actual</td>
                    <td class="text-center">Contraseña Nueva</td>
                </tr>
            </table>
            <br />
            <asp:RequiredFieldValidator ID="RFV_contraseñaActual" runat="server" ControlToValidate="Tx_ContraseñaActual" ErrorMessage="(*)" ForeColor="Red" ValidationGroup="VG_cambioContraseña"></asp:RequiredFieldValidator>
            <asp:TextBox ID="Tx_ContraseñaActual" runat="server" BorderColor="#0099FF" Width="40%" Height="25px" OnTextChanged="Tx_ContraseñaActual_TextChanged" TextMode="Password" ValidationGroup="VG_cambioContraseña"></asp:TextBox>
            <cc1:filteredtextboxextender ID="FTBE_ContraseñaActual" runat="server" FilterType="Numbers,LowercaseLetters, UppercaseLetters, Custom" ValidChars="_-ñ@." TargetControlID="Tx_ContraseñaActual" />
            <%--<cc1:filteredtextboxextender ID="FTBE_contraseñaNueva" runat="server" FilterType="Numbers,LowercaseLetters, UppercaseLetters, Custom" ValidChars=" _-ñ@" TargetControlID="Tx_ContraseñaNueva" />--%>
            <%--<cc1:filteredtextboxextender ID="FTBE_contraseñaActual" runat="server" FilterType="Numbers,LowercaseLetters, UppercaseLetters, Custom" ValidChars=" _-ñ@" TargetControlID="Tx_ContraseñaActual" />--%>
            
            &nbsp;<asp:RequiredFieldValidator ID="RFV_contraseñaNueva" runat="server" ControlToValidate="Tx_ContraseñaNueva" ErrorMessage="(*)" ForeColor="Red" ValidationGroup="VG_cambioContraseña"></asp:RequiredFieldValidator>
            <asp:TextBox ID="Tx_ContraseñaNueva" runat="server" BorderColor="#0099FF" Width="40%" Height="25px" TextMode="Password" ValidationGroup="VG_cambioContraseña"></asp:TextBox>
            <cc1:filteredtextboxextender ID="FTBE_ContraseñaNueva" runat="server" FilterType="Numbers,LowercaseLetters, UppercaseLetters, Custom" ValidChars="_-ñ@." TargetControlID="Tx_ContraseñaNueva" />
            <%--  <cc1:TextBoxWatermarkExtender id="TBWEDOB_contraseñaNueva" runat="server" targetcontrolid="Tx_ContraseñaNueva" watermarktext="Contraseña nueva" watermarkcssclass="watermarked"> </cc1:TextBoxWatermarkExtender>--%>
            <%--<cc1:filteredtextboxextender ID="FTBE_contraseñaNueva" runat="server" FilterType="Numbers,LowercaseLetters, UppercaseLetters, Custom" ValidChars=" _-ñ@" TargetControlID="Tx_ContraseñaNueva" />--%>
                                   

        <td class="auto-style32"></td>
    </tr>
    <tr>
        <td class="auto-style34">
            <asp:Label ID="LB_ErrorContraseña" runat="server" class="alert alert-danger" Visible="False"></asp:Label>
        </td>
        <td class="auto-style35">
            <asp:Button ID="BT_GuardarBiografia0" runat="server" Text="Guardar cambios" BorderColor="#0099FF" Font-Bold="True" Font-Size="86%" Height="30px" Width="64%" ValidationGroup="VG_cambioContraseña" CssClass="auto-style21" OnClick="BT_GuardarBiografia0_Click" />
        </td>
    </tr>
</table>
</asp:Content>

