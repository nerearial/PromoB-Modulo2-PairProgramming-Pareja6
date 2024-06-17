CREATE SCHEMA ejercicios_2;

USE ejercicios_2;
-- Ejercicio 1
CREATE TABLE empleadas (
	id_empleada INT AUTO_INCREMENT,
    nombre VARCHAR(20),
    apellido VARCHAR(20),
    pais VARCHAR(20),
    salario INT,
    PRIMARY KEY (id_empleada)
    );

-- Ejercicio 2
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

-- Ejercicio 3 

CREATE TABLE Empleadas_en_proyectos (
	id_proyecto INT,
    id_empleada INT,
    CONSTRAINT ´Fk_empleadas_en_proyectos_id_empleadas´
		FOREIGN KEY (id_empleada)
        REFERENCES empleadas (id_empleada),
PRIMARY KEY (id_proyecto)
);

-- Ejercicio 4 

CREATE SCHEMA creacion_tienda;
USE creacion_tienda;

CREATE TABLE customers (
	id_customer INT AUTO_INCREMENT,
    customer_name VARCHAR(20),
    PRIMARY KEY (id_customer)
);

-- Ejercicio 5

CREATE TABLE employees (
	id_employee INT AUTO_INCREMENT,
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    PRIMARY KEY (id_employee)
);

CREATE TABLE customers2 (
	id_customer INT AUTO_INCREMENT,
    customer_name VARCHAR(20),
    PRIMARY KEY (id_customer)
);

-- Ejercicio 5

CREATE TABLE employees2 (
	id_employee INT AUTO_INCREMENT,
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    PRIMARY KEY (id_employee)
);
    
