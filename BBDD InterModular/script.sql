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
('Ford Fiesta', 2020, 19101.46),
('Chevrolet Cruze', 2016, 34115.82),
('Volkswagen Golf', 2007, 18429.85),
('BMW Serie 3', 2006, 33115.44),
('Audi A4', 2021, 35037.01),
('Mercedes-Benz C-Class', 2017, 29068.37),
('Hyundai Elantra', 2015, 27331.77),
('Kia Forte', 2007, 36419.47),
('Nissan Sentra', 2014, 33188.81),
('Mazda 3', 2017, 27499.99),
('Peugeot 308', 2014, 24135.74),
('Renault Megane', 2016, 21241.84),
('SEAT León', 2018, 36366.59),
('Skoda Octavia', 2016, 27165.43),
('Fiat Tipo', 2013, 22328.74),
('Kawasaki Ninja', 2013, 13689.08),
('Suzuki GSX-R750', 2022, 17326.67),
('Ducati Monster', 2017, 19730.05),
('Harley-Davidson Iron 883', 2017, 14595.96),
('KTM Duke 390', 2023, 12299.31),
('BMW R1200GS', 2012, 14449.77),
('Triumph Street Triple', 2013, 15820.14),
('Aprilia RSV4', 2009, 15244.85),
('Benelli TNT 600', 2020, 13912.48),
('MV Agusta Brutale', 2005, 10144.06),
('Royal Enfield Classic 350', 2013, 9709.51),
('Honda CBR500R', 2007, 10784.07),
('Yamaha MT-07', 2005, 19397.19),
('Husqvarna Svartpilen', 2009, 9890.64),
('CFMoto 650NK', 2006, 19597.45);

INSERT INTO coches (id, num_puertas, tipo_carroceria) VALUES
(1, 4, 'sedan'),
(2, 4, 'sedan');
(4, 2, 'SUV'),
(5, 4, 'sedan'),
(6, 3, 'convertible'),
(7, 4, 'convertible'),
(8, 3, 'hatchback'),
(9, 4, 'sedan'),
(10, 4, 'SUV'),
(11, 2, 'convertible'),
(12, 2, 'hatchback'),
(13, 4, 'convertible'),
(14, 5, 'hatchback'),
(15, 4, 'SUV'),
(16, 3, 'sedan'),
(17, 2, 'convertible'),
(18, 3, 'SUV');

INSERT INTO motos (id, tipo_motor, cilindrada) VALUES
(3, '4 tiempos', 998);
(19, '2 tiempos', 1000),
(20, '4 tiempos', 750),
(21, '4 tiempos', 1000),
(22, '2 tiempos', 500),
(23, '4 tiempos', 125),
(24, '2 tiempos', 750),
(25, '2 tiempos', 500),
(26, '4 tiempos', 125),
(27, '2 tiempos', 750),
(28, '4 tiempos', 250),
(29, '2 tiempos', 500),
(30, '2 tiempos', 500),
(31, '4 tiempos', 1000),
(32, '2 tiempos', 500),
(33, '4 tiempos', 750);

INSERT INTO datos_curiosos (id_vehiculo, curiosidad) VALUES
(1, 'El Toyota Corolla es el coche más vendido del mundo.'),
(2, 'El Honda Civic es famoso por su fiabilidad y personalización.'),
(3, 'La Yamaha R1 es una moto deportiva de alta gama.');


ALTER TABLE vehiculos ADD COLUMN fecha_creacion DATETIME DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE datos_curiosos ADD COLUMN fecha_creacion DATETIME DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE vehiculos ADD COLUMN num_curiosidades INT DEFAULT 0;

DELIMITER $$

CREATE TRIGGER trg_actualizar_curiosidades_insert
AFTER INSERT ON datos_curiosos
FOR EACH ROW
BEGIN
  UPDATE vehiculos
  SET num_curiosidades = num_curiosidades + 1
  WHERE id = NEW.id_vehiculo;
END$$

DELIMITER ;

