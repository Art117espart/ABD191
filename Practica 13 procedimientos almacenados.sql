

--1. Crea un procedimiento almacenado con el cual podremos Insertar usuarios atreves de los par�metros.
CREATE PROCEDURE sp_Insertar_Usuarios--Creamos el nombre del procedimiento

--Definimos los datos que se van a ocupar
	@Nombre nvarchar(100),
	@Email nvarchar(100),
	@Pass nvarchar(100),
	@FechaRegistro DATE
AS
BEGIN
	INSERT INTO Usuarios(Nombre,Email,Pass,FechaRegistro)
	VALUES (@Nombre,@Email,@Pass,@FechaRegistro)--Un insert ya realizada
END;
-- Insertar usuario 1
EXEC sp_Insertar_Usuarios @Nombre = 'JUNA ARMNADO VELAZQUEZ ALVAREZ', @Email =  '122044673@upq.edu.mx',@Pass = 'HOLA333',@FechaRegistro = '2004-06-26'
-- Insertar usuario 2
EXEC sp_Insertar_Usuarios @Nombre = 'Mar�ano L�pez',@Email = 'mariano.lopez@example.com',@Pass = 'clave123',@FechaRegistro = '2024-01-15';
-- Insertar usuario 3
EXEC sp_Insertar_Usuarios @Nombre = 'Carlos Mesa Mart�nez',@Email = 'carlos.mesa.martinez@example.com',@Pass = 'segura456',@FechaRegistro = '2022-02-28';
-- Insertar usuario 4
EXEC sp_Insertar_Usuarios @Nombre = 'Analaura S�nchez',@Email = 'lua.sanchez@example.com',@Pass = 'contrasena789',@FechaRegistro = '2021-04-10';
-- Insertar usuario 5
EXEC sp_Insertar_Usuarios @Nombre = 'David Garc�a Luna',@Email = 'david.garciaLuna@example.com',@Pass = 'pass1234',@FechaRegistro = '2025-05-22';
--Un select para ver la tabla de usuarios cuando insertemos a los nuevos usuarios
SELECT * FROM Usuarios;


--2. Crea un procedimiento almacenado para Editar una Suscripci�n

CREATE PROCEDURE sp_Editar_Suscripcion
    @UsuarioID INT,
	@Tipo nvarchar(50)
    AS
BEGIN
    UPDATE Suscripciones SET Tipo = @Tipo
    WHERE UsuarioID = @UsuarioID;
END;
EXEC sp_Editar_Suscripcion @UsuarioID = 3, @Tipo = 'Premium'
EXEC sp_Editar_Suscripcion @UsuarioID = 4, @Tipo = 'Premium'
EXEC sp_Editar_Suscripcion @UsuarioID = 2, @Tipo = ' '
EXEC sp_Editar_Suscripcion @UsuarioID = 1, @Tipo = 'B�sica'
EXEC sp_Editar_Suscripcion @UsuarioID = 5, @Tipo = 'B�sica'
SELECT * FROM Suscripciones;


--3. Crea un procedimiento para Eliminar un registro en la tabla de Historial Visualizaci�n.

CREATE PROCEDURE sp_Eliminar_RegistroHistorial
    @HistorialID INT
AS
BEGIN
    DELETE FROM HistorialVisual   WHERE HistorialVisualID = @HistorialID;
END;
EXEC sp_Eliminar_RegistroHistorial @HistorialID  = 11
EXEC sp_Eliminar_RegistroHistorial @HistorialID  = 12
EXEC sp_Eliminar_RegistroHistorial @HistorialID  = 13
EXEC sp_Eliminar_RegistroHistorial @HistorialID  = 14
EXEC sp_Eliminar_RegistroHistorial @HistorialID  = 15
SELECT * FROM HistorialVisual;

--4. Crea un procedimiento para consultar los usuarios con su suscripci�n, que use como par�metro el tipo de suscripci�n.
CREATE PROCEDURE sp_Consultar_Usuarios_Con_Suscripcion
    @TipoSuscripcion NVARCHAR(50)
AS
BEGIN
    SELECT u.UsuarioID, u.Nombre, u.Email, s.SuscripcionesID, s.FechaInicio, s.FechaFin, s.Tipo AS TipoSuscripcion
    FROM Usuarios u
    INNER JOIN Suscripciones s ON u.UsuarioID = s.UsuarioID
    WHERE s.Tipo = @TipoSuscripcion;
END;
EXEC sp_Consultar_Usuarios_Con_Suscripcion @TipoSuscripcion = 'Premium';
EXEC sp_Consultar_Usuarios_Con_Suscripcion @TipoSuscripcion = 'B�sica';
EXEC sp_Consultar_Usuarios_Con_Suscripcion @TipoSuscripcion = ' ';

SELECT * FROM Suscripciones ;


--5. Crea un procedimiento para consultar que pel�culas fueron reproducidas por el usuario pasando como par�metro el g�nero de la pel�cula.

CREATE PROCEDURE sp_Consultar_Peliculas_Reproducidas_Por_Genero
    @UsuarioID INT,
    @Genero NVARCHAR(50)
AS
BEGIN
    SELECT p.Titulo, p.Genero, p.FechaEstreno
    FROM Peliculas p
    INNER JOIN HistorialVisual hr ON p.PeliculaID = hr.PeliculaID
    INNER JOIN Usuarios u ON hr.UsuarioID = u.UsuarioID
    WHERE u.UsuarioID = @UsuarioID
      AND p.Genero = @Genero;
END;
EXEC sp_Consultar_Peliculas_Reproducidas_Por_Genero @UsuarioID = 5, @Genero = 'Familiar'
EXEC sp_Consultar_Peliculas_Reproducidas_Por_Genero @UsuarioID = 7, @Genero = 'Acci�n'

SELECT * FROM Peliculas

