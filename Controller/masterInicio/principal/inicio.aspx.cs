using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_masterInicio_principal_inicio : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DataTable catalogo = new DAOPerfilEstilista().mostrarcatalogo();
        DataTable servicios = new DAOServicio().mostrarservicio();

        int tamaño;
        tamaño = catalogo.Rows.Count;

        if(tamaño >= 6)
        {
            IB_Inicio1.ImageUrl = catalogo.Rows[0]["imagen"].ToString();
            IB_Inicio2.ImageUrl = catalogo.Rows[1]["imagen"].ToString();
            IB_Inicio3.ImageUrl = catalogo.Rows[2]["imagen"].ToString();
            IB_Inicio4.ImageUrl = catalogo.Rows[3]["imagen"].ToString();
            IB_Inicio5.ImageUrl = catalogo.Rows[4]["imagen"].ToString();
            IB_Inicio6.ImageUrl = catalogo.Rows[5]["imagen"].ToString();
        }
        else
        {
            IB_Inicio1.ImageUrl = "~/Imagenes/paginaInicio/lavado_1.png";
        }


        L_Inicio1.Text = "Nombre del servicio" + "<br/>" + "Precio:" + "valor" + "<br/>" + "Duracion:" + "tiempo";
        L_Inicio2.Text = "Nombre del servicio" + "<br/>" + "Precio:" + "valor" + "<br/>" + "Duracion:" + "tiempo";
        L_Inicio3.Text = "Nombre del servicio" + "<br/>" + "Precio:" + "valor" + "<br/>" + "Duracion:" + "tiempo";
    }

    protected void BT_Reservar1_Click(object sender, EventArgs e)
    {

    }
}