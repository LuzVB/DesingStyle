using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using Newtonsoft.Json;
using System.Text;


public partial class View_masterInicio_principal_generarTokenCuenta : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetNoStore();
    }

    protected void Bt_RecuperarC_Click(object sender, EventArgs e)
    {
        DAOUsuario dao = new DAOUsuario();
        System.Data.DataTable validez = dao.generarTokenCuenta(Tx_RCuentaCorreo.Text);

        if (int.Parse(validez.Rows[0]["id"].ToString()) > 0)
        {
            EUserToken token = new EUserToken();
            token.Id = int.Parse(validez.Rows[0]["id"].ToString());
            token.Nombre = validez.Rows[0]["nombre"].ToString();
            token.User_name = validez.Rows[0]["apellido"].ToString();
            token.Estado = int.Parse(validez.Rows[0]["estado"].ToString());
            token.Correo = validez.Rows[0]["correo"].ToString();
            token.Fecha = DateTime.Now.ToFileTimeUtc();

            String userToken = encriptar(JsonConvert.SerializeObject(token));
            dao.almacenarToken(userToken, token.Id);

            Correo correo = new Correo();

            String mensaje = "su link de acceso es: " + "http://localhost:54483//View/masterInicio/principal/recuperarCuenta.aspx?" + userToken;
            correo.enviarCorreoCuenta(token.Correo, userToken, mensaje);

            LB_RCuentaError.Text = "Su activación ha sido enviada a su correo";
        }
        else if (int.Parse(validez.Rows[0]["id"].ToString()) == -2)
        {
            LB_RCuentaError.Text = "Ya extsite un token, por favor verifique su correo.";
        }
        else
        {
            LB_RCuentaError.Text = "La cuenta se encuentra activa o el usuario no existe.";
        }
    }

    private string encriptar(string input)
    {
        SHA256CryptoServiceProvider provider = new SHA256CryptoServiceProvider();

        byte[] inputBytes = Encoding.UTF8.GetBytes(input);
        byte[] hashedBytes = provider.ComputeHash(inputBytes);

        StringBuilder output = new StringBuilder();

        for (int i = 0; i < hashedBytes.Length; i++)
            output.Append(hashedBytes[i].ToString("x2").ToLower());

        return output.ToString();
    }
}