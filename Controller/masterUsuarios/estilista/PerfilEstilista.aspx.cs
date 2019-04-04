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

        if (contraseñaActual != _contraseñaActual)
        {
            LB_ErrorContraseña.Text = "La contraseña actual es errónea";
        }
        else
        {
            clienteContra.Contraseña = contraseñaNueva;
            clienteContra.UserId = int.Parse(Session["user_id"].ToString());

            guardar.actualizarContrasena(clienteContra);

            LB_ErrorContraseña.Text = "La contraseña ha sido actualizada";

        }
    }

    protected void BT_GuardarBiografia_Click(object sender, EventArgs e)
    {
        EUsuario estilista = new EUsuario();
        estilista.UserId = int.Parse(Session["user_id"].ToString());
        estilista.Biografia = Tx_IBiografia.Text;

        DAOPerfilEstilista guardarCambios = new DAOPerfilEstilista();
        guardarCambios.actualizarBiografia(estilista);
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
}