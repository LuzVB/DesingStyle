using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using Label = System.Web.UI.WebControls.Label;

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
        int error = 0;
        ERegistroUsuario estilista = new ERegistroUsuario();
        estilista.Cedula = Int32.Parse(Tx_CodigoEstilista.Text);
        estilista.Nombre = Tx_NombreEstilista.Text;
        estilista.Apellido = Tx_ApellidoEstilista.Text;
        estilista.Telefono = Int32.Parse(Tx_TelefonoEstilista.Text);
        estilista.Correo = Tx_CorreoEstilista.Text;
        estilista.Contraseña = Tx_ContraseñaEstilista.Text;
        estilista.Estado = 1;
        estilista.Rol = 2;
        estilista.Session = Session["user"].ToString();


        int index = Int32.Parse(DDL_servicio.SelectedIndex.ToString());
        if (index <= -1  )
        {
            L_ServicioR.Visible = true;
        }
        else
        {
            L_ServicioR.Visible = false;
            ERegistroUsuario EstilistaServicio = new ERegistroUsuario();


            EstilistaServicio.Usuario = Int32.Parse(Tx_CodigoEstilista.Text);
            EstilistaServicio.Servicio = Int32.Parse(DDL_servicio.SelectedValue.ToString());
            EstilistaServicio.Session = Session["user"].ToString();
            DataTable contarCorreo = new DAORegistroCliente().contarCorreos(estilista);

            if (contarCorreo.Rows[0]["user_correo"].Equals("1"))
            {

                DataTable datos = new DAORegistroEstilista().registroEstilista(estilista);
                DataTable datos2 = new DAORegistroEstilista().registroEstilistaServicio(EstilistaServicio);
                error = 0;
                L_correo.Visible = false;
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
            }
            else
            {
                error = 1;
                L_correo.Visible = true;
            }

            GV_Estilista.DataBind();

            Response.Redirect("regristroEstilista.aspx");
        }
    }


    protected void Tx_NombreEstilista_TextChanged(object sender, EventArgs e)
    {

    }

    protected void GV_Estilista_SelectedIndexChanged(object sender, EventArgs e)
    {

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

    protected void ServicioAd_Click(object sender, ImageClickEventArgs e)
    {
        int indexEstilista = Int32.Parse(DDL_estilistas.SelectedIndex.ToString());
        int indexAServicio = Int32.Parse(DDL_Aservicio.SelectedIndex.ToString());

        if (indexEstilista <= -1)
        {

            L_REstilista.Visible = true;

        }
        else if (indexAServicio <= -1) {

            L_RServicio.Visible = true;
        }
        else {


            ERegistroUsuario ServicioAdi = new ERegistroUsuario();
            ServicioAdi.Usuario = Int32.Parse(DDL_estilistas.SelectedValue.ToString());
            ServicioAdi.Servicio = Int32.Parse(DDL_Aservicio.SelectedValue.ToString());
            ServicioAdi.Session = Session["user"].ToString();


            DataTable servicioa = new DAORegistroEstilista().ServicioEAdcional(ServicioAdi);
            Response.Redirect("regristroEstilista.aspx");
        }
    }

    protected void GV_Estilista_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        
        if (e.Row.FindControl("L_Estado") != null)
        {
            if (((Label)e.Row.FindControl("L_Estado")).Text.Equals("1"))
            {
                ((Label)e.Row.FindControl("L_Estado")).Text = "Activo";
            }
            else if (((Label)e.Row.FindControl("L_Estado")).Text.Equals("2"))
            {
                ((Label)e.Row.FindControl("L_Estado")).Text = "Despedido";
               
            }
            else {
         
                ((Label)e.Row.FindControl("L_Estado")).Text = "Activo";
            }
        }
     
    }


    protected void GV_Estilista_DataBound(object sender, EventArgs e)
    {
        DDL_estilistas.DataBind();
        GV_EstilistaServicio.DataBind();
    }

    protected void GV_EstilistaServicio_DataBound(object sender, EventArgs e)
    {

    }
}

   
