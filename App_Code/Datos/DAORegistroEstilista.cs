using Npgsql;
using NpgsqlTypes;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Windows.Forms;

/// <summary>
/// Descripción breve de DAORegistroEstilista
/// </summary>
public class DAORegistroEstilista
{
    public DataTable registroEstilista(ERegistroUsuario estilista)//los parametros se deben llamar igual como en la BD 
    {
        DataTable insertarEstilista = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MiConexion"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("usuario.f_insert_cliente", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("_id", NpgsqlDbType.Integer).Value = estilista.Cedula;
            dataAdapter.SelectCommand.Parameters.Add("_nombre", NpgsqlDbType.Text).Value = estilista.Nombre;
            dataAdapter.SelectCommand.Parameters.Add("_apellido", NpgsqlDbType.Text).Value = estilista.Apellido;
            dataAdapter.SelectCommand.Parameters.Add("_correo", NpgsqlDbType.Text).Value = estilista.Correo;
            dataAdapter.SelectCommand.Parameters.Add("_contrasena", NpgsqlDbType.Text).Value = estilista.Contraseña;
            dataAdapter.SelectCommand.Parameters.Add("_fecha_nacimiento", NpgsqlDbType.Date).Value = estilista.Fecha_nacimiento;
            dataAdapter.SelectCommand.Parameters.Add("_telefono", NpgsqlDbType.Integer).Value = estilista.Telefono;
            dataAdapter.SelectCommand.Parameters.Add("_estado", NpgsqlDbType.Integer).Value = estilista.Estado;
            dataAdapter.SelectCommand.Parameters.Add("_id_rol", NpgsqlDbType.Integer).Value = estilista.Rol;
            dataAdapter.SelectCommand.Parameters.Add("_session", NpgsqlDbType.Text).Value = estilista.Session;

            conection.Open();
            dataAdapter.Fill(insertarEstilista);
        }
        catch (Npgsql.PostgresException e)
        {

            MessageBox.Show("El estilista ya se encuentra registrado con ese servicio");
        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
        return insertarEstilista;
    }

    public DataTable actualizarbiografia(EUsuario datos)
    {
        DataTable Usuario = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MiConexion"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("usuario.f_actualizar_contrasena2", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("_user_id", NpgsqlDbType.Integer).Value = datos.UserId;
            dataAdapter.SelectCommand.Parameters.Add("_contrasena", NpgsqlDbType.Varchar).Value = datos.Contraseña;

            conection.Open();
            dataAdapter.Fill(Usuario);
        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
        return Usuario;
    }

    public DataTable registroEstilistaServicio(ERegistroUsuario EstilistaServicio)//los parametros se deben llamar igual como en la BD 
    {
        DataTable Servicio = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MiConexion"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("usuario.f_insert_estilista_servicio", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("_id_usuario", NpgsqlDbType.Integer).Value = EstilistaServicio.Cedula;
            dataAdapter.SelectCommand.Parameters.Add("_id_servicio", NpgsqlDbType.Integer).Value = EstilistaServicio.Servicio;
            dataAdapter.SelectCommand.Parameters.Add("_session", NpgsqlDbType.Text).Value = EstilistaServicio.Session;

            conection.Open();
            dataAdapter.Fill(Servicio);
        }
        //catch (Npgsql.PostgresException e)
        //{

        //    MessageBox.Show("El estilista ya se encuentra registrado con ese servicio");
        //}
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
        return Servicio;
    }
    public DataTable ServicioEAdcional(ERegistroUsuario ServicioAdi)
    {
        DataTable Servicio = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MiConexion"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("usuario.f_insert_servicio_adicional", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("_id_usuario", NpgsqlDbType.Integer).Value = ServicioAdi.Usuario;
            dataAdapter.SelectCommand.Parameters.Add("_id_servicio", NpgsqlDbType.Integer).Value = ServicioAdi.Servicio;
            dataAdapter.SelectCommand.Parameters.Add("_session", NpgsqlDbType.Text).Value = ServicioAdi.Session;

            conection.Open();
            dataAdapter.Fill(Servicio);
        }
        catch (Npgsql.PostgresException e)
        {
            MessageBox.Show("El estilista ya se encuentra registrado con ese servicio");
        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
        return Servicio;
    }
    public DataTable mostrarEstilista()
    {
        DataTable estilista = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MiConexion"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("usuario.f_mostar_estilista", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;

            conection.Open();
            dataAdapter.Fill(estilista);
        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }

        return estilista;
    }
    public DataTable modificarEstilista(string nombre, string apellido, int telefono, string correo, string contrasena, string estado, int id)//los parametros se deben llamar igual como en la BD 
    {
        DataTable modificarEstilista = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MiConexion"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("usuario.f_actualizar_estilista", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("_id", NpgsqlDbType.Integer).Value = id;
            dataAdapter.SelectCommand.Parameters.Add("_nombre", NpgsqlDbType.Text).Value = nombre;
            dataAdapter.SelectCommand.Parameters.Add("_apellido", NpgsqlDbType.Text).Value = apellido;
            dataAdapter.SelectCommand.Parameters.Add("_telefono", NpgsqlDbType.Integer).Value = telefono;
            dataAdapter.SelectCommand.Parameters.Add("_correo", NpgsqlDbType.Text).Value = correo;
            dataAdapter.SelectCommand.Parameters.Add("_contrasena", NpgsqlDbType.Text).Value = contrasena;
            dataAdapter.SelectCommand.Parameters.Add("_estado", NpgsqlDbType.Integer).Value = Int32.Parse(estado);

            conection.Open();
            dataAdapter.Fill(modificarEstilista);
        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
        return modificarEstilista;
    }
    public DataTable obtenerServicio()
    {
        DataTable Usuario = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MiConexion"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("usuario.f_obtener_servicio", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;


            conection.Open();
            dataAdapter.Fill(Usuario);
        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
        return Usuario;
    }
    public DataTable mostrarUsuario_servicio()
    {
        DataTable estilista = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MiConexion"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("usuario.f_mostar_servicio_usuario2", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;

            conection.Open();
            dataAdapter.Fill(estilista);
        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }

        return estilista;
    }
    public void eliminarUsuario_Servicio(int id)
    {
        DataTable eliminarUsuarioSer = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MiConexion"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("usuario.f_eliminar_usuario_servicio", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("_id", NpgsqlDbType.Integer).Value = id;

            conection.Open();
            dataAdapter.Fill(eliminarUsuarioSer);
        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
    }
    public DataTable obtenerEstilista()
    {
        DataTable Usuario = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MiConexion"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("usuario.f_obtener_estilista2", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;


            conection.Open();
            dataAdapter.Fill(Usuario);
        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
        return Usuario;
    }
    public DataTable mostrarEstilistaInasistencia()
    {
        DataTable estilistaInasistecnia = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MiConexion"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("reserva.f_mostar_estilistas_inasistencia2", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;

            conection.Open();
            dataAdapter.Fill(estilistaInasistecnia);
        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }

        return estilistaInasistecnia;
    }
    public DataTable mostrarHorario()
    {
        DataTable horario = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MiConexion"].ConnectionString);

        try
        {
            //NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("reserva.f_mostar_horario4", conection);//primera prueba 
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("reserva.f_mostar_horarioprueba", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;

            conection.Open();
            dataAdapter.Fill(horario);
        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
        return horario;
    }
    public DataTable registroHorario(ERegistroHorario cs)//los parametros se deben llamar igual como en la BD 
    {
        DataTable insertarHorario = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MiConexion"].ConnectionString);

        try
        {
            // NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("reserva.insert_horario", conection);
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("reserva.f_insert_horario", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("_id_estilista", NpgsqlDbType.Integer).Value = cs.Idestilista;
            dataAdapter.SelectCommand.Parameters.Add("_hora_inicio", NpgsqlDbType.Timestamp).Value = cs.Fechaini;
            dataAdapter.SelectCommand.Parameters.Add("_hora_final", NpgsqlDbType.Timestamp).Value = cs.Fechafin;
            dataAdapter.SelectCommand.Parameters.Add("_estado", NpgsqlDbType.Boolean).Value = cs.Estado;

            conection.Open();
            dataAdapter.Fill(insertarHorario);
        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
        return insertarHorario;
    }
    public DataTable Inasistencia(int _usuario, DateTime _fecha)
    {
        DataTable ActualizarInacistencia = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MiConexion"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("usuario.actualizar_inasistencia2", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("_id_estilista", NpgsqlDbType.Integer).Value = _usuario;
            dataAdapter.SelectCommand.Parameters.Add("_fecha", NpgsqlDbType.Date).Value = _fecha;

            conection.Open();
            dataAdapter.Fill(ActualizarInacistencia);
        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
        return ActualizarInacistencia;
    }
    public DataTable AsistenciaCliente(int Usuario, int id, int alerta)
    {
        DataTable AsisCliente = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MiConexion"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("usuario.actualizar_asistencia", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("_id_estilista", NpgsqlDbType.Integer).Value = Usuario;
            dataAdapter.SelectCommand.Parameters.Add("_id", NpgsqlDbType.Integer).Value = id;
            dataAdapter.SelectCommand.Parameters.Add("_alerta", NpgsqlDbType.Integer).Value = alerta;

            conection.Open();
            dataAdapter.Fill(AsisCliente);
        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
        return AsisCliente;
    }
    public DataTable mostrarEstilistaAsis(int id)
    {
        DataTable Servicio = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MiConexion"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("reserva.f_mostrar_asistencia2", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("id_", NpgsqlDbType.Integer).Value = id;
            conection.Open();
            dataAdapter.Fill(Servicio);
        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
        return Servicio;
    }
    public DataTable registroHorario2(ERegistroHorario cs)//los parametros se deben llamar igual como en la BD 
    {
        string fechaCorta;
        DateTime fechaInicio = new DateTime();
        DateTime fechaFin = new DateTime();
        fechaInicio = DateTime.Now;
        fechaCorta = fechaInicio.ToShortDateString();
        fechaFin = fechaInicio.AddYears(1);
        fechaInicio = DateTime.Parse(fechaCorta);
        //fechaFin = fechaInicio.AddDays(1);


        DataTable insertarHorario = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MiConexion"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("reserva.f_insert_horarioprueba3", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("_id_estilista", NpgsqlDbType.Integer).Value = cs.Idestilista;
            dataAdapter.SelectCommand.Parameters.Add("_inicio_serie", NpgsqlDbType.Timestamp).Value = fechaInicio;
            dataAdapter.SelectCommand.Parameters.Add("_final_serie", NpgsqlDbType.Timestamp).Value = fechaFin;
            dataAdapter.SelectCommand.Parameters.Add("_disponible", NpgsqlDbType.Boolean).Value = cs.DisponibleSerie;

            conection.Open();
            dataAdapter.Fill(insertarHorario);
        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
        return insertarHorario;
    }

    public DataTable ActualizarInasistencia(int _usuario, DateTime _fecha)
    {
        DataTable ActualizarInacistencia = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MiConexion"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("reserva.f_actualizar_inacistencia", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("_id_estilista", NpgsqlDbType.Integer).Value = _usuario;
            dataAdapter.SelectCommand.Parameters.Add("_dia_inacistencia", NpgsqlDbType.Date).Value = _fecha;

            conection.Open();
            dataAdapter.Fill(ActualizarInacistencia);
        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
        return ActualizarInacistencia;
    }
    public DataTable Inasistencia(int _usuario, DateTime _fecha, String session)
    {
        DataTable ActualizarInacistencia = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MiConexion"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("reserva.f_insert_inacistencia", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;

            dataAdapter.SelectCommand.Parameters.Add("_id_alerta", NpgsqlDbType.Integer).Value = 1;
            dataAdapter.SelectCommand.Parameters.Add("_id_estilista", NpgsqlDbType.Integer).Value = _usuario;
            dataAdapter.SelectCommand.Parameters.Add("_dia_inacistencia", NpgsqlDbType.Date).Value = _fecha;
            dataAdapter.SelectCommand.Parameters.Add("_session", NpgsqlDbType.Text).Value = session;

            conection.Open();
            dataAdapter.Fill(ActualizarInacistencia);
        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
        return ActualizarInacistencia;
    }
    public DataTable mostrarEstilistaInasistencia(int id)
    {
        DataTable estilistaInasistecnia = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MiConexion"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("reserva.f_mostar_estilistas_inasistencia", conection);
            dataAdapter.SelectCommand.Parameters.Add("_id", NpgsqlDbType.Integer).Value = id;
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;

            conection.Open();
            dataAdapter.Fill(estilistaInasistecnia);
        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }

        return estilistaInasistecnia;
    }
    public DataTable MostrarInasistencia(int id)
    {
        DataTable MostrarInasistencia = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MiConexion"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("usuario.f_mostar_inacistencia", conection);
            dataAdapter.SelectCommand.Parameters.Add("_id", NpgsqlDbType.Integer).Value = id;
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;

            conection.Open();
            dataAdapter.Fill(MostrarInasistencia);
        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }

        return MostrarInasistencia;
    }
    public DataTable EliminarIna(int Estilista, DateTime Dinasistencia)
    {
        DataTable ActualizarInacistencia = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MiConexion"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("reserva.f_actualizar_inacistencia2", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("_id_estilista", NpgsqlDbType.Integer).Value = Estilista;
            dataAdapter.SelectCommand.Parameters.Add("_dia_inacistencia", NpgsqlDbType.Date).Value = Dinasistencia;

            conection.Open();
            dataAdapter.Fill(ActualizarInacistencia);
        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
        return ActualizarInacistencia;
    }
    public DataTable EliminarInasistencia(int id)
    {
        DataTable Eliminar = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MiConexion"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("reserva.f_eliminar_inasistencia", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("id_", NpgsqlDbType.Integer).Value = id;
            conection.Open();
            dataAdapter.Fill(Eliminar);
        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
        return Eliminar;
    }

    public DataTable EliminarSerUsuario(int id)
    {
        DataTable estilistaInasistecnia = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MiConexion"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("usuario.f_mostar_usuario_servicio", conection);
            dataAdapter.SelectCommand.Parameters.Add("_id", NpgsqlDbType.Integer).Value = id;
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;

            conection.Open();
            dataAdapter.Fill(estilistaInasistecnia);
        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }

        return estilistaInasistecnia;
    }
    public DataTable AlertaSerUsario(int Ser, int Est, int alerta, int id)
    {
        DataTable Asis = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MiConexion"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("reserva.f_actualizar_servicioeliminado", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("_id", NpgsqlDbType.Integer).Value = id;
            dataAdapter.SelectCommand.Parameters.Add("_estilista", NpgsqlDbType.Integer).Value = Est;
            dataAdapter.SelectCommand.Parameters.Add("_servicio", NpgsqlDbType.Integer).Value = Ser;
            dataAdapter.SelectCommand.Parameters.Add("_alerta", NpgsqlDbType.Integer).Value = alerta;
            conection.Open();
            dataAdapter.Fill(Asis);
        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
        return Asis;
    }

    public DataTable Alerta(int id)
    {
        DataTable Servicio = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MiConexion"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("reserva.f_mostar_alerta2", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("_id_usuario", NpgsqlDbType.Integer).Value = id;
            conection.Open();
            dataAdapter.Fill(Servicio);
        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
        return Servicio;
    }
    public DataTable ConfirmacionAlerta(int id)
    {
        DataTable Servicio = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MiConexion"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("reserva.f_actualizar_alerta_confirmacion", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("_id", NpgsqlDbType.Integer).Value = id;
            conection.Open();
            dataAdapter.Fill(Servicio);
        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
        return Servicio;
    }

}