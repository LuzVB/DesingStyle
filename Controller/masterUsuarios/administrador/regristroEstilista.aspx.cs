using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

public partial class View_masterUsuarios_administrador_regristroEstilista : System.Web.UI.Page
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

    protected void IB_GuardarEstilista_Click(object sender, ImageClickEventArgs e)
    {
        ERegistroUsuario estilista = new ERegistroUsuario();
        estilista.Cedula = Int32.Parse(Tx_CodigoEstilista.Text);
        estilista.Nombre = Tx_NombreEstilista.Text;
        estilista.Apellido= Tx_ApellidoEstilista.Text;
        estilista.Telefono =Int32.Parse(Tx_TelefonoEstilista.Text);
        estilista.Correo = Tx_CorreoEstilista.Text;
        estilista.Contraseña = Tx_ContraseñaEstilista.Text;
        estilista.Estado = 1;
        estilista.Rol = 2;
        estilista.Session = Session["user"].ToString();


        ERegistroUsuario EstilistaServicio = new ERegistroUsuario();
        EstilistaServicio.Usuario = Int32.Parse(Tx_CodigoEstilista.Text);
        EstilistaServicio.Servicio =Int32.Parse(DDL_servicio.SelectedValue.ToString());
        EstilistaServicio.Session = Session["user"].ToString();

      
        DataTable datos = new DAORegistroEstilista().registroEstilista(estilista);
        DataTable datos2 = new DAORegistroEstilista().registroEstilistaServicio(EstilistaServicio);

        GV_Estilista.DataBind();

        Response.Redirect("regristroEstilista.aspx");
    }

    protected void Bt_Aservicio_Click(object sender, EventArgs e)
    {

        ERegistroUsuario ServicioAdi = new ERegistroUsuario();
        ServicioAdi.Usuario = Int32.Parse(DDL_estilistas.SelectedValue.ToString());
        ServicioAdi.Servicio = Int32.Parse(DDL_Aservicio.SelectedValue.ToString());
        ServicioAdi.Session = Session["user"].ToString();


        DataTable servicioa = new DAORegistroEstilista().ServicioEAdcional(ServicioAdi);
        Response.Redirect("regristroEstilista.aspx");
    }

    protected void Tx_NombreEstilista_TextChanged(object sender, EventArgs e)
    {

    }
}