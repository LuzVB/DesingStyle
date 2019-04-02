using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_masterUsuarios_administrador_datosPersonales : System.Web.UI.Page
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

        DataTable datosAdmin = new DAOAdmin().mostrarAdmin(int.Parse(Session["user_id"].ToString()));
        string nombre, apellido/*, telefono, correo*/;
        nombre = datosAdmin.Rows[0]["nombre"].ToString();
        apellido = datosAdmin.Rows[0]["apellido"].ToString();
        L_Bienvenida.Text = ("HOLA " + nombre + " " + apellido).ToUpper();
    }
}