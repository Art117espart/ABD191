
create table Estatus (id int primary key,
nombre varchar(125));


INSERT INTO Estatus (id, nombre) VALUES
(1, 'Activo'),
(2, 'Inactivo'),
(3, 'En proceso'),
(4, 'Finalizado');



create table Tematica (id int primary key,
nombre varchar(75));



INSERT INTO Tematica (id, nombre) VALUES
(1, 'Tecnología'),
(2, 'Salud'),
(3, 'Educación'),
(4, 'Arte y Cultura'),
(5, 'Deportes'),
(6, 'Medio Ambiente'),
(7, 'Negocios'),
(8, 'Entretenimiento'),
(9, 'Ciencia'),
(10, 'Viajes');







create table Empresas (id int primary key,
nombre varchar(125),
telefono varchar(20),
correo varchar(100),
direccion varchar(500)
);



INSERT INTO Empresas (id, nombre, telefono, correo, direccion) VALUES
(1, 'Empresa A', '1234567890', 'empresaA@example.com', 'Calle 123,
Ciudad A'),
(2, 'Empresa B', '0987654321', 'empresaB@example.com', 'Avenida
Principal, Ciudad B'),
(3, 'Empresa C', '5555555555', 'empresaC@example.com', 'Plaza
Central, Ciudad C'),
(4, 'Empresa D', '7777777777', 'empresaD@example.com', 'Carretera
Norte, Ciudad D'),
(5, 'Empresa E', '9999999999', 'empresaE@example.com', 'Calle
Principal, Ciudad E'),
(6, 'Empresa F', '1111111111', 'empresaF@example.com', 'Avenida Sur,
Ciudad F'),
(7, 'Empresa G', '2222222222', 'empresaG@example.com', 'Calle
Central, Ciudad G'),
(8, 'Empresa H', '3333333333', 'empresaH@example.com', 'Avenida
Norte, Ciudad H'),
(9, 'Empresa I', '4444444444', 'empresaI@example.com', 'Plaza Mayor,
Ciudad I'),
(10, 'Empresa J', '6666666666', 'empresaJ@example.com', 'Calle Mayor,
Ciudad J');


SELECT * FROM Empresas;







create table Escuelas (
id int primary key,
nombre varchar(125),
telefono varchar(20),
correo varchar(100),
direccion varchar(500)
);

INSERT INTO Escuelas (id, nombre, telefono, correo, direccion) VALUES
(1, 'UPQ', '+524421019000', 'proceso.admision@upq.edu.mx', 'Carretera
Estatal 420 S/N, El Rosario, 76240, 76240 Santiago de Querétaro,
Qro.'),
(2, 'ITQ', '+524422274400', 'proceso.admision@itq.edu.mx', 'Av
Tecnológico S/N, Centro Histórico, Centro, 76000 Santiago de
Querétaro, Qro.'),

(3, 'UAQ', '+524422274400', 'proceso.admision@uaq.edu.mx', 'Av
Tecnológico S/N, Centro Histórico, Centro, 76000 Santiago de
Querétaro, Qro.'),
(4, 'Tecnologico de Monterrey', '+528183582000',
'proceso.admision@tec.edu.mx', 'Epigmenio González 500, Fracc, San
Pablo, 76130 Santiago de Querétaro, Qro.'),
(5, 'UPSL', '+524448702100', 'proceso.admision@uslp.edu.mx', 'C.
Urbano Villalón 500, La Ladrillera, 78369 San Luis Potosí, S.L.P.');






create table Asociaciones (
id int primary key,
empresas_id int,
escuelas_id int,
foreign key (escuelas_id) references Escuelas(id),
foreign key (empresas_id) references Empresas(id)
);


INSERT INTO Asociaciones (id, empresas_id, escuelas_id) VALUES
(1, 10, 1),
(2, 5, 2),
(3, 6, 3),
(4, 2, 4),
(5, 7, 5);

SELECT * FROM Asociaciones;





create table Voluntarios(
id int primary key,
nombres varchar(50),
apellidos varchar(50),
escuelas_id int,
Registros tinyint,
foreign key (escuelas_id) references Escuelas(id)
);


INSERT INTO Voluntarios (id, nombres, apellidos, escuelas_id, Registros) VALUES
(1, 'Juan', 'Velazquez', 1, 1),
(2, 'Pedro', 'Elizalde', 1, 1),
(3, 'Samuel', 'Martínez', 3, 1),
(4, 'Ana', 'Rodríguez', 4, 1),
(5, 'Luis', 'Pérez', 5, 1),
(6, 'Laura', 'Gómez', 5, 1),
(7, 'Carlos', 'Hernández', 2, 1),
(8, 'Sofía', 'Díaz', 3, 1),
(9, 'Diego', 'Gutiérrez', 4, 1),
(10, 'Alejandra', 'Sánchez', 2, 1);






create table Convocatorias(
id int primary key,
titulo varchar(100),
descripcion varchar(700),
requisitos varchar(500),
fecha_inicio date,
fecha_final date,
cantidad_usuarios int,
limite_usuarios int,
estatus_id int,
empresa_id int,
tematica_id int,
foreign key(estatus_id) references estatus(id),
foreign key(empresa_id) references empresas(id),
foreign key(tematica_id) references tematica(id)
);


INSERT INTO Convocatorias (id, titulo, descripcion, requisitos,
fecha_inicio, fecha_final, cantidad_usuarios, limite_usuarios, estatus_id, empresa_id,
tematica_id) VALUES
(1, 'Convocatoria 1', 'Descripción de la convocatoria 1', 'Requisitos
para la convocatoria 1', '2024-04-01', '2024-04-30', 5, 10, 1, 1, 1),
(2, 'Convocatoria 2', 'Descripción de la convocatoria 2', 'Requisitos
para la convocatoria 2', '2024-05-01', '2024-05-31', 1, 8, 2, 2, 2),
(3, 'Convocatoria 3', 'Descripción de la convocatoria 3', 'Requisitos
para la convocatoria 3', '2024-06-01', '2024-06-30', 7, 12, 1, 3, 3),
(4, 'Convocatoria 4', 'Descripción de la convocatoria 4', 'Requisitos
para la convocatoria 4', '2024-07-01', '2024-07-31', 14, 15, 3, 4, 4),
(5, 'Convocatoria 5', 'Descripción de la convocatoria 5', 'Requisitos
para la convocatoria 5', '2024-08-01', '2024-08-31', 19, 20, 2, 5, 5),
(6, 'Convocatoria 6', 'Descripción de la convocatoria 6', 'Requisitos
para la convocatoria 6', '2024-09-01', '2024-09-30', 12, 18, 1, 6, 6),
(7, 'Convocatoria 7', 'Descripción de la convocatoria 7', 'Requisitos
para la convocatoria 7', '2024-10-01', '2024-10-31', 11, 25, 1, 7, 7),
(8, 'Convocatoria 8', 'Descripción de la convocatoria 8', 'Requisitos
para la convocatoria 8', '2024-11-01', '2024-11-30', 22, 22, 2, 8, 8),
(9, 'Convocatoria 9', 'Descripción de la convocatoria 9', 'Requisitos
para la convocatoria 9', '2024-12-01', '2024-12-31', 20, 30, 3, 9, 9),
(10, 'Convocatoria 10', 'Descripción de la convocatoria 10',
'Requisitos para la convocatoria 10', '2025-01-01', '2025-01-31', 12, 28,
1, 10, 10);




SELECT * FROM Convocatorias;






create table Registros (
id int primary key,
voluntarios_id int,
convocatoria_id int,
foreign key(voluntarios_id) references Voluntarios(id),
foreign key(convocatoria_id) references Convocatorias(id)
);




--Creacion de las vistas

CREATE VIEW vw_asociacionesEscuelasEmpresas AS
select 
	a.id, e.nombre as "Escuela", em.nombre as "Empresa"
from 
	asociaciones as a
INNER JOIN 
	escuelas as e on e.id = a.escuelas_id
INNER JOIN 
	empresas as em on em.id = a.empresas_id;

SELECT * FROM vw_asociacionesEscuelasEmpresas;


CREATE VIEW vw_convocatoriaEstatus AS
SELECT C.id, C.titulo, E.nombre AS estatus
FROM Convocatorias as C
INNER JOIN Estatus AS E ON C.estatus_id = E.id;

SELECT * FROM vw_convocatoriaEstatus;


CREATE VIEW vw_convocatoriaUsuarios
AS
SELECT 
	e.nombre AS Empresa, c.titulo, c.cantidad_usuarios, c.limite_usuarios
FROM 
	Empresas AS e
INNER JOIN 
	Convocatorias AS c ON e.id = C.empresa_id;

SELECT * FROM vw_convocatoriaUsuarios;


--Procedimientos simples.

Select * from

--Procedimiento para agregar un usuario
CREATE PROCEDURE sp_insertarVoluntario
	@id int,
	@nombres VARCHAR(50),
	@apellidos VARCHAR(50),
	@escuela int
AS
BEGIN
	Declare @registros int
	SET @registros = 1
	INSERT INTO Voluntarios (id, nombres, apellidos, escuelas_id, Registros)
	VALUES (@id, @nombres, @apellidos, @escuela, @registros)
END;

Select * from Voluntarios;

EXEC sp_insertarVoluntario 11, 'Mario', 'Alvarez', 3;

--Borrar voluntario


CREATE PROCEDURE sp_borrarVoluntario
	@id int
AS
BEGIN
	DELETE FROM Voluntarios WHERE id = @id
END;

EXEC sp_borrarVoluntario 11;



--Actualizar la tematica de una convocatoria

CREATE PROCEDURE sp_actualizarTemaConvo
	@idConvo int,
	@idTema int
AS
BEGIN
	UPDATE Convocatorias SET tematica_id = @idTema WHERE id = @idConvo
END;
SELECT * FROM Convocatorias;

EXEC sp_actualizarTemaConvo 2, 10

--Vista de acuerdo al tipo de tematica de una convocatoria

CREATE PROCEDURE sp_ConvoTema
	@nombre VARCHAR(75)
AS
BEGIN
SELECT c.titulo, c.descripcion, t.nombre as Tematica
FROM Convocatorias AS C
JOIN Tematica AS T ON t.id = c.tematica_id
WHERE t.nombre = @nombre
END;

EXEC sp_ConvoTema 'Deportes';

Select * from Tematica;


--Ingresar una convocatoria
CREATE PROCEDURE sp_insertarConvocatoria
	@id INT,
    @titulo VARCHAR(100),
    @descripcion VARCHAR(700),
    @requisitos VARCHAR(500),
    @fi DATE,
    @ff DATE,
    @lu INT,
    @estatus INT,
    @empresa INT,
    @tema INT
AS
BEGIN
    INSERT INTO 
        Convocatorias (id, titulo, descripcion, requisitos, fecha_inicio, 
        fecha_final, cantidad_usuarios, limite_usuarios, estatus_id, empresa_id, tematica_id)
    VALUES 
        (@id, @titulo, @descripcion, @requisitos, @fi, @ff, 0, @lu, @estatus, @empresa, @tema)
END;


EXEC sp_insertarConvocatoria 11, 'Convocatoria de Desarrollo Web', 'Descripción detallada de la convocatoria.',
    'Requisitos para la convocatoria.', '2024-07-01','2024-07-31', 100, 1, 1, 1;


Select * from Convocatorias;




--Procedimientos con transacciones


--Ingresar a un registro

CREATE PROCEDURE sp_insertarRegistro
    @id int,
    @idvol int,
    @idconvo int
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY
        IF (SELECT Registros FROM Voluntarios WHERE id = @idvol) = 0
        BEGIN
            RAISERROR('El voluntario no tiene registros disponibles.', 16, 1);
            ROLLBACK;
            RETURN;
        END
        IF (SELECT cantidad_usuarios FROM Convocatorias WHERE id = @idconvo) >= (SELECT limite_usuarios FROM Convocatorias WHERE id = @idconvo)
        BEGIN
            RAISERROR('La convocatoria ha alcanzado el límite de usuarios.', 16, 1);
            ROLLBACK;
            RETURN;
        END
        INSERT INTO Registros (id, voluntarios_id, convocatoria_id)
        VALUES (@id, @idvol, @idconvo);
        UPDATE Convocatorias SET cantidad_usuarios = cantidad_usuarios + 1 WHERE id = @idconvo;
        UPDATE Voluntarios SET Registros = Registros - 1 WHERE id = @idvol;
        COMMIT;
    END TRY
    BEGIN CATCH
        ROLLBACK;
        DECLARE @ErrorMessage NVARCHAR(4000);
        SET @ErrorMessage = ERROR_MESSAGE();
        PRINT @ErrorMessage;
    END CATCH;

END;

Select * FROM Convocatorias;
Select * from Voluntarios;

EXEC sp_insertarRegistro 1,1,7;
EXEC sp_insertarRegistro 1,1,2;


--Opcion para borrar registro


CREATE PROCEDURE sp_borrarRegistro
    @id int
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY
        -- Obtener los ids necesarios
        DECLARE @idConvo int;
        DECLARE @idVol int;
        SELECT @idConvo = convocatoria_id, @idVol = voluntarios_id
        FROM Registros
        WHERE id = @id;
        -- Verificar si se encontraron los ids
        IF @idConvo IS NULL OR @idVol IS NULL
        BEGIN
            RAISERROR('Registro no encontrado.', 16, 1);
            ROLLBACK;
            RETURN;
        END
        -- Actualizar cantidad_usuarios en Convocatorias
        UPDATE Convocatorias 
        SET cantidad_usuarios = cantidad_usuarios - 1 
        WHERE id = @idConvo;
        -- Actualizar Registros en Voluntarios
        UPDATE Voluntarios 
        SET Registros = Registros + 1 
        WHERE id = @idVol;
        -- Borrar el registro de la tabla Registros
        DELETE FROM Registros WHERE id = @id;
        COMMIT;
    END TRY
    BEGIN CATCH
        ROLLBACK;
        DECLARE @ErrorMessage NVARCHAR(4000);
        SET @ErrorMessage = ERROR_MESSAGE();
        PRINT @ErrorMessage;
    END CATCH;
END;

EXEC sp_borrarRegistro 1;
SELECT * FROM Voluntarios;
Select * From Convocatorias;


CREATE PROCEDURE sp_Eliminar_Empresa_Asociaciones
     @p_empresa_id INT
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY
        -- Eliminar convocatorias relacionadas con la empresa
        DELETE FROM Convocatorias WHERE empresa_id = @p_empresa_id;

        -- Eliminar asociaciones de la empresa
        DELETE FROM Asociaciones WHERE empresas_id = @p_empresa_id;

        -- Eliminar la empresa
        DELETE FROM Empresas WHERE id = @p_empresa_id;

        COMMIT;
    END TRY
    BEGIN CATCH
        ROLLBACK;
        DECLARE @ErrorMessage NVARCHAR(4000);
        SET @ErrorMessage = ERROR_MESSAGE();
        PRINT @ErrorMessage;
    END CATCH;
END;

EXEC sp_Eliminar_Empresa_Asociaciones 1;

SELECT * FROM Empresas;

