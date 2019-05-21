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
        if (!IsPostBack)
        {
            Session["agenda"] = new Agenda();

        }

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
        
        L_correo.Visible = false;
        LB_Nombre.Visible = false;
        LB_apellido.Visible = false;
        LB_Telefono.Visible = false;
        L_ErrorContraseña.Visible = false;
        L_correo.Visible = false;
        L_cedula.Visible = false;
        L_correo.Visible = false;
        L_ErrorFechaNacimiento.Visible = false;


        ERegistroUsuario estilista = new ERegistroUsuario();
        ERegistroHorario horario = new ERegistroHorario();

        if (Int64.Parse(Tx_CodigoEstilista.Text) > 2147483647)
        {

            L_cedula.Visible = true;
            L_cedula.Text = "Error vuelva a ingresar la cedula ";
            error = 1;

        }
        else
        {
            estilista.Cedula = Int32.Parse(Tx_CodigoEstilista.Text);
        }
        
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

        if (contarCorreo.Rows[0]["user_correo"].ToString() != "1")
        {
            error = 1;
            L_correo.Visible = true;
            L_correo.Text = "El Correo ya existe";

        }

        if (contarID.Rows[0]["user_id"].ToString() != "-1")
        {
            error = 1;
            L_cedula.Visible = true;
            L_cedula.Text = "La cedula ya se encuentra registrada";
        }


        if (System.DateTime.Now.Subtract(estilista.Fecha_nacimiento.AddYears(edadCliente)).TotalDays < 0)
        {
            edadCliente = edadCliente - 1;

        }

        if (edadCliente < 18)
        {
            L_ErrorFechaNacimiento.Visible = true;
            L_ErrorFechaNacimiento.Text = "Fecha de nacimiento incorrecta, no es mayor de edad.";
            error = 1;
        }

        if (Tx_CodigoEstilista.Text.Length < 8)
        {
            L_cedula.Visible = true;
            L_cedula.Text = "El numero de caracteres de la cedula son invalidos";
            error = 1;
        }

        if (Tx_NombreEstilista.Text.Length < 3)
        {
            LB_Nombre.Visible = true;
            LB_Nombre.Text = "El numero de caracteres del nombre son invalidos";
            error = 1;

        }

        if (Tx_ApellidoEstilista.Text.Length < 3)
        {

            LB_apellido.Visible = true;
            LB_apellido.Text = "El numero de caracteres del apellido son invalidos";
            error = 1;

        }

        if (Tx_TelefonoEstilista.Text.Length < 7)
        {
            
            LB_Telefono.Visible = true;
            LB_Telefono.Text = "El numero de caracteres del telefono son invalidos";
            error = 1;

        }

        if (Tx_ContraseñaEstilista.Text.Length < 4)
        {

            L_ErrorContraseña.Visible = true;
            L_ErrorContraseña.Text = "El numero de caracteres del contraseña son invalidos";
            error = 1;

        }

        if (Tx_CorreoEstilista.Text.Length < 16)
        {
            L_correo.Visible = true;
            L_correo.Text = "El numero de caracteres del correo son invalidos";
            error = 1;
        }

        if (error == 0)
        {
            L_ServicioR.Visible = false;
            horario.Idestilista = Int32.Parse(Tx_CodigoEstilista.Text);

            registroEstilista.registroCliente(estilista);
            datosEstilista.registroEstilistaServicio(estilista);
            
            Session["id_estilista"] = Tx_CodigoEstilista.Text;

            LB_Estilista.Text = Tx_NombreEstilista.Text + " " + Tx_ApellidoEstilista.Text;
            LB_CedulaM.Text = Session["id_estilista"].ToString();

            MPE_rangoHorario.Show();

        }
        
    }


    protected void Tx_NombreEstilista_TextChanged(object sender, EventArgs e)
    {

    }

    protected void GV_Estilista_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

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

            if(servicioa.Rows[0]["ok"].ToString() == "ok")
            {
                Response.Redirect("regristroEstilista.aspx");
            }
            else if(servicioa.Rows[0]["nada"].ToString() == "nada")
            {
                LB_EAdicional.Visible = true;
                LB_EAdicional.Text = "El servicio ya está añadido";
            }
            

           
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
        if (e.CommandName.Equals("Alerta"))
        {

            int id = int.Parse(e.CommandArgument.ToString());
            DataTable servicio = new DAORegistroEstilista().EliminarSerUsuario(id);
            String Servicio = servicio.Rows[0]["servicio"].ToString();
            String Estilista = servicio.Rows[0]["estilista"].ToString();

            int Ser = Int32.Parse(Servicio);
            int Est = Int32.Parse(Estilista);
            int alerta = 6;
            DAORegistroEstilista servicioa = new DAORegistroEstilista();
            servicioa.AlertaSerUsario(Ser, Est, alerta, id);
            GV_EstilistaServicio.DataBind();
        }
    }

    protected void CB_Lunes_CheckedChanged(object sender, EventArgs e)
    {
        Agenda agenda = (Agenda)Session["agenda"];
        if (CB_Lunes.Checked)
        {
            agenda.Lunes = true;
            LB_EDias.Text = "";
        }
        else
        {
            agenda.Lunes = false;
        }

        MPE_rangoHorario.Show();
    }

    protected void CB_Martes_CheckedChanged(object sender, EventArgs e)
    {
        Agenda agenda = (Agenda)Session["agenda"];
        if (CB_Martes.Checked)
        {
            agenda.Martes = true;
            LB_EDias.Text = "";
        }
        else
        {
            agenda.Martes = false;
        }
        MPE_rangoHorario.Show();
    }

    protected void CB_Miercoles_CheckedChanged(object sender, EventArgs e)
    {
        Agenda agenda = (Agenda)Session["agenda"];
        if (CB_Miercoles.Checked)
        {
            agenda.Miercoles = true;
            LB_EDias.Text = "";
        }
        else
        {
            agenda.Miercoles = false;
        }
        MPE_rangoHorario.Show();
    }

    protected void CB_Jueves_CheckedChanged(object sender, EventArgs e)
    {
        Agenda agenda = (Agenda)Session["agenda"];
        if (CB_Jueves.Checked)
        {
            agenda.Jueves = true;
            LB_EDias.Text = "";
        }
        else
        {
            agenda.Jueves = false;
        }
        MPE_rangoHorario.Show();
    }

    protected void CB_Viernes_CheckedChanged(object sender, EventArgs e)
    {
        Agenda agenda = (Agenda)Session["agenda"];
        if (CB_Viernes.Checked)
        {
            agenda.Viernes = true;
            LB_EDias.Text = "";
        }
        else
        {
            agenda.Viernes = false;
        }
        MPE_rangoHorario.Show();
    }

    protected void CB_Sabado_CheckedChanged(object sender, EventArgs e)
    {
        Agenda agenda = (Agenda)Session["agenda"];
        if (CB_Sabado.Checked)
        {
            agenda.Sabado = true;
            LB_EDias.Text = "";
        }
        else
        {
            agenda.Sabado = false;
        }
        MPE_rangoHorario.Show();
    }

    protected void CB_Domingo_CheckedChanged(object sender, EventArgs e)
    {
        Agenda agenda = (Agenda)Session["agenda"];
        if (CB_Domingo.Checked)
        {
            agenda.Domingo = true;
            LB_EDias.Text = "";
        }
        else
        {
            agenda.Domingo = false;
        }
        MPE_rangoHorario.Show();

    }

    protected void BT_AgregarRango_Click(object sender, EventArgs e)
    {
        int horaaaInicio = int.Parse(DDL_HoraInicio.SelectedValue.ToString());
        int horaFin = int.Parse(DDL_HoraFin.SelectedValue.ToString());
        Boolean malRango = false, paso = true;

        Agenda agenda = (Agenda)Session["agenda"];
        Horario horas = new Horario();
        horas.HoraInicio = horaaaInicio;
        horas.HoraFin = horaFin;

        if(horaaaInicio == 0 || horaFin == 0)
        {
            LB_ERango.Text = "Seleccione una hora";
        }
        else
        {
            if (horaaaInicio >= horaFin)
            {
                LB_ERango.Text = "Error el rango no es posible, debe ser mayor la hora final a la hora inicio o" +
                    " no pueden ser iguales las horas";
                paso = false;
            }
            else if (agenda.ListaRango == null)
            {
                //if (agenda.ListaRango == null)
                LB_ERango.Text = "";
                agenda.ListaRango = new List<Horario>();
                agenda.ListaRango.Add(horas);
                paso = true;
            }
            else
            {
                foreach (Horario item in agenda.ListaRango)
                {
                    if (item.HoraInicio == horas.HoraInicio || horas.HoraFin == item.HoraFin)
                    {
                        LB_ERango.Text = "El rango ya se encuentra seleccione otro rango";
                        malRango = true;
                        break;
                    }
                    if (item.HoraInicio > horas.HoraInicio || horas.HoraInicio < item.HoraFin)
                    {
                        LB_ERango.Text = "El rango no es valido";
                        malRango = true;
                        break;
                    }
                    else
                    {
                        LB_ERango.Text = "";
                    }

                }

                if (malRango == false)
                {
                    agenda.ListaRango.Add(horas);
                }

                paso = true;
            }

            if (paso == true)
            {
                DataTable dt = new DataTable();
                dt.Columns.Add("HoraInicio");
                dt.Columns.Add("HoraFinal");

                foreach (Horario item in agenda.ListaRango)
                {
                    //creas una nueva row
                    DataRow row = dt.NewRow();
                    //asignas el dato a cada columna de la row
                    row["HoraInicio"] = item.HoraInicio;
                    row["HoraFinal"] = item.HoraFin;

                    dt.Rows.Add(row);

                }

                GV_RangoHorario.DataSource = dt;
                GV_RangoHorario.DataBind();
            }

        }
        
        MPE_rangoHorario.Show();
        
    }

    protected void BT_GuardarAgenda_Click(object sender, EventArgs e)
    {
        Agenda agenda = (Agenda)Session["agenda"];

        if(agenda.Lunes == true || agenda.Martes == true || agenda.Miercoles == true || agenda.Jueves == true
            || agenda.Viernes == true || agenda.Sabado == true || agenda.Domingo == true)
        {
            LB_EDias.Text = "";
            DAORango rango = new DAORango();
            rango.insertarAgenda((Agenda)Session["agenda"], int.Parse(Session["id_estilista"].ToString()));
            DataTable dias = new DataTable();
            int tamaño;

            dias = rango.traerDias(int.Parse(Session["id_estilista"].ToString()));
            tamaño = dias.Rows.Count;


            if (tamaño == 7)
            {
                DAORegistroEstilista horario = new DAORegistroEstilista();
                horario.registroAgenda(int.Parse(Session["id_estilista"].ToString()));
                Session["agenda"] = null;
                GV_RangoHorario.DataBind();
                Session["id_estilista"] = null;
                Response.Redirect("~/View/masterUsuarios/administrador/regristroEstilista.aspx");

            }
            else
            {

                Session["agenda"] = null;
                GV_RangoHorario.DataBind();
                LB_Mensaje.Text = "Desea agregar mas horarios al Estilista";
                MPE_MasHorarios.Show();
            }
        }
        else
        {
            LB_EDias.Text = "Error *Seleccione los dias";
            MPE_rangoHorario.Show();
        }
        
    }

    protected void GV_RangoHorario_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        Agenda agenda = (Agenda)Session["agenda"];

        GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
        int id2 = row.RowIndex + 1;

        string horaInicio = ((Label)GV_RangoHorario.Controls[0].Controls[id2].FindControl("LB_HoraInicio")).Text;
        if(horaInicio == "08:00 a.m")
        {
            horaInicio = "8";
        }
        else if (horaInicio == "09:00 a.m")
        {
            horaInicio = "9";
        }
        else if (horaInicio == "10:00 a.m")
        {
            horaInicio = "10";
        }
        else if (horaInicio == "11:00 a.m")
        {
            horaInicio = "11";
        }
        else if (horaInicio == "12:00 p.m")
        {
            horaInicio = "12";
        }
        else if (horaInicio == "01:00 p.m")
        {
            horaInicio = "13";
        }
        else if (horaInicio == "02:00 p.m")
        {
            horaInicio = "14";
        }
        else if (horaInicio == "03:00 p.m")
        {
            horaInicio = "15";
        }
        else if (horaInicio == "04:00 p.m")
        {
            horaInicio = "16";
        }
        else if (horaInicio == "05:00 p.m")
        {
            horaInicio = "17";
        }

        foreach (Horario item in agenda.ListaRango)
        {
            if (item.HoraInicio == int.Parse(horaInicio))
            {
                agenda.ListaRango.Remove(item);
                //agenda.ListaRango = null;
                break;
            }

        }
        
        GV_RangoHorario.DataBind();

        DataTable dt = new DataTable();
        dt.Columns.Add("HoraInicio");
        dt.Columns.Add("HoraFinal");

        foreach (Horario item in agenda.ListaRango)
        {
            //creas una nueva row
            DataRow rowd = dt.NewRow();
            //asignas el dato a cada columna de la row
            rowd["HoraInicio"] = item.HoraInicio;
            rowd["HoraFinal"] = item.HoraFin;

            dt.Rows.Add(rowd);

        }

        GV_RangoHorario.DataSource = dt;
        GV_RangoHorario.DataBind();

        MPE_rangoHorario.Show();

    }

    protected void BT_Si_Click(object sender, EventArgs e)
    {
        Session["agenda"] = new Agenda();

        DAORango rango = new DAORango();
        DataTable dias = new DataTable();
        int tamaño;

        dias = rango.traerDias(int.Parse(Session["id_estilista"].ToString()));
        tamaño = dias.Rows.Count;


        for (int i = 0; i < tamaño; i++)
        {
            if (dias.Rows[i]["dia"].ToString() == "lunes")
            {
                CB_Lunes.Visible = false;
            }
            else if (dias.Rows[i]["dia"].ToString() == "martes")
            {
                CB_Martes.Visible = false;
            }
            else if (dias.Rows[i]["dia"].ToString() == "miercoles")
            {
                CB_Miercoles.Visible = false;
            }
            else if (dias.Rows[i]["dia"].ToString() == "jueves")
            {
                CB_Jueves.Visible = false;
            }
            else if (dias.Rows[i]["dia"].ToString() == "viernes")
            {
                CB_Viernes.Visible = false;
            }
            else if (dias.Rows[i]["dia"].ToString() == "sabado")
            {
                CB_Sabado.Visible = false;
            }
            else if (dias.Rows[i]["dia"].ToString() == "domingo")
            {
                CB_Domingo.Visible = false;
            }
        }

        //if(CB_Lunes.Visible == false && CB_Martes.Visible == false && CB_Miercoles.Visible == false && CB_Jueves.Visible == false &&
        //    CB_Viernes.Visible == false && CB_Sabado.Visible == false && CB_Domingo.Visible == false)
        //{
        //    //hacer la serie 
        //}
        //else
        //{
        //    MPE_rangoHorario.Show();
        //}

        MPE_rangoHorario.Show();

    }

    protected void BT_Cancelar_Click(object sender, EventArgs e)
    {
        DAORegistroEstilista horario = new DAORegistroEstilista();
        horario.registroAgenda(int.Parse(Session["id_estilista"].ToString()));
        Session["agenda"] = null;
        GV_RangoHorario.DataBind();
        Session["id_estilista"] = null;
        Response.Redirect("~/View/masterUsuarios/administrador/regristroEstilista.aspx");
    }

    protected void GV_RangoHorario_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.FindControl("LB_HoraInicio") != null && e.Row.FindControl("LB_HoraFinal") != null)
        {
            if (((Label)e.Row.FindControl("LB_HoraInicio")).Text.Equals("8"))
            {
                ((Label)e.Row.FindControl("LB_HoraInicio")).Text = "08:00 a.m";
            }
            else if(((Label)e.Row.FindControl("LB_HoraInicio")).Text.Equals("9"))
            {
                ((Label)e.Row.FindControl("LB_HoraInicio")).Text = "09:00 a.m";
            }
            else if (((Label)e.Row.FindControl("LB_HoraInicio")).Text.Equals("10"))
            {
                ((Label)e.Row.FindControl("LB_HoraInicio")).Text = "10:00 a.m";
            }
            else if (((Label)e.Row.FindControl("LB_HoraInicio")).Text.Equals("11"))
            {
                ((Label)e.Row.FindControl("LB_HoraInicio")).Text = "11:00 a.m";
            }
            else if (((Label)e.Row.FindControl("LB_HoraInicio")).Text.Equals("12"))
            {
                ((Label)e.Row.FindControl("LB_HoraInicio")).Text = "12:00 p.m";
            }
            else if (((Label)e.Row.FindControl("LB_HoraInicio")).Text.Equals("13"))
            {
                ((Label)e.Row.FindControl("LB_HoraInicio")).Text = "01:00 p.m";
            }
            else if (((Label)e.Row.FindControl("LB_HoraInicio")).Text.Equals("14"))
            {
                ((Label)e.Row.FindControl("LB_HoraInicio")).Text = "02:00 p.m";
            }
            else if (((Label)e.Row.FindControl("LB_HoraInicio")).Text.Equals("15"))
            {
                ((Label)e.Row.FindControl("LB_HoraInicio")).Text = "03:00 p.m";
            }
            else if (((Label)e.Row.FindControl("LB_HoraInicio")).Text.Equals("16"))
            {
                ((Label)e.Row.FindControl("LB_HoraInicio")).Text = "04:00 p.m";
            }
            else if (((Label)e.Row.FindControl("LB_HoraInicio")).Text.Equals("17"))
            {
                ((Label)e.Row.FindControl("LB_HoraInicio")).Text = "05:00 p.m";
            }
            

            if (((Label)e.Row.FindControl("LB_HoraFinal")).Text.Equals("8"))
            {
                ((Label)e.Row.FindControl("LB_HoraFinal")).Text = "08:00 a.m";
            }
            else if (((Label)e.Row.FindControl("LB_HoraFinal")).Text.Equals("9"))
            {
                ((Label)e.Row.FindControl("LB_HoraFinal")).Text = "09:00 a.m";
            }
            else if (((Label)e.Row.FindControl("LB_HoraFinal")).Text.Equals("10"))
            {
                ((Label)e.Row.FindControl("LB_HoraFinal")).Text = "10:00 a.m";
            }
            else if (((Label)e.Row.FindControl("LB_HoraFinal")).Text.Equals("11"))
            {
                ((Label)e.Row.FindControl("LB_HoraFinal")).Text = "11:00 a.m";
            }
            else if (((Label)e.Row.FindControl("LB_HoraFinal")).Text.Equals("12"))
            {
                ((Label)e.Row.FindControl("LB_HoraFinal")).Text = "12:00 p.m";
            }
            else if (((Label)e.Row.FindControl("LB_HoraFinal")).Text.Equals("13"))
            {
                ((Label)e.Row.FindControl("LB_HoraFinal")).Text = "01:00 p.m";
            }
            else if (((Label)e.Row.FindControl("LB_HoraFinal")).Text.Equals("14"))
            {
                ((Label)e.Row.FindControl("LB_HoraFinal")).Text = "02:00 p.m";
            }
            else if (((Label)e.Row.FindControl("LB_HoraFinal")).Text.Equals("15"))
            {
                ((Label)e.Row.FindControl("LB_HoraFinal")).Text = "03:00 p.m";
            }
            else if (((Label)e.Row.FindControl("LB_HoraFinal")).Text.Equals("16"))
            {
                ((Label)e.Row.FindControl("LB_HoraFinal")).Text = "04:00 p.m";
            }
            else if (((Label)e.Row.FindControl("LB_HoraFinal")).Text.Equals("17"))
            {
                ((Label)e.Row.FindControl("LB_HoraFinal")).Text = "15:00 p.m";
            }
            //
        }
    }
}

   
