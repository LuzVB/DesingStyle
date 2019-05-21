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

        int id = int.Parse(Session["user_id"].ToString());
        DataTable asistencia = new DAORegistroEstilista().mostrarEstilistaAsis(id);
        int vacio = int.Parse(asistencia.Rows.Count.ToString());
        if (vacio != 0)
        {
            string FechaReserva, alerta;
            FechaReserva = asistencia.Rows[0]["dia_hora_inicio"].ToString();
            DateTime prueb = DateTime.Parse(FechaReserva);
            String DiaReserva = prueb.ToString("dd/MM/yyyy");
            String Hora1Reserva = prueb.ToString("hh:mm:ss");
            String HoraActual = DateTime.Now.ToString("HH:mm");
            String DReserva = prueb.ToString("dd'de' MMM 'de' yyyy");
            String DiaMulta = prueb.AddDays(1).ToString("dd/MM/yyyy");
            string FechaActual = DateTime.Now.ToString();
            DateTime FechaAc = DateTime.Parse(FechaActual);
            String FechaSistema = FechaAc.ToString("dd/MM/yyyy");
            alerta = asistencia.Rows[0]["id_alerta"].ToString();
            int Alerta = int.Parse(alerta);
            String[] separador;
            String[] separador1;
            String[] separador2;
            String[] separador3;
            String[] separador4;
            separador = FechaSistema.Split('/');
            separador1 = DiaMulta.Split('/');
            separador2 = Hora1Reserva.Split(':');
            separador3 = DiaReserva.Split('/');
            separador4 = HoraActual.Split(':');
            int Actual = int.Parse(separador[0]);
            int Inacistencia = int.Parse(separador1[0]);
            int ActualMes = int.Parse(separador[1]);
            int InacistenciaMes = int.Parse(separador1[1]);
            int HoraReserva = int.Parse(separador2[0]);
            int MinReserva = int.Parse(separador2[1]);
            int Horaactual = int.Parse(separador4[0]);
            int Minactual = int.Parse(separador4[1]);
            int DiaReservas = int.Parse(separador3[0]);
            int MesReservas = int.Parse(separador3[1]);
            //int Reserva = int.Parse(DiaReserva);
            if (Alerta == 5 && Actual == DiaReservas && ActualMes == MesReservas && HoraReserva < Horaactual || Alerta == 5 && Inacistencia == DiaReservas && InacistenciaMes == MesReservas && HoraReserva > Horaactual)
            {
                //fecha.Text = DiaMulta.ToUpper();
                //prueba.Text = alerta.ToUpper();
                Label2.Text = ("Debido a que usted INCUMPLIO con la reserva del dia " + DReserva + " " + " NO  prodra reserva durante 24 Horas");
                Asistencia.Show();
                BT_GuardarReserva.Visible = false;

            }
            else
            {
                //fecha.Text = DiaMulta.ToUpper();
                //prueba.Text = alerta.ToUpper();
                BT_GuardarReserva.Visible = true;
            }
        }

    }


    protected void BT_GuardarReserva_Click(object sender, EventArgs e)
    {
        string hora, fecha;
        DateTime fechaCliente,fechaCalendario;
        DateTime fechaF = new DateTime();
        int servicioID, tamaño;
        int contador = 0;

        servicioID = int.Parse(DDL_servicio.SelectedValue.ToString());

        DAO_Reserva buscar = new DAO_Reserva();
        DataTable precio = buscar.mostrarPrecio(servicioID);

        fechaCliente = DateTime.Parse(DDL_Hora.SelectedItem.ToString());
        hora = fechaCliente.ToShortTimeString();
        fecha = C_Reserva.SelectedDate.ToShortDateString();//"1/01/0001"
        
        if (fecha == "1/01/0001")
        {
            fechaF = DateTime.Now;
            fecha = fechaF.ToShortDateString();
            fechaCalendario = fechaF;
        }
        else
        {
            fechaCalendario = C_Reserva.SelectedDate;
        }

        
        //fecha = fechaCliente.ToShortDateString();

        DataTable verificar = buscar.verificarReserva(int.Parse(Session["user_id"].ToString()), fechaCalendario, fechaCalendario.AddDays(1));
        tamaño = verificar.Rows.Count;

        for (int i = 0; i < tamaño; i++)
        {
            if (verificar.Rows[i]["id_servicio"].ToString() == DDL_servicio.SelectedValue)
            {
                contador = 1;
            }
        }

        if(contador == 1)
        {
            LB_Error.Text = "Lo sentimos ya tiene una reserva con ese servicio. Seleccione otra fecha u otro servicio.";
            MPE_Error.Show();
        }
        else
        {
            L_estilistaPanel.Text = DDL_Estilista.SelectedItem.ToString();
            L_servicioPanel.Text = DDL_servicio.SelectedItem.ToString();
            L_fechaPanel.Text = fecha;
            L_horaPanel.Text = hora;
            L_PrecioM.Text = "$ " + precio.Rows[0]["precio_servicio"].ToString();

            MPE_confirmarReserva.Show();
        }

    }

    protected void BT_Reservar_Click(object sender, EventArgs e)
    {
        string hora_cliente, diaReserva, duracionServicio, time24 ,horaF, hora_clienteF;
        string[] cadena;
        DateTime horaCliente, horaFinal, fechaF;
        int  hora, minuto, duracionFinal, id_estilista, id_servicio;
        DAO_Reserva mostrarDuracion = new DAO_Reserva();
        DAO_Reserva buscarPrecio = new DAO_Reserva();
        


        diaReserva = C_Reserva.SelectedDate.ToShortDateString();//11/09/2019 //aqui

        if (diaReserva == "1/01/0001")
        {
            fechaF = DateTime.Now;
            diaReserva = fechaF.ToShortDateString();
        }

        hora_cliente = DDL_Hora.SelectedItem.ToString();
        id_estilista = int.Parse(DDL_Estilista.SelectedValue.ToString());
        id_servicio = int.Parse(DDL_servicio.SelectedValue.ToString());

        horaCliente = DateTime.Parse(hora_cliente); 

        time24 = horaCliente.ToString("HH:mm", CultureInfo.CurrentCulture); 
        
        DataTable duracion = mostrarDuracion.duracionServicio(id_servicio);
        duracionServicio = duracion.Rows[0]["duracion_servicio"].ToString();

        cadena = duracionServicio.Split(':');

        hora = int.Parse(cadena[0]);
        minuto = int.Parse(cadena[1]);

        duracionFinal = (hora * 60) + minuto;//30

        horaFinal = DateTime.Parse(time24).AddMinutes(duracionFinal);
        horaF = horaFinal.ToShortTimeString();

        hora_cliente = diaReserva +" "+ time24;
        hora_clienteF = diaReserva +" " + horaF;       
       


        ERegistroHorario reserva = new ERegistroHorario();
        ERegistroHorario gReserva = new ERegistroHorario();
        DAO_Reserva rangoHorario = new DAO_Reserva();
        DAO_Reserva guardarReserva = new DAO_Reserva();
        DataTable horario = rangoHorario.horarioEstilista(id_estilista, hora_cliente, hora_clienteF);
        int tamano = horario.Rows.Count;


        for (int i = 0; i < tamano; i++)
        {
            reserva.IdReserva = int.Parse(horario.Rows[i]["id"].ToString());
            reserva.Estado = false;

            rangoHorario.actulizarReserva(reserva);
        }

        DataTable precio = buscarPrecio.mostrarPrecio(id_servicio);
        gReserva.IdCliente = int.Parse(Session["user_id"].ToString());
        gReserva.Idestilista = id_estilista;
        gReserva.IdServicio = id_servicio;
        gReserva.Session = Session["user"].ToString();
        gReserva.Fechaini = DateTime.Parse(hora_cliente);
        gReserva.Fechafin = DateTime.Parse(hora_clienteF);
        gReserva.Precio = int.Parse(precio.Rows[0]["precio_servicio"].ToString());
        gReserva.Registro = true;

        guardarReserva.guardarReserva2(gReserva);

        MPE_ReservaExitosa.Show();
    }


    protected void DDL_servicio_SelectedIndexChanged(object sender, EventArgs e)
    {
        int servicioID;
        servicioID = int.Parse(DDL_servicio.SelectedValue.ToString());

        DAO_Reserva servicio = new DAO_Reserva();
        DataTable precio = servicio.mostrarPrecio(servicioID);
        DataTable duracion = servicio.duracionServicio(servicioID);

        L_Precio.Text = "$ " + precio.Rows[0]["precio_servicio"].ToString();
        L_Duracion.Text = duracion.Rows[0]["duracion_servicio"].ToString();
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

    protected void ODS_servicio_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
       
    }

    protected void DDL_servicio_DataBound(object sender, EventArgs e)
    {

        if (DDL_servicio.SelectedValue.Equals(""))
        {
            L_Precio.Text = "";
            L_Duracion.Text = "";
        }
        else
        {
           int servicioID = int.Parse(DDL_servicio.SelectedValue.ToString());

            DAO_Reserva buscarPrecio = new DAO_Reserva();
            DataTable precio = buscarPrecio.mostrarPrecio(servicioID);
            DataTable duracion = buscarPrecio.duracionServicio(servicioID);

            L_Precio.Text = "$ " + precio.Rows[0]["precio_servicio"].ToString();
            L_Duracion.Text = duracion.Rows[0]["duracion_servicio"].ToString();
        }

       
    }



    protected void DDL_Hora_DataBound(object sender, EventArgs e)
    {

        int index = Int32.Parse(DDL_Hora.SelectedIndex.ToString());
        if (index <= -1)
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