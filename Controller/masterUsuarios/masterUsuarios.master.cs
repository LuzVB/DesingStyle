using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_masterUsuarios_masterUsuarios : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["rol"] == null)
        {
            M_Administrador.Visible = false;
            M_Estilista.Visible = false;
            M_Cliente.Visible = false;

            Response.Redirect("~/View/masterInicio/principal/inicio.aspx");
        }
        else if (Session["rol"].ToString().Equals("1"))
        {
            M_Administrador.Visible = true;
            M_Estilista.Visible = false;
            M_Cliente.Visible = false;
        }
        else if (Session["rol"].ToString().Equals("2"))
        {
            M_Administrador.Visible = false;
            M_Estilista.Visible = true;
            M_Cliente.Visible = false;
        }
        else if (Session["rol"].ToString().Equals("3"))
        {
            M_Administrador.Visible = false;
            M_Estilista.Visible = false;
            M_Cliente.Visible = true;
        }
        else
        {
            M_Administrador.Visible = false;
            M_Estilista.Visible = false;
            M_Cliente.Visible = false;

            Response.Redirect("~/View/masterInicio/principal/inicio.aspx");
        }

       
    }

    protected void IB_SalirAdministrador_Click(object sender, ImageClickEventArgs e)
    {

        DAOUsuario user = new DAOUsuario();
        EUsuario datos = new EUsuario();
        datos.Session = Session.SessionID;
        user.cerrarSession(datos);

        Session["rol"] = null;
        Session["nombre"] = null;
        Session["user_id"] = null;
        Session["user"] = null;

        Response.Redirect("~/View/masterInicio/principal/inicio.aspx");
    }
}
