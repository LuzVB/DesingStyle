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
            CRS_PerfilEstilista.ReportDocument.SetDataSource(reporte);
            CRV_PerfilEstilista.ReportSource = CRS_PerfilEstilista;
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

        informacion = datos.Tables["Estilistas"];
        DAOReportes servicios = new DAOReportes();

        DataTable intermedio = servicios.mostrarestilistas();

        for (int i = 0; i < intermedio.Rows.Count; i++)
        {
            
                fila = informacion.NewRow();

                fila["id"] = intermedio.Rows[i]["id"].ToString();
                fila["nombre"] = intermedio.Rows[i]["nombre"].ToString();
                fila["apellido"] = intermedio.Rows[i]["apellido"].ToString();
                fila["imagen_perfil"] = streamFile(intermedio.Rows[i]["imagen_perfil"].ToString());
                fila["telefono"] = intermedio.Rows[i]["telefono"].ToString();
                fila["correo"] = intermedio.Rows[i]["correo"].ToString();

            informacion.Rows.Add(fila);
            }

            return datos;
        }


        private byte[] streamFile(string filename)
        {
            FileStream fs;
            if (!filename.Equals(""))
            {
                fs = new FileStream(Server.MapPath(filename), FileMode.Open, FileAccess.Read);
            }
            else
            {
                fs = new FileStream(Server.MapPath("~/Imagenes/logo/usuario.png"), FileMode.Open, FileAccess.Read);
            }

            // Create a byte array of file stream length
            byte[] ImageData = new byte[fs.Length];

            //Read block of bytes from stream into the byte array
            fs.Read(ImageData, 0, System.Convert.ToInt32(fs.Length));

            //Close the File Stream
            fs.Close();
            return ImageData; //return the byte data
        }

    protected void BT_ServiciosAdq_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/View/masterUsuarios/administrador/reportes.aspx");
    }

    protected void BT_UsuariosSinRegistro_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/View/masterUsuarios/administrador/repsin.aspx");
    }

    protected void BT_ReservasEstilistas_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/View/masterUsuarios/administrador/reportesTabla.aspx");
    }
}