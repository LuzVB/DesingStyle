using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_masterUsuarios_administrador_registroServicios : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void IB_GuardarServicio_Click(object sender, ImageClickEventArgs e)
    {
        EServicio servicio = new EServicio();
        servicio.Nombre = Tx_NombreServicio.Text;
        servicio.Descripcion = Tx_descripcionServicio.Text;
        servicio.Precio = Int32.Parse(Tx_PrecioServicio.Text);
        servicio.Duracion = Tx_duracionServicio.Text;
        servicio.Estado = 1;
        servicio.Session = Session.SessionID;

        DataTable datos = new DAOServicio().registroServicio(servicio);
        Response.Redirect("registroServicios.aspx");
    }

    protected void GV_Estilista_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        //if (e.CommandName == "cancelar") {

        //    int indice = Convert.ToInt32(e.CommandArgument);
        //    int cant = Convert.ToInt32(GV_Estilista.DataKeys[indice].Value);
        //    DAOServicio user = new DAOServicio();
        //    EServicio Servicio = new EServicio();
        //    Servicio.Id = cant;
        //    user.modificarEstado(Servicio);
        //}
        //else {
        //    ClientScriptManager cm = this.ClientScript;
        //    cm.RegisterClientScriptBlock(this.GetType(), "", "<script type='text/javascript'>alert('solo Imagenes');</script>");
        //}
    }
}