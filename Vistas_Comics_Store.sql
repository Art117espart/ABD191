
--Crea una Vista llamada Vista_ComprasComic para ver los detalles de las compras de comics.
CREATE VIEW VISTA_CompraComics AS
SELECT cc.id_CC, cc.cantidad, C.nombre, Co.id_compra, Co.fecha_compra,Co.total
FROM comic_compras cc
LEFT JOIN Comics C
ON cc.id_CC = C.id_comic
LEFT JOIN Compras Co 
ON Co.id_compra = cc.id_CC


SELECT * FROM VISTA_CompraComics;


--Crea una Vista llamada Vista_ComicsComprados donde se pueda apreciar y contar los comics que compro cada cliente

CREATE VIEW Vista_ComicsComprados AS
SELECT cl.id_cliente, cl.nombre, cc.cantidad AS cantidad_comics_comprados
FROM Clientes cl
LEFT JOIN comic_compras cc
ON cc.id_compra = cl.id_cliente



SELECT * FROM Vista_ComicsComprados;

