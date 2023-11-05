-- estaciones: id, nombre, fecha_inauguracion, linea_id, color_estacion
-- lineas: id, color, anio 
-- reportes_estaciones: id, estacion_id, fecha_hora, reporte_id, reportador_id
-- reporte: id, fecha_hora, codigo_id, comentario, reportador_id
-- reportador: id, nombres, apellidos, sueldo

--sql para crear esta base de datos:

create database metro_stgo; -- crea la base de datos

\c metro_stgo; -- conecta a la base de datos

create extension if not exists "uuid-ossp"; -- crea la extension para poder usar uuid

--CODIGOS
--LINEAS
--ESTACIONES
--REPORTE
--REPORTADORES
--REPORTES_ESATCIONES 


create table estaciones(
    -- se crea la tabla estaciones
    id varchar(5) not null,
    nombre varchar(30) not null,
    fecha_inauguracion date not null,
    linea_id varchar(3) not null,
    color_estacion varchar(5),
    primary key (id)
    foreign key (linea_id) references lineas(id)
);

create table lineas(
    -- se crea la tabla lineas
    id varchar(3) not null,
    color varchar(20) not null,
    anio date not null,
    primary key (id)
);

create table reportes_estaciones(
    -- se crea la tabla reportes_estaciones
    id serial not null,
    estacion_id varchar(4) not null,
    fecha_hora timestamp not null,
    reporte_id int not null,
    reportador_id varchar(10) not null,
    primary key (id),
    foreign key (estacion_id) references estaciones(id),
    foreign key (reportador_id) references reportador(id),
    foreign key (reporte_id) references reporte(id)
);

create table reporte(
    -- se crea la tabla reporte 
    id serial not null,
    fecha_hora timestamp not null,
    codigo_id varchar(10) not null,
    comentario varchar(255) not null,
    reportador_id varchar(10) not null,
    primary key (id),
    foreign key (reportador_id) references reportador(id),
    foreign key (codigo_id) references codigo(id)
);

create table reportador(
    -- se crea la tabla reportador
    id varchar(10) not null,
    nombres varchar(50) not null,
    apellidos varchar(50) not null,
    sueldo int not null,
    primary key (id)
);

create table codigos(
    -- se crea la tabla reportador
    id varchar(10) not null,
    descripcion varchar(255) not null,
    primary key (id)
);

insert into lineas (id, color, anio) values
("L1", "ROJA", "1969/09/04"),
("L2", "AMARILLA", "1978/01/31"),
("L3", "VERDE-OLIVO", "2019/01/22"),
("L4", "AZUL", "2005/11/30"),
("L4A", "CELESTE", "2006/08/16"),
("L5", "VERDE", "1997/04/05"),
("L6", "MORADO", "2017/11/02");

insert into estaciones (id, nombre, fecha_inauguracion, linea_id, color_estacion) values
-- Linea 1
("L1-1", "San Pablo", "1975/09/15", "L1", "COMUN"),
("L1-2", "Neptuno", "1975/09/15", "L1", "COMUN"),
("L1-3", "Pajaritos", "1975/09/15", "L1", "COMUN"),
("L1-4", "Las Rejas", "1975/09/15", "L1", "COMUN"),
("L1-5", "Ecuador", "1975/09/15", "L1", "COMUN"),
("L1-6", "San Alberto Hurtado", "1975/09/15", "L1", "COMUN"),
("L1-7", "Universidad de Santiago", "1975/09/15", "L1", "COMUN"),
("L1-8", "Estación Central", "1975/09/15", "L1", "COMUN"),
("L1-9", "Unión Latinoamericana", "1975/09/15", "L1", "COMUN"),
("L1-10", "República", "1975/09/15", "L1", "COMUN"),
("L1-11", "Los Héroes", "1975/09/15", "L1", "COMUN"),
("L1-12", "La Moneda", "1975/09/15", "L1", "COMUN"),
("L1-13", "Universidad de Chile", "1977/03/31", "L1", "COMUN"),
("L1-14", "Santa Lucía", "1977/03/31", "L1", "COMUN"),
("L1-15", "Universidad Católica", "1977/03/31", "L1", "COMUN"),
("L1-16", "Baquedano", "1977/03/31", "L1", "COMUN"),
("L1-17", "Salvador", "1977/03/31", "L1", "COMUN"),
("L1-18", "Manuel Montt", "1978/08/31", "L1", "COMUN"),
("L1-19", "Pedro de Valdivia", "1978/08/31", "L1", "COMUN"),
("L1-20", "Los Leones", "1978/08/31", "L1", "COMUN"),
("L1-21", "Tobalaba", "1978/08/31", "L1", "COMUN"),
("L1-22", "El Golf", "1978/08/31", "L1", "COMUN"),
("L1-23", "Alcántara", "1978/08/31", "L1", "COMUN"),
("L1-24", "Escuela Militar", "1978/08/31", "L1", "COMUN"),
("L1-25", "Manquehue", "2010/01/07", "L1", "COMUN"),
("L1-26", "Hernando de Magallanes", "2010/01/07", "L1", "COMUN"),
("L1-27", "Los Dominicos", "2010/01/07", "L1", "COMUN"),

-- Linea 2
("L2-1", "Vespucio Norte", "1978/02/14", "L2", "COMUN"),
("L2-2", "Zapadores", "1978/02/14", "L2", "COMUN"),
("L2-3", "Dorsal", "1978/02/14", "L2", "ROJO"),
("L2-4", "Einstein", "1978/02/14", "L2", "VERDE"),
("L2-5", "Cementerios", "1978/02/14", "L2", "ROJO"),
("L2-6", "Cerro Blanco", "1978/02/14", "L2", "VERDE"),
("L2-7", "Patronato", "1978/02/14", "L2", "ROJO"),
("L2-8", "Puente Cal y Canto", "1978/02/14", "L2", "COMUN"),
("L2-9", "Santa Ana", "1978/02/14", "L2", "COMUN"),
("L2-10", "Los Héroes", "1978/02/14", "L2", "COMUN"),
("L2-11", "Toesca", "1978/02/14", "L2", "VERDE"),
("L2-12", "Parque O'Higgins", "1978/02/14", "L2", "ROJO"),
("L2-13", "Rondizzoni", "1978/02/14", "L2", "VERDE"),
("L2-14", "Franklin", "1978/02/14", "L2", "COMUN"),
("L2-15", "El Llano", "1978/02/14", "L2", "ROJO"),
("L2-16", "San Miguel", "1978/02/14", "L2", "VERDE"),
("L2-17", "Lo Vial", "1978/02/14", "L2", "ROJO"),
("L2-18", "Departamental", "1978/02/14", "L2", "VERDE"),
("L2-19", "Ciudad del Niño", "1978/02/14", "L2", "ROJO"),
("L2-20", "Lo Ovalle", "1978/02/14", "L2", "COMUN"),
("L2-21", "El Parrón", "1978/02/14", "L2", "VERDE"),
("L2-22", "La Cisterna", "1978/02/14", "L2", "COMUN"),

-- Linea 3
("L3-1", "Los Libertadores", "2019/01/22", "L3", "COMUN"),
("L3-2", "Cardenal Caro", "2019/01/22", "L3", "COMUN"),
("L3-3", "Vivaceta", "2019/01/22", "L3", "COMUN"),
("L3-4", "Conchalí", "2019/01/22", "L3", "COMUN"),
("L3-5", "Plaza Chacabuco", "2019/01/22", "L3", "COMUN"),
("L3-6", "Puente Cal y Canto", "2019/01/22", "L3", "COMUN"),
("L3-7", "Plaza de Armas", "2019/01/22", "L3", "COMUN"),
("L3-8", "Universidad de Chile", "2019/01/22", "L3", "COMUN"),
("L3-9", "Parque Almagro", "2019/01/22", "L3", "COMUN"),
("L3-10", "Matta", "2019/01/22", "L3", "COMUN"),
("L3-11", "Irarrázaval", "2019/01/22", "L3", "COMUN"),
("L3-12", "Monseñor Eyzaguirre", "2019/01/22", "L3", "COMUN"),
("L3-13", "Ñuñoa", "2019/01/22", "L3", "COMUN"),
("L3-14", "Chile España", "2019/01/22", "L3", "COMUN"),
("L3-15", "Villa Frei", "2019/01/22", "L3", "COMUN"),
("L3-16", "Plaza Egaña", "2019/01/22", "L3", "COMUN"),
("L3-17", "Fernando Castillo Velazco", "L3", "COMUN"),

-- Linea 4
("L4-1", "Tobalaba", "2005/11/30", "L4", "COMUN"),
("L4-2", "Cristóbal Colón", "2005/11/30", "L4", "VERDE"),
("L4-3", "Francisco Bilbao", "2005/11/30", "L4", "COMUN"),
("L4-4", "Príncipe de Gales", "2005/11/30", "L4", "ROJO"),
("L4-5", "Simón Bolívar", "2005/11/30", "L4", "VERDE"),
("L4-6", "Plaza Egaña", "2005/11/30", "L4", "COMUN"),
("L4-7", "Los Orientales", "2005/11/30", "L4", "ROJO"),
("L4-8", "Grecia", "2005/11/30", "L4", "VERDE"),
("L4-9", "Los Presidentes", "2005/11/30", "L4", "ROJO"),
("L4-10", "Quilín", "2005/11/30", "L4", "VERDE"),
("L4-11", "Las Torres", "2005/11/30", "L4", "ROJO"),
("L4-12", "Macul", "2005/11/30", "L4", "COMUN"),
("L4-13", "Vicuña Mackenna", "2005/11/30", "L4", "COMUN"),
("L4-14", "Vicente Valdés", "2005/11/30", "L4", "COMUN"),
("L4-15", "Rojas Magallanes", "2005/11/30", "L4", "VERDE"),
("L4-16", "Trinidad", "2005/11/30", "L4", "ROJO"),
("L4-17", "San José de la Estrella", "2005/11/30", "L4", "VERDE"),
("L4-18", "Los Quillayes", "2005/11/30", "L4", "ROJO"),
("L4-19", "Elisa Correa", "2005/11/30", "L4", "COMUN"),
("L4-20", "Hospital Sotero del Rio", "2005/11/30", "L4", "COMUN"),
("L4-21", "Protectora de la Infancia", "2005/11/30", "L4", "VERDE"),
("L4-22", "Las Mercedes", "2005/11/30", "L4", "ROJO"),
("L4-23", "Plaza de Puente Alto", "2005/11/30", "L4", "COMUN"),

-- Linea 4A
("L4A-1", "La Cisterna", "2005/11/30", "L4A", "COMUN"),
("L4A-2", "San Ramon", "2005/11/30", "L4A", "COMUN"),
("L4A-3", "Santa Rosa", "2005/11/30", "L4A", "COMUN"),
("L4A-4", "La Granja", "2005/11/30", "L4A", "COMUN"),
("L4A-5", "Santa Julia", "2005/11/30", "L4A", "COMUN"),
("L4A-6", "Vicuña Mackenna", "2005/11/30", "L4A", "COMUN"),

-- Linea 5
("L5-1", "Plaza de Maipú", "1997/04/05", "L5", "COMUN"),
("L5-2", "Santiago Bueras", "1997/04/05", "L5", "COMUN"),
("L5-3", "Del Sol", "1997/04/05", "L5", "COMUN"),
("L5-4", "Monte Tabor", "1997/04/05", "L5", "COMUN"),
("L5-5", "Plaza de Maipú", "2005/04/05", "L5", "COMUN"),
("L5-6", "Santiago Bueras", "2005/04/05", "L5", "ROJO"),
("L5-7", "Del Sol", "2005/04/05", "L5", "VERDE"),
("L5-8", "Monte Tabor", "2005/04/05", "L5", "ROJO"),
("L5-9", "Las Parcelas", "2005/04/05", "L5", "VERDE"),
("L5-10", "Laguna Sur", "2005/04/05", "L5", "COMUN"),
("L5-11", "Barrancas", "2005/04/05", "L5", "ROJO"),
("L5-12", "Pudahuel", "2005/04/05", "L5", "COMUN"),
("L5-13", "San Pablo", "2005/04/05", "L5", "COMUN"),
("L5-14", "Lo Prado", "2005/04/05", "L5", "VERDE"),
("L5-15", "Blanqueado", "2005/04/05", "L5", "ROJO"),
("L5-16", "Gruta de Lourdes", "2005/04/05", "L5", "VERDE"),
("L5-17", "Quinta Normal", "2005/04/05", "L5", "ROJO"),
("L5-18", "Cumming", "2005/04/05", "L5", "VERDE"),
("L5-19", "Santa Ana", "2005/04/05", "L5", "COMUN"),
("L5-20", "Plaza de Armas", "2005/04/05", "L5", "COMUN"),
("L5-21", "Bellas Artes", "2005/04/05", "L5", "COMUN"),
("L5-22", "Baquedano", "2005/04/05", "L5", "COMUN"),
("L5-23", "Parque Bustamante", "2005/04/05", "L5", "ROJO"),
("L5-24", "Santa Isabel", "2005/04/05", "L5", "VERDE"),
("L5-25", "Irarrázaval", "2005/04/05", "L5", "COMUN"),
("L5-26", "Nuble", "2005/04/05", "L5", "COMUN"),
("L5-27", "Rodrigo de Araya", "2005/04/05", "L5", "VERDE"),
("L5-28", "Carlos Valdovinos", "2005/04/05", "L5", "ROJO"),
("L5-29", "Camino Agrícola", "2005/04/05", "L5", "VERDE"),
("L5-30", "San Joaquín", "2005/04/05", "L5", "ROJO"),
("L5-31", "Pedrero", "2005/04/05", "L5", "VERDE"),
("L5-32", "Mirador", "2005/04/05", "L5", "ROJO"),
("L5-33", "Bellavista de La Florida", "2005/04/05", "L5", "COMUN"),
("L5-34", "Vicente Valdés", "2005/04/05", "L5", "COMUN"),

-- Linea 6
("L6-1", "Cerrillos", "2017/11/02", "L6", "COMUN"),
("L6-2", "Pedro Aguirre Cerda", "2017/11/02", "L6", "COMUN"),
("L6-3", "Franklin", "2017/11/02", "L6", "COMUN"),
("L6-4", "Bio Bio", "2017/11/02", "L6", "COMUN"),
("L6-5", "Ñuble", "2017/11/02", "L6", "COMUN"),
("L6-6", "Estadio Nacional", "2017/11/02", "L6", "COMUN"),
("L6-7", "Ñuñoa", "2017/11/02", "L6", "COMUN"),
("L6-8", "Inés de Suárez", "2017/11/02", "L6", "COMUN"),
("L6-9", "Los Leones", "2017/11/02", "L6", "COMUN");
