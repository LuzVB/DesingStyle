using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_masterUsuarios_administrador_reservaEstilista : System.Web.UI.Page
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

    protected void DDL_Estilistas_DataBound(object sender, EventArgs e)
    {
        if (DDL_Estilistas.SelectedValue.Equals("0"))
        {
            LB_NombreEstilista.Visible = false;
        }
        else
        {
            LB_NombreEstilista.Visible = true;
            LB_NombreEstilista.Text = "Nombre del Estilista " + DDL_Estilistas.SelectedItem.ToString();
        }
    }

    protected void DDL_Estilistas_SelectedIndexChanged(object sender, EventArgs e)
    {
        LB_Seleccione.Text = "";
        if (DDL_Estilistas.SelectedValue.Equals("0"))
        {
            LB_NombreEstilista.Visible = false;
        }
        else
        {
            LB_NombreEstilista.Visible = true;
            LB_NombreEstilista.Text = "Nombre del Estilista " + DDL_Estilistas.SelectedItem.ToString();
        }
    }

    protected void C_Fecha_SelectionChanged(object sender, EventArgs e)
    {
        if (DDL_Estilistas.SelectedValue.Equals("0"))
        {
            LB_Seleccione.Text = "Seleccione un estilista";
        }
        else
        {
            LB_Seleccione.Text = "";
        }
    }
}