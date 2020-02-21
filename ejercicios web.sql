--PRIMEROS EJEMPLOS DE CONSULTAS SIMPLES
--===============================================
select * from emple;
select * from depart;

--1.- Selecionar los empleados con salario superio a 300000


select salario
from emple
where salario > 300000;


--2.- Selecionar los empleados con salario superio a 190000 y con el trabajo de vendedor

select salario, oficio
from emple
where salario > 190000
      and
      oficio like 'VENDEDOR';
      

--3.- Selecionar el nº de departamento que tengan distinto nombre






--4.- Selecionar todos los empleados del departamento nº 20 y ademas debe de estar ordenado
--    por el apellido y tienen que aparecer en la consulta el nº del empleado, el apellido, 
--    el oficio y el nº de departamento.

select emp_no, apellido, oficio, dept_no
from emple
where dept_no = 20
order by apellido desc;

--5.- Empleados cuyo oficio sea analista, ordenado por el numero del empleado.

select emp_no, oficio, apellido
from emple
where oficio like 'ANALISTA'
order by emp_no desc;


--6.- Seleccionar las filas del departamento 20 cuyo oficio sea analista.
--    La consulta debe de estar ordenada descendentemente por el apellido y 
--    tambien descendentemente por el nº empleado.
select dept_no, oficio, apellido as "NO LO PIDEN"
from emple
where dept_no = 20
and
      oficio like 'ANALISTA'
      order by apellido desc, emp_no;

select * from alumnos;
select * from notas_alumnos;
select * from notas;


--7.- Seleccionar los nombres de los alumnos y su nota1 de la tabla notas_alumnos.
  
select round(avg(nota3)), nombre_alumno
from notas_alumnos;

--8.- Seleccionar los nombres de los alumnos y su nota de la tabla notas_alumnos
--    siendo scott el propietario de la tabla.






--9.-Seleccionar la nota_media de los alumnos de la tabla notas_alumnos.

select round(avg(nota1)), round(avg(nota2)), round(avg(nota3))
from notas_alumnos;
  

--10.- Seleccionar los alumnos que de la nota1 hayan sacado un 7 y que la media 
--     de las 3 notas sea mayor que 6
select nombre_alumno, nota1
from notas_alumnos
where nota1 = 7
and
      (nota1+nota2+nota3)/3>6;

--11.-  Seleccionar los nombres de los alumnos y su nota siendo esta mayor o igual 
--      a 5 y su curso primero.















--12.- Seleccionar los empelados que sean analistas
  
















--13.- Seleccionar los empleados cuyo apellido tenga una A en la 2ª posición.














--14.- Seleccionar el apellido de los empleados cuyo ofifcio sea vendedro,analista o empleado
  












--15.- Seleccionar el apellido, el salario y el nº de departamento de los empleados cuyo salario sea mayor o igual a 125000 en los departamentos 10 o 20.
  
















--16.- Seleccionar la lista de empleados indicando para cada uno su apellido, oficio, fecha de alta y el salario con un aumento del 16%.
  













--17.- De cada departamento saber el nombre y la localidad.














--18.- seleccionar los departamentos agrupados por el nº departamento.





--19.- seleccionar los empleados ordenados alfabeticamente por el nombre y por el oficio.
  



--20.- seleccionar los empleados que no tienen comision.
  




--21.- Seleccionar los empleados de apellido muñoz.
  







--22.- Seleccionar los departamentos cuyo nombre acabe en 'on';
  



--23.- Seleccionar los empleados cuyo nº de departamento no sea ni 30, ni 20 ni 40.
  






--24.- Seleccionar los departamentos cuya localidad no sea ni madrid ni bilbao.
  



--25.- Seleccionar los empleados cuya fecha de alta este entre entre el 8/9/61 y el 27/2/82.
  



--26.- seleccionar los departamentos que terminen en n y tengan una o en su interior.
  



--27.- Seleccionar los empleados que tengan una a en el nombre y una b en su poblacion en la posicion que sea.
  



--28.- seleccionar los empelados cuyo salario sea mayor de 20000 y menor que 50000.
  






--                  SEGUNDOS EJEMPLOS DE SUBCONSULTAS 
--            ===============================================
select * from emple;
select * from depart;
--1.- Seleccionar el apellido de los empleados que trabajen en madrid o barcelona.

select apellido
from  emple
where dept_no in (select dept_no
                 from depart
                 where loc in ('MADRID', 'BARCELONA'));
                  
--2.- Seleccionar el apellido y el oficio de todos los empleados del departamento 
--    20 cuyo trabajo sea identico al de los empleados del departamento ventas.

select apellido,oficio
from emple
where dept_no = 20
      and
      oficio in (select oficio
                from emple
                where dept_no = (select dept_no
                                from depart
                                where dnombre = 'VENTAS')
                );
 
--3.- Obtener el departamento de los empleados con el mismo oficio y el salario de 'Gil'.

select dept_no, APELLIDO
from emple
where (oficio,salario) = (select oficio, salario
                         from emple
                         where apellido = 'GIL');
                   
                  
--4.- Obtener el nombre de alumno, su asignatura y su nota.





--5.- Nombre de los alumnos matriculados en FOL.
  





--TABLAS EMPLE Y DEPART
select * from emple;
select * from depart;
--1.- seleccionar de la tabla emple aquellas filas cuyo apellido empiece por A 
--    y el oficio tenga una e en cualquier posición.

select apellido
from emple
where apellido like 'A%'
      and
      oficio like '%E%';
      
     
--2.- Seleccionar el apellido, el oficio y la localidad  de los departamentos 
--    donde trabajan los analistas.

select apellido, oficio, loc
from emple e
inner join depart d
on e.dept_no = d.dept_no
where e.dept_no = (select e.dept_no
                from emple
                where oficio = 'ANALISTAS');
       --ó         
select apellido, oficio, loc
from emple, depart
where oficio = 'ANALISTAS';

--3.- Mostrar los empleados (nombre, oficio ,salario y fecha de alta) que desempeñen 
--    el mismo oficio que JIMENEZ o que tengan el salario mayor o igual a FERNANDEZ.

select apellido, oficio, salario, fecha_alt
from emple 
where oficio = (select oficio
               from emple
               where apellido = 'JIMENEZ')
               or
               salario >= (select salario
                          from emple
                          where apellido = 'FERNANDEZ');
                          
                          
--4.- Mostar por pantalla el nombre, el oficio y el salario de los empleados 
--    del departamento de FERNANDEZ que tengan su mismo salario.

select APELLIDO, oficio, salario
from emple
where (dept_no,salario) = (select dept_no, salario
                          from emple
                          where apellido = 'FERNANDEZ');
                  
                          
--5.- Presentar los nombres y oficios de los empleados que tienen el mismo trabajo que JIMENEZ.

select apellido, oficio
from emple
where oficio = (select oficio
               from emple
               where apellido = 'JIMENEZ');

--TABLA LIBRERÍA
SELECT * FROM LIBRERIA;
--6.- Visualizar el tema, estante y ejemplares de las filas de libreria de 
--    ejemplares comprendidos entre 8 y 15.
select *
from libreria
where ejemplares between 8 and 15;

--7.- Visualizar las columnas tema, estante y ejemplares de las filas cuyo 
--    estante no este comprendido entre la B y la D.

select *
from libreria
where estante not between 'B' and 'D';

--8.- Visualizar con una sola orden select todos los temas de libreria cuyo numero  
--    de ejemplares sea inferior a los que hay en medicina.

select tema
from libreria
where ejemplares<(select ejemplares
                  from libreria
                  where tema = 'Medicina');

--9.- Visualizar los temas de libreria cuyos numeros de ejemplares no 
--    este entre 15 y 20, ambos incluidos.

select tema
from libreria
where ejemplares not between (15) and (20);

--TABLAS ALUMNOS, ASIGNATURAS Y NOTAS
SELECT * FROM PROFE.ALUMNOS;
SELECT * FROM ALUMNOS;
SELECT * FROM PROFE.ASIGNATURAS;
SELECT * FROM ASIGNATURAS;
SELECT * FROM PROFE.NOTAS_ALUMNOS;
SELECT * FROM NOTAS_ALUMNOS;

--10.- Visualizar todas las asignaturas que contengan en su interior tres 
--     letras 'o' y tengan alumnos matriculados en madrid.

select nombre
from ASIGNATURAS, alumnos
where nombre like '%O%O%o%'
      and
      pobla = 'Madrid'
      and 
      alumno.cod = notas_alumnos.cod
      and
      notas_alumnos.dni = alumnos.dni;
      
--11.- Visualizar los nombres de los alumnos que tengan una nota entre 7 y 8 
--     en la asignatura de FOL.






--12.- Visualizar los nombres de asignaturas que no tengan suspensos.






--13.- Visualizar los nombres de alumnos de madrid que tengan alguna asignatura suspendida.



--14.- Mostrar los nombres de alumnos que tengan la misma nota que tiene 
--     "Díaz Fernández, María" en FOL en alguna asignatura.





--                      CONSULTAS CON FUNCIONES
--             ===============================================
SELECT * FROM EMPLE;
--2.- A partir de la tabla emple, visualizar cuantos apellidos de los empleados 
--    empiezan por la letra ‘A’

select count(apellido) as "Nº de Apellidos"
from emple
where apellido like 'A%';


--3.- Dada la tabla emple, obtener el sueldo medio, el número  de comisiones no nulas, 
--    el máximo sueldo y el minimo sueldo de los empleados del departamento 30.
--    Emplear el formato adecuado para la salida y las cantidades adecuadas.

select round(avg(salario)), count(comision),max(salario),min(salario)
from emple
where dept_no = 30; 


--4.- Contar las filas de librería cuyo tema tenga por lo menos una ‘A’.
SELECT * FROM LIBRERIA;

select count(tema)
from libreria
where tema like '%a%';

--5.- Visualizar los temas con mayor número de ejemplares de la tabla librería y 
--    que tengan al menos una ‘E’ (pueden ser un tema o varios).

select tema
from libreria
where ejemplares = (select max(ejemplares)
                   from libreria
                   where tema like '%e%');
                   
--6.- Visualizar el número de estantes diferentes que hay en la tabla librería.

select count(distinct(estante))
from libreria;


--7.- Visualizar el número de estantes distintos que hay en la 
--    tabla librería de aquellos temas que  contienen al menos una ‘E’.

select count(distinct(estante))
from libreria
where tema like '%e%';



--8.- ¿Qué sentencia select se debe ejecutar para tener el siguiente resultado?

SELECT * FROM MISTEXTOS;

select rpad(ltrim(rtrim(titulo,'."'),'"'),45,'-^')
from mistextos;

--9.- Visualizar los titulos de la tabla MISTEXTOS sin los caracteres punto y comillas, 
--    y en minusculas de dos formas conocidas.

select lower(ltrim(rtrim(titulo,'."'),'"'))
from mistextos;


--10.-  Escribir una sentencia select que visualice dos columnas, 
--      una con el autor y otra con el apellido del autor.
SELECT * FROM LIBROS;

select autor, substr(autor, 0, instr(autor,',',1)-1) as "APELLIDO AUTOR"
from libros;


--11.- Escribir la sentencia select que visualice las columnas de autor y 
--     otra columna con el nombre del autor (sin el apellido) de la tabla libros.

select autor, substr(autor, instr(autor,',',1)+1) as "NOMBRE AUTOR"
from libros;

--12.- A partir de la tabla LIBROS, realizar una sentencia SELECT que visualice en una columna, 
--     primero el nombre del autor y, luego, su apellido




--13.- A partir de la tabla LIBROS, ralizar una sentencia SELCET para que aparezcan los títulos 
--     ordenados por su número de caractes

select titulo
from libros
order by length(titulo) desc;


--14.- Dada la tabla NACIMIENTOS:
--     Realizar una sencia SELECT que obtenga la siguiente salida:

SELECT * FROM NACIMIENTOS;

--     Hay que hacer dos columas:
--     1- con el nombre
--     2- con la fechanac pero solo dos digitos del año.



--15.- Dada la tabla LIBRERIA, hacer una sentencia SELECT que visualice el tema, 
--     el último carácter del tema que no se a blanco y el número de caracteres de tema
--     ( sin contar los blancos de la derecha) ordenados por tema.
SELECT * FROM LIBRERIA;

select tema, length(rtrim(tema))
from libreria
order by tema asc;

--16.- A partir de la tabla NACIMIENTOS, visualizar en una columna el NOMBRE 
--     seguido de su fehca de nacimiento formateada(quitar blancos del nombre)
SELECT * FROM NACIMIENTOS;

select to_date('DD/MM/YY', fechanac)
from nacimientos;

--17.- Convertir la cadena '01051998' a fehca y visualizar su nombre de mes en mayusculas

select upper(to_char(to_date('01051998'),'month'))
FROM dual;


--18.- 


--19.- A partir de la tabla EMPLE, obtener el apellido de los empleados 
--     que lleven más de 19 años trabajando.
SELECT * FROM EMPLE;




--                               CONSULTAS CON FUNCIONES 2
--                    ==============================================

--1.- visualizar los departamentos con mayor numero de empleados y que tengan un 
--    salario mayor que 200000.
SELECT * FROM EMPLE;
SELECT * FROM DEPART;

select dnombre
from depart
where dept_no = (select dept_no
                from emple
                where emp_no = (select max(emp_no)
                               from emple
                               where salario > 200000)
                );


--2.- visualizar los titulos de la tabla libros entre los caracteres * y en 
--    minuscula.Ejemplo: *la colmena*
SELECT * FROM LIBROS;

select lower(concat('*',concat(titulo,'*')))
from libros;


--3.- visualizar los empleados que hayan nacido entre el 8/9/81 y el 10/11/83
SELECT * FROM NACIMIENTOS;

select nombre, apellido
from nacimientos
where fecha_alt = (select trunc(year_between(sysdate,fecha_alt);--no se hacerlo 



-- 4.- visualizar los libros que comiencen por 'L' y sean de la editorial 'Planeta'.
SELECT * FROM LIBROS;

select titulo
from libros
where titulo like 'L%'
      and
      editorial = 'PLANETA';
      

--5.- Si hoy es 18/10/04 del lunes que dia sera el lunes de la semana que viene

select next_day(sysdate,'LUNES') from dual;


--6.- Visualizar los autores que no sean de la editorial 'planeta' 
SELECT * FROM LIBROS;

select  autor, editorial
from libros
where editorial <> 'PLANETA';

--7.- a partir de la tabla mis textos realizar una select para que 
--    aparezcan los autores ordenados por el numero de caracteres de la columna titulo.
SELECT * FROM MISTEXTOS;

select autor, titulo
from mistextos
order by length(titulo)desc;


--8.- seleccionar los empleados que hayan trabajado mas de 5 años y sumarles 
--    10000 pts a su salario.
SELECT * FROM EMPLE;
SELECT * FROM DEPART;

select apellido, salario + 10000
from emple
where fecha_alt;

select aepellido
from emple
where months_between(sysdate, fecha_alt)/12;



--9.- obtener la fecha de hoy con el siguiente formato(en mayusculas)hoy es 
--    dieciocho de 0ctubre del dosmilcuatro.

select to_char(sysdate,'"HOY ES "DAY,DD" DE "MONTH"DEL "YYYY') from dual;



--10.- escribir una consultilla que visualice en una sola columna el nombre 
--     y apellido de las personas de la tabla nacimiento y la fecha de nacimiento en un 
--     formato especifico.
SELECT * FROM NACIMIENTOS;

select concat(concat(nombre,apellido), to_char(fechanac,'DAY dd MONTH yy'))
from nacimientos;



--                                     CONSULTAS CON FUNCIONES 3
--                           ==============================================

--12.- A partir de la tabla libros, realizar una sentencia select que 
--     visualice en una columna, primero el nombre del autor y luego el apellido.
SELECT * FROM LIBROS;

select substr(autor,instr(autor,',',1)+1,substr(autor,0,instr(autor,',',1)-1))
from libros;


--13.- A partir de la tabla libros , realizar una sentecia select que 
--    visualice los titulos ordenados por su numero de caracteres.

select titulo
from libros
order by length(titulo)desc;



--14.- Realizar una select que obtenga el siguiente  resultado:

select nombre, fechanac,to_char(fechanac,'"Nacio el "dd" de "month" de "yyyy')
from nacimientos;



--15.- Dada la tabla librería, hacer una sentencia select que visualice el tema,
--     el ultimo carácter del tema  que no sea blanco y el número de caracteres de tema 
--     (sin contar los blancos de la derecha) ordenados por tema.
SELECT * FROM LIBRERIA;

select tema,substr(tema,instr(tema,' ')-1) as "Última letra de TEMA",instr(tema,' ')-1 as "Caracteres contados"
from libreria
order by tema;


--16.- a partir de la tabla nacimientos, visualizar en una columna el nombre 
--     seguido de su fecha de nacimiento formateada (quitar blancos del nombre).
SELECT * FROM NACIMIENTOS;

select concat(rtrim(nombre,' '),to_char(fechanac,'day,dd month yyyy'))
from nacimientos;


--17.- Convertir la cadena ‘25051984’ a fecha y visualizar su nombre de mes en mayúsculas.

select to_char(to_date('25051984'),'"El día "dd" de "month"del "yyyy", naci yo"')
from dual;


--18.- Visualizar aquellos temas de la tabla librería cuyos ejemplares sean 7 
--     con el nombre de tema ‘SEVEN’; el resto de temas que no tengan 7 ejemplares 
--     se visualizarán como están.
SELECT * FROM LIBRERIA;

select tema, to_char(ejemplares,'SEVEN')
from libreria
where ejemplares = 'SEVEN'; --in (select to_char(ejemplares,'SEVEN')
                   -- from libreria;
                        

--19.- A partir de la tabla emple, obtener el apellido de los empleados que lleven mas 
--     de 19 años trabajando.

SELECT * FROM EMPLE;
--selec trunc(months_between(sysdate,fecha_alt)/12)) from emple;

select apellido, fecha_alt
from emple
where to_number(to_char(fecha_alt,'yyyy'))>19;


--20.- Seleccionar el apellido de los empleados de la tabla emple que lleven mas 
--     de 18 años trabajando en el en el departamento ‘ventas’.



--21.- Visualizar el apellido, el salario y el número de departamento de aquellos empleados de la tabla emple cuyo salario sea el mayor de su departamento.



--22.- Visualizar el apellido, el salario y el número de departamento de aquellos empleados de la tabla emple  cuyo salario supere a la media en su departamento.







--                   Funciones orientadas a fechas
--              ===============================================

--63.- Dada la tabla emple, sumar dos meses a la fecha de alta.




--64.- Dada la tabla emple, restar dos meses a la fecha de alta.





--65.- Obtener de la tabla emple el ultimo dia del mes para cada uno de las fechas de alta.





--66.- Obtener la diferencia de meses que hay entre la fecha 5/5/200 y la fecha 1/1/2000.




--67.- Calcular vuestra edad.





--68.- Si hoy es domingo 25 de julio de 1999 (fecha del sistema "sysdate"). ¿Qué fecha será el proximo jueves?



--69.- A partir de la tabla emple, obtener la fecha de alta (columna FECHA_ALT) fromateada, de manera que aparezca 
--el nombre del mes con todas sus letras (month), el numero del dia del mes(dd) y el año (yyyy).


--70.- A partid de la tabla emple, obtener la fecha de lata de forma que aparezca el nombre del mes con tres letras (month), el numero del dia del año (ddd), el ultimo digito del año(y)y los tres digitos ultimos del año(yyy).


--71.- Obtener la fecha de hoy con el siguiente fromato: Hoy es NOMBRE_DIA,DIA_MES de NOMBRE_MES de AÑO.





--72.- Visualizar la suma de salarios de la tabla emple de manera formateada, tal que aparezca el simbolo de la moneda lical,
--el punto para los miles y la coma para los decimales.


--75.- Convertir la cadena 01012001 a tipo date.



--76.- Obtener el nombre del mes a partir de la cadena '01012001'. Antes hay que convertir la cadena a tipo fecha.




--77.- Obtener el nombre del dia, el nombre del me, el dia y el año en ingles a partir de la fecha '12121997'














--                           Group By y Having
--                ===============================================

--1) Visualizar los departamentos en los que el salario medio es mayor o igual que la media 
--   de todos los salarios;
SELECT * FROM EMPLE;

select dept_no, round(avg(salario))
from emple
group by dept_no
having round(avg(salario)) >= (select avg(salario)
                             from emple);



--2) A partir de la tabla emple, visualizar el número de venderores del departamentos 'VENTAS';  
SELECT * FROM EMPLE;
SELECT * FROM DEPART; 

select count(*)
from emple
where dept_no = (select dept_no
                 from depart
                 where dnombre = 'VENTAS'
                 and
                       oficio = 'VENDEDOR');

  
--3) Partiendo de la tabla EMPLE, visualizar por cada oficio de los empleados del 
--   departamento 'VENTAS' la suma de salarios.

select sum(salario) as "SUMA SALARIO", oficio 
from emple 
where dept_no in (select dept_no 
                  from depart 
                  where dnombre like 'VENTAS')
                  group by oficio;
                  
--4) seleccionar aquellos apellidos de la tabla EMPLE cuyo salario sea igual a la 
--   media de su salario en su departamento.


select  salario,apellido
from emple
where (salario, dept_no) in (select avg(salario), dept_no
                            from emple
                            group by dept_no);
                                       
--5) A partir de la tabla emple, visualizar el numero de empleados de cada 
--   departamento cuyo oficio sea 'EMPLEADO'

select count(*)
from emple
group by dept_no
having dept_no in (select dept_no
                  from emple
                  where oficio = 'EMPLEADO');


--6) Desde la tabla EMPLE, visualizar el departamento que tenga más empleados 
--   cuyo oficio sea 'EMPLEADO'

select dept_no, count(*)
from emple
where oficio = 'EMPLEADO'
group by dept_no
having count(*) in (select max(count(*))
                   from emple
                   group by dept_no
                   );
                   

--7) A partir de las tablas EMPLE y DEPART, visualizar el número de departamento 
--   y el nombre de departamento que tenga más empleados cuyo oficio sea 'EMPLEADO'

SELECT * FROM EMPLE;
SELECT * FROM DEPART;

select e.dept_no
from emple e
inner join depart d
on e.dept_no = d.dept_no
where oficio = 'EMPLEADO'
group by e.dept_no
having count(*) = (select max(count(*))
                   from emple e
                   where oficio = 'EMPLEADO'
                   inner join depart d
                   on e.dept_no = d.dept_no
                   group by e.dept_no);
                   
select dept_no, dnombre
from depart
where 














8) Buscar los departamentos que tienen más de dos personas trabajando en la misma profesión
 
















9) Dada la tabla LIBRERIA, visualizar por cada estante la suma de los ejemplares.











10) Visualizar el estante con más ejemplares de la tabla libreria.

















11) Visualizar los nombres de los alumnos de la tabla ALUM que aparezcan en alguna de estas tablas: NUEVOS y ANTIGUOS.

















12) Escribir las distintas formas en que se puede poner la consulta anterior llegando al mismo resultado
  










13) Visualizar los nombres de los alumnos de la tabla alum que aparezcan en estas dos tablas: antiguos y nuevos

















14) Escribir las distintas formas en que se puede poner la consulta anterior llegando al mismo resultado.

















15) Visualizar aquellos nombres de la tabla alum que no esten en la tabla antiguos ni en la tabla nuevos










17) Realizar una consulta en la que aparezca por cada centro y en cada especialidad el numero de profesores. Si el centro no tiene profesores debe aparecer un 0 en la columna de profesores.

















19) Obtener la especialidad con menos empleados














Group By y Having 2
===============================================

1.- mostrar el oficio y media de salarios de aquellos empleados cuya media de salario sea mayor que 200000
 






2.- mostrar el nombre y la comision de aquellos empleados que tengan una comision mayor que la de sanchez

















3.- mostrar el nombre salario y nº de departamento de aquellos empleados que ganan el salario maximo de su departamento

















4.- mostrar el nombre del departamento que tanga mas empleados cuyo oficio sea presidente










5.- mostrar el numero de directores de la tabla emple que sean dep departamento producción
 





SELECT APELLIDO, ROWID FROM EMPLE;


