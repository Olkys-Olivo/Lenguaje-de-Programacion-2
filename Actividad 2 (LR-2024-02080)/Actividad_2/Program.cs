using Spectre.Console;
partial class Program
{
    static void Main()
    {
        // Entrada de Datos
        AnsiConsole.Write(new FigletText("BANK").Color(Color.Blue));
        decimal monto = AnsiConsole.Ask<decimal>("Monto del préstamo:");
        decimal tasaAnual = AnsiConsole.Ask<decimal>("¿Tasa anual %?:");
        int meses = AnsiConsole.Ask<int>("Plazo en meses:");

        // Calculos 1
        decimal tasaXMes = (tasaAnual / 12) / 100;
        double factor = Math.Pow((double)(1 + tasaXMes), -meses);
        decimal cuota = (monto * tasaXMes) / (decimal)(1 - factor);

        // CONFIGURACION DE LA TABLA
        var tabla = new Table().Border(TableBorder.Rounded);
        tabla.AddColumn("[purple]Mes[/]");
        tabla.AddColumn("[purple]Cuota[/]");
        tabla.AddColumn("[purple]Interés[/]");
        tabla.AddColumn("[purple]Abono a Capital[/]");
        tabla.AddColumn("[purple]Saldo[/]");

        // Ciclo para Tabla
        decimal saldoActual = monto;
        for (int i = 1; i <= meses; i++)
        {
            decimal interesMes = saldoActual * tasaXMes;
            decimal abono = cuota - interesMes;
            saldoActual = saldoActual - abono;

            // Si el saldo es muy bajo por centavos, lo ponemos a 0
            if (saldoActual < 0) saldoActual = 0;

            // Agregar fila redondeando valores
            tabla.AddRow(
                i.ToString(),
                Math.Round(cuota, 2).ToString("C"),
                Math.Round(interesMes, 2).ToString("C"),
                Math.Round(abono, 2).ToString("C"),
                Math.Round(saldoActual, 2).ToString("C")
            );
        }
        // Resultados
        AnsiConsole.Write(tabla);
        AnsiConsole.MarkupLine("[bold green]Proceso finalizado.[/]");
    }
}