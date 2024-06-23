-- CLASE DE 22 JUNIO 2024
CREATE SCHEMA Clase;
USE Clase;

CREATE TABLE Clase.empleadas (
id_empleada INT NOT NULL AUTO_INCREMENT,
nombre VARCHAR(10),
apellido VARCHAR(50),
salario INT,
pais VARCHAR(10),
PRIMARY KEY (id_empleada) );

INSERT INTO Clase.empleadas (nombre, apellido, salario, pais)
VALUES ("Ana","González",2500,"España"),
       ("Maria","López",4000,"España"),
       ("Lucia","Ramos",3000,"España"),
       ("Elena","Bueno",5000,"España"),
       ("Rocio","García",1500,"Francia");
       
CREATE TABLE Clase.empleadasenproyectos
(id_empleada INT NOT NULL,
id_proyecto INT NOT NULL,
PRIMARY KEY (id_empleada,id_proyecto),
CONSTRAINT fk_empleadas FOREIGN KEY (id_empleada) REFERENCES Clase.empleadas (id_empleada)
);

INSERT INTO Clase.empleadasenproyectos (id_empleada,id_proyecto)
VALUES (2,1),
	   (3,2),
       (4,2),
       (5,3);
       
Alter table Clase.empleadasenproyectos
-- DROP FOREIGN KEY fk_empleadas;
ADD CONSTRAINT fk_empleadas FOREIGN KEY (id_empleada) REFERENCES Clase.empleadas (id_empleada)

-- INICIO EJERCICIOS

SELECT * FROM empleadas;

-- Mínimo de ID_empleada
SELECT MIN(id_empleada) as min_id
FROM empleadas;

-- Para el máximo: 
SELECT MAX(id_empleada) as max_id
FROM empleadas;

SELECT Min(nombre) as min_nombre
FROM empleadas;

SELECT salario
FROM empleadas;

-- Suma de todos los salarios
SELECT SUM(salario) as suma_salarios
FROM empleadas;

SELECT AVG(salario) as promedio_salarios
FROM empleadas;

SELECT COUNT(nombre)
FROM empleadas;

SELECT COUNT(*) -- comprobar cuantas filas tenemos en la tabla
FROM empleadas;

-- Cómo hacer un GROUP BY
SELECT pais, AVG(salario)
FROM empleadas
GROUP BY pais;

-- HAVING es para poner filtros y limitaciones a los GROUP BY:
SELECT pais, AVG(salario) as promedio_salario
FROM empleadas
GROUP BY pais
HAVING COUNT(*) > 2; -- Francia no sale porque tiene una sola fila, no cumple la condición

-- como hacer un if else en SQL:
SELECT salario,
CASE 
	WHEN salario < 2000 THEN "Bajo"
    WHEN salario > 3000 THEN "Alto"
    ELSE "Medio"
    END as RangoSalario
    -- Hay que poner siempre un alias porque creamos una columna nueva con el WHEN
FROM empleadas;

-- CASE anidados:
SELECT salario,
CASE
	WHEN SALARIO < 2000 THEN "BAJO"
    ELSE 
		CASE WHEN SALARIO > 3000 THEN "ALTO"
        ELSE "Medio"
        END -- OJO para cada case necesitamos un END!!!
	END as RangoSalario2
FROM empleadas;

-- subconsultas
SELECT *
FROM empleadas
WHERE salario >
	(SELECT CASE 
				WHEN pais = "España" THEN 1000
                WHEN pais = "Francia" THEN 2000
                ELSE 1500
                END); -- No hace falta alias porque no va a salir.

-- JOINS

SELECT * FROM empleadas
CROSS JOIN empleadasenproyectos;

SELECT em.nombre, ep.id_proyecto
FROM empleadas as em
CROSS JOIN empleadasenproyectos as ep;

-- COGER TODAS CON EL CROSS JOIN
SELECT * FROM empleadas as em
CROSS JOIN empleadasenproyectos as ep
WHERE em.id_empleada = ep.id_empleada;

-- NATURAL JOIN. Todas las combinaciones posibles de estas dos tablas.
-- Es la parte común de las dos tablas.
SELECT * FROM empleadas as em
NATURAL JOIN empleadasenproyectos as ep;

-- INNER JOIN, COLUMNA EN COMUN ENTRE DOS TABLAS:
SELECT * FROM empleadas as em
INNER JOIN empleadasenproyectos as ep
ON em.id_empleada = ep.id_empleada;
-- El natural join no repite las columnas en comun, el inner si.

-- LEFT JOIN 
SELECT * FROM empleadas as em
LEFT JOIN empleadasenproyectos as ep
ON em.id_empleada = ep.id_empleada;

-- RIGHT JOIN
SELECT * FROM empleadas as em
RIGHT JOIN empleadasenproyectos as ep
ON em.id_empleada = ep.id_empleada;

-- 
USE tienda;

SELECT ct.customer_name, ct.customer_number, ct.city, od.* 
FROM customers as ct 
NATURAL JOIN orders as od
WHERE od.status <> "Shipped" AND  ct.city = "Madrid"
LIMIT 10;
