
--Ejercicio 1 crear un insert para una pelicula y que esa pelicula tenga historioal con algun usuario
CREATE PROCEDURE sp_insertar_Pelicula_Historial
    @Titulo NVARCHAR(100),
    @Genero NVARCHAR(50),
    @FechaEstreno DATE,
    @UsuarioID INT
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY

        INSERT INTO Peliculas(Titulo, Genero, FechaEstreno)
        VALUES (@Titulo, @Genero, @FechaEstreno);

        DECLARE @PeliculaID INT;
        SET @PeliculaID = SCOPE_IDENTITY();--El scope_identity () es especialmente útil cuando necesitas asegurarte de que estás 
											--trabajando con el valor correcto de la identidad generada.

        INSERT INTO HistorialVisual(UsuarioID, PeliculaID, FechaVisualizacion)
        VALUES (@UsuarioID, @PeliculaID, GETDATE());--El getdate sirve para poder poner la fecha automatica de hoy.

        COMMIT;
    END TRY
    BEGIN CATCH
        ROLLBACK;
        DECLARE @ErrorMessage NVARCHAR(4000);
        SET @ErrorMessage = ERROR_MESSAGE();
        PRINT @ErrorMessage;
    END CATCH;
END;
EXEC sp_insertar_Pelicula_Historial 'Dead Pool 3',  'Accion', '2024-07-25', 1002;--usuario existente se tiene que generar
EXEC sp_insertar_Pelicula_Historial 'Oppenheimer',  'Accion', '2023-07-21', 10;--usuario existente se tiene que generar 
EXEC sp_insertar_Pelicula_Historial 'Barby',  'Comedia', '2023-05-21', 1;--usuario existente se tiene que generar
EXEC sp_insertar_Pelicula_Historial 'Dead Pool 2',  'Accion', '2018-05-15', 6;--usuario existente se tiene que generar
EXEC sp_insertar_Pelicula_Historial 'Dead Pool 3',  'Accion', '2024-07-25', 11;--usuario no existente no tiene que agregar nada

DELETE FROM HistorialVisual WHERE HistorialVisualID = 1002;
DELETE FROM  Peliculas WHERE PeliculaID = 1008;
SELECT * FROM Peliculas;
SELECT * FROM HistorialVisual;
SELECT * FROM Usuarios;



--Ejercicio 2 crear un insert de un nuevo usuario y colocar una suscripcion a la vez y que esta ya tenga visualizacion de peliculas
CREATE PROCEDURE sp_insertar_Usuario_Suscripcion_Visualizacion
    @Nombre NVARCHAR(100), --Insertamos los valoress que se va a ocupar para el procedimiento.
    @Email NVARCHAR(100),
    @Pass NVARCHAR(100),
    @FechaInicio DATE,
    @FechaFin DATE,
    @TipoSuscripcion NVARCHAR(50),
    @PeliculaID INT
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY
-- Insertamos un nuevo usuario y obtener su UsuarioID
INSERT INTO Usuarios(Nombre, Email, Pass, FechaRegistro)
VALUES (@Nombre, @Email, @Pass, GETDATE());

DECLARE @UsuarioID INT;
SET @UsuarioID = SCOPE_IDENTITY();

-- Insertamos una nueva suscripción para el usuario recién creado
INSERT INTO Suscripciones(UsuarioID, Tipo, FechaInicio, FechaFin)
VALUES (@UsuarioID, @TipoSuscripcion, @FechaInicio, @FechaFin);

-- Registramos una visualización de película en el historial visual del usuario
INSERT INTO HistorialVisual(UsuarioID, PeliculaID, FechaVisualizacion)
VALUES (@UsuarioID, @PeliculaID, GETDATE());


        COMMIT;
    END TRY
    BEGIN CATCH
        ROLLBACK;
        DECLARE @ErrorMessage NVARCHAR(4000);
        SET @ErrorMessage = ERROR_MESSAGE();
        PRINT @ErrorMessage;
    END CATCH;
END;

EXEC sp_insertar_Usuario_Suscripcion_Visualizacion 'Samuel Pedro','sumuelito@upq.edu.mx', 'HTPPLsoyla ostia', '2024-07-03','2024-07-03','Premium', 1008;
EXEC sp_insertar_Usuario_Suscripcion_Visualizacion 'Samuel Pedro','sumuelito@upq.edu.mx', 'HTPPLsoyla ostia', '2024-07-03','2024-07-03','Premium', 1007;
EXEC sp_insertar_Usuario_Suscripcion_Visualizacion 'Jenny Fernada','jennyfeli@upq.edu.mx', 'HTPPLsoyla ostia', '2024-07-03','2024-07-03','Premium', 1007;

SELECT * FROM Suscripciones;
SELECT * FROM HistorialVisual;
SELECT * FROM Usuarios;
SELECT * FROM Peliculas;


--Ejercicio 3 procedimiento almasenado para poder alterar el email de algun usuario existente y cambiarle el tipo de suscripcion si es que no tenia.
CREATE PROCEDURE sp_actualizar_email_suscripcion
    @UsuarioID INT,
    @NuevoEmail NVARCHAR(100)
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY
	--Seleccionamos al usuario para cambiarle su email
        UPDATE Usuarios
        SET Email = @NuevoEmail
        WHERE UsuarioID = @UsuarioID;
	--Aqui le decimos que a ese mismo usuario le cambiaremos la suscripcion actual
        UPDATE Suscripciones
        SET Tipo = 'Premium'
        WHERE UsuarioID = @UsuarioID;

        COMMIT;
    END TRY
    BEGIN CATCH
        ROLLBACK;
        DECLARE @ErrorMessage NVARCHAR(4000);
        SET @ErrorMessage = ERROR_MESSAGE();
        PRINT @ErrorMessage;
    END CATCH;
END;

EXEC sp_actualizar_email_suscripcion 1008, 'SOyelnuevoemail@gmail.com';
EXEC sp_actualizar_email_suscripcion 3, 'SOyelnuevoemailes@gmail.com';
EXEC sp_actualizar_email_suscripcion 4, 'SOyelnuevoemail3@gmail.com';
SELECT * FROM Suscripciones;
SELECT * FROM Usuarios;

--Ejercicio 4 procedimiento almacenado para eliminar una pelicula con historial
CREATE PROCEDURE sp_eliminar_pelicula_historial
    @PeliculaID INT --En este caso solo se usara el id de la pelicual que queremos eliminar.
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY
	--procedimiento para eliminar el historial de la pelicula
        DELETE FROM HistorialVisual
        WHERE PeliculaID = @PeliculaID;
	--Procesimiento para eliminar la pelicula
        DELETE FROM Peliculas
        WHERE PeliculaID = @PeliculaID;

        COMMIT;
    END TRY
    BEGIN CATCH
        ROLLBACK;
        DECLARE @ErrorMessage NVARCHAR(4000);
        SET @ErrorMessage = ERROR_MESSAGE();
        PRINT @ErrorMessage;
    END CATCH;
END;
EXEC sp_eliminar_pelicula_historial 9;
EXEC sp_eliminar_pelicula_historial 9;
EXEC sp_eliminar_pelicula_historial 10;-

SELECT * FROM Peliculas;
SELECT * FROM HistorialVisual;



--Ejercicio 5 Procedimento almacenado para borrar un usuario, suscripcion y el istorial del usuario eliminado
CREATE PROCEDURE sp_eliminar_usuario_suscripciones_Historial
    @UsuarioID INT --EL dato que se usara es el ID del usuario que queremos eliminar
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY
	--Procedimineto de borrar el historial del usuario
        DELETE FROM HistorialVisual
        WHERE UsuarioID = @UsuarioID;
	--Procedimineto para borrar la suscripcion de la tabla suscripciones
        DELETE FROM Suscripciones
        WHERE UsuarioID = @UsuarioID;
	--Procedimiento para borrar el usuario y su contenido.
        DELETE FROM Usuarios
        WHERE UsuarioID = @UsuarioID;

        COMMIT;
    END TRY
    BEGIN CATCH
        ROLLBACK;
        DECLARE @ErrorMessage NVARCHAR(4000);
        SET @ErrorMessage = ERROR_MESSAGE();
        PRINT @ErrorMessage;
    END CATCH;
END;
--Muestras de aplicacion 
EXEC sp_eliminar_usuario_suscripciones_Historial 1;
EXEC sp_eliminar_usuario_suscripciones_Historial 4;
EXEC sp_eliminar_usuario_suscripciones_Historial 10;

SELECT * FROM Suscripciones;
SELECT * FROM HistorialVisual;
SELECT * FROM Usuarios;


