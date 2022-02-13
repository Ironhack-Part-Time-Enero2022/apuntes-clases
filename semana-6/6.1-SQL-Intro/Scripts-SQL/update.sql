use coches; 
select * from clientes; 
-- Imaginamos que nos hemos equivocado al poner la provincia y la ciudad de Antonio. 

UPDATE clientes -- seleccionamos la tabla
SET provincia = 'Asturias', telefono=098264839 -- indicamos los valores nuevos que queremos poner
WHERE idclientes = 1;

-- Si ahora volvemos a chequear nuestra BBDD

select * from cliente; 