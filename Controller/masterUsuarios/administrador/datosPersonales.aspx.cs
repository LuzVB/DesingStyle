using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_masterUsuarios_administrador_datosPersonales : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["rol"] == null)
        {
            Response.Redirect("~/View/masterInicio/principal/inicio.aspx");
        }
        else if (Session["rol"].ToString().Equals("2"))
        {
            Response.Redirect("~/View/masterInicio/principal/inicio.aspx");
        }
        else if (Session["rol"].ToString().Equals("3"))
        {
            Response.Redirect("~/View/masterInicio/principal/inicio.aspx");
        }
        
        DataTable datosAdmin = new DAOAdmin().mostrarAdmin(int.Parse(Session["user_id"].ToString()));
        string nombre, apellido/*, telefono, correo*/;
        nombre = datosAdmin.Rows[0]["nombre"].ToString();
        apellido = datosAdmin.Rows[0]["apellido"].ToString();
        L_Bienvenida.Text = ("HOLA, " + nombre + " " + apellido).ToUpper();

        //Response.Cache.SetNoStore();
    }

    protected void BT_GuardarAdm_Click(object sender, EventArgs e)
    {
        EAdministrador admin = new EAdministrador();
        int error = 0;

        admin.Id = int.Parse(Session["user_id"].ToString());
        admin.Nombre = ((TextBox)FV_datosAdmin.Row.FindControl("Tx_AdmNombre")).Text;
        admin.Apellido = ((TextBox)FV_datosAdmin.Row.FindControl("Tx_AdmApellido")).Text;
        admin.Telefono = Int64.Parse(((TextBox)FV_datosAdmin.Row.FindControl("Tx_AdmTelefono")).Text);
        admin.Correo = ((TextBox)FV_datosAdmin.Row.FindControl("Tx_AdmCorreo")).Text;
        admin.Session = Session["user"].ToString();

        DataTable contarCorreo = new DAOAdmin().contarCorreos(admin);
        DataTable datosAdmin = new DAOAdmin().mostrarAdmin(int.Parse(Session["user_id"].ToString()));

        ((Label)FV_datosAdmin.Row.FindControl("LB_Correo")).Visible = false;
        ((Label)FV_datosAdmin.Row.FindControl("LB_Telefono")).Visible = false;
        ((Label)FV_datosAdmin.Row.FindControl("LB_Apellido")).Visible = false;
        ((Label)FV_datosAdmin.Row.FindControl("LB_Nombre")).Visible = false;


        if (datosAdmin.Rows[0]["correo"].ToString() == admin.Correo)
        {
            error = 0;
            P_Alerta.Visible = false;
        }
        else if (contarCorreo.Rows[0]["user_correo"].Equals("1"))
        {
            error = 0;
            P_Alerta.Visible = false;
        }
        else
        {
            L_Alerta.Text = "El correo ya existe";
            P_Alerta.Visible = true;

            ((TextBox)FV_datosAdmin.Row.FindControl("Tx_AdmCorreo")).Text = datosAdmin.Rows[0]["correo"].ToString();
            
            error = 1;
        }
        if (((TextBox)FV_datosAdmin.Row.FindControl("Tx_AdmNombre")).Text.Length < 3)
        {
            ((Label)FV_datosAdmin.Row.FindControl("LB_Nombre")).Visible = true;
            ((Label)FV_datosAdmin.Row.FindControl("LB_Nombre")).Text = "El numero de caracteres del nombre son invalidos";
            error = 1;
        }
        if (((TextBox)FV_datosAdmin.Row.FindControl("Tx_AdmApellido")).Text.Length < 3)
        {

            ((Label)FV_datosAdmin.Row.FindControl("LB_Apellido")).Visible = true;
            ((Label)FV_datosAdmin.Row.FindControl("LB_Apellido")).Text = "El numero de caracteres del apellido son invalidos";
            error = 1;
        }
       
        if (((TextBox)FV_datosAdmin.Row.FindControl("Tx_AdmTelefono")).Text.Length < 7)
        {

            ((Label)FV_datosAdmin.Row.FindControl("LB_Telefono")).Visible = true;
            ((Label)FV_datosAdmin.Row.FindControl("LB_Telefono")).Text = "El numero de caracteres del telefono son invalidos";
            error = 1;
        }
        if (((TextBox)FV_datosAdmin.Row.FindControl("Tx_AdmCorreo")).Text.Length < 16)
        {

            ((Label)FV_datosAdmin.Row.FindControl("LB_Correo")).Visible = true;
            ((Label)FV_datosAdmin.Row.FindControl("LB_Correo")).Text = "El numero de caracteres del correo son invalidos";
            error = 1;
        }

        if (error == 0)
        {
            DAOAdmin guardarCambios = new DAOAdmin();
            guardarCambios.modificarAdmin(admin);
            Response.Redirect("~/View/masterUsuarios/administrador/datosPersonales.aspx");
        }
    }



    protected void BT_GuardarContraAdm_Click(object sender, EventArgs e)
    {
        DataTable datosAdmin = new DAOAdmin().mostrarAdmin(int.Parse(Session["user_id"].ToString()));
        DAOAdmin guardar = new DAOAdmin();
        EAdministrador adminContra = new EAdministrador();
        int error = 0;
        string contraseñaActual, contraseñaNueva, _contraseñaActual;

        contraseñaActual = Tx_AdmCActual.Text;
        contraseñaNueva = Tx_AdmCNueva.Text;
        _contraseñaActual = datosAdmin.Rows[0]["contrasena"].ToString();

        if (contraseñaActual != _contraseñaActual)
        {
            LB_ErrorContraseña.Text = "La contraseña actual es errónea";
            error = 1;
        }

        if (Tx_AdmCNueva.Text.Length < 4)
        {
            LB_ErrorContraseña.Text = "La contraseña no puede tener menos de 4 caracteres";
            error = 1;
        }

        if (error == 0)
        {
            adminContra.Contraseña = contraseñaNueva;
            adminContra.Id = int.Parse(Session["user_id"].ToString());

            guardar.actualizarContrasena(adminContra);

            Tx_AdmCActual.Text = "";
            Tx_AdmCActual.Text = "";

            LB_ErrorContraseña.Text = "La contraseña ha sido actualizada";

        }
    }
}

