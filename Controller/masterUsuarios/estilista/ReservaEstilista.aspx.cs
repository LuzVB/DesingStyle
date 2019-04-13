using System;
using System.Collections.Generic;
using System.Data;
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
}