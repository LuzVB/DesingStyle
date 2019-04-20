using System;
using System.Data;
using System.Web.UI.WebControls;

public partial class View_masterUsuarios_cliente_ReservasAgendadas : System.Web.UI.Page
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

    protected void BT_redirigirCitan_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/View/masterUsuarios/cliente/ReservarCitaCliente.aspx");
    }

    protected void GV_reservasAgendadas_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        EReserva datosRes = new EReserva();
        ERegistroHorario guardarReserva = new ERegistroHorario();
        DAO_Reserva reserva = new DAO_Reserva();
        DateTime horaActual = DateTime.Now;
        //DateTime horaActual = DateTime.Parse("20/04/2019 07:00:00 a. m.");

        if (e.CommandName.Equals("Cancelar"))
        {
            datosRes.Id =  int.Parse(e.CommandArgument.ToString());
            DataTable reservaBd = reserva.mostrarReserva(int.Parse(e.CommandArgument.ToString()));

            datosRes.Id_estilista = int.Parse(reservaBd.Rows[0]["id_estilista"].ToString());
            datosRes.Id_cliente = int.Parse(Session["user_id"].ToString());
            datosRes.Hora_inicio = DateTime.Parse(reservaBd.Rows[0]["dia_hora_inicio"].ToString());
            datosRes.Hora_final = DateTime.Parse(reservaBd.Rows[0]["dia_hora_final"].ToString());

            TimeSpan resultado = datosRes.Hora_inicio - horaActual;
            TimeSpan cancelacion = TimeSpan.Parse("03:00:00");

            if (resultado >= cancelacion)
            {
                DataTable reservas = reserva.traerHorario(datosRes);

                int tamano = reservas.Rows.Count;

                for (int i = 0; i < tamano; i++)
                {
                    guardarReserva.IdReserva = int.Parse(reservas.Rows[i]["id"].ToString());

                    guardarReserva.IdServicio = 0;
                    guardarReserva.IdCliente = 0;
                    guardarReserva.Estado = true;

                    reserva.actulizarReserva(guardarReserva);
                }


                reserva.eliminarReserva(datosRes);
            }
            else
            {
                LB_Error.Text = "Lo sentimos usted ya no puede cancelar la reserva.";
                MPE_Error.Show();
            }
            

            GV_reservasAgendadas.DataBind();
            
        }

       
    }


    protected void BT_Reservas_Click(object sender, EventArgs e)
    {
       
        GV_Historial.Visible = false;
        GV_reservasAgendadas.Visible = true;
        LB_Informacion.Visible = true;

        LB_Informacion.Text = "En caso de que no pueda asistir a su cita, cancele la cita con el botón (x) " +
       "y reagende una nueva cita. Tenga en cuenta que tiene que cancelar (tiempo) antes de su cita, si este no es el caso," +
       " no cancela y no asiste se le multara.";
    }

    protected void BT_Historial_Click(object sender, EventArgs e)
    {
        GV_Historial.Visible = true;
        GV_reservasAgendadas.Visible = false;
        LB_Informacion.Visible = false;
    }

}