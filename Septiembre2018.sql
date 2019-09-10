/*1*/

SELECT nombre, dorsal, equipo
from ciclista, equipo
where equipo = nomequipo and nomequipo like '%mobile%'
order by nomequipo, nombre;

/* 2 */

SELECT nombre, dorsal, equipo, count(maillot)
from ciclista, lleva, maillot
where dorsal = ciclista and maillot = codigo and color = 'rojo'
group by nombre
order by count(maillot) DESC;


/* 3 */

SELECT count(numetapa), sum(kms), count(distinct ganador)
from etapa;


/* 4 */

SELECT numetapa Etapa, kms Distancia, salida Salida, llegada Llegada, count(nomPuerto) "Puertos de Cat 1 y 2"
from etapa, puerto
where etapa = numetapa and categoria in ('Primera', 'Segunda')
group by numetapa
order by numetapa;


/* 5 */

SELECT director, nomequipo, count(ganador)
from equipo, ciclista, etapa
where nomequipo = equipo and dorsal = ganador and nombre not in ('Juan Pérez Casillas', 'Manuel Sánchez Smith')
group by director
having count(ganador) < 5
order by count(ganador) DESC, director;


/* 6 */

SELECT nombre, edad, equipo
from ciclista
where edad <= ALL (SELECT c.edad from ciclista c, etapa e where c.dorsal = e.ganador);
