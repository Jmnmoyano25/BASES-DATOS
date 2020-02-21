--1

--¿cual seria la salida de ejecutar esta funciones?


--2 EMPLE cuantos apellidos de los empleados empiezan por la letra 'A'

select apellido
from emple
where apellido like 'A%';

--3 EMPLE obtener el sueldo medio, el numero de comisiones no nulas,
-- el maximo sueldo y el minimo sueldo de los empleados del departamento 30.
-- emplear el fomrato adecuado para l asalida para las cantidades numericas
select * from emple;

select avg(salario), comision
from emple
where nvl(comision,0);

where salario = (select max(salario)
                 from emple);

  select apellido, comision, oficio
   from emple
   where comision is not null;
   
--4 contar las filas de la LIBRERIA cuyo tema tenga po lo menus una 'a'
select * from libreria; 

select count tema
from emple 
where tema =(select tema
            from libreria
            where tema like '%a%');

= (select tema
             from emple
             where tema like '%a%');


select * from profe.libreria;


-- 5 --
select tema
from libreria
where ejemplares  = (select max(ejemplares)
             from libreria)
 and
  tema like '%e%';
  
-- 6 --

select count (distinct estante) as distintos
from libreria;

-- 7 --

select count (distinct estante) as distintos
from libreria
where tema like '%e%' ;

-- 8 --

select * from profe.mistextos;

select rpad(ltrim(rtrim(titulo,'.'''),''''))
from profe.mistextos;

-- 9 --





-------------------------ejercicios select y subselect-------------

select * from emple;
select * from depart;

--1) Visualizar los departamentos en los que el salario medio es mayor 
--   o igual que la media de todos los salarios
select dept_no, round(avg(salario)) as "MEDIA DEL SALARIO"
from emple
group by dept_no
having round(avg(salario)) >= (select round(avg(salario))
                               from emple); 

--2) A partir de la tabla emple, visualizar el número de venderores del departamentos 'VENTAS'

select count(*) as "Nº de Vendedores"
from emple 
where dept_no = (select dept_no 
                from depart 
                where dnombre ='VENTAS' 
                      and 
                      oficio = 'VENDEDOR'); 

--3) Partiendo de la tabla EMPLE, visualizar por cada oficio de 
--   los empleados del departamento 'VENTAS' la suma de salarios.

select sum(salario), oficio 
from emple 
where dept_no in (select dept_no 
                  from depart 
                  where dnombre like 'VENTAS')
                  group by oficio;
                  

--4) Seleccionar aquellos apellidos de la tabla EMPLE cuyo salario sea igual a la media
--   de su salario en su departamento.

select apellido, salario
from emple
where (salario, dept_no) in (select round(avg(salario)),dept_no
                             from emple
                             group by dept_no);

--5) A partir de la tabla emple, visualizar el numero
--   de empleados de cada departamento cuyo oficio sea 'EMPLEADO'

select dept_no,count(*) as "NUMERO DE EMPLEADOS"
from emple
where oficio like 'EMPLEADO'
group by dept_no;

--6)  Desde la tabla EMPLE, visualizar el departamento que tenga 
--    más empleados cuyo oficio sea 'EMPLEADO' 
select dept_no, count(*)
from emple
where oficio like 'EMPLEADO'
group by dept_no
having count(*) = (select max(count(*))
                   from emple
                   where oficio like 'EMPLEADO'
                   group by dept_no);
                   
--7) A partir de las tablas EMPLE y DEPART, visualizar el número de departamento y 
--   el nombre de departamento que tenga más empleados cuyo oficio sea 'EMPLEADO'
                   
select e.dept_no, dnombre, count(*)
from emple e
inner join depart d
on e.dept_no = d.dept_no
where oficio like 'EMPLEADO'
group by e.dept_no
having count(*) in (select max(count(*)), dnombre
                    from emple
                    where oficio like 'EMPLEADO'
                    group by e.dept_no);
--solucion web                   
select dept_no,dnombre
from depart 
where dept_no = (select dept_no
                 from emple
                 where oficio = 'EMPLEADO' 
                 group by dept_no 
                 having count(*) = (select max(count(*))
                                    from emple
                                    where oficio='EMPLEADO'
                                    group by dept_no));

--8) Buscar los departamentos que tienen más de dos personas trabajando en la misma profesión
select dept_no, count(*)
from emple
group by dept_no
having count(*) > 2;

--Tabla LIBRERIA
--9) Dada la tabla LIBRERIA, visualizar por cada estante la suma de los ejemplares.
                                                 




                                

 
 



