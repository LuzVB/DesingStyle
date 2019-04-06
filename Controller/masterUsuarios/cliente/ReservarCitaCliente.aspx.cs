using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_masterUsuarios_cliente_ReservarCitaCliente : System.Web.UI.Page
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

    }


    protected void BT_GuardarReserva_Click(object sender, EventArgs e)
    {
        string hora, fecha;
        DateTime fechaCliente;

        int servicioID;
        servicioID = int.Parse(DDL_servicio.SelectedValue.ToString());

        DAO_Reserva buscarPrecio = new DAO_Reserva();
        DataTable precio = buscarPrecio.mostrarPrecio(servicioID);

        fechaCliente = DateTime.Parse(DDL_Hora.SelectedItem.ToString());
        hora = fechaCliente.ToShortTimeString();
        fecha = fechaCliente.ToShortDateString();

        L_estilistaPanel.Text = DDL_Estilista.SelectedItem.ToString();
        L_servicioPanel.Text = DDL_servicio.SelectedItem.ToString();
        L_fechaPanel.Text = fecha;
        L_horaPanel.Text = hora;
        L_PrecioM.Text = "$ " + precio.Rows[0]["precio_servicio"].ToString();

        MPE_confirmarReserva.Show();
    }

    protected void BT_Reservar_Click(object sender, EventArgs e)
    {
        string hora_cliente, diaReserva, duracionServicio, time24;
        string[] cadena;
        DateTime horaCliente, horaFinal;
        int servicio, hora, minuto, duracionFinal, id_estilista, id_servicio;
        DAO_Reserva mostrarDuracion = new DAO_Reserva();
        DAO_Reserva buscarPrecio = new DAO_Reserva();
        


        diaReserva = C_Reserva.SelectedDate.ToShortDateString();

        hora_cliente = DDL_Hora.SelectedItem.ToString();
        id_estilista = int.Parse(DDL_Estilista.SelectedValue.ToString());
        id_servicio = int.Parse(DDL_servicio.SelectedValue.ToString());

        horaCliente = DateTime.Parse(hora_cliente);
        //hora_cliente = horaCliente.ToLongTimeString();

        time24 = horaCliente.ToString("HH:mm", CultureInfo.CurrentCulture);


        servicio = int.Parse(DDL_servicio.SelectedValue.ToString());
        DataTable duracion = mostrarDuracion.duracionServicio(servicio);
        duracionServicio = duracion.Rows[0]["duracion_servicio"].ToString();

        cadena = duracionServicio.Split(':');

        hora = int.Parse(cadena[0]);
        minuto = int.Parse(cadena[1]);

        duracionFinal = (hora * 60) + minuto;



        horaFinal = DateTime.Parse(time24).AddMinutes(duracionFinal);


        ERegistroHorario reserva = new ERegistroHorario();
        ERegistroHorario gReserva = new ERegistroHorario();
        DAO_Reserva rangoHorario = new DAO_Reserva();
        DAO_Reserva guardarReserva = new DAO_Reserva();
        DataTable horario = rangoHorario.horarioEstilista(id_estilista, hora_cliente, horaFinal.ToString());
        int tamano = horario.Rows.Count;


        for (int i = 0; i < tamano; i++)
        {
            reserva.IdReserva = int.Parse(horario.Rows[i]["id"].ToString());
            reserva.IdServicio = id_servicio;
            reserva.IdCliente = int.Parse(Session["user_id"].ToString());
            reserva.Estado = false;

            rangoHorario.actulizarReserva(reserva);
        }

        DataTable precio = buscarPrecio.mostrarPrecio(id_servicio);
        gReserva.IdCliente = int.Parse(Session["user_id"].ToString());
        gReserva.Idestilista = id_estilista;
        gReserva.IdServicio = servicio;
        gReserva.Session = Session["user"].ToString();
        gReserva.Fechaini = DateTime.Parse(hora_cliente);
        gReserva.Fechafin = horaFinal;
        gReserva.Precio = int.Parse(precio.Rows[0]["precio_servicio"].ToString());

        guardarReserva.guardarReserva(gReserva);

        MPE_ReservaExitosa.Show();
    }


    protected void DDL_servicio_SelectedIndexChanged(object sender, EventArgs e)
    {
        int servicioID;
        servicioID = int.Parse(DDL_servicio.SelectedValue.ToString());

        DAO_Reserva buscarPrecio = new DAO_Reserva();
        DataTable precio = buscarPrecio.mostrarPrecio(servicioID);

        L_Precio.Text = "$ " + precio.Rows[0]["precio_servicio"].ToString();

    }

    protected void BT_Aceptar_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/View/masterUsuarios/cliente/ReservasAgendadas.aspx");
    }

    protected void C_Reserva_SelectionChanged(object sender, EventArgs e)
    {
        DateTime fecha = new DateTime();
        DateTime calendario2 = new DateTime();
        fecha = DateTime.Now;
        string calendario, fecha2;

        calendario = C_Reserva.SelectedDate.ToShortDateString();
        fecha2 = fecha.ToShortDateString();

        fecha = DateTime.Parse(fecha2);
        calendario2 = DateTime.Parse(calendario);

        if (calendario2 < fecha)
        {
            LB_CalendarioAlert.Visible = true;
            LB_CalendarioAlert.Text = "No hay reservas por favor seleccione otra fecha.";
        }
        else
        {
            LB_CalendarioAlert.Visible = false;
        }
    }
}