using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using Npgsql;
using NpgsqlTypes;
using Newtonsoft;
using Newtonsoft.Json;

/// <summary>
/// Descripción breve de DAORango
/// </summary>
public class DAORango
{
    public DAORango()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }

    public void insertarAgenda(Agenda agenda, int id_estilista)
    {
        DataTable Usuario = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MiConexion"].ConnectionString);

        for (int i = 0; i <= 7; i++)
        {
            List<Horario> list = null;
            string dia = null;
            bool guardar = false;

            switch (i)
            {
                case 1:
                    if (agenda.Lunes == true)
                    {
                        dia = "lunes";
                        list = agenda.ListaRango;
                        guardar = true;
                    }
                    break;
                case 2:
                    if (agenda.Martes == true)
                    {
                        dia = "martes";
                        list = agenda.ListaRango;
                        guardar = true;
                    }
                    break;
                case 3:
                    if (agenda.Miercoles == true)
                    {
                        dia = "miercoles";
                        list = agenda.ListaRango;
                        guardar = true;
                    }
                    break;
                case 4:
                    if (agenda.Jueves == true)
                    {
                        dia = "jueves";
                        list = agenda.ListaRango;
                        guardar = true;
                    }
                    break;
                case 5:
                    if (agenda.Viernes == true)
                    {
                        dia = "viernes";
                        list = agenda.ListaRango;
                        guardar = true;
                    }
                    break;
                case 6:
                    if (agenda.Sabado == true)
                    {
                        dia = "sabado";
                        list = agenda.ListaRango;
                        guardar = true;
                    }
                    break;
                case 7:
                    if (agenda.Domingo == true)
                    {
                        dia = "domingo";
                        list = agenda.ListaRango;
                        guardar = true;
                    }
                    break;
            }

            if (guardar)
            {
                try
                {
                    NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("reserva.f_insertar_rango", conection);
                    dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                    dataAdapter.SelectCommand.Parameters.Add("_dia", NpgsqlDbType.Text).Value = dia;
                    dataAdapter.SelectCommand.Parameters.Add("_rango", NpgsqlDbType.Json).Value = JsonConvert.SerializeObject(list);
                    dataAdapter.SelectCommand.Parameters.Add("_estilista_id", NpgsqlDbType.Integer).Value = id_estilista;

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
            }
        }
    }

    public void generarSerie(DateTime horaIni, DateTime horafin, int id)
    {
        DataTable Usuario = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MiConexion"].ConnectionString);


        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("public.f_generar_agenda2", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("_id", NpgsqlDbType.Integer).Value = id;
            dataAdapter.SelectCommand.Parameters.Add("_fecha_start", NpgsqlDbType.Timestamp).Value = horaIni;
            dataAdapter.SelectCommand.Parameters.Add("_fecha_fin", NpgsqlDbType.Timestamp).Value = horafin;

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



    }

   

    public DataTable traerDias(int id)
    {
        DataTable dias = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MiConexion"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("reserva.f_mostar_rangohorario3", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("_estilista_id", NpgsqlDbType.Integer).Value = id;

            conection.Open();
            dataAdapter.Fill(dias);
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

        return dias;
    }

}