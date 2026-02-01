
// 1. Declaración de variables con su tipo de dato correspondiente
string Nombre;
string Apellido;
int Edad;
double Altura;

Console.WriteLine("--- Recopilación de Datos ---");

// Entrada de datos

Console.Write("Coloque su nombre: ");
Nombre = Console.ReadLine();

Console.Write("Coloque su apellido: ");
Apellido = Console.ReadLine();

Console.Write("Coloque su edad: ");

// Convertimos la entrada de string a int
Edad = int.Parse(Console.ReadLine());

Console.Write("Coloque su altura: ");

// Convertimos la entrada de string a decimal double
Altura = double.Parse(Console.ReadLine());

// Salida de datos
Console.WriteLine(" ~ Datos Recolectados ~ ");

Console.WriteLine($"Nombre Completo: {Nombre} {Apellido}");
Console.WriteLine($"Edad:            {Edad} años");
Console.WriteLine($"Altura:          {Altura} m"); // ejemplo: 1.64 o 1.,64

Console.WriteLine("~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~");