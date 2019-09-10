/*1*/

SELECT profesores.*
from profesores, asignaturas, matriculas, estudiantes
where asi_profesor = pro_id and mat_asignatura = asi_id and mat_estudiante = est_id
and est_dni = '31442155K';


/* 2 */

SELECT est_dni, est_nombre, est_apellidos
from estudiantes, matriculas
where est_id = mat_estudiante and mat_asignatura not in (SELECT asi_id from asignaturas where asi_nombre = 'Bases de Datos')
and mat_curso = '201718'
order by est_apellidos, est_nombre, est_dni;


/* 3 */

SELECT asi_nombre, count(mat_asignatura), max(mat_nota_acta)
FROM asignaturas, matriculas, estudiantes
WHERE asi_id = mat_asignatura and est_id = mat_estudiante
and est_dni = '31442155K'
group by asi_nombre
order by count(mat_asignatura) DESC;


/* 4 */

SELECT pro_nombre, pro_apell, asi_titulacion, asi_nombre
from profesores, asignaturas
where asi_profesor = pro_id and asi_titulacion like 'Grado en Ingeniería%';


/* 5 */

SELECT est_ciudad Dirección, asi_titulacion Titulación, count(mat_estudiante) estudiantes
from estudiantes, matriculas, asignaturas
where mat_asignatura = asi_id and est_id = mat_estudiante and mat_curso = '201718'
group by est_ciudad, asi_titulacion
having Estudiantes < 20
order by Estudiantes;