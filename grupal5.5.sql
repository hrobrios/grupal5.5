-- Tabla "Clientes"
CREATE TABLE Clientes (
  NumeroCliente INT PRIMARY KEY,
  DireccionEnvio1 VARCHAR(100),
  DireccionEnvio2 VARCHAR(100),
  DireccionEnvio3 VARCHAR(100),
  DireccionEnvio4 VARCHAR(100),
  DireccionEnvio5 VARCHAR(100),
  Saldo int
);

-- Tabla "Articulos"
CREATE TABLE Articulos (
  NumeroArticulo INT PRIMARY KEY,
  Descripcion VARCHAR(100)
);

-- Tabla "Distribucion"
CREATE TABLE Distribucion (
  NumeroArticulo INT,
  NumeroFabrica INT,
  Existencias INT,
  PRIMARY KEY (NumeroArticulo, NumeroFabrica),
  FOREIGN KEY (NumeroArticulo) REFERENCES Articulos(NumeroArticulo)
);

-- Tabla "CabeceraPedidos"
CREATE TABLE CabeceraPedidos (
  NumeroPedido INT PRIMARY KEY,
  NumeroCliente INT,
  DireccionEnvio VARCHAR(100),
  FechaPedido DATE,
  FOREIGN KEY (NumeroCliente) REFERENCES Clientes(NumeroCliente)
);

-- Tabla "CuerpoPedidos"
CREATE TABLE CuerpoPedidos (
  NumeroPedido INT,
  NumeroArticulo INT,
  Cantidad INT,
  PRIMARY KEY (NumeroPedido, NumeroArticulo),
  FOREIGN KEY (NumeroPedido) REFERENCES CabeceraPedidos(NumeroPedido),
  FOREIGN KEY (NumeroArticulo) REFERENCES Articulos(NumeroArticulo)
);

-- Tabla "Fabricas"
CREATE TABLE Fabricas (
  NumeroFabrica INT PRIMARY KEY,
  TelefonoContacto VARCHAR(20),
  ArticulosProveidos INT
);
