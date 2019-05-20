using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_masterInicio_principal_inicioSesion : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Response.Cache.SetNoStore();
        
    }

    protected void BT_InicioSesion_Click(object sender, EventArgs e)
    {
        Session["rol"] = null;
        Session["nombre"] = null;
        Session["user_id"] = null;
        Session["user"] = null;

        EUsuario user = new EUsuario();
        user.Correo = Tx_Icorreo.Text;
        user.Contraseña = Tx_Icontraseña.Text;
        DataTable datos = new DAOUsuario().login(user);

        if (datos.Rows.Count > 0)
        {

            string rol = datos.Rows[0]["rol"].ToString();
            Session["rol"] = datos.Rows[0]["rol"].ToString();
            Session["nombre"] = datos.Rows[0]["nombre"].ToString();
            Session["user_id"] = datos.Rows[0]["user_id"].ToString();
            Session["user"] = Session.SessionID;
            // string usuarioID = datos.Rows[0]["user_id"].ToString();

            switch (rol)
            {
                case "1":

                    MAC datosConexion = new MAC();
                    EUsuario datos1 = new EUsuario();

                    datos1.UserId = int.Parse(Session["user_id"].ToString());
                    datos1.Ip = datosConexion.ip();
                    datos1.Mac = datosConexion.mac();
                    datos1.Session = Session["user"].ToString();


                    DataTable guardar = new DAOUsuario().guardadoSession(datos1);

                    Response.Redirect("~/View/masterUsuarios/administrador/datosPersonales.aspx");
                    break;
                case "2":

                    MAC datosConexion2 = new MAC();
                    EUsuario datosEst = new EUsuario();

                    datosEst.UserId = int.Parse(Session["user_id"].ToString());
                    datosEst.Ip = datosConexion2.ip();
                    datosEst.Mac = datosConexion2.mac();
                    datosEst.Session = Session["user"].ToString();


                    DataTable guardarEstilista = new DAOUsuario().guardadoSession(datosEst);

                    Response.Redirect("~/View/masterUsuarios/estilista/PerfilEstilista.aspx");
                    break;

                  case "3":

                    MAC datosConexion3 = new MAC();
                    EUsuario datosCliente = new EUsuario();

                    datosCliente.UserId = int.Parse(Session["user_id"].ToString());
                    datosCliente.Ip = datosConexion3.ip();
                    datosCliente.Mac = datosConexion3.mac();
                    datosCliente.Session = Session["user"].ToString();


                    DataTable guardarCliente = new DAOUsuario().guardadoSession(datosCliente);


                    Response.Redirect("~/View/masterUsuarios/cliente/datosPersonalesCliente.aspx");
                    break;
                default:
                    LB_IError.Text = "Error en correo o contraseña";
                    
                    break;
            }
        }
        else
        {
            LB_IError.Text = "(*)El usuario no existe ";

        }
    }
}