-- estaciones: id, nombre, fecha_inauguracion, linea_id, color_estacion
-- lineas: id, color, anio 
-- reportes_estaciones: id, estacion_id, fecha_hora, reporte_id, reportador_id
-- reporte: id, fecha_hora, codigo_id, comentario, reportador_id
-- reportador: id, nombres, apellidos, sueldo

--sql para crear esta base de datos:

create database metro_stgo; -- crea la base de datos
\c metro_stgo; -- conecta a la base de datos

create extension if not exists "uuid-ossp"; -- crea la extension para poder usar uuid

create table estaciones(
    id varchar(4) not null,
    nombre varchar(30) not null,
    fecha_inauguracion date not null,
    linea_id varchar(3) not null,
    color_estacion varchar(5),
    primary key (id)
    foreign key (linea_id) references lineas(id)
)

create table lineas(
    id varchar(3) not null,
    color varchar(20) not null,
    anio date not null,
    primary key (id)
)

create table reportes_estaciones(
    id serial not null,
    estacion_id varchar(4) not null,
    fecha_hora timestamp not null,
    reporte_id int not null,
    reportador_id varchar(10) not null,
    primary key (id),
    foreign key (estacion_id) references estaciones(id),
    foreign key (reportador_id) references reportador(id),
    foreign key (reporte_id) references reporte(id)
)

create table reporte(
    id serial not null,
    fecha_hora timestamp not null,
    codigo_id varchar(10) not null,
    comentario varchar(255) not null,
    reportador_id varchar(10) not null,
    primary key (id),
    foreign key (reportador_id) references reportador(id),
    foreign key (codigo_id) references codigo(id)
)

create table reportador(
    id varchar(10) not null,
    nombres varchar(50) not null,
    apellidos varchar(50) not null,
    sueldo int not null,
    primary key (id)
)

create table codigos(
    id varchar(10) not null,
    descripcion varchar(255) not null,
    primary key (id)
)

