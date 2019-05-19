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
        int id = int.Parse(Session["user_id"].ToString());
        DataTable asistencia = new DAORegistroEstilista().mostrarEstilistaAsis(id);
        int vacio = int.Parse(asistencia.Rows.Count.ToString());
        string nombre, apellido/*, telefono, correo*/;
        nombre = datosCliente.Rows[0]["nombre"].ToString();
        apellido = datosCliente.Rows[0]["apellido"].ToString();
        L_Bienvenida.Text = ("HOLA " + nombre + " " + apellido ).ToUpper();

        if (vacio != 0)
        {
            string FechaReserva, alerta;
            FechaReserva = asistencia.Rows[0]["dia_hora_inicio"].ToString();
            DateTime prueb = DateTime.Parse(FechaReserva);
            String DiaReserva = prueb.ToString("dd/MM/yyyy");
            String DiaMulta = prueb.AddDays(1).ToString("dd/MM/yyyy");
            string FechaActual = DateTime.Now.ToString();
            DateTime FechaAc = DateTime.Parse(FechaActual);
            String FechaSistema = FechaAc.ToString("dd/MM/yyyy");
            alerta = asistencia.Rows[0]["id_alerta"].ToString();
            int Alerta = int.Parse(alerta);
            String[] separador;
            String[] separador1;
            separador = FechaSistema.Split('/');
            separador1 = DiaReserva.Split('/');
            int Actual = int.Parse(separador[0]);
            int Inacistencia = int.Parse(separador1[0]);
            int ActualMes = int.Parse(separador[1]);
            int InacistenciaMes = int.Parse(separador1[1]);
            //int Reserva = int.Parse(DiaReserva);
            if (Alerta == 1 || Alerta == 2 || Alerta == 3 || Alerta == 6 && Actual == Inacistencia && ActualMes == InacistenciaMes)
            {
                DataTable prueba = new DAORegistroEstilista().Alerta(id);
                int vacio2 = int.Parse(prueba.Rows.Count.ToString());
                if (vacio2 != 0)
                {

                    String descripcion = prueba.Rows[0]["descripcion"].ToString();
                    String fecha = prueba.Rows[0]["fecha"].ToString();
                    DateTime prue = DateTime.Parse(fecha);
                    String DiaReserv = prueb.ToString("dd'de' MMM 'de' yyyy");
                    String nombre_estilista = prueba.Rows[0]["nombre_estilista"].ToString();
                    String apellido_estilista = prueba.Rows[0]["apellido_estilista"].ToString();
                    String servicio = prueba.Rows[0]["servicio"].ToString();
                    Nombre.Text = " " + nombre + " " + apellido;
                    sera.Text = descripcion + " " + "el dia" + " " + DiaReserv + " " + "con el servicio " + " " + servicio + " " + "fue cancelada";
                    MPE_Alerta.Show();
                }
            }
            else
            {

            }
        }

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
        DataTable datoscliente = new DAOCliente().mostrarCliente(int.Parse(Session["user_id"].ToString()));

        ((Label)FV_MostrarCliente.Row.FindControl("LB_ErrorNombre")).Visible = false;
        ((Label)FV_MostrarCliente.Row.FindControl("LB_ErrorApellido")).Visible = false;
        ((Label)FV_MostrarCliente.Row.FindControl("LB_ErrorTelefono")).Visible = false;
        ((Label)FV_MostrarCliente.Row.FindControl("LB_ErrorCorreo")).Visible = false;

        if (datoscliente.Rows[0]["correo"].ToString() == cliente.Correo)
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

            ((TextBox)FV_MostrarCliente.Row.FindControl("Tx_ClienteCorreo")).Text = datoscliente.Rows[0]["correo"].ToString();

            error = 1;
        }
        if (((TextBox)FV_MostrarCliente.Row.FindControl("Tx_ClienteNombre")).Text.Length < 3)
        {

            ((Label)FV_MostrarCliente.Row.FindControl("LB_ErrorNombre")).Visible = true;
            ((Label)FV_MostrarCliente.Row.FindControl("LB_ErrorNombre")).Text = "El Numero de caracteres del nombre es invalido";
            error = 1;
        }
        if (((TextBox)FV_MostrarCliente.Row.FindControl("Tx_ClienteApellido")).Text.Length < 3)
        {
            ((Label)FV_MostrarCliente.Row.FindControl("LB_ErrorApellido")).Visible = true;
            ((Label)FV_MostrarCliente.Row.FindControl("LB_ErrorApellido")).Text = "El Numero de caracteres del apellido es invalido";
            error = 1;
        }
        if (((TextBox)FV_MostrarCliente.Row.FindControl("Tx_ClienteTelefono")).Text.Length < 8) {

            ((Label)FV_MostrarCliente.Row.FindControl("LB_ErrorTelefono")).Visible = true;
            ((Label)FV_MostrarCliente.Row.FindControl("LB_ErrorTelefono")).Text = "El Numero de caracteres del telefono es invalido";
            error = 1;
        }
        if (((TextBox)FV_MostrarCliente.Row.FindControl("Tx_ClienteCorreo")).Text.Length < 10)
        {

            ((Label)FV_MostrarCliente.Row.FindControl("LB_ErrorCorreo")).Visible = true;
            ((Label)FV_MostrarCliente.Row.FindControl("LB_ErrorCorreo")).Text = "El Numero de caracteres del correo es invalido";
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
        if  (Tx_ContraseñaNueva.Text.Length < 4)
        {
            LB_ErrorContraseña.Text = "La contraseña debe tener más de 4 caracteres";
        }
        else
        {
            
                clienteContra.Contraseña = contraseñaNueva;
                clienteContra.UserId = int.Parse(Session["user_id"].ToString());

                guardar.actualizarContrasena(clienteContra);
                LB_ErrorContraseña.Visible = true;
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



    protected void Aceptar_Command(object sender, CommandEventArgs e)
    {
        if (e.CommandName.Equals("Aceptar")) {

            int id = int.Parse(Session["user_id"].ToString());
            DataTable prueba = new DAORegistroEstilista().Alerta(id);
            int IdReserva = int.Parse(prueba.Rows[0]["id"].ToString());
            DataTable datoscliente = new DAORegistroEstilista().ConfirmacionAlerta(IdReserva);

            Response.Redirect("~/View/masterUsuarios/cliente/datosPersonalesCliente.aspx");
        }
    }


}