using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_masterUsuarios_estilista_ReservaEstilista : System.Web.UI.Page
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
        else if (Session["rol"].ToString().Equals("3"))
        {
            Response.Redirect("~/View/masterInicio/principal/inicio.aspx");
        }

        Prueba.Text = C_Reserva.SelectedDate.ToShortDateString();

    }

    protected void C_Reserva_SelectionChanged(object sender, EventArgs e)
    {

        Prueba.Text= C_Reserva.SelectedDate.ToShortDateString();
        DateTime fecha = new DateTime();
        DateTime calendario2 = new DateTime();
        fecha = DateTime.Now;
        string calendario, fecha2;
        UP_HoraReserva.Visible = false;

        calendario = C_Reserva.SelectedDate.ToShortDateString();
        fecha2 = fecha.ToShortDateString();

        fecha = DateTime.Parse(fecha2);
        calendario2 = DateTime.Parse(calendario);

        if (calendario2 < fecha)
        {
            GridView_ReservasEst.Visible = false;
            Alerta_Rerva.Visible = true;
            Alerta_Rerva.Text = "No hay reservas por favor seleccione otra fecha.";
        }
        else
        {
            GridView_ReservasEst.Visible = true;
            Alerta_Rerva.Visible = false;
        }
    }

    protected void BT_Reservas_Click(object sender, EventArgs e)
    {
        C_Reserva.Visible = true;
        GridView_ReservasEst.Visible = true;
        GridView_Historial.Visible = false;
        Alerta_Rerva.Visible = false;
    }

    protected void BT_Historial_Click(object sender, EventArgs e)
    {
        C_Reserva.Visible = false;
        GridView_ReservasEst.Visible = false;
        GridView_Historial.Visible = true;
        Alerta_Rerva.Visible = false;
        Prueba.Visible = false;
        UP_HoraReserva.Visible = false;
    }

    protected void GridView_ReservasEst_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void GridView_Historial_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.FindControl("Alerta1") != null)
        {
            if (((Label)e.Row.FindControl("Alerta1")).Text.Equals("4"))
            {
                ((Label)e.Row.FindControl("Alerta1")).Text = "Asitio";
            }
            else if (((Label)e.Row.FindControl("Alerta1")).Text.Equals("5"))
            {
                ((Label)e.Row.FindControl("Alerta1")).Text = "No Asistio";

            }
           
        }
    }



    protected void GridView_ReservasEst_RowDataBound(object sender, GridViewRowEventArgs e)
    {


        if (e.Row.FindControl("Alerta") != null)
        {
            if (((Label)e.Row.FindControl("Alerta")).Text.Equals("0"))
            {
                ((Label)e.Row.FindControl("Alerta")).Text = "Pendiente";
                ((Button)e.Row.FindControl("Asistio")).Visible = true;
                ((Button)e.Row.FindControl("NoAsistio")).Visible = true;


            }
            else if (((Label)e.Row.FindControl("Alerta")).Text.Equals("5"))
            {
                ((Label)e.Row.FindControl("Alerta")).Text = "No Asistio";
                ((Button)e.Row.FindControl("Asistio")).Visible = false;
                ((Button)e.Row.FindControl("NoAsistio")).Visible = false;

            }
            else if (((Label)e.Row.FindControl("Alerta")).Text.Equals("4"))
            {
                ((Label)e.Row.FindControl("Alerta")).Text = "Asistio";
                ((Button)e.Row.FindControl("Asistio")).Visible = false;
                ((Button)e.Row.FindControl("NoAsistio")).Visible = false;

            }
        }
    }

    protected void GridView_ReservasEst_RowCommand(object sender, GridViewCommandEventArgs e)
    {

       

        if (e.CommandName.Equals("Asistio"))
        {

            Alerta_Rerva.Visible = true;

            int id = int.Parse(e.CommandArgument.ToString());
            GridViewRow row = (GridViewRow)(((Button)e.CommandSource).NamingContainer);
            int id2 = row.RowIndex + 1;
            //int mane = Convert.ToInt32(((Label)row.FindControl("Hora")).Text.ToString());
            String HoraReserva = ((Label)GridView_ReservasEst.Controls[0].Controls[id2].FindControl("Hora")).Text;
            //((Button)GridView_ReservasEst.Controls[0].Controls[id2].FindControl("NoAsistio")).Visible = false;
            String HoraActual = DateTime.Now.ToString("hh:mm:ss");
            int Usuario = int.Parse(Session["user_id"].ToString());

            String[] separador2;
            String[] separador;
            separador = HoraReserva.Split(':');
            separador2 = HoraActual.Split(':');
            int Horainicio = int.Parse(separador[0]);
            int HoraSistema = int.Parse(separador2[0]);
            int HorainicioMin = int.Parse(separador[1]);
            int HoraSistemaMin = int.Parse(separador2[1]);
            if (Horainicio == HoraSistema && HorainicioMin < HoraSistemaMin )
            {
                DAORegistroEstilista guardarCambios = new DAORegistroEstilista();
                int alerta = 4;
                guardarCambios.AsistenciaCliente(Usuario,id,alerta);
                Alerta_Rerva.Text = Convert.ToString(id);
                UP_HoraReserva.Visible = false;
                GridView_ReservasEst.DataBind();
            }
            else
            {
                UP_HoraReserva.Visible = true;
                Alerta_Rerva.Visible = false;
                Asistencia.Text = ("No se ha cumplido con la reserva " + HoraReserva +" ");
                Alerta.Text = ("podra llevar el registro de la asistencia cuando se cumpla  con la hora establecida" + " " + "Hora Del Sistema: " + " " + HoraActual + " ");
            }

        } else if (e.CommandName.Equals("NoAsistio"))

            {

            Alerta_Rerva.Visible = true;

            int id = int.Parse(e.CommandArgument.ToString());

            GridViewRow row = (GridViewRow)(((Button)e.CommandSource).NamingContainer);
            int id2 = row.RowIndex + 1;
            //int mane = Convert.ToInt32(((Label)row.FindControl("Hora")).Text.ToString());
            String HoraReserva= ((Label)GridView_ReservasEst.Controls[0].Controls[id2].FindControl("Hora")).Text;
            //((Button)GridView_ReservasEst.Controls[0].Controls[id2].FindControl("Asistio")).Visible = false;
            String HoraActual = DateTime.Now.ToString("hh:mm:ss");
            int Usuario = int.Parse(Session["user_id"].ToString());

            String[] separador2;
            String[] separador;
            separador = HoraReserva.Split(':');
            separador2 = HoraActual.Split(':');
            int Horainicio = int.Parse(separador[0]);
            int HoraSistema = int.Parse(separador2[0]);
            int HorainicioMin = int.Parse(separador[1]);
            int HoraSistemaMin = int.Parse(separador2[1]);

            if (Horainicio == HoraSistema && HorainicioMin < HoraSistemaMin)
            {
                DAORegistroEstilista guardarCambios = new DAORegistroEstilista();
                int alerta = 5;
                guardarCambios.AsistenciaCliente(Usuario, id, alerta);
                Alerta_Rerva.Text = Convert.ToString(id);
                UP_HoraReserva.Visible = false;
                GridView_ReservasEst.DataBind();
            } else {

                Alerta_Rerva.Visible = false;
                Asistencia.Text = ("No se ha cumplido con la reserva " + HoraReserva + " ");
                Alerta.Text = ("podra llevar el registro de la asistencia cuando se cumpla  con la hora establecida" +" "+ "Hora Del Sistema: "+" "+HoraActual + " ");
            }
           
        }
    }

    protected void GridView_ReservasEst_DataBound(object sender, EventArgs e)
    {


    }



}