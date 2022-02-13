-- ⚠️⚠️⚠️ Ojoooo!!!!! Si no ponemos el where borraremos toda la tabla ⚠️⚠️⚠️
USE coches;

select * from clientes;

DELETE FROM clientes  -- de que tabla queremos borrar datos
WHERE nombre="Daniel"; -- la condición 

-- Puede que cuando intentemos hacer un update o un delete nos salga un error como este 👇🏽

-- Error Code: 1175. You are using safe update mode and you tried to update a table without a WHERE that uses a KEY column.  To disable safe mode, toggle the option in Preferences -> SQL Editor and reconnect.

-- Esto es porque nuestra sesión de MySQL esta configurada con la actualización segura. 
-- Esto significa que no puede actualizar o eliminar registros sin especificar la clave  primaria en la cláusula where.
-- Para evitar esto podemos ejecutar la siguiente línea de código: 
SET SQL_SAFE_UPDATES = 0;

DELETE FROM clientes  -- de que tabla queremos borrar datos
WHERE nombre = "Daniel";


-- chequeemos ahora nuestra tabla
select * from clientes;
