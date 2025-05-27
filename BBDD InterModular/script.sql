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
(1,'Toyota Corolla', 2020, 20000.00),   
(2,'Honda Civic', 2019, 22000.00),      
(3,'Yamaha R1', 2021, 15000.00);        
(4, 'Ford Fiesta', 2020, 19101.46),
(5, 'Chevrolet Cruze', 2016, 34115.82),
(6, 'Volkswagen Golf', 2007, 18429.85),
(7, 'BMW Serie 3', 2006, 33115.44),
(8, 'Audi A4', 2021, 35037.01),
(9, 'Mercedes-Benz C-Class', 2017, 29068.37),
(10, 'Hyundai Elantra', 2015, 27331.77),
(11, 'Kia Forte', 2007, 36419.47),
(12, 'Nissan Sentra', 2014, 33188.81),
(13, 'Mazda 3', 2017, 27499.99),
(14, 'Peugeot 308', 2014, 24135.74),
(15, 'Renault Megane', 2016, 21241.84),
(16, 'SEAT León', 2018, 36366.59),
(17, 'Skoda Octavia', 2016, 27165.43),
(18, 'Fiat Tipo', 2013, 22328.74),
(19, 'Kawasaki Ninja', 2013, 13689.08),
(20, 'Suzuki GSX-R750', 2022, 17326.67),
(21, 'Ducati Monster', 2017, 19730.05),
(22, 'Harley-Davidson Iron 883', 2017, 14595.96),
(23, 'KTM Duke 390', 2023, 12299.31),
(24, 'BMW R1200GS', 2012, 14449.77),
(25, 'Triumph Street Triple', 2013, 15820.14),
(26, 'Aprilia RSV4', 2009, 15244.85),
(27, 'Benelli TNT 600', 2020, 13912.48),
(28, 'MV Agusta Brutale', 2005, 10144.06),
(29, 'Royal Enfield Classic 350', 2013, 9709.51),
(30, 'Honda CBR500R', 2007, 10784.07),
(31, 'Yamaha MT-07', 2005, 19397.19),
(32, 'Husqvarna Svartpilen', 2009, 9890.64),
(33, 'CFMoto 650NK', 2006, 19597.45);


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
(4, 'Es uno de los más vendidos en su categoría.'),
(5, 'Ganó un premio internacional por su diseño.'),
(6, 'Ha aparecido en varias películas famosas.'),
(7, 'Famoso por su potencia y estabilidad.'),
(8, 'Ha sido rediseñado completamente en este año.'),
(9, 'Ganó un premio internacional por su diseño.'),
(10, 'Muy popular entre los jóvenes conductores.'),
(11, 'Es uno de los más vendidos en su categoría.'),
(12, 'Famoso por su potencia y estabilidad.'),
(13, 'Utilizado frecuentemente en competiciones.'),
(14, 'Este modelo es conocido por su eficiencia.'),
(15, 'Considerado uno de los modelos más seguros.'),
(16, 'Muy popular entre los jóvenes conductores.'),
(17, 'Tiene una excelente relación calidad/precio.'),
(18, 'Ha sido rediseñado completamente en este año.'),
(19, 'Este modelo es conocido por su eficiencia.'),
(20, 'Ha aparecido en varias películas famosas.'),
(21, 'Muy popular entre los jóvenes conductores.'),
(22, 'Utilizado frecuentemente en competiciones.'),
(23, 'Ganó un premio internacional por su diseño.'),
(24, 'Ha sido rediseñado completamente en este año.'),
(25, 'Ganó un premio internacional por su diseño.'),
(26, 'Utilizado frecuentemente en competiciones.'),
(27, 'Ha aparecido en varias películas famosas.'),
(28, 'Considerado uno de los modelos más seguros.'),
(29, 'Este modelo es conocido por su eficiencia.'),
(30, 'Tiene una excelente relación calidad/precio.'),
(31, 'Famoso por su potencia y estabilidad.'),
(32, 'Utilizado frecuentemente en competiciones.'),
(33, 'Este modelo es conocido por su eficiencia.');

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

