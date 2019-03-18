using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_masterInicio_principal_Registro : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Bt_CrearU_Click(object sender, EventArgs e)
    {
        ERegistroUsuario cliente = new ERegistroUsuario();

        cliente.Cedula = Int32.Parse(Tx_cedula.Text);
        cliente.Nombre = Tx_nombre.Text;
        cliente.Apellido = Tx_apellidos.Text;
        cliente.Correo = Tx_correo.Text;
        cliente.Contraseña = Tx_contraseña.Text;
        cliente.Fecha_nacimiento = DateTime.Parse(Tx_fecha.Text);
        cliente.Telefono = Int32.Parse(Tx_Telefono.Text);
        cliente.Estado = 1;
        cliente.Rol = 3;
        cliente.Session = Session.SessionID;
        DataTable contarCorreo = new DAORegistroCliente().contarCorreos(cliente);
        DataTable contarId = new DAORegistroCliente().contarId(cliente);
        DateTime fechaCliente = DateTime.Parse(Tx_fecha.Text);
        int edadCliente = System.DateTime.Now.Year - fechaCliente.Year;
        int error = 0;

        if (System.DateTime.Now.Subtract(fechaCliente.AddYears(edadCliente)).TotalDays < 0)
        {
            edadCliente = edadCliente - 1;

        }

        if (contarCorreo.Rows[0]["user_correo"].Equals("1"))
        {
            L_ErrorCorreo.Text = "";
            error = 0;
        }
        else
        {
            L_ErrorCorreo.Text = "El correo ya existe";
            error = 1;
        }

        if (contarId.Rows[0]["user_id"].Equals(-1))
        {
            L_ErrorCedula.Text = "";
            error = 0;
        }
        else
        {
            L_ErrorCedula.Text = "La cedula ya se encuentra registrada ";
            error = 1;
        }


        if (edadCliente > 18)
        {
            L_ErrorFechaNacimiento.Text = "";
            error = 0;
        }
        else
        {
            L_ErrorFechaNacimiento.Text = "Fecha de nacimiento incorrecta, no es mayor de edad.";
            error = 1;
        }

        if(error == 0)
        {
            new DAORegistroCliente().registroCliente(cliente);

            L_ErrorCrear.Text = "Cuenta creada, inicie sesión ";

            Tx_nombre.Text = "";
            Tx_apellidos.Text = "";
            Tx_correo.Text = "";
            Tx_cedula.Text = "";
            Tx_fecha.Text = "";
            Tx_Telefono.Text = "";
        }
        
    }
}