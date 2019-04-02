using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de ECliente
/// </summary>
public class ECliente
{
    public ECliente()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }


    private int id;
    private string apellido;
    private string nombre;
    private string session;
    private string correo;
    private Int64 telefono;
    private string contraseña;

    public int Id { get => id; set => id = value; }
    public string Apellido { get => apellido; set => apellido = value; }
    public string Nombre { get => nombre; set => nombre = value; }
    public string Session { get => session; set => session = value; }
    public string Correo { get => correo; set => correo = value; }
    public long Telefono { get => telefono; set => telefono = value; }
    public string Contraseña { get => contraseña; set => contraseña = value; }
}