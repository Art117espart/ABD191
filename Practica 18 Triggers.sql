CREATE TRIGGER nuevas_tablas_DBBank
ON DATABASE
FOR CREATE_TABLE AS
BEGIN
	PRINT 'Se ha creado una nueva tabla en DBBANK.'
END;

CREATE TABLE Prestamos (
    PrestamoID INT IDENTITY(1,1) PRIMARY KEY,
    ClienteID INT,
    Monto DECIMAL(18, 2),
    TasaInteres DECIMAL(5, 2),
    FechaInicio DATE,
    FechaFin DATE,
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);

CREATE TABLE PagosPrestamos (
    PagoID INT IDENTITY(1,1) PRIMARY KEY,
    PrestamoID INT,
    MontoPagado DECIMAL(18, 2),
    FechaPago DATE,
    FOREIGN KEY (PrestamoID) REFERENCES Prestamos(PrestamoID)
);


INSERT INTO Prestamos (ClienteID, Monto, TasaInteres, FechaInicio, FechaFin) VALUES 
(1, 5000.00, 5.00, '2024-01-15', '2026-01-15'),
(2, 2000.00, 4.50, '2024-02-20', '2025-02-20'),
(3, 3000.00, 6.00, '2024-03-10', '2026-03-10');


INSERT INTO PagosPrestamos (PrestamoID, MontoPagado, FechaPago) VALUES 
(1, 1000.00, '2024-03-01'),
(1, 1000.00, '2024-06-01'),
(2, 500.00, '2024-04-01'),
(3, 1500.00, '2024-05-01');


SELECT * FROM Prestamos;
SELECT * FROM PagosPrestamos;




CREATE TRIGGER se_creo_nuevo_procedimiento
ON DATABASE
FOR CREATE_PROCEDURE AS
BEGIN
	PRINT 'Se ha creado un Nuevo Procedimiento en DBBANK.'
END;


CREATE PROCEDURE sp_insertar_Prestamo_Pago
    @ClienteID INT,
    @Monto DECIMAL(18, 2),
    @TasaInteres DECIMAL(5, 2),
    @FechaInicio DATE,
    @FechaFin DATE,
    @MontoPagado DECIMAL(18, 2),
    @FechaPago DATE
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY

        -- Insertar el nuevo préstamo
        INSERT INTO Prestamos (ClienteID, Monto, TasaInteres, FechaInicio, FechaFin)
        VALUES (@ClienteID, @Monto, @TasaInteres, @FechaInicio, @FechaFin);

        DECLARE @PrestamoID INT;
        SET @PrestamoID = SCOPE_IDENTITY();  -- Obtener el ID del préstamo recién insertado

        -- Insertar el primer pago del préstamo
        INSERT INTO PagosPrestamos (PrestamoID, MontoPagado, FechaPago)
        VALUES (@PrestamoID, @MontoPagado, @FechaPago);

        COMMIT;
    END TRY
    BEGIN CATCH
        ROLLBACK;
        DECLARE @ErrorMessage NVARCHAR(4000);
        SET @ErrorMessage = ERROR_MESSAGE();
        PRINT @ErrorMessage;
    END CATCH;
END;

EXEC sp_insertar_Prestamo_Pago 2,300000.50,50.99,'2024-07-17','2024-07-17',3000000.50,'2024-08-01';
EXEC sp_insertar_Prestamo_Pago 3,13000.50,50.99,'2024-07-17','2024-07-17',13000.50,'2024-08-01';

SELECT * FROM Prestamos;
SELECT * FROM PagosPrestamos;




CREATE PROCEDURE sp_consultar_Clientes_Prestamos_Pagos
AS
BEGIN
    -- Consultamos a los clientes y sus préstamos con los pagos realizados
    SELECT 
        C.ClienteID,
        C.Nombre,
        C.Direccion,
        C.Telefono,
        C.Email,
        P.PrestamoID,
        P.Monto AS MontoPrestamo,
        P.TasaInteres,
        P.FechaInicio,
        P.FechaFin,
        PP.MontoPagado,
        PP.FechaPago
    FROM 
        Clientes C
    LEFT JOIN 
        Prestamos P ON C.ClienteID = P.ClienteID
    LEFT JOIN 
        PagosPrestamos PP ON P.PrestamoID = PP.PrestamoID
    ORDER BY 
        C.ClienteID, P.PrestamoID, PP.FechaPago;
END;

EXEC sp_consultar_Clientes_Prestamos_Pagos ;