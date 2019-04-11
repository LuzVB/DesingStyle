using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de EReserva
/// </summary>
public class EReserva
{
    public EReserva()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }

    private int id;
    private int id_estilista;
    private int id_cliente;
    private DateTime hora_inicio;
    private DateTime hora_final;
    private int id_reservas;

    public int Id { get => id; set => id = value; }
    public int Id_estilista { get => id_estilista; set => id_estilista = value; }
    public DateTime Hora_inicio { get => hora_inicio; set => hora_inicio = value; }
    public DateTime Hora_final { get => hora_final; set => hora_final = value; }
    public int Id_cliente { get => id_cliente; set => id_cliente = value; }
    public int Id_reservas { get => id_reservas; set => id_reservas = value; }
}