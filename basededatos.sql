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

CREATE TABLE 'detalle'
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




/*CREATE TABLE productos 
    (id_prod int NOT NULL auto_increment,
    precio int,
    stock int
    );*/

/*INNER JOIN de tabla clientes y personas.*/
SELECT clientes.tarjeta, personas.ApyN, clientes.credito FROM clientes inner join personas on clientes.id_personas = personas.id_personas;

/*INNER JOIN de tabla facturas y clientes.*/
SELECT facturas.cod_factura, facturas.total, clientes.tarjeta FROM facturas inner join clientes on facturas.id_clientes = clientes.id_clientes;



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
