-- Creación de tablas
CREATE TABLE Clientes (
id_cliente BIGINT IDENTITY(1,1) PRIMARY KEY,
nombre VARCHAR (100),
correo_electronico VARCHAR (255),
pass VARCHAR(255)
);
SELECT * FROM Clientes;
CREATE TABLE Compras (
id_compra BIGINT IDENTITY(1,1) PRIMARY KEY,
fecha_compra DATE,
id_cliente BIGINT,
FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);
SELECT * FROM Compras;
CREATE TABLE Comics(
id_comic BIGINT IDENTITY(1,1) PRIMARY KEY,
nombre VARCHAR (255),
anio INT,
precio FLOAT 
);
SELECT * FROM Comics;
ALTER TABLE Comics DROP COLUMN precio;
ALTER TABLE Comics ADD anio INT;


CREATE TABLE comic_compras(
id_CC BIGINT IDENTITY(1,1) PRIMARY KEY,
cantidad TINYINT,
id_compra BIGINT,
id_comic BIGINT,
FOREIGN KEY (id_compra) REFERENCES Compras(id_compra),
FOREIGN KEY (id_comic) REFERENCES Comics(id_comic)
);
SELECT * FROM comic_compras;
CREATE TABLE Inventario(
id_inventario BIGINT IDENTITY(1,1) PRIMARY KEY,
id_comic BIGINT,
cantidad_disponible INT,
disponibilidad BINARY,
FOREIGN KEY (id_comic) REFERENCES Comics(id_comic)
);
SELECT * FROM Inventario;

INSERT INTO Clientes (nombre, correo_electronico, pass) VALUES
('Juan Perez', 'juan.perez@example.com', 'password1'),
('Ana Garcia', 'ana.garcia@example.com', 'password2'),
('Luis Martinez', 'luis.martinez@example.com', 'password3'),
('Maria Lopez', 'maria.lopez@example.com', 'password4'),
('Carlos Sanchez', 'carlos.sanchez@example.com', 'password5'),
('Sofia Rodriguez', 'sofia.rodriguez@example.com', 'password6'),
('Pedro Gomez', 'pedro.gomez@example.com', 'password7'),
('Laura Fernandez', 'laura.fernandez@example.com', 'password8'),
('Miguel Torres', 'miguel.torres@example.com', 'password9'),
('Paula Diaz', 'paula.diaz@example.com', 'password10'),
('Diego Ruiz', 'diego.ruiz@example.com', 'password11'),
('Valeria Castro', 'valeria.castro@example.com', 'password12');

INSERT INTO Comics (nombre, anio, precio) VALUES
('Comic 1', 1980, 9),
('Comic 2', 2021, 12),
('Comic 3', 2019, 8),
('Comic 4', 2022, 15),
('Comic 5', 2018, 7),
('Comic 6', 2021, 14),
('Comic 7', 2020, 1099),
('Comic 8', 2019, 6),
('Comic 9', 2022, 199),
('Comic 10', 2021, 49),
('Comic 11', 2020, 89),
('Comic 12', 2018, 79),
('Comic 13', 2021, 19),
('Comic 14', 2019, 599),
('Comic 15', 2020, 129);

INSERT INTO Inventario (id_comic, cantidad_disponible, disponibilidad) VALUES
(4, 5, 1),
(5, 10, 1),
(6, 0, 0),
(7, 8, 1),
(8, 2, 1),
(9, 7, 1),
(10, 0, 0),
(11, 12, 1),
(12, 6, 1),
(13, 3, 1),
(14, 9, 1),
(15, 1, 1),
(16, 4, 1),
(17, 11, 1),
(18, 5, 1);

INSERT INTO Compras (fecha_compra, id_cliente) VALUES
('2024-05-20', 1),
('2024-05-21', 2),
('2024-05-22', 3),
('2024-05-23', 4),
('2024-05-24', 5),
('2024-05-25', 6),
('2024-05-26', 7);

INSERT INTO Compras (fecha_compra, id_cliente) VALUES
('2024-05-27', 1),
('2024-05-28', 1),
('2024-05-29', 2);


INSERT INTO comic_compras (cantidad, id_compra, id_comic) VALUES
(2, 1, 10),
(1, 2, 12),
(3, 3, 13),
(1, 4, 14),
(2, 5, 5),
(1, 6, 6),
(2, 7, 7);


INSERT INTO comic_compras (cantidad, id_compra, id_comic) VALUES
(1, 8, 8),
(3, 9, 9),
(1, 10, 10);
