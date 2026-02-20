using System;
using Spectre.Console;

public class TabladeAmortizacion
{
    // Propiedades (Datos del préstamo)
    public decimal Monto { get; set; }
    public decimal TasaAnual { get; set; }
    public int Meses { get; set; }

    // Metodo: Contiene la lógica de cálculo y visualización
    public void GenerarAmortizacion()
    {
        // Cálculos iniciales
        decimal tasaXMes = (TasaAnual / 12) / 100;
        double factor = Math.Pow((double)(1 + tasaXMes), -Meses);
        decimal Cuota = (Monto * tasaXMes) / (decimal)(1 - factor);

        // Creación de la tabla (usando tu configuración de colores morados)
        var tabla = new Table().Border(TableBorder.Rounded).
        BorderColor(Color.Purple);
        tabla.AddColumn("[purple]Mes[/]");
        tabla.AddColumn("[purple]Cuota[/]");
        tabla.AddColumn("[purple]Interés[/]");
        tabla.AddColumn("[purple]Abono a Capital[/]");
        tabla.AddColumn("[purple]Saldo[/]");

        decimal saldoActual = Monto;

        // Ciclo "for" para calcular mes a mes
        for (int i = 1; i <= Meses; i++)
        {
            decimal interesMes = saldoActual * tasaXMes;
            decimal Abono = Cuota - interesMes;
            saldoActual = saldoActual - Abono;

            if (saldoActual < 0) saldoActual = 0;

            // Agregar filas con formato de moneda
            tabla.AddRow(
                i.ToString(),
                Math.Round(Cuota, 2).ToString("C"),
                Math.Round(interesMes, 2).ToString("C"),
                Math.Round(Abono, 2).ToString("C"),
                Math.Round(saldoActual, 2).ToString("C")
            );
        }

        // Mostrar la tabla resultante
        AnsiConsole.Write(tabla);
    }
}

// --- CLASE PRINCIPAL: Ejecución del programa ---
partial class Program
{
    static void Main()
    {
        // 1. Encabezado decorativo
        AnsiConsole.Write(new FigletText("BANK").Color(Color.HotPink).Centered());

        // 2. Instanciar (crear) el objeto de la clase Prestamo
       TabladeAmortizacion miTablaMorada = new TabladeAmortizacion();

        // 3. Capturar datos y guardarlos en las propiedades del objeto
        miTablaMorada.Monto = AnsiConsole.Ask<decimal>("Ingrese Monto del préstamo:");
        miTablaMorada.TasaAnual = AnsiConsole.Ask<decimal>("Tasa anual %:");
        miTablaMorada.Meses = AnsiConsole.Ask<int>("Plazo en meses:");

        // 4. Llamar al método del objeto para que haga los cálculos y muestre la tabla
        miTablaMorada.GenerarAmortizacion();

        // Mensaje final
        AnsiConsole.MarkupLine("[bold purple]Proceso finalizado.[/]");
    }
}