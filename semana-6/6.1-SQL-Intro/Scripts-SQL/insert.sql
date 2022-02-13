-- definimos que queremos usar la BBDD de "coches"
USE coches; 

-- INSERTAMOS DATOS EN LA TABLA CLIENTES
INSERT INTO clientes (idclientes, nombre, direccion, provincia, telefono)
VALUES (1, "Antonio", "Calle Abrevadero 23","Madrid", 123456789);

-- Podemos incluir múltiples valores a la vez
INSERT INTO clientes (idclientes, nombre, direccion, provincia, telefono)
VALUES
	(2, "Laura", "Calle Portugal 12","Sevilla", 345267814),
    (3, "Maria", "Avenida Madrid 45","Valencia", 984562356),
    (4, "Lucas", "Calle Leo, 1","Madrid", 234562345),
    (5, "Manuel", "Calle Jazmin","Cuenca", 125639394),
    (6, "Daniel", "Calle del Libro 23","Barcelona", 842567301);

-- chequeemos si se han introducido los datos: 
select * from clientes; -- con el * indicamos que queremos seleccionar todas las columnas. 

select direccion from clientes; -- seleccionamos solo la columna direccion de la tabla clientes


-- INSERTAMOS DATOS EN LA TABLA FECHA. 
-- ⚠️ Si vamos a introducir todos los datos de las columnas podemos obviar el nombre de las columnas. 

INSERT INTO fecha 
VALUES
    (2, '2008-7-05'), 
    (3, '2008-7-06'), 
    (4, '2008-7-07'),
    (5, '2008-7-08'), 
    (6, '2008-7-09'), 
    (7, '2008-7-10');

-- chequeamos si se han insertado los valores
select * from fecha;


-- INSERTAMOS DATOS EN LA TABLA VENDEDOR.
INSERT INTO vendedor 
VALUES
	(1, "Pablo", "Madrid-Alcorcón", "2000-1-01"),
    (2, "Laura", "Madrid-San Sebastian", "2005-9-10");
    
select * from vendedor;


-- INSERTAMOS DATOS EN LA TABLA FACTURA.
INSERT INTO factura 
VALUES
	(1, 23.500, 1, 3, 2 ),
    (2, 34.000, 2, 2, 1 );

-- chequeamos si se han metido correctamente    
select * from factura;

-- INSERTAMOS DATOS EN LA TABLA FACTURA.
INSERT INTO factura 
VALUES
	(1, 23.500, 1, 3, 2 ),
    (2, 34.000, 2, 2, 1 );

-- INSERTAMOS DATOS EN LA TABLA PRODUCTO.
INSERT INTO producto 
VALUES
	(10, "Monovolumen", 1 ),
    (20, "Todoterreno", 2 );
    
select * from producto;