using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_masterUsuarios_administrador_inasistenciaEstilista : System.Web.UI.Page
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

    }

    protected void Tx_FechaInasistencia_TextChanged(object sender, EventArgs e)
    {

    }

    protected void BT_Insasitencia_Click(object sender, EventArgs e)
    {
        int indexEstilista = Int32.Parse(DDL_EstilistaInasistencia.SelectedIndex.ToString());
        int _usuario = Int32.Parse(DDL_EstilistaInasistencia.SelectedValue.ToString());
        DateTime _fecha = DateTime.Parse(((TextBox)Tx_FechaInasistencia.FindControl("Tx_FechaInasistencia")).Text);
        DAORegistroEstilista guardarCambios = new DAORegistroEstilista();
        string session= Session["user"].ToString();

        DateTime fecha = new DateTime();
        fecha = DateTime.Now;
        String fecha2 = fecha.ToShortDateString();
        fecha = DateTime.Parse(fecha2);

        if (_fecha < fecha)
        {
            Alerta_Fecha.Visible = true;
            Alerta_Fecha.Text = "Error en la fecha seleccionada.";
        }
        else
        {
            Alerta_Fecha.Visible = false;
            guardarCambios.ActualizarInasistencia(_usuario, _fecha);
            guardarCambios.Inasistencia(_usuario, _fecha, session);
            Response.Redirect("inasistenciaEstilista.aspx");
        }

    }


    protected void ODS_estilista_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {

    }

    protected void DD_Estilista_DataBound(object sender, EventArgs e)
    {
        GV_reservasEstilistas.DataBind();
    }

    protected void DD_Estilista_SelectedIndexChanged(object sender, EventArgs e)
    {
        int id = Int32.Parse(DD_Estilista.SelectedValue.ToString());
        DAORegistroEstilista guardarCambios = new DAORegistroEstilista();
        guardarCambios.mostrarEstilistaInasistencia(id);
    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {

    }

    protected void GV_reservasEstilistas_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.Equals("Cancelar"))
        {
            int idInasistencia = int.Parse(e.CommandArgument.ToString());
            GridViewRow row = (GridViewRow)(((ImageButton)e.CommandSource).NamingContainer);
            int idButton = row.RowIndex + 1;
            DateTime  HoraReserva = DateTime.Parse(((Label)GV_reservasEstilistas.Controls[0].Controls[idButton].FindControl("Fecha")).Text);
            String GHoraReserva = HoraReserva.ToString("dd/MM/yyyy");
            String[] GDReserva;
            String[] GDActual;
            string FechaActual = DateTime.Now.ToString("dd/MM/yyyy");
            GDReserva = GHoraReserva.Split('/');
            GDActual = FechaActual.Split('/');
            int DReserva = int.Parse(GDReserva[0]);
            int DActual = int.Parse(GDActual[0]);
            int MReserva = int.Parse(GDReserva[1]);
            int MActual = int.Parse(GDActual[1]);

            if (DReserva < DActual && MReserva == MActual)
            {
                Eliminar.Visible = true;
                String Reserva = ((Label)GV_reservasEstilistas.Controls[0].Controls[idButton].FindControl("Fecha")).Text;
                Eliminar.Text = "No Se puede eliminar la Inasistencia" +" "+ GHoraReserva;

            }
            else if (DReserva >= DActual && MReserva >= MActual || DReserva <= DActual && MReserva >= MActual)
            {
                Eliminar.Visible = false;
                DataTable DInasistencia = new DAORegistroEstilista().MostrarInasistencia(idInasistencia);
                int Estilista = int.Parse(DInasistencia.Rows[0]["id_estilista"].ToString());
                DateTime Dinasistencia = DateTime.Parse(DInasistencia.Rows[0]["dia_inacistencia"].ToString());
                DataTable Cambioinasistencia = new DAORegistroEstilista().EliminarIna(Estilista, Dinasistencia);
                DataTable inasistencia = new DAORegistroEstilista().EliminarInasistencia(idInasistencia);
                GV_reservasEstilistas.DataBind();

            }
            
        }
    }
}