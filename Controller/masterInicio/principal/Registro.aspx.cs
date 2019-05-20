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

        Response.Cache.SetNoStore();

    }

    protected void Bt_CrearU_Click(object sender, EventArgs e)
    {
        ERegistroUsuario cliente = new ERegistroUsuario();
        
        L_ErrorCedula.Visible = false;
        LB_ErrorNombre.Visible = false;
        LB_ErrorApellido.Visible = false;
        LB_ErrorTelefono.Visible = false;
        LB_ErrorContraseña.Visible = false;
        L_ErrorCorreo.Visible = false;
        L_ErrorFechaNacimiento.Visible = false;

        int error = 0;

        if (Int64.Parse(Tx_cedula.Text) > 2147483647)
        {

            L_ErrorCedula.Visible = true;
            L_ErrorCedula.Text = "Error vuelva a ingresar la cedula ";
            error = 1;

        }
        else
        {
            cliente.Cedula = Int32.Parse(Tx_cedula.Text);
        }
        
        cliente.Nombre = Tx_nombre.Text;
        cliente.Apellido = Tx_apellidos.Text;
        cliente.Correo = Tx_correo.Text;
        cliente.Contraseña = Tx_contraseña.Text;
        cliente.Fecha_nacimiento = DateTime.Parse(Tx_fecha.Text);
        cliente.Telefono = Int64.Parse(Tx_Telefono.Text);
        cliente.Estado = 1;
        cliente.Rol = 3;
        cliente.Session = Session.SessionID;
        DataTable contarCorreo = new DAORegistroCliente().contarCorreos(cliente);
        DataTable contarId = new DAORegistroCliente().contarId(cliente);
        DataTable idRegistro = new DAORegistroCliente().idRolRegistro(cliente);
        DataTable idSinRegistro = new DAORegistroCliente().idRolSinRegistro(cliente);
        DateTime fechaCliente = DateTime.Parse(Tx_fecha.Text);
        int edadCliente = System.DateTime.Now.Year - fechaCliente.Year;
        

        if (System.DateTime.Now.Subtract(fechaCliente.AddYears(edadCliente)).TotalDays < 0)
        {
            edadCliente = edadCliente - 1;

        }

        if (contarCorreo.Rows[0]["user_correo"].ToString() != "1")
        {
            L_ErrorCorreo.Visible = true;
            L_ErrorCorreo.Text = "El correo ya existe";
            error = 1;

        }

        if (edadCliente < 18)
        {
            L_ErrorFechaNacimiento.Visible = true;
            L_ErrorFechaNacimiento.Text = "Fecha de nacimiento incorrecta, no es mayor de edad.";
            error = 1;
        }
        
        if (Tx_nombre.Text.Length < 3)
        {
            LB_ErrorNombre.Visible = true;
            LB_ErrorNombre.Text = "El numero de caracteres del nombre son invalidos";
            error = 1;

        }

        if (Tx_apellidos.Text.Length < 3)
        {

            LB_ErrorApellido.Visible = true;
            LB_ErrorApellido.Text = "El numero de caracteres del apellido son invalidos";
            error = 1;

        }

        if (Tx_Telefono.Text.Length < 7)
        {

            LB_ErrorTelefono.Visible = true;
            LB_ErrorTelefono.Text = "El numero de caracteres del telefono son invalidos";
            error = 1;

        }

        if (Tx_contraseña.Text.Length < 4)
        {

            LB_ErrorContraseña.Visible = true;
            LB_ErrorContraseña.Text = "La contraseña no puede tener menos de 4 caracteres";
            error = 1;

        }

        if (Tx_correo.Text.Length < 16)
        {

            L_ErrorCorreo.Visible = true;
            L_ErrorCorreo.Text = "El numero de caracteres del correo son invalidos";
            error = 1;
        }

        if (Tx_cedula.Text.Length < 8)
        {

            L_ErrorCedula.Visible = true;
            L_ErrorCedula.Text = "El numero de caracteres de la cedula son invalidos";
            error = 1;

        }
        
        if (idSinRegistro.Rows[0]["user_id"].Equals(-1))
        {
            if (idRegistro.Rows[0]["user_id"].Equals(-1))
            {
                //L_ErrorCedula.Text = "";

                if (error == 0)
                {
                    cliente.Rol = 3;
                    new DAORegistroCliente().registroCliente(cliente);

                    L_ErrorCrear.Visible = true;
                    L_ErrorCrear.Text = "Cuenta creada, inicie sesión ";

                    Tx_nombre.Text = "";
                    Tx_apellidos.Text = "";
                    Tx_correo.Text = "";
                    Tx_cedula.Text = "";
                    Tx_fecha.Text = "";
                    Tx_Telefono.Text = "";
                }
            }
            else
            {
                L_ErrorCedula.Visible = true;
                L_ErrorCedula.Text = "La cedula ya se encuentra registrada ";
                error = 1;
            }
        }
        else
        {
            L_ErrorCedula.Text = "";
            if (error == 0)
            {
                cliente.Rol = 4;
                new DAORegistroCliente().registrarClienteSin(cliente);

                L_ErrorCrear.Visible = true;
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

}