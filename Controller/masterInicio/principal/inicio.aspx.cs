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
        //Response.Cache.SetNoStore();

        DataTable catalogo = new DAOPerfilEstilista().mostrarcatalogo();
        DataTable servicios = new DAOServicio().mostrarservicio2();

        int tam, tam2;
        tam = catalogo.Rows.Count;
        tam2 = servicios.Rows.Count;


        if (tam >= 6)
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


        if (tam2 == 0)
        {
            L_Inicio1.Text = "ESPERA PRONTO " + "<br/>" + "NUEVOS SERVICIOS " + " " + "<br/>" + " " + " ";
            L_Inicio2.Text = "ESPERA PRONTO " + "<br/>" + "NUEVOS SERVICIOS " + " " + "<br/>" + " " + " ";
            L_Inicio3.Text = "ESPERA PRONTO " + "<br/>" + "NUEVOS SERVICIOS " + " " + "<br/>" + " " + " ";

            BT_Reservar1.Visible = false;
            BT_Reservar2.Visible = false;
            BT_Reservar3.Visible = false;

        }
        else if (tam2 == 1)
        {
            L_Inicio1.Text = servicios.Rows[0]["nombre"].ToString() + "<br/>" + "Precio:" + servicios.Rows[0]["precio"].ToString() + "<br/>" + "Duracion:" + servicios.Rows[0]["duracion"].ToString();
            L_Inicio2.Text = "ESPERA PRONTO " + "<br/>" + "NUEVOS SERVICIOS " + " " + "<br/>" + " " + " ";
            L_Inicio3.Text = "ESPERA PRONTO " + "<br/>" + "NUEVOS SERVICIOS " + " " + "<br/>" + " " + " ";

            if (Session["rol"] != null)
            {
                if (Session["rol"].ToString().Equals("3"))
                {
                    BT_Reservar1.Visible = true;
                    BT_Reservar2.Visible = false;
                    BT_Reservar3.Visible = false;
                }
                else
                {
                    BT_Reservar1.Visible = false;
                    BT_Reservar2.Visible = false;
                    BT_Reservar3.Visible = false;
                }
            }
            else
            {
                BT_Reservar1.Visible = false;
                BT_Reservar2.Visible = false;
                BT_Reservar3.Visible = false;
            }


        }
        else if (tam2 == 2)
        {
            L_Inicio1.Text = servicios.Rows[0]["nombre"].ToString() + "<br/>" + "Precio:" + servicios.Rows[0]["precio"].ToString() + "<br/>" + "Duracion:" + servicios.Rows[0]["duracion"].ToString();
            L_Inicio2.Text = servicios.Rows[1]["nombre"].ToString() + "<br/>" + "Precio:" + servicios.Rows[1]["precio"].ToString() + "<br/>" + "Duracion:" + servicios.Rows[1]["duracion"].ToString();
            L_Inicio3.Text = "ESPERA PRONTO " + "<br/>" + "NUEVOS SERVICIOS " + " " + "<br/>" + " " + " ";

            if (Session["rol"] != null)
            {
                if (Session["rol"].ToString().Equals("3"))
                {
                    BT_Reservar1.Visible = true;
                    BT_Reservar2.Visible = true;
                    BT_Reservar3.Visible = false;
                }
                else
                {
                    BT_Reservar1.Visible = false;
                    BT_Reservar2.Visible = false;
                    BT_Reservar3.Visible = false;
                }
            }
            else
            {
                BT_Reservar1.Visible = false;
                BT_Reservar2.Visible = false;
                BT_Reservar3.Visible = false;
            }
        }
        else
        {
            L_Inicio1.Text = servicios.Rows[0]["nombre"].ToString() + "<br/>" + "Precio:" + servicios.Rows[0]["precio"].ToString() + "<br/>" + "Duracion:" + servicios.Rows[0]["duracion"].ToString();
            L_Inicio2.Text = servicios.Rows[1]["nombre"].ToString() + "<br/>" + "Precio:" + servicios.Rows[1]["precio"].ToString() + "<br/>" + "Duracion:" + servicios.Rows[1]["duracion"].ToString();
            L_Inicio3.Text = servicios.Rows[2]["nombre"].ToString() + "<br/>" + "Precio:" + servicios.Rows[2]["precio"].ToString() + "<br/>" + "Duracion:" + servicios.Rows[2]["duracion"].ToString();

            if (Session["rol"] != null)
            {
                if (Session["rol"].ToString().Equals("3"))
                {
                    BT_Reservar1.Visible = true;
                    BT_Reservar2.Visible = true;
                    BT_Reservar3.Visible = true;
                }
                else
                {
                    BT_Reservar1.Visible = false;
                    BT_Reservar2.Visible = false;
                    BT_Reservar3.Visible = false;
                }
            }
            else
            {
                BT_Reservar1.Visible = false;
                BT_Reservar2.Visible = false;
                BT_Reservar3.Visible = false;
            }


        }
        
    }
    
    protected void BT_Reservar1_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/View/masterUsuarios/cliente/ReservarCitaCliente.aspx");
    }

    protected void BT_Reservar2_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/View/masterUsuarios/cliente/ReservarCitaCliente.aspx");
    }

    protected void BT_Reservar3_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/View/masterUsuarios/cliente/ReservarCitaCliente.aspx");
    }
}