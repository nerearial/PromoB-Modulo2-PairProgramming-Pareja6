CREATE SCHEMA ejercicios_2;

USE ejercicios_2;

CREATE TABLE empleadas (
	id_empleada INT AUTO_INCREMENT,
    nombre VARCHAR(20),
    apellido VARCHAR(20),
    pais VARCHAR(20),
    salario INT,
    PRIMARY KEY (id_empleada)
    );

CREATE TABLE Personas2 (
    id INT NOT NULL,
    apellido VARCHAR(255) NOT NULL,
    nombre VARCHAR(255),
    ciudad varchar(255) DEFAULT 'Madrid',
	edad INT,
		CONSTRAINT ´mirar_edad´
        CHECK (edad>16),
	PRIMARY KEY (id)
);

CREATE TABLE Empleadas_en_proyectos(
	id_proyecto INT,
    id_empleada INT,
    CONSTRAINT ´Fk_empleadas_en_proyectos_id_empleadas´
		FOREIGN KEY (id_empleada)
        REFERENCES empleadas (id_empleada),
PRIMARY KEY (id_proyecto)
);
