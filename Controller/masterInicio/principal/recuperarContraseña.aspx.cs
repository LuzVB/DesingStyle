using System;
using System.Collections.Generic;
using System.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class View_masterInicio_principal_recuperarContraseña : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Response.Cache.SetNoStore();

        if (Request.QueryString.Count > 0)
        {
            DAOUsuario user = new DAOUsuario();
            DataTable info = user.obtenerUsusarioToken(Request.QueryString[0]);

            if (int.Parse(info.Rows[0][0].ToString()) == -1)
                this.RegisterStartupScript("mensaje", "<script type='text/javascript'>alert('El Token es invalido. Genere uno nuevo');window.location=\"../principal/inicioSesion.aspx\"</script>");
            else if (int.Parse(info.Rows[0][0].ToString()) == -1)
                this.RegisterStartupScript("mensaje", "<script type='text/javascript'>alert('El Token esta vencido. Genere uno nuevo');window.location=\"../principal/inicioSesion.aspx\"</script>");
            else
                Session["user_id"] = int.Parse(info.Rows[0][0].ToString());
        }
        else
            Response.Redirect("~/View/masterInicio/principal/inicio.aspx");
    }

    protected void Bt_GuardarContraseña_Click(object sender, EventArgs e)
    {
        if (Tx_NuevaContraseña.Text == Tx_ConfirmarContraseña.Text)
        {
            DAOUsuario user = new DAOUsuario();
            EUsuario eUser = new EUsuario();

            eUser.UserId = int.Parse(Session["user_id"].ToString());
            eUser.Contraseña = Tx_NuevaContraseña.Text;

            user.actualziarContrasena(eUser);
            this.RegisterStartupScript("mensaje", "<script type='text/javascript'>alert('Su Contraseña ha sido actualizada.');window.location=\"../principal/inicioSesion.aspx\"</script>");

        }
        else
        {
            LB_RContraseñaError.Text = "Las contraseñas no coinciden";
        }

        
    }
}