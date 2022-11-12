-- tabla para los proveedores y sus inserciones
create table minimarket.proveedores(
	id int primary key not null auto_increment,
	nombre_contacto varchar(100) not null,
	productos_venta varchar(100) not null,
	teléfono varchar(100) not null,
	correo varchar (100) not null
	);

insert into proveedores (nombre_contacto, productos_venta, teléfono, correo)
values ("Juan Ugarte","Productos Savory","+5693678546","heladossav@gmail.com"),
("Pablo Rodriguez","artículos de aseo","+56945873423","art_aseo_pormayor@gmail.com"),
("Jeremy Pedraza","Productos Fruna","+5694579908","frunaconfites@gmail.com"),
("Ivan Medina","Productos en conseva","+5693667581","conservas-almacenero@hotmail.com"),
("Paula Zuñiga","Productos Colun","+5695878802","colun.tu.almacen@gmail.com")
;

-- tabla para los productos y sus inserciones
create table minimarket.productos(
	id int primary key not null auto_increment,
	tipo_producto varchar(100) not null,
	nombre_producto varchar(100) not null,
	marca varchar (100) not null,
	contenido_neto varchar (100),
	valor_unitario int not null,
	proveedor_id int,
	foreign key (proveedor_id) references proveedores (id)
);

insert into productos (tipo_producto, nombre_producto, marca, contenido_neto, valor_unitario, proveedor_id)
values ("Helados","Centella","Savory","",350,1),
("Confitería","tabletón","Fruna","",150,3),
("Artículos de aseo","shampoo sachet","Ballerina","50 ml",200,2),
("Artículos de aseo","Acondicionador manzanilla ","Ballerina","750 ml",1700,2),
("Abarrotes","Jurel al natural","San josé","425 g",1800,4),
("Lácteos","flan vainilla","colun","",300,5)
;

-- tabla de la venta a un cliente y sus inserciones
create table minimarket.ventas(
id int primary key not null auto_increment,
fecha date not null,
monto int not null
);

insert into ventas (fecha, monto)
values ('2022-11-09',1700),
('2022-11-07',600)
;

-- tabla intermedia // tabla para los productos vendidos y sus inserciones 

create table minimarket.ventas_productos (
	id int primary key not null auto_increment,
	venta_id int not null,
	producto_id int not null,
	cantidad int not null,
	precio_acumulado int not null,
	foreign key (producto_id) references productos (id),
	foreign key (venta_id) references ventas (id)
);

insert into ventas_productos (producto_id, cantidad, precio_acumulado,venta_id)
values (2,10,1500,1),
(1,1,200,1),
(6,2,600,2)
;

-- consultas con join

-- ¿qué productos valen menos de 1000 pesos?
select * 
from productos pr        
inner join ventas po
on pr.id = po.id
where valor_unitario < 1000;



-- ¿Qué productos vendí el 7 de noviembre?
select * 
from productos pr        
inner join ventas po
on pr.id = po.id
where fecha = '2022-11-07';



