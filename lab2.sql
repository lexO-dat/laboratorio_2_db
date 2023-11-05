-- Lucas Abello - 21450324-7
-- Laura Romero - 26575596-8
--Damian Elizondo - 21603579-8

--sql para crear esta base de datos:
CREATE DATABASE metro_stgo; -- crea la base de datos

\c metro_stgo; -- conecta a la base de datos

CREATE EXTENSION IF NOT EXISTS "uuid-ossp"; -- crea la extension para poder usar uuid

--CODIGOS
--LINEAS
--ESTACIONES
--REPORTADORES
--REPORTE
--REPORTES_ESTACIONES 

CREATE TABLE codigos(
    -- se crea la tabla reportador
    id varchar(10) NOT NULL,
    descripcion varchar(255) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE lineas(
    -- se crea la tabla lineas
    id varchar(3) NOT NULL,
    color varchar(20) NOT NULL,
    anio date NOT NULL,
    PRIMARY KEY (id)
);

-- se crea la tabla estaciones
CREATE TABLE estaciones(
    id varchar(5) NOT NULL,
    nombre varchar(30) NOT NULL,
    fecha_inauguracion date NOT NULL,
    linea_id varchar(3) NOT NULL,
    color_estacion varchar(5),
    PRIMARY KEY (id),
    FOREIGN KEY (linea_id) REFERENCES lineas(id)
);

 -- se crea la tabla reportador
CREATE TABLE reportador(
    id varchar(10) NOT NULL,
    nombres varchar(50) NOT NULL,
    apellidos varchar(50) NOT NULL,
    sueldo int NOT NULL,
    PRIMARY KEY (id)
);

-- se crea la tabla reporte
CREATE TABLE reporte(  --ID_CREA = REPORTADOR_ID 
    id serial NOT NULL,
    fecha_hora timestamp NOT NULL,
    codigo_id varchar(10) NOT NULL,
    comentario varchar(255) NOT NULL,
    reportador_id varchar(10) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (reportador_id) REFERENCES reportador(id),
    FOREIGN KEY (codigo_id) REFERENCES codigos(id)
);

-- se crea la tabla reportes_estaciones
CREATE TABLE reportes_estaciones(
    id UUID NOT NULL DEFAULT uuid_generate_v4(),
    estacion_id varchar(5) NOT NULL,
    fecha_hora timestamp NOT NULL,
    reporte_id int NOT NULL,
    reportador_id varchar(10) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (estacion_id) REFERENCES estaciones(id),
    FOREIGN KEY (reportador_id) REFERENCES reportador(id),
    FOREIGN KEY (reporte_id) REFERENCES reporte(id)
);

INSERT INTO lineas (id, color, anio) VALUES
('L1', 'ROJA', '1969/09/04'),
('L2', 'AMARILLA', '1978/01/31'),
('L3', 'CAFE', '2019/01/22'),
('L4', 'AZUL', '2005/11/30'),
('L4A', 'CELESTE', '2006/08/16'),
('L5', 'VERDE', '1997/04/05'),
('L6', 'MORADO', '2017/11/02');

-- Linea 1
INSERT INTO estaciones (id, nombre, fecha_inauguracion, linea_id, color_estacion) VALUES
('L1-1', 'San Pablo', '1975/09/15', 'L1', 'COMUN'),
('L1-2', 'Neptuno', '1975/09/15', 'L1', 'COMUN'),
('L1-3', 'Pajaritos', '1975/09/15', 'L1', 'COMUN'),
('L1-4', 'Las Rejas', '1975/09/15', 'L1', 'COMUN'),
('L1-5', 'Ecuador', '1975/09/15', 'L1', 'COMUN'),
('L1-6', 'San Alberto Hurtado', '1975/09/15', 'L1', 'COMUN'),
('L1-7', 'Universidad de Santiago', '1975/09/15', 'L1', 'COMUN'),
('L1-8', 'Estación Central', '1975/09/15', 'L1', 'COMUN'),
('L1-9', 'Unión Latinoamericana', '1975/09/15', 'L1', 'COMUN'),
('L1-10', 'República', '1975/09/15', 'L1', 'COMUN'),
('L1-11', 'Los Héroes', '1975/09/15', 'L1', 'COMUN'),
('L1-12', 'La Moneda', '1975/09/15', 'L1', 'COMUN'),
('L1-13', 'Universidad de Chile', '1977/03/31', 'L1', 'COMUN'),
('L1-14', 'Santa Lucía', '1977/03/31', 'L1', 'COMUN'),
('L1-15', 'Universidad Católica', '1977/03/31', 'L1', 'COMUN'),
('L1-16', 'Baquedano', '1977/03/31', 'L1', 'COMUN'),
('L1-17', 'Salvador', '1977/03/31', 'L1', 'COMUN'),
('L1-18', 'Manuel Montt', '1978/08/31', 'L1', 'COMUN'),
('L1-19', 'Pedro de Valdivia', '1978/08/31', 'L1', 'COMUN'),
('L1-20', 'Los Leones', '1978/08/31', 'L1', 'COMUN'),
('L1-21', 'Tobalaba', '1978/08/31', 'L1', 'COMUN'),
('L1-22', 'El Golf', '1978/08/31', 'L1', 'COMUN'),
('L1-23', 'Alcántara', '1978/08/31', 'L1', 'COMUN'),
('L1-24', 'Escuela Militar', '1978/08/31', 'L1', 'COMUN'),
('L1-25', 'Manquehue', '2010/01/07', 'L1', 'COMUN'),
('L1-26', 'Hernando de Magallanes', '2010/01/07', 'L1', 'COMUN'),
('L1-27', 'Los Dominicos', '2010/01/07', 'L1', 'COMUN');

-- Linea 2
INSERT INTO estaciones (id, nombre, fecha_inauguracion, linea_id, color_estacion) VALUES
('L2-1', 'Vespucio Norte', '2006/12/21', 'L2', 'COMUN'),
('L2-2', 'Zapadores', '2006/12/21', 'L2', 'COMUN'),
('L2-3', 'Dorsal', '2006/12/21', 'L2', 'ROJO'),
('L2-4', 'Einstein', '2005/12/25', 'L2', 'VERDE'),
('L2-5', 'Cementerios', '2005/12/25', 'L2', 'ROJO'),
('L2-6', 'Cerro Blanco', '2004/09/08', 'L2', 'VERDE'),
('L2-7', 'Patronato', '2004/09/08', 'L2', 'ROJO'),
('L2-8', 'Puente Cal y Canto', '1987/09/15', 'L2', 'COMUN'),
('L2-9', 'Santa Ana', '1986/07/25', 'L2', 'COMUN'),
('L2-10', 'Los Héroes', '1978/03/31', 'L2', 'COMUN'),
('L2-11', 'Toesca', '1978/03/31', 'L2', 'VERDE'),
('L2-12', 'Parque OHiggins', '1978/03/31', 'L2', 'ROJO'),
('L2-13', 'Rondizzoni', '1978/03/31', 'L2', 'VERDE'),
('L2-14', 'Franklin', '1978/03/31', 'L2', 'COMUN'),
('L2-15', 'El Llano', '1978/12/21', 'L2', 'ROJO'),
('L2-16', 'San Miguel', '1978/12/21', 'L2', 'VERDE'),
('L2-17', 'Lo Vial', '1978/12/21', 'L2', 'ROJO'),
('L2-18', 'Departamental', '1978/12/21', 'L2', 'VERDE'),
('L2-19', 'Ciudad del Niño', '1978/12/21', 'L2', 'ROJO'),
('L2-20', 'Lo Ovalle', '1978/12/21', 'L2', 'COMUN'),
('L2-21', 'El Parrón', '2004/12/22', 'L2', 'VERDE'),
('L2-22', 'La Cisterna', '2004/12/22', 'L2', 'COMUN');

-- Linea 3
INSERT INTO estaciones (id, nombre, fecha_inauguracion, linea_id, color_estacion) VALUES
('L3-1', 'Plaza Quilicura', '2023/09/25', 'L3', 'COMUN'),
('L3-2', 'Lo Cruzar', '2023/09/25', 'L3', 'COMUN'),
('L3-3', 'Ferrocarril', '2023/09/25', 'L3', 'COMUN'),
('L3-4', 'Los Libertadores', '2019/01/22', 'L3', 'COMUN'),
('L3-5', 'Cardenal Caro', '2019/01/22', 'L3', 'COMUN'),
('L3-6', 'Vivaceta', '2019/01/22', 'L3', 'COMUN'),
('L3-7', 'Conchalí', '2019/01/22', 'L3', 'COMUN'),
('L3-8', 'Plaza Chacabuco', '2019/01/22', 'L3', 'COMUN'),
('L3-9', 'Puente Cal y Canto', '2019/01/22', 'L3', 'COMUN'),
('L3-10', 'Plaza de Armas', '2019/01/22', 'L3', 'COMUN'),
('L3-11', 'Universidad de Chile', '2019/01/22', 'L3', 'COMUN'),
('L3-12', 'Parque Almagro', '2019/01/22', 'L3', 'COMUN'),
('L3-13', 'Matta', '2019/01/22', 'L3', 'COMUN'),
('L3-14', 'Irarrázaval', '2019/01/22', 'L3', 'COMUN'),
('L3-15', 'Monseñor Eyzaguirre', '2019/01/22', 'L3', 'COMUN'),
('L3-16', 'Ñuñoa', '2019/01/22', 'L3', 'COMUN'),
('L3-17', 'Chile España', '2019/01/22', 'L3', 'COMUN'),
('L3-18', 'Villa Frei', '2019/01/22', 'L3', 'COMUN'),
('L3-19', 'Plaza Egaña', '2019/01/22', 'L3', 'COMUN'),
('L3-20', 'Fernando Castillo Velazco', '2019/01/22','L3', 'COMUN');

-- Linea 4
INSERT INTO estaciones (id, nombre, fecha_inauguracion, linea_id, color_estacion) VALUES
('L4-1', 'Tobalaba', '2005/11/30', 'L4', 'COMUN'),
('L4-2', 'Cristóbal Colón', '2005/11/30', 'L4', 'VERDE'),
('L4-3', 'Francisco Bilbao', '2005/11/30', 'L4', 'COMUN'),
('L4-4', 'Príncipe de Gales', '2005/11/30', 'L4', 'ROJO'),
('L4-5', 'Simón Bolívar', '2005/11/30', 'L4', 'VERDE'),
('L4-6', 'Plaza Egaña', '2005/11/30', 'L4', 'COMUN'),
('L4-7', 'Los Orientales', '2005/11/30', 'L4', 'ROJO'),
('L4-8', 'Grecia', '2005/11/30', 'L4', 'VERDE'),
('L4-9', 'Los Presidentes', '2006/03/02', 'L4', 'ROJO'),
('L4-10', 'Quilín', '2006/03/02', 'L4', 'VERDE'),
('L4-11', 'Las Torres', '2006/03/02', 'L4', 'ROJO'),
('L4-12', 'Macul', '2006/03/02', 'L4', 'COMUN'),
('L4-13', 'Vicuña Mackenna', '2005/11/30', 'L4', 'COMUN'),
('L4-14', 'Vicente Valdés', '2005/11/30', 'L4', 'COMUN'),
('L4-15', 'Rojas Magallanes', '2005/11/30', 'L4', 'VERDE'),
('L4-16', 'Trinidad', '2005/11/30', 'L4', 'ROJO'),
('L4-17', 'San José de la Estrella', '2009/11/05', 'L4', 'VERDE'),
('L4-18', 'Los Quillayes', '2005/11/30', 'L4', 'ROJO'),
('L4-19', 'Elisa Correa', '2005/11/30', 'L4', 'COMUN'),
('L4-20', 'Hospital Sotero del Rio', '2005/11/30', 'L4', 'COMUN'),
('L4-21', 'Protectora de la Infancia', '2005/11/30', 'L4', 'VERDE'),
('L4-22', 'Las Mercedes', '2005/11/30', 'L4', 'ROJO'),
('L4-23', 'Plaza de Puente Alto', '2005/11/30', 'L4', 'COMUN');

-- Linea 4A
INSERT INTO estaciones (id, nombre, fecha_inauguracion, linea_id, color_estacion) VALUES
('L4A-1', 'La Cisterna', '2006/08/16', 'L4A', 'COMUN'),
('L4A-2', 'San Ramon', '2006/08/16', 'L4A', 'COMUN'),
('L4A-3', 'Santa Rosa', '2006/08/16', 'L4A', 'COMUN'),
('L4A-4', 'La Granja', '2006/08/16', 'L4A', 'COMUN'),
('L4A-5', 'Santa Julia', '2006/08/16', 'L4A', 'COMUN'),
('L4A-6', 'Vicuña Mackenna', '2006/08/16', 'L4A', 'COMUN');

-- Linea 5
INSERT INTO estaciones (id, nombre, fecha_inauguracion, linea_id, color_estacion) VALUES
('L5-1', 'Plaza de Maipú', '2011/02/03', 'L5', 'COMUN'),
('L5-2', 'Santiago Bueras', '2011/02/03', 'L5', 'ROJO'),
('L5-3', 'Del Sol', '2011/02/03', 'L5', 'VERDE'),
('L5-4', 'Monte Tabor', '2011/02/03', 'L5', 'ROJO'),
('L5-5', 'Las Parcelas', '2011/02/03', 'L5', 'VERDE'),
('L5-6', 'Laguna Sur', '2011/02/03', 'L5', 'COMUN'),
('L5-7', 'Barrancas', '2011/02/03', 'L5', 'ROJO'),
('L5-8', 'Pudahuel', '2010/01/12', 'L5', 'COMUN'),
('L5-9', 'San Pablo', '2010/01/12', 'L5', 'COMUN'),
('L5-10', 'Lo Prado', '2010/01/12', 'L5', 'VERDE'),
('L5-11', 'Blanqueado', '2010/01/12', 'L5', 'ROJO'),
('L5-12', 'Gruta de Lourdes', '2010/01/12', 'L5', 'VERDE'),
('L5-13', 'Quinta Normal', '2004/03/31', 'L5', 'ROJO'),
('L5-14', 'Cumming', '2004/03/31', 'L5', 'VERDE'),
('L5-15', 'Santa Ana', '2000/03/02', 'L5', 'COMUN'),
('L5-16', 'Plaza de Armas', '2000/03/02', 'L5', 'COMUN'),
('L5-17', 'Bellas Artes', '2000/03/02', 'L5', 'COMUN'),
('L5-18', 'Baquedano', '1997/04/05', 'L5', 'COMUN'),
('L5-19', 'Parque Bustamante', '1997/04/05', 'L5', 'ROJO'),
('L5-20', 'Santa Isabel', '1997/04/05', 'L5', 'VERDE'),
('L5-21', 'Irarrázaval', '1997/04/05', 'L5', 'COMUN'),
('L5-22', 'Nuble', '1997/04/05', 'L5', 'COMUN'),
('L5-23', 'Rodrigo de Araya', '1997/04/05', 'L5', 'ROJO'),
('L5-24', 'Carlos Valdovinos', '1997/04/05', 'L5', 'VERDE'),
('L5-25', 'Camino Agrícola', '1997/04/05', 'L5', 'ROJO'),
('L5-26', 'San Joaquín', '1997/04/05', 'L5', 'COMUN'),
('L5-27', 'Pedrero', '1997/04/05', 'L5', 'VERDE'),
('L5-28', 'Mirador', '1997/04/05', 'L5', 'ROJO'),
('L5-29', 'Bellavista de La Florida', '1997/04/05', 'L5', 'COMUN'),
('L5-30', 'Vicente Valdés', '2005/11/30', 'L5', 'COMUN');

-- Linea 6
INSERT INTO estaciones (id, nombre, fecha_inauguracion, linea_id, color_estacion) VALUES
('L6-1', 'Cerrillos', '2017/11/02', 'L6', 'COMUN'),
('L6-2', 'Pedro Aguirre Cerda', '2017/11/02', 'L6', 'COMUN'),
('L6-3', 'Franklin', '2017/11/02', 'L6', 'COMUN'),
('L6-4', 'Bio Bio', '2017/11/02', 'L6', 'COMUN'),
('L6-5', 'Ñuble', '2017/11/02', 'L6', 'COMUN'),
('L6-6', 'Estadio Nacional', '2017/11/02', 'L6', 'COMUN'),
('L6-7', 'Ñuñoa', '2017/11/02', 'L6', 'COMUN'),
('L6-8', 'Inés de Suárez', '2017/11/02', 'L6', 'COMUN'),
('L6-9', 'Los Leones', '2017/11/02', 'L6', 'COMUN');

--INSERTAR DATOS
INSERT INTO codigos(id, descripcion) VALUES
('A0', 'Cierre completo al publico'),
('K5', 'Corte de luz en linea'),
('X10', 'Explosion en estacion'),
('Z6', 'Robo en estacion'),
('C8', 'Pelea en estacion'),
('SS', 'Evento critico o Emergencia');


INSERT INTO reportador(id, nombres, apellidos, sueldo) VALUES
('11521635-4','Manuel', 'Alba', 3000000 ),
('15876325-6','Brian', 'Bastias', 2000000 ),
('21603579-8','Damian', 'Elizondo', 100000),
('26575596-8','Laura', 'Romero', 100000 );

INSERT INTO reporte(id, fecha_hora, codigo_id, comentario, reportador_id) VALUES
('25','2023/11/02:8:45:12', 'K5', 'Corte de luz masivo en linea 1', '11521635-4' );
('26','2023/11/15:9:35:18', 'A0', 'Cierre completo al publico estacion', '21603579-8' );
('27','2023/12/05:11:55:25', 'SS', 'Persona en la via', '26575596-8' );
('28','202/12/24:12:15:03', 'Z6', 'Asalto en estacion', '11521635-4' );
('29','2023/12/26:15:30:50', 'X10', 'Explosion en estacion/ Ataque por Corxea', '21603579-8' );
('30','2023/12/31:20:10:36', 'C8', 'Pelea en estacion', '26575596-8' );



INSERT INTO reportes_estaciones(estacion_id, fecha_hora, reportador_id, reporte_id) VALUES
('L1-1', '2023/11/02:8:55:30', '15876325-6', '25' ),
('L1-2', '2023/11/02:8:55:30', '15876325-6', '25' ),
('L1-3', '2023/11/02:8:55:30', '15876325-6', '25' ),
('L1-4', '2023/11/02:8:55:30', '15876325-6', '25' ),
('L1-5', '2023/11/02:8:55:30', '15876325-6', '25' ),
('L1-6', '2023/11/02:8:55:30', '15876325-6', '25' ),
('L1-7', '2023/11/02:8:55:30', '15876325-6', '25' ),
('L1-8', '2023/11/02:8:55:30', '15876325-6', '25' ),
('L1-9', '2023/11/02:8:55:30', '15876325-6', '25' ),
('L1-10', '2023/11/02:8:55:30', '15876325-6', '25' ),
('L1-11', '2023/11/02:8:55:30', '15876325-6', '25' ),
('L1-12', '2023/11/02:8:55:30', '15876325-6', '25' ),
('L1-13', '2023/11/02:8:55:30', '15876325-6', '25' ),
('L1-14', '2023/11/02:8:55:30', '15876325-6', '25' ),
('L1-15', '2023/11/02:8:55:30', '15876325-6', '25' ),
('L1-16', '2023/11/02:8:55:30', '15876325-6', '25' ),
('L1-17', '2023/11/02:8:55:30', '15876325-6', '25' ),
('L1-18', '2023/11/02:8:55:30', '15876325-6', '25' ),
('L1-19', '2023/11/02:8:55:30', '15876325-6', '25' ),
('L1-20', '2023/11/02:8:55:30', '15876325-6', '25' ),
('L1-21', '2023/11/02:8:55:30', '15876325-6', '25' ),
('L1-22', '2023/11/02:8:55:30', '15876325-6', '25' ),
('L1-23', '2023/11/02:8:55:30', '15876325-6', '25' ),
('L1-24', '2023/11/02:8:55:30', '15876325-6', '25' ),
('L1-25', '2023/11/02:8:55:30', '15876325-6', '25' ),
('L1-26', '2023/11/02:8:55:30', '15876325-6', '25' ),
('L1-27', '2023/11/02:8:55:30', '15876325-6', '25' );

-- QUERIES

-- PREGUNTA DE CORXEA ELIMINANDO LINEA 4 (PREGUNTA 5)
--Al ejecutar este comando (delete from lineas where id='L4';) se genero el siguiente error (update o delete en «lineas» viola la llave foránea «estaciones_linea_id_fkey» 
--en la tabla «estaciones» DETALLE: La llave (id)=(L4) todavía es referida desde la tabla «estaciones».) el cual menciona de que como las 
--estaciones de la linea 4 están linkeadas a la linea 4 no se pueden borrar
--Se tuvieron que eliminar las 23 estaciones que requieren la linea 4 permitiendonos asi ejecutar el comando.

--metro_stgo=# delete from lineas where id='L4';
--ERROR:  update o delete en «lineas» viola la llave foránea «estaciones_linea_id_fkey» en la tabla «estaciones»
--DETALLE:  La llave (id)=(L4) todavía es referida desde la tabla «estaciones».
--metro_stgo=# DELETE FROM estaciones WHERE linea_id = 'L4';
--DELETE 23
--metro_stgo=# delete from lineas where id='L4';
--DELETE 1

--QUERY FINAL:
DELETE FROM estaciones WHERE linea_id = 'L4';
DELETE FROM lineas WHERE id='L4';




