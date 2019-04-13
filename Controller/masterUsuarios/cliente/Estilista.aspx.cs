using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_masterUsuarios_cliente_Estilista : System.Web.UI.Page
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

        //LB_nombreEstilista.Text = Session["nombre"].ToString();
        //L_Biografia.Text = "manicure,pedicure etc";
    }

    protected void DropDownList_Estilista_SelectedIndexChanged(object sender, EventArgs e)
    {
        int id= Int32.Parse(DropDownList_Estilista.SelectedValue.ToString());
        DAOCliente guardarCambios = new DAOCliente();
        guardarCambios.mostrarEstilista(id);
    }

    protected void FV_Estilista_DataBound(object sender, EventArgs e)
    {
        //DropDownList_Estilista.DataBind();
    }

    protected void DropDownList_Estilista_DataBound(object sender, EventArgs e)
    {
        //FV_Estilista.DataBind();
    }

    protected void FV_Estilista_PageIndexChanging(object sender, FormViewPageEventArgs e)
    {

    }
}