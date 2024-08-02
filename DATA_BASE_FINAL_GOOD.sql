USE ComicsStore;
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
total int,
FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);
SELECT * FROM Compras;

CREATE TABLE Comics(
id_comic BIGINT IDENTITY(1,1) PRIMARY KEY,
nombre VARCHAR (255),
año INT,
precio FLOAT,
id_autor BIGINT,
FOREIGN KEY (id_autor) REFERENCES Autores(id_autor)
);
SELECT * FROM Comics;

CREATE TABLE Autores (
id_autor bigint identity(300,1) PRIMARY KEY,
nombre VARCHAR(100),
pais_origen VARCHAR(100)
);

CREATE TABLE comic_compras(
id_CC BIGINT IDENTITY(1,1) PRIMARY KEY,
cantidad TINYINT,
id_compra BIGINT,
id_comic BIGINT,
fecha date,
FOREIGN KEY (id_compra) REFERENCES Compras(id_compra),
FOREIGN KEY (id_comic) REFERENCES Comics(id_comic)
);
SELECT * FROM comic_compras;


CREATE TABLE Inventario(
id_inventario BIGINT IDENTITY(1,1) PRIMARY KEY,
id_comic BIGINT,
cantidad_disponible INT,
disponibilidad int,
FOREIGN KEY (id_comic) REFERENCES Comics(id_comic)
);
SELECT * FROM Inventario;



USE ComicsStore;

INSERT INTO Clientes (nombre, correo_electronico, pass) VALUES
('John Doe', 'john.doe@example.com', 'password123'),
('Jane Smith', 'jane.smith@example.com', 'password123'),
('Robert Brown', 'robert.brown@example.com', 'password123'),
('Emily Davis', 'emily.davis@example.com', 'password123'),
('Michael Wilson', 'michael.wilson@example.com', 'password123'),
('Sarah Johnson', 'sarah.johnson@example.com', 'password123'),
('David Lee', 'david.lee@example.com', 'password123'),
('Emma White', 'emma.white@example.com', 'password123'),
('Daniel Harris', 'daniel.harris@example.com', 'password123'),
('Sophia Martinez', 'sophia.martinez@example.com', 'password123'),
('James Clark', 'james.clark@example.com', 'password123'),
('Isabella Lewis', 'isabella.lewis@example.com', 'password123'),
('Christopher Robinson', 'christopher.robinson@example.com', 'password123'),
('Mia Walker', 'mia.walker@example.com', 'password123'),
('Anthony Hall', 'anthony.hall@example.com', 'password123'),
('Olivia Young', 'olivia.young@example.com', 'password123'),
('Matthew King', 'matthew.king@example.com', 'password123'),
('Ava Wright', 'ava.wright@example.com', 'password123'),
('Joshua Scott', 'joshua.scott@example.com', 'password123'),
('Charlotte Green', 'charlotte.green@example.com', 'password123');


INSERT INTO Compras (fecha_compra, id_cliente, total) VALUES
('2023-01-15', 1, 250),
('2023-01-16', 2, 180),
('2023-01-17', 3, 300),
('2023-01-18', 4, 150),
('2023-01-19', 5, 220),
('2023-01-20', 6, 275),
('2023-01-21', 7, 190),
('2023-01-22', 8, 330),
('2023-01-23', 9, 210),
('2023-01-24', 10, 145),
('2023-01-25', 11, 400),
('2023-01-26', 12, 170),
('2023-01-27', 13, 260),
('2023-01-28', 14, 310),
('2023-01-29', 15, 230),
('2023-01-30', 16, 290),
('2023-01-31', 17, 200),
('2023-02-01', 18, 150),
('2023-02-02', 19, 310),
('2023-02-03', 20, 175);

INSERT INTO Autores (nombre, pais_origen) VALUES
('Stan Lee', 'USA'),
('Frank Miller', 'USA'),
('Alan Moore', 'UK'),
('Neil Gaiman', 'UK'),
('Grant Morrison', 'UK'),
('Brian K. Vaughan', 'USA'),
('Gail Simone', 'USA'),
('Mark Millar', 'UK'),
('Warren Ellis', 'UK'),
('Rick Remender', 'USA'),
('Ed Brubaker', 'USA'),
('Geoff Johns', 'USA'),
('J. Michael Straczynski', 'USA'),
('Brian Michael Bendis', 'USA'),
('Matt Fraction', 'USA'),
('Greg Rucka', 'USA'),
('Scott Snyder', 'USA'),
('Robert Kirkman', 'USA'),
('Jason Aaron', 'USA'),
('Dan Slott', 'USA');
SELECT * FROM Autores

INSERT INTO Comics (nombre, año, precio, id_autor) VALUES
('The Amazing Spider-Man', 1963, 3.99, 300),
('Batman: Year One', 1987, 4.99, 301),
('Watchmen', 1986, 5.99, 302),
('Sandman', 1989, 4.99, 303),
('All-Star Superman', 2005, 3.99, 304),
('Y: The Last Man', 2002, 3.99, 305),
('Wonder Woman', 2007, 2.99, 306),
('Kick-Ass', 2008, 3.99, 307),
('Transmetropolitan', 1997, 3.99, 308),
('Black Science', 2013, 3.99, 309),
('Criminal', 2006, 3.99, 310),
('Green Lantern: Rebirth', 2004, 3.99, 311),
('Rising Stars', 1999, 3.99, 312),
('Ultimate Spider-Man', 2000, 2.99, 314),
('Hawkeye', 2012, 2.99, 315),
('Lazarus', 2013, 3.99, 316),
('American Vampire', 2010, 3.99, 317),
('The Walking Dead', 2003, 2.99, 318),
('Thor: God of Thunder', 2012, 3.99, 319),
('The Superior Spider-Man', 2013, 3.99, 318);
SELECT *FROM Comics
INSERT INTO comic_compras (cantidad, id_compra, id_comic, fecha) VALUES
(2, 1, 21, '2023-01-15'),
(1, 2, 2, '2023-01-16'),
(3, 3, 3, '2023-01-17'),
(1, 4, 4, '2023-01-18'),
(2, 5, 5, '2023-01-19'),
(3, 6, 6, '2023-01-20'),
(1, 7, 7, '2023-01-21'),
(2, 8, 8, '2023-01-22'),
(1, 9, 9, '2023-01-23'),
(3, 10, 10, '2023-01-24'),
(1, 11, 11, '2023-01-25'),
(2, 12, 12, '2023-01-26'),
(3, 13, 13, '2023-01-27'),
(1, 14, 14, '2023-01-28'),
(2, 15, 15, '2023-01-29'),
(3, 16, 16, '2023-01-30'),
(1, 17, 17, '2023-01-31'),
(2, 18, 18, '2023-02-01'),
(3, 19, 19, '2023-02-02'),
(1, 20, 20, '2023-02-03');


INSERT INTO Inventario (id_comic, cantidad_disponible, disponibilidad) VALUES
(21, 50, 12),
(2, 40, 1),
(3, 30, 4),
(4, 20, 0),
(5, 60, 3),
(6, 70, 1),
(7, 80, 0),
(8, 90, 1),
(9, 100, 1),
(10, 110, 0),
(11, 50, 1),
(12, 40, 1),
(13, 30, 15),
(14, 20, 1),
(15, 60, 13),
(16, 70, 1),
(17, 80, 12),
(18, 90, 1),
(19, 100, 12),
(20, 110, 1);
