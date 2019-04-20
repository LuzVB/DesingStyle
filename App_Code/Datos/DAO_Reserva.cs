using Npgsql;
using NpgsqlTypes;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Globalization;
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
            //NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("usuario.f_cargar_estilista", conection);
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("usuario.f_cargar_estilista3", conection);
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
        string hora_ini, hora_actual, fechaA;
        DateTime fechaActual = new DateTime();
        fechaActual = DateTime.Now;
        fechaA = fechaActual.ToShortDateString();
        DateTime fecha = new DateTime();
        DateTime hora_iniBD = new DateTime();
        DateTime hora_finBD = new DateTime();
        DataTable horario = new DataTable();
        

        if (hora_inicio == "1")
        {
            fecha = DateTime.Now;
            hora_ini = fecha.ToShortDateString();
        }
        else
        {
            hora_ini = DateTime.Parse(hora_inicio).ToShortDateString();
        }

        if (DateTime.Parse(fechaA) == DateTime.Parse(hora_ini)){

            hora_actual = fechaActual.ToString("HH:mm", CultureInfo.CurrentCulture); 

            hora_iniBD = DateTime.Parse(hora_actual);
            hora_finBD = DateTime.Parse(hora_ini + " 17:00:00");
            
        }
        else if (DateTime.Parse(fechaA) > DateTime.Parse(hora_ini))
        {

            hora_iniBD = DateTime.Parse(hora_ini + " 00:00:00");
            hora_finBD = DateTime.Parse(hora_ini + " 00:00:00");
        }
        else
        {
            hora_iniBD = DateTime.Parse(hora_ini + " 08:00:00");
            hora_finBD = DateTime.Parse(hora_ini + " 17:00:00");
            
        }

        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MiConexion"].ConnectionString);

        try /*1203125647*/
        {
            ////NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("reserva.f_mostar_horarios2", conection);
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("reserva.f_mostar_horarios5", conection);
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

    public DataTable mostrarHorarios2(int id_estilista, string hora_inicio, int id_servicio)
    {
        string hora_ini, hora_actual, fechaA;
        DateTime fechaActual = new DateTime();
        fechaActual = DateTime.Now;
        fechaA = fechaActual.ToShortDateString();
        DateTime fecha = new DateTime();
        DateTime hora_iniBD = new DateTime();
        DateTime hora_finBD = new DateTime();
        DataTable horario = new DataTable();


        if (hora_inicio == "1")
        {
            fecha = DateTime.Now;
            hora_ini = fecha.ToShortDateString();
        }
        else
        {
            hora_ini = DateTime.Parse(hora_inicio).ToShortDateString();
        }

        if (DateTime.Parse(fechaA) == DateTime.Parse(hora_ini))
        {

            hora_actual = fechaActual.ToString("HH:mm", CultureInfo.CurrentCulture);

            hora_iniBD = DateTime.Parse(hora_actual);
            hora_finBD = DateTime.Parse(hora_ini + " 17:00:00");

        }
        else if (DateTime.Parse(fechaA) > DateTime.Parse(hora_ini))
        {

            hora_iniBD = DateTime.Parse(hora_ini + " 00:00:00");
            hora_finBD = DateTime.Parse(hora_ini + " 00:00:00");
        }
        else
        {
            hora_iniBD = DateTime.Parse(hora_ini + " 08:00:00");
            hora_finBD = DateTime.Parse(hora_ini + " 17:00:00");

        }

        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MiConexion"].ConnectionString);

        try /*1203125647*/
        {
            ////NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("reserva.f_mostar_horarios2", conection);
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("reserva.f_mostar_horarios6", conection);
            dataAdapter.SelectCommand.Parameters.Add("_id_estilista", NpgsqlDbType.Integer).Value = id_estilista;
            dataAdapter.SelectCommand.Parameters.Add("_hora_inicio", NpgsqlDbType.Timestamp).Value = hora_iniBD;
            dataAdapter.SelectCommand.Parameters.Add("_hora_final", NpgsqlDbType.Timestamp).Value = hora_finBD;
            dataAdapter.SelectCommand.Parameters.Add("_servicio", NpgsqlDbType.Integer).Value = id_servicio;
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
        DateTime horaActual = DateTime.Now;

        DataTable reservas = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MiConexion"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("reserva.f_mostrar_reservas9", conection);
            dataAdapter.SelectCommand.Parameters.Add("_id_cliente", NpgsqlDbType.Integer).Value = id_cliente;
            dataAdapter.SelectCommand.Parameters.Add("_hora_actual", NpgsqlDbType.Timestamp).Value =horaActual;
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

    public DataTable verificarReserva(int id_cliente, DateTime fechaActual, DateTime horaFinal )
    {
        DataTable reservas = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MiConexion"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("reserva.f_traer_rescliente", conection);
            dataAdapter.SelectCommand.Parameters.Add("_id_cliente", NpgsqlDbType.Integer).Value = id_cliente;
            dataAdapter.SelectCommand.Parameters.Add("_fechaactual", NpgsqlDbType.Timestamp).Value = fechaActual;
            dataAdapter.SelectCommand.Parameters.Add("_hora_final", NpgsqlDbType.Timestamp).Value = horaFinal;
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

    public DataTable mostrarHistorial(int id_cliente)
    {
        DateTime horaActual = DateTime.Now;

        DataTable reservas = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MiConexion"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("reserva.f_mostrar_historial", conection);
            dataAdapter.SelectCommand.Parameters.Add("_id_cliente", NpgsqlDbType.Integer).Value = id_cliente;
            dataAdapter.SelectCommand.Parameters.Add("_hora_actual", NpgsqlDbType.Timestamp).Value = horaActual;
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

    public DataTable mostrarReserva(int id)
    {
        DataTable reservas = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MiConexion"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("reserva.f_mostar_reserva", conection);
            dataAdapter.SelectCommand.Parameters.Add("_id", NpgsqlDbType.Integer).Value = id;
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

    public void eliminarReserva(EReserva reserva)
    {
        DataTable cita = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MiConexion"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("reserva.f_eliminar_reserva", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("_id", NpgsqlDbType.Integer).Value = reserva.Id;

            conection.Open();
            dataAdapter.Fill(cita);
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


    public DataTable traerHorario(EReserva traer)
    {

        DataTable horario = new DataTable();

        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MiConexion"].ConnectionString);

        try /*1203125647*/
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("reserva.f_traer_reservas", conection);
            dataAdapter.SelectCommand.Parameters.Add("_id_estilista", NpgsqlDbType.Integer).Value = traer.Id_estilista;
            dataAdapter.SelectCommand.Parameters.Add("_id_cliente", NpgsqlDbType.Integer).Value = traer.Id_cliente;
            dataAdapter.SelectCommand.Parameters.Add("_hora_inicio", NpgsqlDbType.Timestamp).Value = traer.Hora_inicio;
            dataAdapter.SelectCommand.Parameters.Add("_hora_final", NpgsqlDbType.Timestamp).Value = traer.Hora_final; 
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
}