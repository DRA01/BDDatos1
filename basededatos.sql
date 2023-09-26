CREATE DATABASE empresa;
USE empresa;

CREATE TABLE IF NOT EXISTS personas 
    (id_personas int NOT NULL auto_increment,
    ApyN varchar(50),
    email varchar(20),
    telefono varchar(20),
    dni int,
    PRIMARY KEY (id_personas));

CREATE TABLE IF NOT EXISTS clientes 
    (id_clientes int NOT NULL auto_increment,
    tarjeta int,
    credito int,
    id_personas int,
    PRIMARY KEY (id_clientes),
    FOREIGN KEY (id_personas) REFERENCES personas (id_personas));

CREATE TABLE detalles
    (id_productos int NOT NULL auto_increment,
    id_producto int,
    id_factura)

CREATE TABLE facturas 
    (id_Factura int NOT NULL auto_increment,
    cod_factura varchar(10) NOT NULL,
    total int,
    id_clientes int,
    PRIMARY KEY (id_Factura),
    FOREIGN KEY (id_clientes) REFERENCES clientes (id_clientes));



CREATE TABLE empleados 
    (id_empleado int NOT NULL auto_increment,
    categoria varchar(20),
    sueldo int,
    id_personas int,
    PRIMARY KEY (id_empleado),
    FOREIGN KEY (id_personas) REFERENCES personas (id_personas)
    );

INSERT INTO clientes (tarjeta, credito, id_personas)
    VALUES 
        ('1111', '40000', '1'),
        ('2222', '50000', '2'),
        ('3333', '60000', '3'),
        ('4444', '70000', '4'),
        ('5555', '80000', '5'),
        ('6666', '90000', '6'),
        ('7777', '100000', '7')
        ;


INSERT INTO facturas (cod_factura, total, id_clientes)
    VALUES
        ('fEmp01', '15000', '4'),
        ('fEmp02', '1800', '4'),
        ('fEmp03', '2000', '1'),
        ('fEmp04', '5900', '2'),
        ('fEmp05', '7800', '3'),
INSERT INTO facturas (cod_factura)
    VALUES
        UPDATE facturas SET cod_factura = 'fEmp06'WHERE id_Factura = 6; 
        UPDATE facturas SET cod_factura = 'fEmp07'WHERE id_Factura = 7;
        UPDATE facturas SET cod_factura = 'fEmp08'WHERE id_Factura = 8;
        UPDATE facturas SET cod_factura = 'fEmp09'WHERE id_Factura = 9;

INSERT INTO productos (codigo, nombre, descripcion, precio) 
    VALUES
        ('abl001', 'mouse', 'Mouse generico para Pc', '1500'),
        ('abl002', 'teclado', 'Teclado mecanico TKL con switches outemu blue', '5000'),
        ('abl003', 'parlante', 'Parlante Logitech 8000wts de potencia surround', '3500')
        ;



/*CREATE TABLE productos 
    (id_prod int NOT NULL auto_increment,
    precio int,
    stock int
    );*/

/*INNER JOIN de tabla clientes y personas.*/
SELECT clientes.tarjeta, personas.ApyN, clientes.credito FROM clientes inner join personas
on clientes.id_personas = personas.id_personas;

/*INNER JOIN de tabla facturas y clientes.*/
SELECT facturas.cod_factura, facturas.total, clientes.tarjeta FROM facturas inner join clientes
on facturas.id_clientes = clientes.id_clientes;


/*ALTER TABLE clientes ADD CONSTRAINT id_clientes PRIMARY KEY (id_clientes);
ALTER TABLE personas ADD CONSTRAINT dni PRIMARY KEY (dni);
ALTER TABLE empleados ADD CONSTRAINT id_empleado PRIMARY KEY (id_empleado);
ALTER TABLE facturas ADD CONSTRAINT n_Factura PRIMARY KEY (n_Factura);


ALTER TABLE clientes ADD CONSTRAINT dni FOREIGN KEY (dni) REFERENCES personas (dni);
ALTER TABLE facturas ADD CONSTRAINT id_clientes FOREIGN KEY (id_clientes) REFERENCES clientes (id_clientes);
ALTER TABLE empleados ADD CONSTRAINT dni FOREIGN KEY (id_clientes) REFERENCES personas (dni);
*/
INSERT INTO personas (ApyN, email, telefono, dni)
    VALUES
        ('Marcelo Tinelli', 'ads@gmail.com', '32132122', '57127813');
        ('Pepe Argento', 'LKD@gmail.com', '25689503', '10257349'),
        ('Juan Roman Riquelme', 'JRM10@gmail.com','55423698', '39456321'),
        ('Calos Saul Menem', 'Carlitos@gmail.com', '01352695', '23529567'),
        ('Ricardo Fort', 'Fort@gmail.com', '74120325', '65423589');




/*// ALTER TABLE nombre.tabla ADD CONSTRAINT nombre_campo PRIMARY KEY (nombre_campo); 
(crear la relacion / llave primaria)//
// ALTER TABLE nombre.tabla ADD CONSTRAINT nombre_campo FOREIGN KEY (nombre_campo);
(llave secundaria)*/


/*19-9-23
 ELIMINAMOS TODAS LAS BDD QUE AGREGAMOS ANTERIORMENTE
*/
DROP DATABASE clase_prueba
DROP DATABASE empresa
DROP DATABASE sqljava
DROP DATABASE clientes
DROP DATABASE test

/* CREAMOS UN USUARIO PARA LA BDD */

CREATE USER 'clases'@'localhost' IDENTIFIED BY '123456';

CREATE TABLE `prueba1`.`escuela` 
    (`nombre` VARCHAR(20) NOT NULL , `edad` INT(10) NOT NULL ,
    `dni` VARCHAR(10) NOT NULL , `telefono` VARCHAR(10) NOT NULL );


    /*Creamos el User "tinelli" de prueba para darle permisos y agregar registros */

CREATE USER 'tinelli'@'localhost' IDENTIFIED BY 'Admin123456';
CREATE DATABASE db_tinelli;
GRANT ALL PRIVILEGES ON db_tinelli.* TO 'tinelli'@'localhost';

CREATE TABLE IF NOT EXISTS tb_hq 
    (id_hq int NOT NULL auto_increment,
    nom varchar(20),
    dni int,
    email varchar(30),
    PRIMARY KEY (id_hq));

CREATE TABLE IF NOT EXISTS tb_estudio1
    (id_estudio1 int NOT NULL auto_increment,
    categoria varchar(20),
    sueldo int,
    id_hq INT,
    PRIMARY KEY (id_estudio1),
    FOREIGN KEY (id_hq) REFERENCES tb_hq (id_hq) ON DELETE CASCADE);

CREATE TABLE IF NOT EXISTS tb_estudio2
    (id_estudio2 int NOT NULL auto_increment,
    categoria varchar (20),
    sueldo int,
    id_hq int,
    PRIMARY KEY (id_estudio2),
    FOREIGN KEY (id_hq) REFERENCES tb_hq (id_hq) ON DELETE CASCADE);

INSERT INTO tb_hq (nom, dni, email)
    VALUES
        ('Marcelo Tinelli','41511', 'ads@gmail.com'),
        ('Pepe Argento','41056', 'LKD@gmail.com'),
        ('Juan Roman Riquelme','94100', 'JRM10@gmail.com'),
        ('Calos Saul Menem','30145', 'Carlitos@gmail.com'),
        ('Ricardo Fort','14840', 'Fort@gmail.com'),
        ('Susana Gimenez','79821','SSG@gmail.com'),
        ('Pablo Escobar','44810','PEG@gmail.com'),
        ('Liliana Calabro','12014','Calabro@gmail.com'),
        ('Alacran','54789','Alacran@gmail.com'),
        ('Boby Goma','54101','Boby@gmail.com');

INSERT INTO tb_estudio1 (id_hq, categoria, sueldo)
    VALUES
        (2, 'reidor', 200),
        (4, 'esclavo', 250),
        (6, 'bailarin', 450),
        (8, 'reidor', 270),
        (10, 'esclavo', 150);

INSERT INTO tb_estudio2 (id_hq, categoria, sueldo)
    VALUES
        (1, 'bailarin', 480),
        (3, 'reidor', 280),
        (5, 'esclavo', 160),
        (7, 'bailarin', 460),
        (9, 'reidor', 240);

/* 26-09-23 */

SELECT id_hq FROM tb_hq;
SELECT * FROM tb_estudio1;

INSERT INTO tb_hq (nom, dni, email)
    VALUES
        ('Fernando De La Rua', '78521', 'DeLaRua@gmail.com');

INSERT INTO tb_estudio2 (id_hq, categoria, sueldo)
    VALUES
        (11, 'Invitado', 10);

/* Dominios generales para todos 

Base de Datos: db_(nombre)
Tabla: tb_(nombre)
Identificador: id_(nombre) */

/* Inner join para sacar el sueldo de "De La Rua" */
/*
¿que quiero seleccionar?  ¿de donde? donde quiero relacionar    donde esta la relacion          condicion que pusimos para que devuelva el sueldo de De La Rua
|-----------------------||----------||---------------------|----------------------------------||-----------------------|*/
SELECT tb_estudio2.sueldo FROM tb_hq inner join tb_estudio2 on tb_hq.id_hq = tb_estudio2.id_hq WHERE tb_hq.id_hq = 11;

SELECT tb_estudio2.sueldo tb_estudio1.sueldo FROM tb_hq inner join tb_estudio2 on tb_hq.id_hq = tb_estudio2.id_hq
inner join tb_estudio1 on tb_hq.id_hq = tb_estudio1.id_hq WHERE tb_estudio2.sueldo > 100 AND tb_estudio1.sueldo > 100;

SELECT * FROM tb_hq WHERE id_hq > 5 AND id_hq < 8;

CREATE DATABASE db_videoclub
CREATE TABLE IF NOT EXISTS tb_pelis

INSERT INTO tb_pelis (codigo int, nom varchar(20), genero varchar(20), years int,
    director varchar(20), estudio varchar(20), duracion time, clasificacion varchar(20))