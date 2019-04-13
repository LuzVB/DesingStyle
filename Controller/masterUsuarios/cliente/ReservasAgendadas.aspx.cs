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

        if (e.CommandName.Equals("Cancelar"))
        {
            datosRes.Id =  int.Parse(e.CommandArgument.ToString());
            DataTable reservaBd = reserva.mostrarReserva(int.Parse(e.CommandArgument.ToString()));

            datosRes.Id_estilista = int.Parse(reservaBd.Rows[0]["id_estilista"].ToString());
            datosRes.Id_cliente = int.Parse(Session["user_id"].ToString());
            datosRes.Hora_inicio = DateTime.Parse(reservaBd.Rows[0]["dia_hora_inicio"].ToString());
            datosRes.Hora_final = DateTime.Parse(reservaBd.Rows[0]["dia_hora_final"].ToString());

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

        GV_reservasAgendadas.DataBind();
    }
    
}