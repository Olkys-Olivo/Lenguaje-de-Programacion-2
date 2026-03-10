using System;
using Microsoft.Data.Sqlite;

PRAGMA foreign_keys = ON;

class Program
{
    static void Main()
    {
        // Esto creará el archivo en la carpeta de ejecución (bin/Debug/net...)
        string connectionString = "Data Source=Gimnasio_FitLife.db";

        connection.Open();
        var command = connection.CreateCommand();
        command.CommandText = sqlScript;
        command.ExecuteNonQuery();

        Console.WriteLine("Base de Datos Generada.");

        // Consulta de prueba
        command.CommandText = "SELECT nombre_Miembro, nombre_Clase FROM Inscripciones JOIN Miembros ON Inscripciones.cedula = Miembros.cedula JOIN Clases ON Inscripciones.id_Clase = Clases.id_Clase";
        using (var reader = command.ExecuteReader())
        {
            while (reader.Read())
            {
                Console.WriteLine($"Alumno: {reader.GetString(0)} -> Clase: {reader.GetString(1)}");
            }
        }
    }
}
CREATE TABLE IF NOT EXISTS Miembros (
  cedula TEXT PRIMARY KEY,
  nombre_Miembro TEXT NOT NULL,
  apellido_Miembro TEXT NOT NULL,
  telefono TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS Clases (
  id_Clase INTEGER PRIMARY KEY,
  nombre_Clase TEXT NOT NULL,
  dia_Clase TEXT NOT NULL,
  horario_Clase TEXT NOT NULL,
  id_Instructor INTEGER NOT NULL,
  FOREIGN KEY (id_Instructor) REFERENCES Instructores (id_Instructor)
);

CREATE TABLE IF NOT EXISTS Instructores (
  id_Instructor INTEGER PRIMARY KEY,
  nombre_Instructor TEXT NOT NULL,
  apellido_Instructor TEXT NOT NULL,
  horario_Instructor TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS Inscripciones (
  id_Inscripcion INTEGER PRIMARY KEY,
  cedula TEXT NOT NULL,
  id_Clase INTEGER NOT NULL,
  FOREIGN KEY (cedula) REFERENCES Miembros (cedula),
  FOREIGN KEY (id_Clase) REFERENCES Clases (id_Clase)
);

-- Insertar Miembros
INSERT INTO
  Miembros (
    cedula,
    nombre_Miembro,
    apellido_Miembro,
    telefono
  )
VALUES
  ('123456789', 'Juan', 'Perez', '555-1234'),
  ('102938475', 'Carlos', 'Gomez', '555-8712'),
  ('987654321', 'Maria', 'Rodriguez', '555-0192'),
  ('456123789', 'Ricardo', 'Morales', '555-3344'),
  ('112233445', 'Lucia', 'Fernandez', '555-9821'),
  ('554433221', 'Andres', 'Castro', '555-4567'),
  ('889977665', 'Elena', 'Vargas', '555-1122'),
  ('135792468', 'Sebastian', 'Lopez', '555-7034'),
  ('246801357', 'Sofia', 'Martinez', '555-2290'),
  ('271828182', 'Valeria', 'Jimenez', '555-6677');

-- Insertar Clases
-- Id_Clase inicia en 1
INSERT INTO
  Clases (
    id_Clase,
    nombre_Clase,
    dia_Clase,
    horario_Clase,
    id_Instructor
  )
VALUES
  (1, 'Yoga', 'Lunes', '18:00-19:00', 11),
  (2, 'Spinning', 'Lunes', '07:00-08:00', 12),
  (3, 'Body Pump', 'Martes', '18:30-19:30', 13),
  (4, 'Zumba', 'Miércoles', '19:00-20:00', 14),
  (5, 'HIIT', 'Jueves', '08:00-08:45', 15),
  (6, 'Pilates', 'Viernes', '17:00-18:00', 16),
  (7, 'Kickboxing', 'Sábado', '10:30-11:30', 17),
  (8, 'Crossfit', 'Lunes', '19:30-20:30', 18),
  (9, 'Funcional', 'Miércoles', '07:30-08:30', 19),
  (10, 'Body Combat', 'Lunes', '18:00-19:00', 20);

-- Id_Instructor inicia en 11
-- Insertar Instructores 
-- Id_Instructor inicia en 11
INSERT INTO
  Instructores (
    id_Instructor,
    nombre_Instructor,
    apellido_Instructor,
    horario_Instructor
  )
VALUES
  (11, 'Laura', 'García', 'Lunes 18:00-19:00'),
  (12, 'Miguel', 'Sánchez', 'Lunes 07:00-08:00'),
  (13, 'Ana', 'López', 'Martes 18:30-19:30'),
  (14, 'Jorge', 'Martínez', 'Miércoles 19:00-20:00'),
  (15, 'Sofía', 'Gómez', 'Jueves 08:00-08:45'),
  (16, 'Carlos', 'Rodríguez', 'Viernes 17:00-18:00'),
  (17, 'María', 'Fernández', 'Sábado 10:30-11:30'),
  (18, 'Ricardo', 'Morales', 'Lunes 19:30-20:30'),
  (19, 'Lucía', 'Jiménez', 'Miércoles 07:30-08:30');

-- Insertar Inscripciones
-- Id_Inscripcion inicia en 100
INSERT INTO
  Inscripciones (id_Inscripcion, cedula, id_Clase)
VALUES
  (100, '123456789', 1),
  (102, '102938475', 2),
  (103, '987654321', 3),
  (104, '456123789', 4),
  (105, '112233445', 5),
  (106, '554433221', 6),
  (107, '889977665', 7),
  (108, '135792468', 8),
  (109, '246801357', 9),
  (110, '271828182', 10);

-- Consultas SQL
SELECT
  Nombre_Miembro,
  Nombre_Clase,
  Nombre_Instructor
FROM
  Miembros
  INNER JOIN Nombre_Miembro ON Miembros.Cedula
  INNER JOIN Nombre_Clase ON Clases.ID_Instructor;