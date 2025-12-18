-- Ejercicio 1: Crear Base de Datos 

CREATE DATABASE veterinaria_patitas_felices;
USE veterinaria_patitas_felices;

-- Ejercicio 2: Tabla Dueños 

CREATE TABLE duenos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    direccion VARCHAR(100)
);

-- Ejercicio 3: Tabla Mascotas

CREATE TABLE mascotas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    raza VARCHAR(30) NOT NULL,
    fecha_nacimiento DATE,
    id_dueno INT,
    FOREIGN KEY (id_dueno) REFERENCES duenos(id)
);

-- Ejercicio 4: Tabla Veterinarios 

CREATE TABLE veterinarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    matricula VARCHAR(20) NOT NULL UNIQUE,
    especialidad VARCHAR(50) NOT NULL
);

-- Ejercicio 5: Tabla Historial Clínico 

CREATE TABLE historial_clinico (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_mascota INT,
    id_veterinario INT,
    fecha_registro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    descripcion VARCHAR(250) NOT NULL,
    FOREIGN KEY (id_mascota) REFERENCES mascotas(id) ON DELETE CASCADE,
    FOREIGN KEY (id_veterinario) REFERENCES veterinarios(id)


);

-- Ejercicio 6: Insertar registros

-- 1
INSERT INTO duenos (nombre, apellido, telefono, direccion) VALUES 
('Juan', 'Perez', '123456789', 'Av. Siempreviva 123'),
('Ana', 'Gomez', '987654321', 'Calle Falsa 123'),
('Carlos', 'Lopez', '555666777', 'Buenos Aires 123');

-- 2. 
INSERT INTO mascotas (nombre, especie, fecha_nacimiento, id_dueno) VALUES 
('Firulais', 'Perro', '2020-05-10', 1),
('Michi', 'Gato', '2019-08-15', 2),
('Pepito', 'Loro', '2021-01-20', 3);

-- 3. 
INSERT INTO veterinarios (nombre, apellido, matricula, especialidad) VALUES 
('Laura', 'Martinez', 'MAT-1001', 'Cirugía'),
('Pedro', 'Sanchez', 'MAT-1002', 'Dermatología');

-- 4. 
INSERT INTO historial_clinico (id_mascota, id_veterinario, descripcion) VALUES 
(1, 1, 'Vacunación anual completa'),
(2, 2, 'Revisión por alergia en la piel'),
(1, 1, 'Limpieza dental');


-- Ejercicio 7: Actualizar registros 


UPDATE duenos SET direccion = 'Nueva Dirección 999' WHERE id = 1;
UPDATE veterinarios SET especialidad = 'Neurología' WHERE id = 1;
UPDATE historial_clinico SET descripcion = 'Revisión por alergia y recetado de crema' WHERE id = 2;

-- Ejercicio 8: Eliminar registros 

DELETE FROM mascotas WHERE id = 1;

-- Ejercicio 9: JOIN simple 

SELECT 
    m.nombre AS Nombre_Mascota,
    m.especie AS Especie,
    CONCAT(d.nombre, ' ', d.apellido) AS Dueno
FROM mascotas m
JOIN duenos d ON m.id_dueno = d.id;

