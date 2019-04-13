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
        guardarCambios.Inasistencia(_usuario, _fecha);
        Response.Redirect("inasistenciaEstilista.aspx");
    }


    protected void ODS_estilista_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {

    }
}