using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_masterUsuarios_cliente_datosPersonalesCliente : System.Web.UI.Page
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
        else if (Session["rol"].ToString().Equals("2"))
        {
            Response.Redirect("~/View/masterInicio/principal/inicio.aspx");
        }
        if (GV_alertaCliente.Rows.Count == 0)
        {
            GV_alertaCliente.Visible = false;
        }
        else {
            GV_alertaCliente.Visible = true;
        }
        DataTable datosCliente = new DAOCliente().mostrarCliente(int.Parse(Session["user_id"].ToString()));
        string nombre, apellido/*, telefono, correo*/;
        nombre = datosCliente.Rows[0]["nombre"].ToString();
        apellido = datosCliente.Rows[0]["apellido"].ToString();
        L_Bienvenida.Text = ("HOLA " + nombre + " " + apellido).ToUpper();
    }

    protected void BT_GuardarCliente_Click(object sender, EventArgs e)
    {

        ECliente cliente = new ECliente();
        int error = 0;

        cliente.Id = int.Parse(Session["user_id"].ToString());
        cliente.Nombre = ((TextBox)FV_MostrarCliente.Row.FindControl("Tx_ClienteNombre")).Text;
        cliente.Apellido = ((TextBox)FV_MostrarCliente.Row.FindControl("Tx_ClienteApellido")).Text;
        cliente.Telefono = Int64.Parse(((TextBox)FV_MostrarCliente.Row.FindControl("Tx_ClienteTelefono")).Text);
        cliente.Correo = ((TextBox)FV_MostrarCliente.Row.FindControl("Tx_ClienteCorreo")).Text;
        cliente.Session = Session["user"].ToString();

        DataTable contarCorreo = new DAOCliente().contarCorreos(cliente);
        DataTable datosAdmin = new DAOCliente().mostrarCliente(int.Parse(Session["user_id"].ToString()));

        if (datosAdmin.Rows[0]["correo"].ToString() == cliente.Correo)
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

            ((TextBox)FV_MostrarCliente.Row.FindControl("Tx_ClienteCorreo")).Text = datosAdmin.Rows[0]["correo"].ToString();

            error = 1;
        }

        if (error == 0)
        {
            DAOCliente guardarCambios = new DAOCliente();
            guardarCambios.modificarCliente(cliente);

            Response.Redirect("~/View/masterUsuarios/cliente/datosPersonalesCliente.aspx");
        }

    }





    protected void BT_GuardarContraCliente_Click(object sender, EventArgs e)
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

    protected void BT_EliminarCuenta_Click(object sender, EventArgs e)
    {
        
        MPE_EliminarCuenta.Show();

    }

    protected void eliminarCuenta(object sender, EventArgs e)
    {
        DataTable datosCliente = new DAOCliente().mostrarCliente(int.Parse(Session["user_id"].ToString()));
        DAOCliente eliminar = new DAOCliente();
        EUsuario clienteContra = new EUsuario();
        string contraseñaActual, _contraseñaActual;
        contraseñaActual = Tx_EliminarCuenta.Text;
        _contraseñaActual = datosCliente.Rows[0]["contrasena"].ToString();


        if (contraseñaActual != _contraseñaActual)
        {
            LB_ErrorEliminar.Text = "La contraseña actual es errónea";
        }
        else
        {

            clienteContra.UserId = int.Parse(Session["user_id"].ToString());
            eliminar.eliminarCuenta(clienteContra);

            Session["rol"] = null;
            Session["nombre"] = null;
            Session["user_id"] = null;
            Session["user"] = null;

            Response.Redirect("~/View/masterInicio/principal/inicio.aspx");

            //LB_ErrorEliminar.Text = "La contraseña ha sido actualizada";

        }

    }



    protected void GV_alertaCliente_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}