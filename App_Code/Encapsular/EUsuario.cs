using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de EUsuario
/// </summary>
public class EUsuario
{
    private string correo;
    private string contraseña;
    private String biografia;
    private String imagen;
    private string muestra;
    private Int32 userId;
    private String session;
    private String ip;
    private String mac;

    public string Correo { get => correo; set => correo = value; }
    public string Contraseña { get => contraseña; set => contraseña = value; }
    public int UserId { get => userId; set => userId = value; }
    public string Session { get => session; set => session = value; }
    public string Ip { get => ip; set => ip = value; }
    public string Mac { get => mac; set => mac = value; }
    public string Biografia { get => biografia; set => biografia = value; }
    public string Imagen { get => imagen; set => imagen = value; }
    public string Muestra { get => muestra; set => muestra = value; }
}