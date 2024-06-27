--tabla de Usuarios
CREATE TABLE Usuarios(
UsuarioID INT IDENTITY(1,1) PRIMARY KEY,
Nombre NVARCHAR(100) NOT NULL,
Email NVARCHAR(100) NOT NULL UNIQUE,
Pass NVARCHAR(100) NOT NULL,
FechaRegistro DATE NOT NULL DEFAULT GETDATE ()
);

--tabla de Peliculas
CREATE TABLE Peliculas(
PeliculaID INT IDENTITY(1,1) PRIMARY KEY,
Titulo NVARCHAR(100) NOT NULL,
Genero NVARCHAR(50),
FechaEstreno DATE
);

--tabla de Suscripciones
CREATE TABLE Suscripciones(
SuscripcionesID INT IDENTITY(1,1) PRIMARY KEY,
UsuarioID INT NOT NULL,
FechaInicio DATE NOT NULL,
FechaFin DATE,
Tipo NVARCHAR(50) ,
FOREIGN KEY (UsuarioID) REFERENCES Usuarios(UsuarioID)
);

--tabla de HistorialVisual
CREATE TABLE HistorialVisual(
HistorialVisualID INT IDENTITY(1,1) PRIMARY KEY,
UsuarioID INT NOT NULL,
PeliculaID INT NOT NULL,
FechaVisualizacion DATE NOT NULL DEFAULT GETDATE ()
FOREIGN KEY (UsuarioID) REFERENCES Usuarios(UsuarioID),
FOREIGN KEY (PeliculaID) REFERENCES Peliculas(PeliculaID)
);

-- Inserts de Usuarios 
INSERT INTO Usuarios (Nombre, Email, Pass, FechaRegistro) VALUES 
('Juan P�rez', 'juan.perez@example.com', 'JuanP�rez123', '2023-06-15'),
('Mar�a L�pez', 'maria.lopez@example.com', 'Mar�aL�pez123', '2023-06-16'),
('Carlos G�mez', 'carlos.gomez@example.com', 'CarlosG�mez123', '2023-06-17'),
('Ana Mart�nez', 'ana.martinez@example.com', 'AnaMart�nez123', '2023-06-18'),
('Luis Fern�ndez', 'luis.fernandez@example.com', 'LuisFern�ndez123', '2023-06-19'),
('Elena S�nchez', 'elena.sanchez@example.com', 'ElenaS�nchez123', '2023-06-20'),
('Miguel Torres', 'miguel.torres@example.com', 'MiguelTorres123', '2023-06-21'),
('Laura D�az', 'laura.diaz@example.com', 'LauraD�az123', '2023-06-22'),
('Sof�a Ram�rez', 'sofia.ramirez@example.com', 'Sof�aRam�rez123', '2023-06-23'),
('Jorge Navarro', 'jorge.navarro@example.com', 'JorgeNavarro123', '2023-06-24');

-- Inserts de Peliculas
INSERT INTO Peliculas (Titulo, Genero, Pass, FechaEstreno) VALUES 
('El Padrino', 'Crimen', 'password1', '1972-03-24'),
('Titanic', 'Romance', 'password2', '1997-12-19'),
('Avatar', 'Ciencia ficci�n', 'password3', '2009-12-18'),
('El Caballero Oscuro', 'Acci�n', 'password4', '2008-07-18'),
('Forrest Gump', 'Drama', 'password5', '1994-07-06'),
('Matrix', 'Ciencia ficci�n', 'password6', '1999-03-31'),
('Gladiador', 'Acci�n', 'password7', '2000-05-05'),
('Inception', 'Ciencia ficci�n', 'password8', '2010-07-16'),
('Toy Story', 'Animaci�n', 'password9', '1995-11-22'),
('Jurassic Park', 'Aventura', 'password10', '1993-06-11'),
('El Se�or de los Anillos', 'Fantas�a', 'password11', '2001-12-19');

--Inserts de Suscripciones
INSERT INTO Suscripciones (UsuarioID, FechaInicio, FechaFin, Tipo) VALUES 
(1, '2024-01-01', '2024-12-31', 'Premium'),
(2, '2024-02-01', '2024-11-30', 'B�sica'),
(3, '2024-03-01', NULL, NULL),
(4, '2024-04-01', '2024-10-01', 'Premium'),
(5, '2024-05-01', NULL, NULL),
(6, '2024-06-01', '2024-09-01', 'B�sica'),
(7, '2024-07-01', '2024-12-31', 'Premium');

--Inserts de HistorialVisual
INSERT INTO HistorialVisual (UsuarioID, PeliculaID, FechaVisualizacion) VALUES 
(1, 1, '2024-06-01 12:00'),
(1, 2, '2024-06-02 12:00'),
(2, 3, '2024-06-03 12:00'),
(2, 4, '2024-06-04 20:00'),
(3, 5, '2024-06-05 19:00'),
(3, 6, '2024-06-06 15:00'),
(4, 7, '2024-06-07 16:00'),
(4, 8, '2024-06-08 18:00'),
(5, 9, '2024-06-09 17:00'),
(5, 10, '2024-06-10 14:00'),
(6, 11, '2024-06-11 23:00'),
(6, 1, '2024-06-12 12:00'),
(7, 2, '2024-06-13 22:00'),
(7, 3, '2024-06-14 21:00'),
(8, 4, '2024-06-15 20:00'),
(8, 5, '2024-06-16 20:00'),
(9, 6, '2024-06-17 14:00'),
(9, 7, '2024-06-18 1:00'),
(10, 8, '2024-06-19 2:00'),
(10, 9, '2024-06-20 3:00');


SELECT  u.Nombre, 
		u.Email, 
		u.FechaRegistro, 
		p.PeliculaID, 
		p.Titulo, 
		p.Genero, 
		p.FechaEstreno, 
		hv.FechaVisualizacion, 
		s.Tipo, 
		s.FechaInicio, 
		s.FechaFin
FROM 
	HistorialVisual AS hv
FULL JOIN 
    Usuarios AS u ON hv.UsuarioID = u.UsuarioID
FULL JOIN 
    Peliculas AS p ON hv.PeliculaID = p.PeliculaID
FULL JOIN 
    Suscripciones AS s ON u.UsuarioID = s.UsuarioID;
