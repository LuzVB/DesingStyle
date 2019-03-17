using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_masterUsuarios_administrador_usuariosSinRegistro : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string fechaHora = DateTime.Now.ToString("D");
        LB_FechaSistema.Text = fechaHora;

    }
}