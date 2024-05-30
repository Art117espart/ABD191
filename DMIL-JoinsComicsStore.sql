USE ComicsStore;
SELECT * FROM Clientes;
SELECT * FROM Compras;
SELECT * FROM Comics;
SELECT * FROM comic_compras;
SELECT * FROM Inventario;
--Inner Join
SELECT C.id_compra, Cl.nombre AS CLIENTE, c.id_compra 
FROM Compras c
JOIN Clientes cl 
on C.id_cliente= Cl.id_cliente;

--RIGHT Join
SELECT C.id_compra, Cl.nombre AS CLIENTE, c.id_compra 
FROM Compras c
RIGHT JOIN Clientes cl 
on C.id_cliente= Cl.id_cliente;

--LEFT JOIN
SELECT C.id_compra, Cl.nombre AS CLIENTE, c.id_compra 
FROM Compras c
LEFT JOIN Clientes cl 
on C.id_cliente= Cl.id_cliente;

--FULL JOIN
SELECT C.id_compra, Cl.nombre AS CLIENTE, c.id_compra 
FROM Compras c
FULL JOIN Clientes cl 
on C.id_cliente= Cl.id_cliente;

--FULL JOIN
SELECT * 
FROM Clientes cl
FULL JOIN Compras c 
on C.id_cliente= Cl.id_cliente;
