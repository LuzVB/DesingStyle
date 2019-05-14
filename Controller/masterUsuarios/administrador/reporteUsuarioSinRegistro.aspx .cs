using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
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


        try
        {
            infoReportes reporte = ObtenerInforme();
            CRS_UsuarioSinRegistro.ReportDocument.SetDataSource(reporte);
            CRV_UsuarioSinRegistro.ReportSource = CRS_UsuarioSinRegistro;
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
        string _fecha;

        DateTime fecha = new DateTime();
        informacion = datos.Tables["UsuarioSinRegistro"];
        DAOReportes Usuarios = new DAOReportes();

        DataTable intermedio = Usuarios.UsuarioSinRegistro();

        for (int i = 0; i < intermedio.Rows.Count; i++)
        {

            fecha = DateTime.Parse(intermedio.Rows[i]["fecha"].ToString());
            _fecha = fecha.ToString("dd/MMMM/yyyy");

               fila = informacion.NewRow();

                fila["id"] = intermedio.Rows[i]["id"].ToString();
                fila["nombre"] = intermedio.Rows[i]["nombre"].ToString();
                fila["apellido"] = intermedio.Rows[i]["apellido"].ToString();
                fila["servicio"] = intermedio.Rows[i]["servicio"].ToString();
                fila["fecha"] =_fecha;
                fila["hora"] = intermedio.Rows[i]["hora"].ToString();
            informacion.Rows.Add(fila);
            }

            return datos;
        }


    protected void BT_Servicios_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/View/masterUsuarios/administrador/reportes.aspx");
    }

    protected void BT_PerfilEstilista_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/View/masterUsuarios/administrador/reportePerfilEstilista.aspx");
    }
}