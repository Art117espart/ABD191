USE ComicsStore;

--I. Crea una consulta para obtener el nombre del cómic con los disponibles en el inventario.

SELECT C.nombre, I.cantidad_disponible
FROM Comics C
JOIN Inventario I ON C.id_comic = I.id_comic
WHERE I.disponibilidad = 1;


--II. Crea una consulta para desplegar los detalles de las compras realizadas por cada cliente y los cómics comprados.

SELECT 
    Clientes.nombre AS Cliente,
    Compras.id_cliente AS id_compra,
    Comics.nombre AS Comic,
    comic_compras.cantidad AS Cantidad
FROM 
    Clientes
JOIN 
    Compras ON Clientes.id_cliente = Compras.id_cliente
JOIN 
    comic_compras ON Compras.id_compra = comic_compras.id_compra
JOIN 
    Comics ON comic_compras.id_comic = Comics.id_comic
ORDER BY 
    Clientes.nombre, Compras.fecha_compra;


--III. Crea una consulta para obtener todas las compras junto con la cantidad disponible de cómics en el inventario incluidos los que no han sido comprados.

SELECT 
    Compras.id_compra AS id_compra,
    Comics.nombre AS Comic,
    Inventario.cantidad_disponible AS cantidad_disponible
FROM 
    Comics
LEFT JOIN 
    comic_compras ON Comics.id_comic = comic_compras.id_comic
LEFT JOIN 
    Compras ON comic_compras.id_compra = Compras.id_compra
LEFT JOIN 
    Inventario ON Comics.id_comic = Inventario.id_comic
ORDER BY 
    Compras.id_compra, Comics.id_comic;



--IV. Consulta para enlistar todos los cómics y su cantidad disponible en el inventario.


SELECT 
    Cm.nombre AS Nombre_del_Comic,
    I.cantidad_disponible AS cantidad_disponible
FROM 
    Comics Cm
LEFT JOIN 
    Inventario I ON Cm.id_comic = I.id_comic
ORDER BY 
    Cm.nombre;



--V. Crea una consulta todos datos de los comics, comics compras e inventario disponible.

SELECT * 
FROM 
    Comics Cm
LEFT JOIN 
    comic_compras cc ON Cm.id_comic = cc.id_comic
LEFT JOIN 
    Inventario I ON Cm.id_comic = I.id_comic
ORDER BY 
    Cm.id_comic, cc.id_CC;


--VI. Crea una consulta que muestre solo los clientes que compraron algo con su id de compra nombre del comic ,cantidad de compra y los disponibles en inventario.

SELECT 
    Cl.nombre AS Cliente,
    C.id_compra,
    Cm.nombre AS Comic,
    cc.cantidad AS CantidadComprada,
    I.cantidad_disponible AS CantidadDisponible
FROM 
    Clientes Cl
JOIN 
    Compras C ON Cl.id_cliente = C.id_cliente
JOIN 
    comic_compras cc ON C.id_compra = cc.id_compra
JOIN 
    Comics Cm ON cc.id_comic = Cm.id_comic
JOIN 
    Inventario I ON Cm.id_comic = I.id_comic
ORDER BY 
    Cl.nombre, C.id_compra;
