﻿using System;
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

        //int id = int.Parse(Session["user_id"].ToString());
        //int prueba = id;
        //DataTable asistencia = new DAORegistroEstilista().mostrarEstilistaAsis(prueba);
        //string fech;
        //fech = asistencia.Rows[0]["id_alerta"].ToString();
        //fecha.Text = fech;
        int id = int.Parse(Session["user_id"].ToString());
        DataTable asistencia = new DAORegistroEstilista().mostrarEstilistaAsis(id);
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
        separador1 = DiaMulta.Split('/');
        int Actual = int.Parse(separador[0]);
        int Inacistencia = int.Parse(separador1[0]);
        int ActualMes = int.Parse(separador[1]);
        int InacistenciaMes = int.Parse(separador1[1]);
        //int Reserva = int.Parse(DiaReserva);
        if (Alerta == 4 && Actual == Inacistencia && ActualMes == InacistenciaMes)
        {
            fecha.Text = DiaMulta.ToUpper();
            prueba.Text = alerta.ToUpper();
            Label2.Text = ("Debido a que usted INCUMPLIO con la reserva del dia " + DiaReserva + " " + " NO  prodra reserva durante 24 Horas");
            Asistencia.Show();
            BT_GuardarReserva.Visible = false;

        }
        else
        {

            BT_GuardarReserva.Visible = true;
        }
    }


    protected void BT_GuardarReserva_Click(object sender, EventArgs e)
    {
        string hora, fecha;
        DateTime fechaCliente,fechaCalendario;
        int servicioID, tamaño;
        int contador = 0;

        servicioID = int.Parse(DDL_servicio.SelectedValue.ToString());

        DAO_Reserva buscar = new DAO_Reserva();
        DataTable precio = buscar.mostrarPrecio(servicioID);

        fechaCliente = DateTime.Parse(DDL_Hora.SelectedItem.ToString());
        hora = fechaCliente.ToShortTimeString();
        fecha = C_Reserva.SelectedDate.ToShortDateString();
        fechaCalendario = C_Reserva.SelectedDate;
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
        DateTime horaCliente, horaFinal;
        int  hora, minuto, duracionFinal, id_estilista, id_servicio;
        DAO_Reserva mostrarDuracion = new DAO_Reserva();
        DAO_Reserva buscarPrecio = new DAO_Reserva();
        


        diaReserva = C_Reserva.SelectedDate.ToShortDateString();//11/09/2019

        hora_cliente = DDL_Hora.SelectedItem.ToString();//08:00:00
        id_estilista = int.Parse(DDL_Estilista.SelectedValue.ToString());//39760672
        id_servicio = int.Parse(DDL_servicio.SelectedValue.ToString());//quitar o modificar //7

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