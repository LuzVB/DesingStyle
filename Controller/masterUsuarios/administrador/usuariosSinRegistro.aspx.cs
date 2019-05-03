using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_masterUsuarios_administrador_usuariosSinRegistro : System.Web.UI.Page
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


        string fechaHora = DateTime.Now.ToString("D");
        LB_FechaSistema.Text = fechaHora;

    }

    protected void DDL_Servicio_SelectedIndexChanged(object sender, EventArgs e)
    {
        int servicioID;
        servicioID = int.Parse(DDL_Servicio.SelectedValue.ToString());

        DAO_Reserva servicio = new DAO_Reserva();
        DataTable precio = servicio.mostrarPrecio(servicioID);
        DataTable duracion = servicio.duracionServicio(servicioID);

        LB_Precio.Text = "$ " + precio.Rows[0]["precio_servicio"].ToString();
        L_Duracion.Text = duracion.Rows[0]["duracion_servicio"].ToString();
    }

    protected void DDL_Servicio_DataBound(object sender, EventArgs e)
    {
        if (DDL_Servicio.SelectedValue.Equals(""))
        {
            LB_Precio.Text = "";
            L_Duracion.Text = "";
        }
        else
        {
            int servicioID = int.Parse(DDL_Servicio.SelectedValue.ToString());

            DAO_Reserva buscarPrecio = new DAO_Reserva();
            DataTable precio = buscarPrecio.mostrarPrecio(servicioID);
            DataTable duracion = buscarPrecio.duracionServicio(servicioID);

            LB_Precio.Text = "$ " + precio.Rows[0]["precio_servicio"].ToString();
            L_Duracion.Text = duracion.Rows[0]["duracion_servicio"].ToString();
        }
    }

    protected void IB_GuardarClienteSin_Click(object sender, ImageClickEventArgs e)
    {
        string hora, fecha;
        DateTime fechaCliente;
        int servicioID;

        ERegistroUsuario cliente = new ERegistroUsuario();
        cliente.Cedula = Int32.Parse(DDL_CedulaSin.SelectedValue.ToString());
        //cliente.Nombre = Tx_nombre.Text;

        servicioID = int.Parse(DDL_Servicio.SelectedValue.ToString());

        DAO_Reserva buscar = new DAO_Reserva();
        DataTable precio = buscar.mostrarPrecio(servicioID);

        fechaCliente = DateTime.Parse(DDL_HoraCliente.SelectedItem.ToString());
        hora = fechaCliente.ToShortTimeString();

        fecha = LB_FechaSistema.Text;


        //if (error == 0)
        //{
        //L_Cliente.Text = cliente.Nombre;
        L_Cedula.Text = cliente.Cedula.ToString();
        L_estilistaPanel.Text = DDL_NombreEstilista.SelectedItem.ToString();
        L_servicioPanel.Text = DDL_Servicio.SelectedItem.ToString();
        L_fechaPanel.Text = fecha;
        L_horaPanel.Text = hora;
        L_PrecioM.Text = LB_Precio.Text;

        MPE_confirmarReserva.Show();
        //}

    }

    protected void BT_Reservar_Click(object sender, EventArgs e)
    {
        string hora_cliente, diaReserva, duracionServicio, time24, horaF, hora_clienteF;
        string[] cadena;
        DateTime horaCliente, horaFinal;
        int hora, minuto, duracionFinal, id_estilista, id_servicio;
        DAO_Reserva mostrarDuracion = new DAO_Reserva();
        DAO_Reserva buscarPrecio = new DAO_Reserva();

        //diaReserva = C_Reserva.SelectedDate.ToShortDateString();//11/09/2019
        diaReserva = LB_FechaSistema.Text;

        hora_cliente = DDL_HoraCliente.SelectedItem.ToString();//08:00:00
        //hora_cliente = "08:00:00";//08:00:00
        id_estilista = int.Parse(DDL_NombreEstilista.SelectedValue.ToString());//39760672
        id_servicio = int.Parse(DDL_Servicio.SelectedValue.ToString());//quitar o modificar //7

        horaCliente = DateTime.Parse(hora_cliente); //10/04/2019 8:00:00 a. m.
        //hora_cliente = horaCliente.ToLongTimeString();

        time24 = horaCliente.ToString("HH:mm", CultureInfo.CurrentCulture); //08:00

        DataTable duracion = mostrarDuracion.duracionServicio(id_servicio);
        duracionServicio = duracion.Rows[0]["duracion_servicio"].ToString();//00:30:00

        cadena = duracionServicio.Split(':');

        hora = int.Parse(cadena[0]);
        minuto = int.Parse(cadena[1]);

        duracionFinal = (hora * 60) + minuto;//30

        horaFinal = DateTime.Parse(time24).AddMinutes(duracionFinal);//10/04/2019 8:30:00 a. m
        horaF = horaFinal.ToShortTimeString();

        hora_cliente = diaReserva + " " + time24;
        hora_clienteF = diaReserva + " " + horaF;



        ERegistroHorario reserva = new ERegistroHorario();
        ERegistroHorario gReserva = new ERegistroHorario();
        DAO_Reserva rangoHorario = new DAO_Reserva();
        DAO_Reserva guardarReserva = new DAO_Reserva();
        DataTable horario = rangoHorario.horarioEstilista(id_estilista, hora_cliente, hora_clienteF);
        int tamano = horario.Rows.Count;


        for (int i = 0; i < tamano; i++)
        {
            reserva.IdReserva = int.Parse(horario.Rows[i]["id"].ToString());
            reserva.IdServicio = id_servicio;
            reserva.IdCliente = int.Parse(DDL_CedulaSin.SelectedValue.ToString());
            reserva.Estado = false;

            rangoHorario.actulizarReserva(reserva);
        }

        DataTable precio = buscarPrecio.mostrarPrecio(id_servicio);
        gReserva.IdCliente = int.Parse(DDL_CedulaSin.SelectedValue.ToString());
        gReserva.Idestilista = id_estilista;
        gReserva.IdServicio = id_servicio;
        gReserva.Session = Session.SessionID;
        gReserva.Fechaini = DateTime.Parse(hora_cliente);
        gReserva.Fechafin = DateTime.Parse(hora_clienteF);
        gReserva.Precio = int.Parse(precio.Rows[0]["precio_servicio"].ToString());
        gReserva.Registro = false;

        guardarReserva.guardarReserva2(gReserva);

        MPE_ReservaExitosa.Show();
    }

    protected void BT_Aceptar_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/View/masterUsuarios/administrador/usuariosSinRegistro.aspx");
    }

    protected void preRegistro_Click(object sender, ImageClickEventArgs e)
    {

        int error = 0;
        ERegistroUsuario cliente = new ERegistroUsuario();
        cliente.Cedula = Int32.Parse(Tx_cedula.Text);
        cliente.Nombre = Tx_nombre.Text;
        cliente.Apellido = "";
        cliente.Correo = "";
        cliente.Contraseña = "";
        cliente.Fecha_nacimiento = DateTime.Parse(LB_FechaSistema.Text);
        cliente.Telefono = 0;
        cliente.Estado = 1;
        cliente.Rol = 4;
        cliente.Session = Session.SessionID;

        DataTable contarId = new DAORegistroCliente().contarId(cliente);

        if (contarId.Rows[0]["user_id"].Equals(-1))
        {
            L_ErrorCedula.Text = "";
            error = 0;
        }
        else
        {
            L_ErrorCedula.Visible = true;
            L_ErrorCedula.Text = "La cedula ya se encuentra registrada ";
            error = 1;
        }

        if(error == 0)
        {
            new DAORegistroCliente().registroCliente(cliente);
            Response.Redirect("usuariosSinRegistro.aspx");
        }
    }
}