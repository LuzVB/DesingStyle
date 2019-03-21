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

        DataTable datosCliente = new DAOCliente().mostrarCliente(int.Parse(Session["user_id"].ToString()));
        string nombre, apellido/*, telefono, correo*/;
        nombre = datosCliente.Rows[0]["nombre"].ToString();
        apellido = datosCliente.Rows[0]["apellido"].ToString();
        L_Bienvenida.Text = ("HOLA " + nombre + " " + apellido).ToUpper();

        //this.RegisterStartupScript("mensaje", "<script type='text/javascript'>function Confirm(){ if (Page_ClientValidate()){ var confirm_value = document.createElement('INPUT');confirm_value.type = 'hidden';if (confirm('Data has been Added.Do you wish to Continue ? ')){ confirm_value.value = 'Yes';}else{ confirm_value.value = 'No';}document.forms[0].appendChild(confirm_value);}}</script>");
        ////L_Bienvenida.Text = Application["visitor"].ToString();

        ////function Confirm()
        ////{
        ////    if (Page_ClientValidate())
        ////    {
        ////        var confirm_value = document.createElement("INPUT");
        ////        confirm_value.type = "hidden";
        ////        confirm_value.name = "confirm_value";
        ////        if (confirm("Data has been Added. Do you wish to Continue ?"))
        ////        {
        ////            confirm_value.value = "Yes";
        ////        }
        ////        else
        ////        {
        ////            confirm_value.value = "No";
        ////        }
        ////        document.forms[0].appendChild(confirm_value);
        ////    }
        ////}

        //if (Application["visitor"].ToString() == "0")
        //{
        //    //contador = 1;

        //    telefono = datosCliente.Rows[0]["telefono"].ToString();
        //    correo = datosCliente.Rows[0]["correo"].ToString();


        //    Tx_ClienteNombre.Text = nombre;
        //    Tx_ClienteApellido.Text = apellido;
        //    Tx_ClienteTelefono.Text = telefono;
        //    Tx_ClienteCorreo.Text = correo;

        //    Application["visitor"] = 1;

        //}


    }

    protected void BT_GuardarCliente_Click(object sender, EventArgs e)
    {
        string _nombre, _apellido, _telefono, _correo;
        int _id;
        
        _id = int.Parse(Session["user_id"].ToString());
        _nombre = ((TextBox)FV_MostrarCliente.Row.FindControl("Tx_ClienteNombre")).Text;
        _apellido = ((TextBox)FV_MostrarCliente.Row.FindControl("Tx_ClienteApellido")).Text;
        _telefono = ((TextBox)FV_MostrarCliente.Row.FindControl("Tx_ClienteTelefono")).Text;
        _correo = ((TextBox)FV_MostrarCliente.Row.FindControl("Tx_ClienteCorreo")).Text;

        DAOCliente guardarCambios = new DAOCliente();
        guardarCambios.modificarCliente(_id, _nombre, _apellido, _telefono, _correo, Session["user"].ToString());


        Response.Redirect("~/View/masterUsuarios/cliente/datosPersonalesCliente.aspx");
        
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

    
}