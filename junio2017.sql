CUESTIONES::
1.- 

a) Verdadero, las columnas utilizadas en WHERE no tienen porque aparecer en el SELECT
 ya que se pueden elegir columnas de las tablas rpoyectadas gracias a la
 clausula FROM


b) Verdadero, en caso de que no lo sea, la consulta no se podra realizar

c) Falso, el operador IN equivale a combinar comparaciones con O logico

d) Para comprobar si un valor ha sido iniializado usamos el operador IS NULL

2.- 

a) Nº registros de la tabla clientes

b) Nº registros de la tabla clientes, ya que todos los clientes
tendrán un apellido, el cual será no nulo

c) Nº registros de la tabla clientes con el campo clt_nom no nulo, 
ya que puede haber clientes con dicho campo con un valor
indeterminado

d) Nº registros de la tabla clientes cuyo valor en la columna clt_nom
no se repita. Esto es debido a que hemos puesto la clausula DISTINCT


3.-

DISTINCT -> La clausula DISTINCT sirve para que los valores repetidos
de la tabla proyectada no se muestren, y en el caso de utilizarlo
junto a count, sirve para que no se cuenten los registros con un valor
de tupla similar


GROUP BY -> La clausula GROUP BY la utilizamos para crear grupos
de tuplas cuyo valor se repita. 




EJEMPLO:

SELECT count(distinct art_col) "Nº colores distintos" from articulos;

SELECT art_nom, count(art_col) "Nº colores/articulo" from articulos group by art_nom;


CONSULTAS SQL HOSPITAL:

/* 1 */

SELECT med_dni "DNI trabajador", med_apellidos "Apellidos trabajador", med_nombre "Nombre trabajador"
from medicos
UNION
SELECT enf_dni, enf_apellidos, enf_nombre
from enfermeros;


/* 2 */

SELECT *
from enfermeros
where enf_id NOT IN (SELECT gua_enf_A from guardias)
AND enf_id NOT IN (SELECT gua_enf_B from guardias);


/* 3 */

SELECT *
from medicos
where med_nomina_actual > 50000
order by med_nomina_actual DESC, med_apellidos;


/* 4 */

SELECT *
from enfermeros
WHERE enf_id IN (SELECT asig_enfermero from asignaciones, habitaciones, areas
where asig_habitacion = hab_id and hab_area = area_id and area_nombre IN ('Traumatología', 'Pediatría'));

/* 5 */

SELECT area_nombre, count(hab_id), count(med_id), count(asig_enfermero)
from areas, medicos, habitaciones, asignaciones
where area_id = hab_area and hab_id = asig_habitacion and med_area = area_id
GROUP BY area_nombre;


/* 6 */

SELECT count(gua_med_A) * 100 + count(gua_med_B) * 70 + count(gua_enf_A) * 60 + count(gua_enf_B) * 40 "Coste guardias 2016"
FROM guardias
WHERE gua_fecha like '2016%';


