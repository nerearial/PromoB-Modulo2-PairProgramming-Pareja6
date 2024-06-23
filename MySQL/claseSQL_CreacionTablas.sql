-- LECCIÓN CREACIÓN DE TABLAS

-- CREAREMOS UN ESQUEMA DE PRÁCTICA, UNA BBDD = ESQUEMA

CREATE SCHEMA CLASE_1_PROMO_B;

USE CLASE_1_PROMO_B;

CREATE TABLE alumnas (
	id_alumnas INT,
    nombre VARCHAR(20),
    mail VARCHAR(40),
    telf VARCHAR(9)
    )
    
USE CLASE_1_PROMO_B;

CREATE TABLE alumnas_2 (
	id_alumnas INT,
    nombre VARCHAR(20),
    mail VARCHAR(40),
    telf VARCHAR(9));
    
CREATE TABLE alumnas_3 (
	id_alumnas INT NOT NULL AUTO_INCREMENT,
    -- el auto_increment no lo introducimos nosotros, lo va asignando el SQL
    nombre VARCHAR(20),
    mail VARCHAR(40) NOT NULL, -- esto es para que nos exija rellenar este dato
    telf VARCHAR(9) UNIQUE, -- tiene que ser datos únicos
    -- telf VARCHAR(9) DEFALT ("DESCONOCIDO"), que asigne un dato por defecto 
    -- una PK NO puede ser nula y tiene que ser única. 
    PRIMARY KEY (id_alumnas)
    -- con PK compuesta sería (id_alumnas, otra)
    );
    
    CREATE TABLE alumnas_4 (
	id_alumnas INT AUTO_INCREMENT, -- COLUMNA CON EL ID
    nombre VARCHAR(20), -- OTRO COMENTARIO
    -- ESTO ES LA DESCRIPCIÓN DE ESTA COLUMNA
    mail VARCHAR(40) NOT NULL,
    telf VARCHAR(9) UNIQUE,
    PRIMARY KEY (id_alumnas)
    ); 
    
    CREATE TABLE notas (
		id_alumnas INT,
        modulo VARCHAR(20),
        nota INT,
        PRIMARY KEY (id_alumnas, modulo)
        );

    CREATE TABLE notas_2 (
		id_alumnas_notas INT,
        modulo VARCHAR(20),
        nota INT,
        PRIMARY KEY (id_alumnas_notas, modulo),
			CONSTRAINT `FK_notas2_alumnas4` -- es un alias de la restricción
			FOREIGN KEY (id_alumnas_notas)
			REFERENCES alumnas_4 (id_alumnas)
    );
        
-- PARTE 2 DE LA CLASE

CREATE SCHEMA leccion_alter;

USE leccion_alter;
    
CREATE TABLE alumnas (
	id_alumnas INT AUTO_INCREMENT, -- COLUMNA CON EL ID
    nombre VARCHAR(20), -- OTRO COMENTARIO
    -- ESTO ES LA DESCRIPCIÓN DE ESTA COLUMNA
    mail VARCHAR(40) NOT NULL,
    telf VARCHAR(9) UNIQUE,
    PRIMARY KEY (id_alumnas)
    ); 

CREATE TABLE notas (
	id_alumnas_notas INT,
    modulo VARCHAR(20),
    nota INT,
    PRIMARY KEY (id_alumnas_notas, modulo),
    CONSTRAINT `FK_notas_alumnas` -- es un alias de la restricción
		FOREIGN KEY (id_alumnas_notas)
        REFERENCES alumnas (id_alumnas)
    );

-- SINTAXIS PARA AÑADIR UNA COLUMNA: 
ALTER TABLE alumnas
ADD COLUMN provincia VARCHAR(15) NOT NULL;

-- CÓMO ELIMINAR UNA COLUMNA
ALTER TABLE alumnas
	DROP COLUMN telf;

ALTER TABLE alumnas
	ADD COLUMN telf VARCHAR(9);

ALTER TABLE alumnas
	MODIFY COLUMN telf INT;
    
ALTER TABLE alumnas
	RENAME COLUMN telf TO telefono;
    
ALTER TABLE alumnas
	CHANGE telefono telf VARCHAR(9);
    
DROP TABLE IF EXISTS alumnas_2, notas_2;

-- PARA METER DATOS EN LAS TABLAS

INSERT INTO alumnas (nombre, mail, provincia, telf)
	VALUES("Elena","elena@adalab.es","A Coruña","685673920")
    
INSERT INTO alumnas (nombre, mail, provincia, telf)
	VALUES
		("Nicole","nicole@adalab.es", "Madrid", "68789385"),
		("Luzma","luzma@adalab.es","Madrid","682340193")
        ;
    
INSERT INTO notas (id_alunas_notas, modulo, nota)
	VALUES(1,"SQL",9)
    