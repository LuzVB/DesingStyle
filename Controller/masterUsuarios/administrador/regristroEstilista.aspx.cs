using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//using System.Windows.Forms;

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
        estilista.Telefono2 =Tx_TelefonoEstilista.Text;
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


        ERegistroHorario datoHorario = new ERegistroHorario();
        DAORegistroEstilista guardarHorario = new DAORegistroEstilista();
        DataTable horario = guardarHorario.mostrarHorario();
        for (int i = 0; i < horario.Rows.Count; i++)
        {
            datoHorario.Fechaini = DateTime.Parse(horario.Rows[i]["hora_inicio"].ToString());
            datoHorario.Fechafin = DateTime.Parse(horario.Rows[i]["hora_fin"].ToString());
            datoHorario.Estado = true;
            datoHorario.Idestilista = int.Parse(Tx_CodigoEstilista.Text);
            guardarHorario.registroHorario(datoHorario);
        }

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

    //protected void Tx_NombreEstilista_TextChanged(object sender, EventArgs e)
    //{

    //    //Class1 cs = new Class1();
    //    //DAO_Prueba p = new DAO_Prueba();
    //    //DataTable horario = p.mostrarHorario();
    //    //for(int i=0; i<horario.Rows.Count; i++){
    //    //    cs.Fechaini = DateTime.Parse(horario.Rows[i]["hora_inicio"].ToString());
    //    //    cs.Fechafin = DateTime.Parse(horario.Rows[i]["hora_fin"].ToString());
    //    //    cs.Estado = true;
    //    //    cs.Idestilista = int.Parse(Tx_CodigoEstilista.Text);
    //    //    p.registroCliente(cs);
    //    //}

    //}
}