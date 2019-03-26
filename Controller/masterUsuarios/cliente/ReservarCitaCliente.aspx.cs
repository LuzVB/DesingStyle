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
        string hora_cliente,diaReserva,duracionServicio,time24;
        string[] cadena;
        DateTime horaCliente, horaFinal;
        int servicio,hora,minuto,duracionFinal, id_estilista,id_servicio;
        DAO_Reserva mostrarDuracion = new DAO_Reserva();
        

        diaReserva = C_Reserva.SelectedDate.ToShortDateString();

        hora_cliente = DDL_Hora.SelectedItem.ToString();
        id_estilista = int.Parse(DropDownList_Estilista.SelectedValue.ToString());
        id_servicio = int.Parse(DDL_servicio.SelectedValue.ToString());

        horaCliente = DateTime.Parse(hora_cliente);
        //hora_cliente = horaCliente.ToLongTimeString();

        time24 = horaCliente.ToString("HH:mm", CultureInfo.CurrentCulture);


        servicio = int.Parse( DDL_servicio.SelectedValue.ToString());
        DataTable duracion = mostrarDuracion.duracionServicio(servicio);
        duracionServicio = duracion.Rows[0]["duracion_servicio"].ToString();

        cadena = duracionServicio.Split(':');

        hora = int.Parse(cadena[0]);
        minuto = int.Parse(cadena[1]);

        duracionFinal = (hora * 60) + minuto;



        horaFinal = DateTime.Parse(time24).AddMinutes(duracionFinal);


        ERegistroHorario reserva = new ERegistroHorario();
        DAO_Reserva rangoHorario = new DAO_Reserva();
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



       


    }
}