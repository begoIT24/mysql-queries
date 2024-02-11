USE tienda;
/* 01 */ SELECT nombre FROM producto;
/* 02 */ SELECT nombre, precio FROM producto;
/* 03 */ SELECT * FROM producto;
/* 04 */ SELECT nombre, precio, ROUND(precio*1.08, 2) FROM producto;
/* 05 */ SELECT nombre, precio AS euros, ROUND(precio*1.08, 2) AS 'dòlars nord-americans' FROM producto;
/* 06 */ SELECT UPPER(nombre) AS nombre_may, precio FROM producto;
/* 07 */ SELECT LOWER(nombre) AS nombre_min, precio FROM producto;
/* 08 */ SELECT nombre, UPPER(SUBSTRING(nombre, 1, 2)) AS iniciales FROM fabricante;
/* 09 */ SELECT nombre, ROUND(precio, 0) AS precio_round FROM producto;
/* 10 */ SELECT nombre, TRUNCATE(precio, 0) AS precio_truncate FROM producto;	
/* 11 */ SELECT codigo_fabricante FROM producto;
/* 12 */ SELECT DISTINCT codigo_fabricante FROM producto;
/* 13 */ SELECT nombre FROM fabricante ORDER BY nombre ASC;
/* 14 */ SELECT nombre FROM fabricante ORDER BY nombre DESC;
/* 15 */ SELECT nombre, nombre FROM producto ORDER BY nombre ASC, precio DESC;
/* 16 */ SELECT * FROM fabricante LIMIT 5;
/* 17 */ SELECT * FROM fabricante LIMIT 3, 2;
/* 18 */ SELECT nombre, precio FROM producto ORDER BY precio ASC LIMIT 1;
/* 19 */ SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;
/* 20 */ SELECT nombre FROM producto WHERE codigo_fabricante = 2;
/* 21 */ SELECT producto.nombre, producto.precio, fabricante.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo;
/* 22 */ SELECT producto.nombre, producto.precio, fabricante.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo ORDER BY fabricante.nombre ASC;
/* 23 */ SELECT producto.codigo, producto.nombre, producto.codigo_fabricante, fabricante.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo;
/* 24 */ SELECT producto.nombre, producto.precio, fabricante.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo ORDER BY producto.precio ASC LIMIT 1;
/* 25 */ SELECT producto.nombre, producto.precio, fabricante.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo ORDER BY producto.precio DESC LIMIT 1;
/* 26 */ SELECT producto.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre = "Lenovo";
/* 27 */ SELECT producto.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre = "Crucial" AND producto.precio > 200;
/* 28 */ SELECT producto.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre = "Asus" OR fabricante.nombre = "Hewlett-Packard" OR fabricante.nombre = "Seagate";
/* 29 */ SELECT producto.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre IN ("Asus","Hewlett-Packard","Seagate");
/* 30 */ SELECT producto.nombre, producto.precio FROM producto INNER JOIN fabricante on producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre LIKE ('%e');
/* 31 */ SELECT producto.nombre, producto.precio FROM producto INNER JOIN fabricante on producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre LIKE ('%w%');
/* 32 */ SELECT producto.nombre, producto.precio, fabricante.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE producto.precio >= 180 ORDER BY producto.precio DESC, producto.nombre ASC;
/* 33 */ SELECT DISTINCT producto.codigo_fabricante, fabricante.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo;
/* 34 */ SELECT fabricante.nombre, producto.nombre FROM fabricante LEFT JOIN producto ON producto.codigo_fabricante = fabricante.codigo; 
/* 35 */ SELECT fabricante.nombre, producto.nombre FROM fabricante LEFT JOIN producto ON producto.codigo_fabricante = fabricante.codigo WHERE producto.nombre IS NULL; 
/* 36 */ SELECT * FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo');
/* 37 */ SELECT * FROM producto WHERE precio = (SELECT MAX(precio) FROM producto WHERE producto.codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo'));
/* 38 */ SELECT producto.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE (fabricante.nombre = 'Lenovo' AND producto.precio = (SELECT MAX(producto.precio) FROM fabricante INNER JOIN producto ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre = 'Lenovo'));
/* 39 */ SELECT producto.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE (fabricante.nombre = 'Hewlett-Packard' AND producto.precio = (SELECT MIN(producto.precio) from fabricante INNER JOIN producto ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre = 'Hewlett-Packard'));
/* 40 */ SELECT nombre FROM producto WHERE precio >= (SELECT MAX(producto.precio) FROM fabricante INNER JOIN producto ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre = 'Lenovo');
/* 41 */ /* no funciona */ SELECT producto.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre = 'Asus' AND producto.precio >= (SELECT AVG(producto.precio));

USE universidad;
/* 1 */ SELECT apellido1, apellido2, nombre FROM persona WHERE tipo = 'alumno' ORDER BY apellido1, apellido2, nombre;
/* 2 */ SELECT nombre, apellido1, apellido2 FROM persona WHERE tipo = 'alumno' AND telefono IS NULL;
/* 3 */ SELECT * FROM persona WHERE tipo = 'alumno' AND YEAR(fecha_nacimiento) = 1999;
/* 4 */ SELECT * FROM persona WHERE tipo = 'profesor' AND telefono IS NULL AND nif LIKE '%K';
/* 5 */ SELECT * FROM asignatura WHERE id_grado = 7 AND curso = 3 AND cuatrimestre = 1;
/* 6 */ SELECT persona.apellido1, persona.apellido2, persona.nombre, departamento.nombre FROM profesor INNER JOIN persona ON profesor.id_profesor = persona.id INNER JOIN departamento ON profesor.id_departamento = departamento.id;
/* 7 */ SELECT asignatura.nombre, curso_escolar.anyo_inicio, curso_escolar.anyo_fin FROM persona INNER JOIN alumno_se_matricula_asignatura ON persona.id = alumno_se_matricula_asignatura.id_alumno INNER JOIN curso_escolar ON alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id INNER JOIN asignatura ON alumno_se_matricula_asignatura.id_asignatura = asignatura.id WHERE persona.nif = '26902806M';
/* 8 */ SELECT DISTINCT departamento.nombre FROM departamento INNER JOIN profesor ON departamento.id = profesor.id_departamento INNER JOIN asignatura ON profesor.id_profesor = asignatura.id_profesor INNER JOIN grado ON grado.id = asignatura.id_grado WHERE grado.nombre = 'Grado en Ingeniería Informática (Plan 2015)' AND asignatura.id_profesor IS NOT NULL;
/* 9 */ SELECT * FROM persona INNER JOIN alumno_se_matricula_asignatura ON persona.id = alumno_se_matricula_asignatura.id_alumno INNER JOIN curso_escolar ON alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id WHERE curso_escolar.id = 5 AND persona.tipo = 'alumno';
/* clàusules LEFT JOIN i RIGHT JOIN */
/* 1 */ SELECT departamento.nombre, persona.apellido1, persona.apellido2, persona.nombre FROM persona LEFT JOIN profesor ON persona.id = profesor.id_profesor LEFT JOIN departamento ON profesor.id_departamento = departamento.id WHERE persona.tipo = 'profesor' ORDER BY departamento.nombre, persona.apellido1, persona.apellido2, persona.nombre;
/* 2 */ SELECT * FROM persona LEFT JOIN profesor ON persona.id = profesor.id_profesor WHERE persona.tipo = 'profesor' AND profesor.id_profesor IS NULL;
/* 3 */ SELECT departamento.nombre FROM departamento LEFT JOIN profesor ON departamento.id = profesor.id_departamento WHERE profesor.id_profesor IS NULL;
/* 4 */ SELECT * FROM persona LEFT JOIN profesor ON persona.id = profesor.id_profesor LEFT JOIN asignatura ON asignatura.id_profesor = profesor.id_profesor WHERE persona.tipo = 'profesor' AND asignatura.id_profesor IS NULL;
/* 5 */ SELECT asignatura.nombre FROM asignatura LEFT JOIN persona ON persona.id = asignatura.id_profesor WHERE asignatura.id_profesor IS NULL;
/* 6 */ /* no funciona */ SELECT departamento.nombre FROM departamento INNER JOIN profesor ON departamento.id = profesor.id_departamento RIGHT JOIN asignatura ON asignatura.id_profesor = profesor.id_profesor WHERE asignatura.id_profesor IS NULL;
/* Consultes resum */
/* 1 */ SELECT * FROM persona WHERE tipo = 'alumno';
/* 2 */	SELECT * FROM persona WHERE tipo = 'alumno' AND YEAR(fecha_nacimiento) = 1999;
/* 3 */ SELECT departamento.nombre, COUNT(profesor.id_profesor) AS num_profesores FROM departamento INNER JOIN profesor ON departamento.id = profesor.id_departamento GROUP BY departamento.nombre ORDER BY num_profesores ASC;
/* 4 */ SELECT departamento.nombre, COUNT(profesor.id_profesor) AS num_profesores FROM departamento LEFT JOIN profesor ON departamento.id = profesor.id_departamento GROUP BY departamento.nombre;
/* 5 */ SELECT grado.nombre, COUNT(asignatura.nombre) AS num_asignaturas FROM grado LEFT JOIN asignatura ON asignatura.id_grado = grado.id GROUP BY grado.nombre ORDER BY num_asignaturas DESC;
/* 6 */	SELECT grado.nombre, COUNT(asignatura.nombre) AS num_asignaturas FROM grado INNER JOIN asignatura ON asignatura.id_grado = grado.id GROUP BY grado.nombre HAVING num_asignaturas > 40;
/* 7 */ SELECT grado.nombre, asignatura.tipo, SUM(asignatura.creditos) AS suma_creditos FROM grado INNER JOIN asignatura ON asignatura.id_grado = grado.id GROUP BY grado.nombre, asignatura.tipo; -- graus sense assignatura no inclosos (LEFT JOIN)
/* 8 */	SELECT curso_escolar.anyo_inicio, COUNT(DISTINCT alumno_se_matricula_asignatura.id_alumno) AS num_alumnos FROM curso_escolar INNER JOIN alumno_se_matricula_asignatura ON curso_escolar.id = alumno_se_matricula_asignatura.id_curso_escolar GROUP BY curso_escolar.anyo_inicio;
/* 9 */	SELECT persona.id, persona.nombre, persona.apellido1, persona.apellido2, COUNT(asignatura.id_profesor) AS num_asignaturas FROM persona LEFT JOIN asignatura ON persona.id = asignatura.id_profesor WHERE persona.tipo = 'profesor' GROUP BY persona.id ORDER BY num_asignaturas DESC;
/*10 */ SELECT * FROM persona WHERE fecha_nacimiento =  (SELECT MAX(fecha_nacimiento) FROM persona);
/*11 */ SELECT * FROM persona LEFT JOIN asignatura ON persona.id = asignatura.id_profesor LEFT JOIN profesor ON persona.id = profesor.id_profesor WHERE persona.tipo = 'profesor' AND asignatura.id_profesor IS NULL;