using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_masterUsuarios_administrador_reportes : System.Web.UI.Page
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


        //try
        //{
        //    infoReportes reporte = ObtenerInforme();
        //    CRS_Servicios.ReportDocument.SetDataSource(reporte);
        //    CRV_Servicios.ReportSource = CRS_Servicios;
        //}
        //catch (Exception)
        //{
        //    throw;
        //}

        try
        {
            infoReportes reporte = ObtenerInforme2();
            CRS_Servicios.ReportDocument.SetDataSource(reporte);
            CRV_Servicios.ReportSource = CRS_Servicios;
        }
        catch (Exception)
        {
            throw;
        }
    }

    protected infoReportes ObtenerInforme()
    {
        DataRow fila;  //dr
        DataTable informacion = new DataTable(); //dt
        infoReportes datos = new infoReportes();
        //string img;

        informacion = datos.Tables["servicios"];
        DAOReportes servicios = new DAOReportes();

        DataTable intermedio = servicios.mostrarServicios();

        for (int i = 0; i < intermedio.Rows.Count; i++)
        {
            fila = informacion.NewRow();

            fila["_id"] = intermedio.Rows[i]["id"].ToString();
            fila["_nombre"] = intermedio.Rows[i]["_nombre"].ToString();
            fila["_total"] = Int64.Parse( intermedio.Rows[i]["_total"].ToString());
           // fila["imagen"] = streamFile(intermedio.Rows[i]["imagen"].ToString());

            //img = intermedio.Rows[i]["imagen"].ToString();
            //img =  (streamFile(intermedio.Rows[i]["imagen"].ToString()).ToString());
            informacion.Rows.Add(fila);
        }

        return datos;
    }

    protected infoReportes ObtenerInforme2()
    {
        DataRow fila;  //dr
        DataTable informacion = new DataTable(); //dt
        infoReportes datos = new infoReportes();
        string _fecha;

        DateTime fecha = new DateTime();

        informacion = datos.Tables["reservas"];
        DAOReportes servicios = new DAOReportes();

        DataTable intermedio = servicios.mostrarServicios2();

       
        for (int i = 0; i < intermedio.Rows.Count; i++)
        {
            fecha = DateTime.Parse(intermedio.Rows[i]["_fecha"].ToString());
            _fecha = fecha.ToShortDateString();


            fila = informacion.NewRow();

            fila["nombre_estilista"] = intermedio.Rows[i]["nombre_estilista"].ToString();
            fila["id_estilista"] = intermedio.Rows[i]["id_estilista"].ToString();
            fila["nombre_cliente"] = intermedio.Rows[i]["nombre_cliente"].ToString();
            fila["id_cliente"] = intermedio.Rows[i]["id_cliente"].ToString();
            fila["nombre_servicio"] = intermedio.Rows[i]["nombre_servicio"].ToString();
            fila["precio"] = intermedio.Rows[i]["precio"].ToString();
            fila["_hora_inicio"] = intermedio.Rows[i]["_hora_inicio"].ToString();
            fila["__hora_final"] = intermedio.Rows[i]["__hora_final"].ToString();
            fila["_fecha"] = _fecha;

            informacion.Rows.Add(fila);
        }

        return datos;
    }

    protected void BT_UsuariosSinServico_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/View/masterUsuarios/administrador/repsin.aspx");
    }

    protected void BT_PerfilEstilista_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/View/masterUsuarios/administrador/reportePerfilEstilista.aspx");
    }

    protected void BT_ReservasEstilistas_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/View/masterUsuarios/administrador/reportesTabla.aspx");
    }
}