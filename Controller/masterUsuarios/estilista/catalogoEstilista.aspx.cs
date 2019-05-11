using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_masterUsuarios_estilista_catalogoEstilista : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["rol"] == null)
        {
            Response.Redirect("~/View/masterInicio/principal/inicio.aspx");
        }
        else if (Session["rol"].ToString().Equals("1"))
        {
            Response.Redirect("~/View/masterInicio/principal/inicio.aspx");
        }
        else if (Session["rol"].ToString().Equals("3"))
        {
            Response.Redirect("~/View/masterInicio/principal/inicio.aspx");
        }

    }

    protected void Bt_GuardarImg_Click(object sender, EventArgs e)
    {
        EUsuario user = new EUsuario();
        user.UserId = int.Parse(Session["user_id"].ToString());
        user.Session = Session["user"].ToString();
        Random rnd = new Random();
        int numero = rnd.Next(1, 10000);
        FileUpload FU_IMuestra = ((FileUpload)FU_Catalogo.FindControl("FU_Catalogo"));
        ClientScriptManager cm = this.ClientScript;

        if (FU_IMuestra.PostedFile.FileName != "" && !(System.IO.Path.GetExtension(FU_IMuestra.PostedFile.FileName).Equals(".jpg")
          || System.IO.Path.GetExtension(FU_IMuestra.PostedFile.FileName).Equals(".png")))
        {
            cm.RegisterClientScriptBlock(this.GetType(), "", "<script type='text/javascript'>alert('solo Imagenes');</script>");
            return;
        }
        else
        {
            user.Muestra = "~\\Imagenes\\catalogo\\" + Session["nombre"].ToString() + numero + System.IO.Path.GetFileName(FU_IMuestra.PostedFile.FileName);
            FU_IMuestra.PostedFile.SaveAs(Server.MapPath(user.Muestra));

            DataTable datos = new DAOPerfilEstilista().registroCatalogo(user);
            Response.Redirect("catalogoEstilista.aspx");
        }
    }

   

    protected void ODS_catalogo_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {

    }

    protected void GridView_Catalogo_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}