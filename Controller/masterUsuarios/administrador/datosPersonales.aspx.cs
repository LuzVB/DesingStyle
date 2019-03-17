using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_masterUsuarios_administrador_datosPersonales : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        L_Bienvenida.Text = "Bienvenido " + "Nombre_Admin";
    }
}