using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de Agenda
/// </summary>
public class Agenda
{
    private bool lunes;
    private bool martes;
    private bool miercoles;
    private bool jueves;
    private bool viernes;
    private bool sabado;
    private bool domingo;

    private List<Horario> listaRango;

    public bool Lunes { get => lunes; set => lunes = value; }
    public bool Martes { get => martes; set => martes = value; }
    public bool Miercoles { get => miercoles; set => miercoles = value; }
    public bool Jueves { get => jueves; set => jueves = value; }
    public bool Viernes { get => viernes; set => viernes = value; }
    public List<Horario> ListaRango { get => listaRango; set => listaRango = value; }
    public bool Sabado { get => sabado; set => sabado = value; }
    public bool Domingo { get => domingo; set => domingo = value; }
}