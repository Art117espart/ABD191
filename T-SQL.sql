--TSQL
/*
--Declarando variables
DECLARE @idCliente int

-- Iniciallizar o asignar un valor
SET @idCliente = 5

--IF
--IF @idCliente = 5
	--SELECT * FROM Clientes WHERE id_cliente = @idCliente

--Declaramos la variable.
DECLARE @edad int
-- Inicializamos o asignamos un valor
SET @idCliente = 10

IF @idCliente = 8
	BEGIN--Se agrega para poder determinar donde inicia el IF
	SET @edad = 25
	SELECT * FROM Clientes WHERE id_cliente = @idCliente
	print @edad

	IF EXISTS(SELECT * FROM Clientes WHERE id_cliente = 10)
	print 'Si existe'
END--y este se pone para que sepa donde termina
ELSE -- se usa para poder tener otro metodo en este caso un print para que sepa el usuario lo que pasa
	BEGIN
	print'id no autorizado para la consulta.'
	print 'Error
	NO existe'
END


DECLARE @contador int = 0
WHILE @contador <=10
BEGIN
	print @contador
	set @contador = @contador + 1
END

--Return

DECLARE @contador int = 0

WHILE @contador <=10
BEGIN
	print @contador
	set @contador = @contador + 1
	IF @contador = 3
		BREAK--Rompe con el ciclo Y sigue con el codigo o lo que siga
	print('Hola')
END
print('aqui continua el flujo')
BEGIN TRY--Intenta realizar lo que esta adentro si no...
set  @contador = 'Juan Armando Velazquez Alvarez' --Esto es puesto intencional para poder prevenir un error de este tipo
END TRY--Avisa que pasa algo para poder seguir
BEGIN CATCH
	print ('!!La variable solo acepta enteros!!')
END CATCH

print('soy otra consulta')
print('yo tambien')
*/

-- CASE: 
DECLARE @valor int
DECLARE @resultado char(10)=''
set @valor = 40
--Este CASE se encarga de mostrar el valor marcado en set @valor = n
set @resultado = (CASE WHEN @valor = 10 THEN 'ROJO'
						WHEN @valor = 20 THEN 'VERDE'
						WHEN @valor = 30 THEN 'MORADO'
						ELSE 'GRIS'
						END)
print @resultado
--Con este select va a mostrar los libros de inventario si estan disponibles o no, usando CASE
SELECT * , (CASE WHEN disponibilidad >= 1 THEN 'VERDE'
				 WHEN disponibilidad = 0 THEN 'ROJO'
				 ELSE 'NEGRO'END) AS INDICADOR
				 FROM Inventario