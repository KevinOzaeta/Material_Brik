create database ENVASADO_BRIK;
USE ENVASADO_BRIK;
CREATE TABLE PRODUCTO(
CODIGO_PRODUCTO INT PRIMARY KEY auto_increment,
NOMBRE_PRODUCTO VARCHAR(255)  NOT NULL,
PRESENTACION_PRODUCTO VARCHAR(50) NOT NULL 

);
CREATE TABLE TARIMA(
CODIGO_TARIMA INT PRIMARY KEY auto_increment,
CODIGO_PRODUCTO INT NOT NULL,
CANTIDAD_PRODUCTO INT NOT NULL,
foreign key(CODIGO_PRODUCTO) references PRODUCTO(CODIGO_PRODUCTO) 
);
CREATE TABLE PEDIDO(
CODIGO_PEDIDO INT PRIMARY KEY auto_increment,
CODIGO_TARIMA INT NOT NULL,
FECHA_PEDIDO timestamp NOT NULL DEFAULT current_timestamp,
foreign key (CODIGO_TARIMA) REFERENCES TARIMA(CODIGO_TARIMA)
);
use envasado_brik;
insert into pedido values (default,89,default);
insert into pedido values (default,90,default);
select r.nombre_producto,t.tipo_tarima,t.presentacion_producto,count(r.nombre_producto) from pedido p join tarima t on(p.codigo_tarima)=(t.codigo_tarima) join producto r on(t.codigo_producto)=(r.codigo_producto) group by r.nombre_producto order by 4 asc;
select codigo_tarima, tipo_tarima,presentacion_producto, count(codigo_tarima) from pedido join tarima using(codigo_tarima) group by codigo_tarima, tipo_tarima,presentacion_producto;
select distinct nombre_producto from pedido join tarima using(codigo_tarima) join producto using(codigo_producto);
select * from pedido where fecha_pedido between '2025-03-31 05:45:19' and '2025-03-31 05:45:37';
select * from pedido order by 3 limit 5;

