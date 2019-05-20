using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_masterUsuarios_estilista_PerfilEstilista : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["rol"] == null)
        {
            Response.Redirect("~/View/masterInicio/principal/inicio.aspx");
        }
        else if (Session["rol"].ToString().Equals("1"))
        {
            Response.Redirect("~/View/masterInicio/principal/inicio.aspx");
        }
        else if (Session["rol"].ToString().Equals("3"))
        {
            Response.Redirect("~/View/masterInicio/principal/inicio.aspx");
        }

        DataTable datosEstilista= new DAOCliente().mostrarCliente(int.Parse(Session["user_id"].ToString()));
        string nombre, apellido, imagen /*biografia*/;/*, telefono, correo*/
        nombre = datosEstilista.Rows[0]["nombre"].ToString();
        apellido = datosEstilista.Rows[0]["apellido"].ToString();
        imagen = datosEstilista.Rows[0]["imagen_perfil"].ToString();
        //biografia = datosEstilista.Rows[0]["biografia"].ToString();
        LB_nombreEstilista.Text = ("Estilista :"+"   " + nombre + " " + apellido).ToUpper();
        //Tx_IBiografia.Text = (biografia).ToUpper();
        
        I_PerfilEstilista.ImageUrl = (imagen).ToUpper();
     
    }

    protected void BT_GuardarBiografia0_Click(object sender, EventArgs e)
    {
        DataTable datosCliente = new DAOCliente().mostrarCliente(int.Parse(Session["user_id"].ToString()));
        DAOCliente guardar = new DAOCliente();
        EUsuario clienteContra = new EUsuario();
        string contraseñaActual, contraseñaNueva, _contraseñaActual;
        contraseñaActual = Tx_ContraseñaActual.Text;
        contraseñaNueva = Tx_ContraseñaNueva.Text;
        _contraseñaActual = datosCliente.Rows[0]["contrasena"].ToString();
        int error = 0;

        if (contraseñaActual != _contraseñaActual)
        {
            LB_ErrorContraseña.Visible = true;
            LB_ErrorContraseña.Text = "La contraseña actual es errónea";
            error = 1;
        }

        if (Tx_ContraseñaNueva.Text.Length < 4)
        {
            LB_ErrorContraseña.Visible = true;
            LB_ErrorContraseña.Text = "La contraseña debe tener más de 4 caracteres";
            error = 1;
        }

        if (error == 0)
        {

            clienteContra.Contraseña = contraseñaNueva;
            clienteContra.UserId = int.Parse(Session["user_id"].ToString());

            guardar.actualizarContrasena(clienteContra);
            LB_ErrorContraseña.Visible = true;
            LB_ErrorContraseña.Text = "La contraseña ha sido actualizada";

            Tx_ContraseñaNueva.Text = "";
            Tx_ContraseñaActual.Text = "";

        }
        
    }

    protected void BT_GuardarBiografia_Click(object sender, EventArgs e)
    {

        if (((TextBox)FV_Biografia.Row.FindControl("Tx_IBiografia")).Text.Length > 300)
        {
            RFV_Biografia.Visible = true;
            RFV_Biografia.Text = "No puede registrar mas de 300 caracteres";
        }
        else
        {
            EUsuario estilista = new EUsuario();
            estilista.UserId = int.Parse(Session["user_id"].ToString());
            estilista.Biografia = ((TextBox)FV_Biografia.Row.FindControl("Tx_IBiografia")).Text;
            DAOPerfilEstilista guardarCambios = new DAOPerfilEstilista();
            guardarCambios.actualizarBiografia(estilista);
            RFV_Biografia.Visible = false;
        }
    }

    protected void BT_CambiarImagen_Click(object sender, EventArgs e)
    {
        EUsuario user = new EUsuario();
        user.UserId = int.Parse(Session["user_id"].ToString());
        FileUpload FU_IMuestra = ((FileUpload)FU_Perfil.FindControl("FU_Perfil"));
        ClientScriptManager cm = this.ClientScript;

        if (FU_IMuestra.PostedFile.FileName != "" && !(System.IO.Path.GetExtension(FU_IMuestra.PostedFile.FileName).Equals(".jpg")
          || System.IO.Path.GetExtension(FU_IMuestra.PostedFile.FileName).Equals(".png")))
        {
            cm.RegisterClientScriptBlock(this.GetType(), "", "<script type='text/javascript'>alert('solo Imagenes');</script>");
            return;
        }

        else
        {
            user.Muestra = "~\\Imagenes\\perfil\\" + Session["nombre"].ToString() + System.IO.Path.GetFileName(FU_IMuestra.PostedFile.FileName);

            FU_IMuestra.PostedFile.SaveAs(Server.MapPath(user.Muestra));

            DataTable datos = new DAOPerfilEstilista().actualizarImaPerfil(user);
            I_PerfilEstilista.ImageUrl = user.Muestra;
        }
    }

    protected void Tx_ContraseñaActual_TextChanged(object sender, EventArgs e)
    {

    }

    protected void FV_Biografia_PageIndexChanging(object sender, FormViewPageEventArgs e)
    {

    }
}