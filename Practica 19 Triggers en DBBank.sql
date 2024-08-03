/*REATE TRIGGER [nombre_esquema.]nombre_trigger
ON nombre_tabla
[ CON <opción_trigger_dml> [ ,...n ] ]
{ PARA | DESPUÉS DE | EN LUGAR DE }
{ [ INSERTAR ] [ , ] [ ACTUALIZAR ] [ , ] [ ELIMINAR ] }
COMO
{ declaración_sql [ ; ] [ ,...n ] }

--a) Crea un Trigger para que después de Insertar un nuevo cliente se despliegue un mensaje de aviso.
CREATE TRIGGER tr_Nuevo_Cliente
ON Clientes
AFTER INSERT
AS
BEGIN
--Este es el mensaje que se mostrara cuando se ejecute el trigger.
    PRINT 'Cliente insertado correctamente.'
END;

INSERT INTO Clientes(Nombre, Direccion, Telefono, Email) VALUES 
('Juana Alejandra Martinez Alvarez', 'Calle Falsa 123, Ciudad', '4421589757', 'juana.alvarem@example.com');



--b) Crea un Trigger para que después de eliminar un cliente se despliegue un mensaje de aviso.
CREATE TRIGGER tr_Borrar_Cliente
ON Clientes
AFTER DELETE
AS
BEGIN
--Este es el mensaje que se mostrara cuando se ejecute el trigger.
    PRINT 'Cliente eliminado correctamente.'
END;


SELECT * FROM Clientes;

EXEC sp_EliminarCliente 1002;*/

--c) Crea un Trigger para la tabla cuentas que valide si existe el cliente antes de crear una nueva cuenta , avisar cada caso con su respectivo mensaje.
CREATE TRIGGER tr_Validar_Cliente_En_Cuenta
ON Cuentas
INSTEAD OF INSERT
AS
BEGIN
    DECLARE @ClienteID INT;
    SELECT @ClienteID = ClienteID FROM INSERTED;

    IF NOT EXISTS (SELECT 1 FROM Clientes WHERE ClienteID = @ClienteID)
    BEGIN
        PRINT 'El cliente no existe. No se puede crear la cuenta.';
    END
    ELSE
    BEGIN
        INSERT INTO Cuentas (ClienteID, TipoCuenta, Saldo, FechaApertura)
        SELECT ClienteID, TipoCuenta, Saldo, FechaApertura FROM INSERTED;
        PRINT 'Cuenta creada correctamente.';
    END
END;


INSERT INTO Cuentas (ClienteID, TipoCuenta, Saldo, FechaApertura) VALUES 
(1, 'Ahorro', 1500.00, '2024-01-15'),
(2, 'Corriente', 3000.50, '2024-02-20'),
(3, 'Ahorro', 1200.75, '2024-03-10');

INSERT INTO Cuentas (ClienteID, TipoCuenta, Saldo, FechaApertura) VALUES 
(4, 'Ahorro', 1200.75, '2024-03-10');
SELECT * FROM Cuentas;



--d) Crea un Trigger para la tabla cuentas que cuide antes de realizar una actualización no se ingrese un numero negativo.
CREATE TRIGGER tr_PrevenirSaldoNegativo
ON Cuentas
INSTEAD OF UPDATE
AS
BEGIN
    IF EXISTS (SELECT 1 FROM INSERTED WHERE Saldo < 0)
    BEGIN
        PRINT 'No se puede ingresar un saldo negativo.';
    END
    ELSE
    BEGIN
        UPDATE Cuentas
        SET ClienteID = i.ClienteID, TipoCuenta = i.TipoCuenta, Saldo = i.Saldo, FechaApertura = i.FechaApertura
        FROM INSERTED i
        WHERE Cuentas.CuentaID = i.CuentaID;
    END
END;


--e) Crea un Trigger para la tabla Prestamos que no permita eliminar el prestamos si tiene pagos asociados en la tabla pagos Prestamos.



--f) Crea una tabla nueva llamada logClientes.


