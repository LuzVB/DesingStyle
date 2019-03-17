using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de ERegistroUsuario
/// </summary>
public class ERegistroUsuario
{
    private string nombre;
    private string apellido;
    private string correo;
    private int cedula;
    private DateTime fecha_nacimiento;
    private string contraseña;
    private string session;
    private int estado;
    private int rol;

    public string Nombre { get => nombre; set => nombre = value; }
    public string Apellido { get => apellido; set => apellido = value; }
    public string Correo { get => correo; set => correo = value; }
    public int Cedula { get => cedula; set => cedula = value; }
    public DateTime Fecha_nacimiento { get => fecha_nacimiento; set => fecha_nacimiento = value; }
    public string Contraseña { get => contraseña; set => contraseña = value; }
    public string Session { get => session; set => session = value; }
    public int Estado { get => estado; set => estado = value; }
    public int Rol { get => rol; set => rol = value; }
}