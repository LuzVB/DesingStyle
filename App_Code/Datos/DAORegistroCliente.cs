using Npgsql;
using NpgsqlTypes;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de DAORegistroCliente
/// </summary>
public class DAORegistroCliente
{
    public DAORegistroCliente()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }

    public DataTable registroCliente(ERegistroUsuario cliente)//los parametros se deben llamar igual como en la BD 
    {
        DataTable insertarCliente = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MiConexion"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("usuario.f_insert_cliente", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("_id", NpgsqlDbType.Integer).Value = cliente.Cedula;
            dataAdapter.SelectCommand.Parameters.Add("_nombre", NpgsqlDbType.Text).Value = cliente.Nombre;
            dataAdapter.SelectCommand.Parameters.Add("_apellido", NpgsqlDbType.Text).Value = cliente.Apellido;
            dataAdapter.SelectCommand.Parameters.Add("_correo", NpgsqlDbType.Text).Value = cliente.Correo;
            dataAdapter.SelectCommand.Parameters.Add("_contrasena", NpgsqlDbType.Text).Value = cliente.Contraseña;
            dataAdapter.SelectCommand.Parameters.Add("_fecha_nacimiento", NpgsqlDbType.Date).Value = cliente.Fecha_nacimiento;
            dataAdapter.SelectCommand.Parameters.Add("_estado", NpgsqlDbType.Integer).Value = cliente.Estado;
            dataAdapter.SelectCommand.Parameters.Add("_id_rol", NpgsqlDbType.Integer).Value = cliente.Rol;
            dataAdapter.SelectCommand.Parameters.Add("_session", NpgsqlDbType.Text).Value = cliente.Session;

            conection.Open();
            dataAdapter.Fill(insertarCliente);
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
        return insertarCliente;
    }

    public DataTable contarCorreos(ERegistroUsuario user)
    {
        DataTable usuario = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MiConexion"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("usuario.f_contarcorreo", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("_correo", NpgsqlDbType.Text).Value = user.Correo;

            conection.Open();
            dataAdapter.Fill(usuario);
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
        return usuario;
    }
}