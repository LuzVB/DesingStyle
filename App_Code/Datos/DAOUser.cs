using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using Npgsql;
using NpgsqlTypes;
/// <summary>
/// Descripción breve de DAOUser
/// </summary>
public class DAOUser
{
    public DAOUser()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }

    //public DataTable mostrarCine(string busqueda)
    //{
    //    DataTable mostarSer = new DataTable();
    //    NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MiConexion"].ConnectionString);

    //    try
    //    {
    //        NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("usuario.f_mostar_servicio", conection);
    //        dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
    //        dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
    //        dataAdapter.SelectCommand.Parameters.Add("_busqueda", NpgsqlDbType.Text).Value = busqueda == " " ? "-1" : busqueda;

    //        conection.Open();
    //        dataAdapter.Fill(mostarSer);
    //    }
    //    catch (Exception Ex)
    //    {
    //        throw Ex;
    //    }
    //    finally
    //    {
    //        if (conection != null)
    //        {
    //            conection.Close();
    //        }
    //    }
    //    return mostarSer;
    //}
}