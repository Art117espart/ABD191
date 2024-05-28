Create TABLE Clientes (
id_cliente bigint identity(1,1) PRIMARY KEY,
nombre VARCHAR (100),
correo_electronico VARCHAR (255),
pass VARCHAR(255)
);

Create TABLE Compras (
id_compra bigint identity(1,1) PRIMARY KEY,
fecha_compra DATE,
id_cliente BIGINT,
FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);

CREATE TABLE Comics(
id_comic BIGINT IDENTITY(1,1) PRIMARY KEY,
nombre VARCHAR (255),
anio TINYINT,
precio DECIMAL
);

CREATE TABLE comic_compras(
id_CC BIGINT IDENTITY(1,1) PRIMARY KEY,
cantidad TINYINT,
id_compra BIGINT,
id_comic BIGINT,
FOREIGN KEY (id_compra) REFERENCES Compras(id_compra),
FOREIGN KEY (id_comic) REFERENCES Comics(id_comic)
);

CREATE TABLE Inventario(
id_inventario BIGINT IDENTITY(1,1) PRIMARY KEY,
id_comic BIGINT,
cantidad_disponible INT,
disponibilidad BINARY,
FOREIGN KEY (id_comic) REFERENCES Comics(id_comic)
);

