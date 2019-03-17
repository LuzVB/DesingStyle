using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_masterInicio_principal_inicio : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        IB_Inicio1.ImageUrl = "~/Imagenes/paginaInicio/lavado_1.png";

        L_Inicio1.Text = "Nombre del servicio" + "<br/>" + "Precio:" + "valor" + "<br/>" + "Duracion:" + "tiempo";
        L_Inicio2.Text = "Nombre del servicio" + "<br/>" + "Precio:" + "valor" + "<br/>" + "Duracion:" + "tiempo";
        L_Inicio3.Text = "Nombre del servicio" + "<br/>" + "Precio:" + "valor" + "<br/>" + "Duracion:" + "tiempo";
    }

    protected void BT_Reservar1_Click(object sender, EventArgs e)
    {

    }
}