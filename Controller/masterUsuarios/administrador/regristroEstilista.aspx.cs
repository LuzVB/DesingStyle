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
        int edadCliente;

        ERegistroUsuario estilista = new ERegistroUsuario();
        ERegistroHorario horario = new ERegistroHorario();

        estilista.Cedula = Int32.Parse(Tx_CodigoEstilista.Text);
        estilista.Nombre = Tx_NombreEstilista.Text;
        estilista.Apellido = Tx_ApellidoEstilista.Text;
        estilista.Telefono = Int64.Parse(Tx_TelefonoEstilista.Text);
        estilista.Correo = Tx_CorreoEstilista.Text;
        estilista.Contraseña = Tx_ContraseñaEstilista.Text;
        estilista.Fecha_nacimiento = DateTime.Parse(Tx_FechaNacimiento.Text);
        estilista.Estado = 1;
        estilista.Rol = 2;
        horario.DisponibleSerie = true;
        estilista.Session = Session["user"].ToString();
        estilista.Servicio = Int32.Parse(DDL_servicio.SelectedValue.ToString());

        edadCliente = System.DateTime.Now.Year - estilista.Fecha_nacimiento.Year;

        DataTable contarCorreo = new DAORegistroCliente().contarCorreos(estilista);
        DataTable contarID = new DAORegistroCliente().contarId(estilista);

        DAORegistroCliente registroEstilista = new DAORegistroCliente();
        DAORegistroEstilista datosEstilista = new DAORegistroEstilista();


        int index = Int32.Parse(DDL_servicio.SelectedIndex.ToString());
        if (index <= -1)
        {
            L_ServicioR.Visible = true;
            error = 1;
        }
        else
        {
            error = 0;
            L_ServicioR.Visible = false;
        }

        if (Tx_CodigoEstilista.Text.Length < 8)
        {

            L_cedula.Visible = true;
            LB_Datos.Text = "El numero de caracteres de la cedula son invalidos";
            error = 1;
        }
        else
        {
            L_cedula.Visible = false;
            error = 0;
        }

        if (Tx_NombreEstilista.Text.Length < 3)
        {
            LB_Nombre.Visible = true;
            LB_Nombre.Text = "El numero de caracteres del nombre son invalidos";
            error = 1;
        }
        else
        {
            LB_Nombre.Visible = false;
            error = 0;
        }

        if (Tx_ApellidoEstilista.Text.Length < 3)
        {

            LB_apellido.Visible = true;
            LB_apellido.Text = "El numero de caracteres del apellido son invalidos";
            error = 1;
        }
        else
        {
            LB_apellido.Visible = false;
            error = 0;
        }

        if (Tx_TelefonoEstilista.Text.Length < 8)
        {

            LB_Telefono.Visible = true;
            LB_Telefono.Text = "El numero de caracteres del telefono son invalidos";
            error = 1;
        }
        else if (Tx_CorreoEstilista.Text.Length < 25)
        {
            LB_Telefono.Visible = false;
            error = 0;
        }
        

        if (contarCorreo.Rows[0]["user_correo"].Equals("1"))
        {
            error = 0;
            L_correo.Visible = false;

        }
        else
        {
            error = 1;
            L_correo.Visible = true;
        }

        if (contarID.Rows[0]["user_id"].Equals(-1))
        {
            error = 0;
            L_cedula.Visible = false;

        }
        else
        {
            error = 1;
            L_cedula.Visible = true;
        }


        if (System.DateTime.Now.Subtract(estilista.Fecha_nacimiento.AddYears(edadCliente)).TotalDays < 0)
        {
            edadCliente = edadCliente - 1;

        }

        if (edadCliente > 18)
        {
            L_ErrorFechaNacimiento.Visible = false;
            error = 0;
        }
        else
        {
            L_ErrorFechaNacimiento.Visible = true;
            L_ErrorFechaNacimiento.Text = "Fecha de nacimiento incorrecta, no es mayor de edad.";
            error = 1;
        }

        if (error == 0)
        {
            L_ServicioR.Visible = false;
            horario.Idestilista = Int32.Parse(Tx_CodigoEstilista.Text);

            registroEstilista.registroCliente(estilista);
            datosEstilista.registroEstilistaServicio(estilista);
            datosEstilista.registroHorario2(horario);


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
        int indexEstilista = Int32.Parse(DDL_Estilistas.SelectedIndex.ToString());
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
            ServicioAdi.Usuario = Int32.Parse(DDL_Estilistas.SelectedValue.ToString());
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
        DDL_Estilistas.DataBind();
        GV_EstilistaServicio.DataBind();
    }

    protected void GV_EstilistaServicio_DataBound(object sender, EventArgs e)
    {

    }
    protected void GV_EstilistaServicio_RowCommand(object sender, GridViewCommandEventArgs e)
    {

        int id = int.Parse(e.CommandArgument.ToString());
        DataTable servicio = new DAORegistroEstilista().EliminarSerUsuario(id);
        String Servicio = servicio.Rows[0]["servicio"].ToString();
        String Estilista = servicio.Rows[0]["estilista"].ToString();

        if (e.CommandName.Equals("Alerta"))
        {

            int Ser = Int32.Parse(Servicio);
            int Est = Int32.Parse(Estilista);
            int alerta = 6;
            DAORegistroEstilista servicioa = new DAORegistroEstilista();
            servicioa.AlertaSerUsario(Ser, Est, alerta, id);
            GV_EstilistaServicio.DataBind();
        }
    }
}

   
