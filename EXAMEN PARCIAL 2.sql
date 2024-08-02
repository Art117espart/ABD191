USE DBBank;
CREATE TABLE Clientes (
    ClienteID INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(100),
    Direccion NVARCHAR(200),
    Telefono NVARCHAR(15),
    Email NVARCHAR(100)
);

CREATE TABLE Cuentas (
    CuentaID INT IDENTITY(1,1) PRIMARY KEY,
    ClienteID INT,
    TipoCuenta NVARCHAR(50),
    Saldo DECIMAL(18, 2),
    FechaApertura DATE,
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);


CREATE TABLE Transacciones (
    TransaccionID INT IDENTITY(1,1) PRIMARY KEY,
    CuentaID INT,
    TipoTransaccion NVARCHAR(50),
    Monto DECIMAL(18, 2),
    FechaTransaccion DATETIME,
    FOREIGN KEY (CuentaID) REFERENCES Cuentas(CuentaID)
);


CREATE TABLE Empleados(
	EmpleadoID INT IDENTITY(1,1) PRIMARY KEY,
	Nombre NVARCHAR(100),
	Posicion NVARCHAR(50),
	Departamento NVARCHAR(50),
	FechaContratacion DATE
);

INSERT INTO Clientes (Nombre, Direccion, Telefono, Email) VALUES 
('Elizalde Barrera Pedro Samuel', 'Calle Falsa 123, Ciudad', '4421589757', 'pana.perez@example.com'),
('Villagran Olvera Catalina Isabel', 'Av. Siempre Viva 742, Ciudad', '4423527084', 'isabel.lopez@example.com'),
('Jennifer Guadalupe Reséndiz Araujo', 'Calle del Sol 456, Ciudad', '4481502867', 'jennifer.garcia@example.com');

INSERT INTO Cuentas (ClienteID, TipoCuenta, Saldo, FechaApertura) VALUES 
(1, 'Ahorro', 1500.00, '2024-01-15'),
(2, 'Corriente', 3000.50, '2024-02-20'),
(3, 'Ahorro', 1200.75, '2024-03-10');

INSERT INTO Transacciones (CuentaID, TipoTransaccion, Monto, FechaTransaccion) VALUES 
(1, 'Depósito', 500.00, '2024-01-20 10:30:00'),
(2, 'Retiro', 1000.00, '2024-02-25 14:00:00'),
(3, 'Depósito', 200.00, '2024-03-15 09:00:00');


INSERT INTO Empleados (Nombre, Posicion, Departamento, FechaContratacion) VALUES 
('Elizalde Barrera Pedro Samuel', 'Gerente', 'Ventas', '2023-05-01'),
('Villagran Olvera Catalina Isabel', 'Asistente', 'Marketing', '2023-06-15'),
('Jennifer Guadalupe Reséndiz Araujo', 'Analista', 'Finanzas', '2023-07-10');





SELECT * FROM  Clientes;

SELECT * FROM Cuentas;

SELECT * FROM Transacciones;

SELECT * FROM Empleados;




















