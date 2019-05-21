using Npgsql;
using NpgsqlTypes;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de DAOServicio
/// </summary>
public class DAOServicio
{
    public DataTable registroServicio(EServicio servicio)//los parametros se deben llamar igual como en la BD 
    {
        DataTable insertarServicio= new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MiConexion"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("usuario.f_insert_servicio", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            //dataAdapter.SelectCommand.Parameters.Add("_id", NpgsqlDbType.Integer).Value = cliente.Cedula;
            dataAdapter.SelectCommand.Parameters.Add("_nombre", NpgsqlDbType.Text).Value = servicio.Nombre;
            dataAdapter.SelectCommand.Parameters.Add("_descripcion", NpgsqlDbType.Text).Value = servicio.Descripcion;
            dataAdapter.SelectCommand.Parameters.Add("_precio", NpgsqlDbType.Integer).Value = servicio.Precio;
            dataAdapter.SelectCommand.Parameters.Add("_duracion", NpgsqlDbType.Text).Value =servicio.Duracion;
            dataAdapter.SelectCommand.Parameters.Add("_estado", NpgsqlDbType.Integer).Value = servicio.Estado;
            dataAdapter.SelectCommand.Parameters.Add("_session", NpgsqlDbType.Text).Value = servicio.Session;


            dataAdapter.Fill(insertarServicio);
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
        return insertarServicio;
    }

    public DataTable registroServicio2(EServicio servicio)//los parametros se deben llamar igual como en la BD 
    {
        DataTable insertarServicio = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MiConexion"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("usuario.f_insert_servicio", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            //dataAdapter.SelectCommand.Parameters.Add("_id", NpgsqlDbType.Integer).Value = cliente.Cedula;
            dataAdapter.SelectCommand.Parameters.Add("_nombre", NpgsqlDbType.Text).Value = servicio.Nombre;
            dataAdapter.SelectCommand.Parameters.Add("_descripcion", NpgsqlDbType.Text).Value = servicio.Descripcion;
            dataAdapter.SelectCommand.Parameters.Add("_precio", NpgsqlDbType.Integer).Value = servicio.Precio;
            dataAdapter.SelectCommand.Parameters.Add("_duracion", NpgsqlDbType.Text).Value = servicio.Duracion;
            dataAdapter.SelectCommand.Parameters.Add("_estado", NpgsqlDbType.Text).Value = servicio.Estado;
            dataAdapter.SelectCommand.Parameters.Add("_session", NpgsqlDbType.Text).Value = servicio.Session;


            dataAdapter.Fill(insertarServicio);
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
        return insertarServicio;
    }

    public DataTable modificarServicico(string nombre, string descripcion, int precio, string duracion,int id)//los parametros se deben llamar igual como en la BD 
    {
        DataTable modificarServicio = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MiConexion"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("usuario.f_actualizar_servicio", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("_id", NpgsqlDbType.Integer).Value = id;
            dataAdapter.SelectCommand.Parameters.Add("_nombre", NpgsqlDbType.Text).Value = nombre;
            dataAdapter.SelectCommand.Parameters.Add("_descripcion", NpgsqlDbType.Text).Value = descripcion;
            dataAdapter.SelectCommand.Parameters.Add("_precio", NpgsqlDbType.Integer).Value = precio;
            dataAdapter.SelectCommand.Parameters.Add("_duracion", NpgsqlDbType.Text).Value = duracion;

            conection.Open();
            dataAdapter.Fill(modificarServicio);
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
        return modificarServicio;
    }

    public DataTable modificarServicico2(string nombre, string descripcion, int precio,string duracion, string estado , int id)//los parametros se deben llamar igual como en la BD 
    {
        DataTable modificarServicio = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MiConexion"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("usuario.f_actualizar_servicio_alerta", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("_id", NpgsqlDbType.Integer).Value = id;
            dataAdapter.SelectCommand.Parameters.Add("_nombre", NpgsqlDbType.Text).Value = nombre;
            dataAdapter.SelectCommand.Parameters.Add("_descripcion", NpgsqlDbType.Text).Value = descripcion;
            dataAdapter.SelectCommand.Parameters.Add("_precio", NpgsqlDbType.Integer).Value = precio;
            dataAdapter.SelectCommand.Parameters.Add("_estado", NpgsqlDbType.Text).Value = estado;
            dataAdapter.SelectCommand.Parameters.Add("_duracion", NpgsqlDbType.Text).Value = duracion;
            conection.Open();
            dataAdapter.Fill(modificarServicio);
          
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
        return modificarServicio;
    }

    public DataTable mostrarservicio()
    {
        DataTable servicio = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MiConexion"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("usuario.f_mostar_servicio", conection);
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

    public DataTable mostrarservicio2()
    {
        DataTable servicio = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MiConexion"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("usuario.f_mostar_servicio2", conection);
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

    public DataTable modificarEstado(int id)//los parametros se deben llamar igual como en la BD 
    {
        DataTable modificarEstado = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MiConexion"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("usuario.f_actualizar_estado", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("_id", NpgsqlDbType.Integer).Value = id;
            conection.Open();
            dataAdapter.Fill(modificarEstado);
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
        return modificarEstado;
    }
}
