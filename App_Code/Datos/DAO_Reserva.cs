using Npgsql;
using NpgsqlTypes;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de DAO_Reserva
/// </summary>
public class DAO_Reserva
{
    public DAO_Reserva()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }

    public DataTable mostrarServicio()
    {
        DataTable servicio = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MiConexion"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("usuario.f_cargar_servicio", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;

            conection.Open();
            dataAdapter.Fill(servicio);
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
        return servicio;
    }

    public DataTable mostrarEstilistas(int id_servicio)
    {
        DataTable estilista = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MiConexion"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("usuario.f_cargar_estilista", conection);
            dataAdapter.SelectCommand.Parameters.Add("_id_servicio", NpgsqlDbType.Integer).Value = id_servicio;
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

    public DataTable mostrarPrecio(int id_servicio)
    {
        DataTable precio = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MiConexion"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("usuario.f_cargar_precio", conection);
            dataAdapter.SelectCommand.Parameters.Add("_id_servicio", NpgsqlDbType.Integer).Value = id_servicio;
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;

            conection.Open();
            dataAdapter.Fill(precio);
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
        return precio;
    }

    public DataTable mostrarHorarios(int id_estilista, string hora_inicio)
    {
        DateTime fecha = new DateTime();
        DataTable horario = new DataTable();
        string hora_ini;

        if (hora_inicio == "1")
        {
            fecha = DateTime.Now;
            hora_ini = fecha.ToShortDateString();
        }
        else
        {
            hora_ini = DateTime.Parse(hora_inicio).ToShortDateString();
        }

        

        DateTime hora_iniBD = DateTime.Parse(hora_ini + " 08:00:00");
        DateTime hora_finBD = DateTime.Parse(hora_ini + " 17:00:00");

        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MiConexion"].ConnectionString);

        try /*1203125647*/
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("reserva.f_mostar_horarios2", conection);
            dataAdapter.SelectCommand.Parameters.Add("_id_estilista", NpgsqlDbType.Integer).Value = id_estilista;
            dataAdapter.SelectCommand.Parameters.Add("_hora_inicio", NpgsqlDbType.Timestamp).Value = hora_iniBD;
            dataAdapter.SelectCommand.Parameters.Add("_hora_final", NpgsqlDbType.Timestamp).Value = hora_finBD;
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

    public DataTable duracionServicio(int id_servicio)
    {
        DataTable duracion = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MiConexion"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("usuario.f_duracion_servicio", conection);
            dataAdapter.SelectCommand.Parameters.Add("_id", NpgsqlDbType.Integer).Value = id_servicio;
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;

            conection.Open();
            dataAdapter.Fill(duracion);
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
        return duracion;
    }

    public DataTable horarioEstilista(int id_estilista, string hora_inicio,string hora_final)
    {


        DataTable horario = new DataTable();
      

        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MiConexion"].ConnectionString);

        try /*1203125647*/
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("reserva.f_mostar_horarios", conection);
            dataAdapter.SelectCommand.Parameters.Add("_id_estilista", NpgsqlDbType.Integer).Value = id_estilista;
            dataAdapter.SelectCommand.Parameters.Add("_hora_inicio", NpgsqlDbType.Timestamp).Value = DateTime.Parse(hora_inicio);
            dataAdapter.SelectCommand.Parameters.Add("_hora_final", NpgsqlDbType.Timestamp).Value = DateTime.Parse(hora_final);
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

    public DataTable actulizarReserva(ERegistroHorario datos)//los parametros se deben llamar igual como en la BD 
    {
        DataTable modificarReserva = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MiConexion"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("reserva.f_actualizar_reserva", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("_id", NpgsqlDbType.Integer).Value = datos.IdReserva;
            dataAdapter.SelectCommand.Parameters.Add("_id_servicio", NpgsqlDbType.Integer).Value = datos.IdServicio;
            dataAdapter.SelectCommand.Parameters.Add("_id_cliente", NpgsqlDbType.Integer).Value = datos.IdCliente;
            dataAdapter.SelectCommand.Parameters.Add("_disponible", NpgsqlDbType.Boolean).Value = datos.Estado;

            conection.Open();
            dataAdapter.Fill(modificarReserva);
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
        return modificarReserva;
    }

    public DataTable guardarReserva(ERegistroHorario datos)//los parametros se deben llamar igual como en la BD 
    {
        DataTable guardar = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MiConexion"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("reserva.f_insert_reserva3", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("_id_estilista", NpgsqlDbType.Integer).Value = datos.Idestilista;
            dataAdapter.SelectCommand.Parameters.Add("_dia_hora_inicio", NpgsqlDbType.Timestamp).Value = datos.Fechaini;
            dataAdapter.SelectCommand.Parameters.Add("_dia_hora_final", NpgsqlDbType.Timestamp).Value = datos.Fechafin;
            dataAdapter.SelectCommand.Parameters.Add("_id_servicio", NpgsqlDbType.Integer).Value = datos.IdServicio;
            dataAdapter.SelectCommand.Parameters.Add("_id_usuario", NpgsqlDbType.Integer).Value = datos.IdCliente;
            dataAdapter.SelectCommand.Parameters.Add("_precio", NpgsqlDbType.Integer).Value = datos.Precio;
            dataAdapter.SelectCommand.Parameters.Add("_session", NpgsqlDbType.Text).Value = datos.Session;

            conection.Open();
            dataAdapter.Fill(guardar);
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
        return guardar;
    }

    public DataTable mostrarReservas(int id_cliente)
    {
        DataTable reservas = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MiConexion"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("reserva.f_mostrar_reservas7", conection);
            dataAdapter.SelectCommand.Parameters.Add("_id_cliente", NpgsqlDbType.Integer).Value = id_cliente;
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;

            conection.Open();
            dataAdapter.Fill(reservas);
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
        return reservas;
    }
}