/** CUESTIONES **/

/*1*/

Para conocer el tipo de cualquier columna dentro de la tabla 
usaremos el comando DESCRIBE nomTabla. Ningun otro pondra el tipo
de las columnas


/*2*/

a) ERROR, la consulta anidada va a devolver mas de una fila
con lo que necesitamos usar los operadores ANY o ALL


b) Esta consulta mostrará todos los proveedores cuyo numero 
de proveedor va a ser igual para todos los articulos cuyo peso 
sea mayor que 100

c) Esta consulta va a mostrar a los proveedores que al menos
ha provisto un articulo de peso mayor que 100


Como podemos leer, las consultas a, b y c no son equivalentes entre
si, ya que una falla, la otra muestra a los proveedores que han provisto todos los articulos de peso mayor que 100
y el ultimo muestra a los proveedores que al menos han provisto un articulo de peso mayor que 100


/* 3 */

HAVING -> Clausula con la que se clasifica grupos creados previamente
por GROUP BY. Como operadores para seleccionar dichos grupos pueden utlizar funciones de grupos,
tales como COUNT(), max(), min(), avg(), ...

WHERE -> Clausula con la que podemos seleccionar columnas en una tabla,
segun el valor de las tuplas. Podemos usar operadores de comparación, pero estos
no pueden abarcar las funciones de grupo, ya que la clausula no funcionaria


EJEMPLO:
/*Informacion de los clientes que han comprado en mas de dos tiendas diferentes*/
SELECT clt_num, clt_nom
from clientes, ventas
where clt_num = vnt_clt
group by clt_nom
having count(distinct vnt_tda) > 2;

/*Información de los clientes que vivan en Madrid*/
SELECT clt_num, clt_nom
from clientes
where clt_pob = 'Madrid';


						/* CONSULTAS SQL */



/* 1 */

SELECT tiendas.*, ifnull(sum(vnt_precio), 0) "Importe ventas/tienda"
FROM tiendas left join ventas on tda_num = vnt_tda
group by tda_num;

/* 2 */

SELECT clientes.*
from clientes, ventas
where clt_num = vnt_clt and clt_pob like 'Ma%' and clt_nom != 'Pablo'
group by clt_num
having count(*) >= 3
order by clt_apell, clt_nom;

/* Consulta de 4 maneras distintas */

/* Producto natural */

SELECT tiendas.*
from tiendas, ventas, articulos
where vnt_tda = tda_num and vnt_art = art_num and art_prv = 7;


/* Consulta anidada */

SELECT *
from tiendas
where tda_num in (SELECT vnt_tda from ventas where vnt_art in (SELECT art_num from articulos where art_prv = 7));

/* Consulta correlacionada */

SELECT *
from tiendas
where 7 in (SELECT art_prv from articulos where art_num in (SELECT vnt_art from ventas where vnt_tda = tda_num));

/* Consulta de existencia */

SELECT *
from tiendas
WHERE EXISTS(SELECT * from ventas, articulos where vnt_tda = tda_num and vnt_art = art_num and art_prv = 7);