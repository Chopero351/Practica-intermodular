DROP DATABASE IF EXISTS practica_intermodular;
CREATE DATABASE practica_intermodular;
USE practica_intermodular;


CREATE TABLE vehiculos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    modelo VARCHAR(100) NOT NULL,
    anio INT CHECK (anio BETWEEN 1950 AND 2050),
    precio DECIMAL(10,2) NOT NULL CHECK (precio >= 0)
);


CREATE TABLE coches (
    id INT PRIMARY KEY,
    num_puertas INT NOT NULL CHECK (num_puertas IN (2,3,4,5)),
    tipo_carroceria ENUM('sedan','hatchback','SUV','coupe','convertible') NOT NULL,
    FOREIGN KEY (id) REFERENCES vehiculos(id) ON DELETE CASCADE
);

CREATE TABLE motos (
    id INT PRIMARY KEY,
    tipo_motor VARCHAR(50) NOT NULL,
    cilindrada INT NOT NULL CHECK (cilindrada > 0),
    FOREIGN KEY (id) REFERENCES vehiculos(id) ON DELETE CASCADE
);


CREATE TABLE datos_curiosos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_vehiculo INT NOT NULL,
    curiosidad TEXT NOT NULL,
    FOREIGN KEY (id_vehiculo) REFERENCES vehiculos(id) ON DELETE CASCADE
);


INSERT INTO vehiculos (modelo, anio, precio) VALUES
('Toyota Corolla', 2020, 20000.00),   
('Honda Civic', 2019, 22000.00),      
('Yamaha R1', 2021, 15000.00);        


INSERT INTO coches (id, num_puertas, tipo_carroceria) VALUES
(1, 4, 'sedan'),
(2, 4, 'sedan');


INSERT INTO motos (id, tipo_motor, cilindrada) VALUES
(3, '4 tiempos', 998);


INSERT INTO datos_curiosos (id_vehiculo, curiosidad) VALUES
(1, 'El Toyota Corolla es el coche más vendido del mundo.'),
(2, 'El Honda Civic es famoso por su fiabilidad y personalización.'),
(3, 'La Yamaha R1 es una moto deportiva de alta gama.');