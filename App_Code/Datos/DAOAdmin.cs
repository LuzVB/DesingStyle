using Npgsql;
using NpgsqlTypes;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Numerics;
using System.Web;

/// <summary>
/// Descripción breve de DAOAdmin
/// </summary>
public class DAOAdmin
{
    public DAOAdmin()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }

    public DataTable mostrarAdmin(int id)
    {
        DataTable mostrarAdmin = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MiConexion"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("usuario.f_mostar_usuario", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("_id", NpgsqlDbType.Integer).Value = id;

            conection.Open();
            dataAdapter.Fill(mostrarAdmin);
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
        return mostrarAdmin;
    }
}