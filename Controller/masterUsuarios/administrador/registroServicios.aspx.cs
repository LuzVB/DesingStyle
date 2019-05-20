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
        int error = 0;
        LB_EPrecio.Visible = false;
        LB_ETiempo.Visible = false;

        if (DDL_precio.SelectedValue.Equals("0"))
        {
            LB_EPrecio.Visible = true;
            LB_EPrecio.Text = "Seleccione un precio";
            error = 1;
        }

        if (DDL_duracion.SelectedValue.Equals("0"))
        {
            LB_ETiempo.Visible = true;
            LB_ETiempo.Text = "Seleccione una duración ";
            error = 1;
        }

        if(error == 0)
        {

            servicio.Nombre = Tx_NombreServicio.Text;
            servicio.Descripcion = Tx_descripcionServicio.Text;
            servicio.Precio = Int32.Parse(DDL_precio.SelectedValue);
            servicio.Duracion = DDL_duracion.SelectedValue;
            servicio.Estado = "Disponible";
            servicio.Session = Session["user"].ToString();
            DataTable datos = new DAOServicio().registroServicio2(servicio);
            GV_Estilista.DataBind();
            Response.Redirect("registroServicios.aspx");
        }

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

    protected void IB_GuardarServicio_Click1(object sender, ImageClickEventArgs e)
    {

    }

    protected void GV_Estilista_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        
    }

    protected void Tx_precio_TextChanged(object sender, EventArgs e)
    {

    }
}