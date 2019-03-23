using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de EServicio
/// </summary>
public class EServicio
{

    private int id;
    private string nombre;
    private string descripcion;
    private int precio;
    private string duracion;
    private int estado;
    private string session;

    public string Nombre { get => nombre; set => nombre = value; }
    public string Descripcion { get => descripcion; set => descripcion = value; }
    public string Session { get => session; set => session = value; }
    public int Estado { get => estado; set => estado = value; }
    public int Precio { get => precio; set => precio = value; }
    public string Duracion { get => duracion; set => duracion = value; }
    public int Id { get => id; set => id = value; }
}