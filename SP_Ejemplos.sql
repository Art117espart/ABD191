/

--Explorar propiedades en una base de datos
EXEC sp_helpdb--muestra todas las propiedades de las base de datos

EXEC sp_helpdb 'ComicsStore'--y este solo de uno

--Explorar las propiedades de un objeto de la BD
EXEC sp_help 'Usuarios'

--llaves primarias de una tabla
EXEC sp_helpindex 'Usuarios'

--Indormacion de los usuarios y procesos actuales
EXEC sp_who

--Rendimiento del servidor
EXEC sp_monitor

--espacio usando por la BD
EXEC sp_spaceused

--Puertp de escucha del SQL SERVER
EXEC sp_readerrorlog 0,1

--Crear nuestros procedimientos almacenados*/
--Procedimiento para consultar el Historial de un usuario
CREATE PROCEDURE sp_ObtenerHistorial--Nombre del procedimiento
	@usuarioid INT--parametro que se usara
AS
BEGIN

select h.HistorialVisualID,p.titulo, h.FechaVisualizacion
from HistorialVisual h
JOIN Peliculas p ON h.PeliculaID = p.PeliculaID
WHERE h.UsuarioID = @usuarioId
ORDER BY h.FechaVisualizacion DESC--Una vista ya realizada



END;
EXEC sp_ObtenerHistorial 10


CREATE PROCEDURE sp_InsertarPeliculas
	@Titulo NVARCHAR (100),--Define los tamaños de las  variables
	@Genero NVARCHAR (50),
	@FechaEstreno DATE
AS
BEGIN
	INSERT INTO Peliculas(Titulo,Genero,FechaEstreno)
	VALUES (@Titulo, @Genero, @FechaEstreno)--Un insert ya realizada
END;
EXEC sp_InsertarPeliculas @Titulo ='Intensamente 2', @Genero = 'Familiar', @FechaEstreno = '2024-06-13'

select * from Peliculas;