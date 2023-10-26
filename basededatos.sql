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

                                        /* 28-09-23 */


/* Cramos la base de datos para poder normalizarla mientras le vamos dando los datos correspondientes */                                        

CREATE DATABASE videoclub;
USE videoclub;
CREATE TABLE IF NOT EXISTS pelis
    (nombre varchar(50),
    anio int (4),
    duracion time, 
    estudio varchar(10),
    clasificacion varchar(4),
    codigo varchar(4));

INSERT INTO pelis (nombre, anio, duracion, estudio, clasificacion, codigo)
    VALUES
        ('Harry Potter', 2001, '2H', 'Warner Bros', 'PG', 'P001'),
        ('Terminator', 1984, '1H', 'Warner Bros', 'PG13', 'P002'),
        ('El senior de los anillos', 2001, '5H', 'Warner Bros', 'PG15', 'P003');

CREATE TABLE IF NOT EXISTS generos
    (tipo varchar (10),
    cod_genero varchar(4),
    codigo varchar(4)
    );

INSERT INTO generos (tipo, cod_genero, codigo)
    VALUES
        ('Fantasia', 'G001','P001'),
        ('Accion', 'G002', 'P002'),
        ('Fantasia', 'G003', 'P003');

CREATE TABLE IF NOT EXISTS pelis_generos
    (cod_genero varchar(4),
    codigo varchar(4));



CREATE TABLE IF NOT EXISTS directores
    (nombre varchar(40),
    cod_director varchar(4),
    nacionalidad varchar(20));

CREATE TABLE IF NOT EXISTS pelis_director
    (cod_director varchar(4),
    codigo varchar(4));


/*-----------------------------------------------------------------------------------*/

CREATE DATABASE verduleria;
USE verduleria;

CREATE DATABASE IF NOT EXISTS productos
    (nombre, 
    precio_x_kg,
    precio_x_caja,
    cod_producto);

CREATE TABLE sede
    (code_sede,
    nombre,
    direccion);

CREATE TABLE curso 
    (code_curso,
    tipo,
    nombre);

CREATE TABLE sede_curso
    (code_sede,
    code_curso);

CREATE TABLE dias



CREATE TABLE horarios
    (code_horarios,
    dia,
    )

/* 10-10-23 */

CREATE DATABASE bd_negocio;
USE bd_negocio;

CREATE TABLE IF NOT EXISTS tb_articulos
    (cod_articulo varchar(6) NOT NULL, 
    nombre varchar(20),
    marca varchar(20),
    precio int,
    CONSTRAINT pk_articulos PRIMARY KEY (cod_articulo));

CREATE TABLE IF NOT EXISTS tb_proveedores
    (proveedor varchar(20),
    tel_prov int,
    cuit_prov int,
    CONSTRAINT pk_proveedores PRIMARY KEY (cuit_prov));


CREATE TABLE IF NOT EXISTS tb_art_prov
    (cod_articulo varchar(6) NOT NULL,
    cuit_prov int,
    CONSTRAINT pk_artprov PRIMARY KEY (cod_articulo , cuit_prov),
    FOREIGN KEY (cod_articulo) REFERENCES tb_articulos (cod_articulo),
    FOREIGN KEY (cuit_prov) REFERENCES tb_proveedores (cuit_prov));

/*---------------------------------------------------------------------------------*/

CREATE DATABASE IF NOT EXISTS db_hospital
USE db_hospital

CREATE TABLE IF NOT EXISTS tb_doctores
    (matricula varchar(10) NOT NULL,
    nombre varchar(15),
    apellidos varchar(20),
    especialidad varchar(40),
    CONSTRAINT pk_doctores PRIMARY KEY (matricula));

CREATE TABLE IF NOT EXISTS tb_pacientes
    (dni int(10) NOT NULL,
    nombre varchar(20),
    apellidos varchar(20),
    telefono int,
    CONSTRAINT pk_pacientes PRIMARY KEY (dni));

CREATE TABLE IF NO EXISTS tb_turnos
    (dni int(10) NOT NULL,
    matricula varchar(10) NOT NULL,
    fecha DATE.
    hora TIME,
    CONSTRAINT pk_turnos PRIMARY KEY (dni, matricula),
    FOREIGN KEY (matricula) REFERENCES tb_doctores (matricula)
    FOREIGN KEY (dni) REFERENCES tb_pacientes (dni));

/*------------------------------------------------------------------------*/

/* 12-10-23 */


CREATE DATABASE IF NOT EXISTS db_peluqueria;
USE db_estetica;

CREATE  TABLE IF NOT EXISTS tb_clientes
    (dni int NOT NULL,
    telefono INT,
    nombre VARCHAR(20),
    CONSTRAINT pk_clientes PRIMARY KEY (dni));

CREATE TABLE IF NOT EXISTS tb_mascotas
    (id_mascota varchar(6) NOT NULL,
    dni INT NOT NULL,
    nombre varchar(20),
    edad int,
    peso int,
    CONSTRAINT pk_mascotas PRIMARY KEY (id_mascota),
    FOREIGN KEY (dni) REFERENCES tb_clientes (dni));


CREATE TABLE IF NOT EXISTS tb_animales
    (id_animal varchar(6) NOT NULL,
    raza varchar(20),
    id_mascota VARCHAR(6) NOT NULL,
    CONSTRAINT pk_animales PRIMARY KEY (id_animal),
    FOREIGN KEY (id_mascota) REFERENCES tb_mascotas (id_mascota));

CREATE TABLE IF NOT EXISTS tb_turnos
    (id_turno
    id_mascota VARCHAR(6) NOT NULL,
    hora TIME,
    precio int,
    CONSTRAINT pk_turnos PRIMARY KEY (id_mascota),
    FOREIGN KEY (id_mascota) REFERENCES tb_mascotas (id_mascota));


CREATE DATABASE IF NOT EXISTS db_transcacho;
USE db_transcacho;



DELIMITER $$

CREATE PROCEDURE CrearCuenta(
    nom VARCHAR(40),
    ape VARCHAR(40),
    telefono varchar(20),
    descr varchar(40)
)
BEGIN 
    DECLARE ultimo_id INT DEFAULT 0;
    START TRANSACTION;
    -- Inserta datos en la cuenta
    INSERT INTO tb_cuentas (nombre, apellido)
        VALUES
            (nom, ape);
    SET ultimo_id = LAST_INSERT_ID();
    IF ultimo_id > 0 THEN 
        INSERT INTO tb_telefonos (id_cuentas, telefono, descripcion)
            VALUES
                (ultimo_id, telefono, descr);
        COMMIT;
    ELSE 
        ROLLBACK;
    END IF;
END$$

DELIMITER;

/* 26-10-23 */



