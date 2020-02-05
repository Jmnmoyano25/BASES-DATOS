select * from user_tables;

select *
 from all_tables;
 
select * 
from all_tables
where table_name like 'L%';

select * from PROFE.LIBRERIA;

select * from emple;
--primera forma de consulta
select apellido, salario 
  from emple;
--segunda forma de consulta
select emple.oficio, apellido
 from emple;
--tercera forma de consulta
select e.apellido, e.salario
 from emple e;

--esta senctencia no es correcta por que mezcla las dos formas de consulta anteriores;
select emple.apellido, e. salario from emple e;

--nvl transforma null a cero, ej. notas medias de varias asignaturas, si una es null
--por que no has asitido, transforma ese null a cero para que haga la media y no salga
--todo null.
select apellido,
       salario, comision,
       salario + nvl(comision,0) as total
 from emple;
 
 --dual es una tabla virtual para completar la sistaxis.
 --para hacer operaciones ponemos la formula y "as" los que sea.
 select 12/4 as divide from dual;
 select 3*5 as producto from dual;
 select 4+1 as suma from dual;
 select 7-8 as resta from dual;

 --te da los usuarios. 
 select user from dual;
 --sysdate te da la fecha
 select sysdate from dual
 
 
 select * from emple;
 --where sirve para hacer filtros de la consulta ej. todos los del departamento 20.
 select *
  from emple
  where dept_no = 20;
  
  --si queremos sacar solo algunos atributos pero con el filtro where. where es similar
  --a if de java (=, <, >, <=, >=, (!= ó <>(distinto de...))).
  select apellido, oficio
   from emple
   where dept_no = 20;
   
   select * from emple
   --ejercicio. apellidos y salarios de todos los analistas:
   select emple.apellido, salario, oficio
    from emple
    where emple.oficio = 'ANALISTA';--EN LOS CONTENIDOS DE LOS DATOS SIEMPRE SE GUARDA CON EL CASE SENTIVE.
   
  select * from notas_alumnos;
  --para sacar la nota1 pero solo de un alumno, acordarse del case sensitive de la cadena de caracteres.
  select nombre_alumno, nota1
   from notas_alumnos
   where nombre_alumno = 'Benito Martín, Luis'; 
  
  select nombre_alumno, nota1,nota2,nota3
   from notas_alumnos
   where nombre_alumno = 'Casas Martínez, Manuel';
   
  --para utlizar los operadores (=, <, >, <=, >=, (!= ó <>(distinto de...))).
  select apellido, salario
   from emple
   where salario <> 390000;
   
  select apellido, salario
   from emple
   where salario < 318500;
   
  select apellido, salario
   from emple
   where salario =208000;
   
  select apellido, salario
   from emple
   where salario > 100000;
   
   select * from emple
   --ademas de los operadores =, <, ..... tambien temeos "is null", "is not null"
   --esto devolvera true or false.
  select apellido, comision, oficio
   from emple
   where comision is null;
   
  select apellido, comision, oficio
   from emple
   where comision is not null;
   
 --buscamos con fechas
  select apellido, oficio, fecha_alt
   from emple
   where fecha_alt='09/11/1981';  
   
  select apellido, oficio, fecha_alt
   from emple
   where fecha_alt > '09/11/1981'; 
 
--order by es para ordenar originalmente ascendente segun e atributo selecciconado. 
  select * 
   from emple
   order by salario;
   
--si queremos cambiar que sea ascendente o descendente
  select * 
   from emple
   order by apellido asc;
   
  select * 
   from emple
   order by apellido desc;
   
--tambien podemos ordenarlo por fechas
  select *
   from emple
   order by fecha_alt desc;

--podemos anidar diferentes order 
  select *
   from emple
   order by oficio desc, salario asc, apellido;

 select * from notas_alumnos;
--podemos hacer las operaciones que queramos y ordenarlo coomo a nuestro gusto 
 select nombre_alumno, (nvl (nota1,0) + nvl(nota2,0) + nvl(nota3,0)) / 3 as media
  from notas_alumnos
  order by media;
  
--no se pueden meter where en el alias, en este caso "media"
 select nombre_alumno, (nvl (nota1,0) + nvl(nota2,0) + nvl(nota3,0)) / 3 as media
  from notas_alumnos
  where media > 5--tendrimaos que repetir toda la expresión varias veces.
  order by media;

--en este caso si funciona el where por que no tine alias 
 select nombre_alumno, (nvl (nota1,0) + nvl(nota2,0) + nvl(nota3,0)) / 3 as media
  from notas_alumnos
  where (nvl (nota1,0) + nvl(nota2,0) + nvl(nota3,0)) / 3 > 5
  order by media;
  
--and, or y not
--and necesita dos condiciones para que se cumpla, en este caso oficio ='VENDEDOR' y  salario >= 250000;
 select apellido, salario, salario + nvl(comision,0) as total, oficio
  from emple
  where oficio ='VENDEDOR'
        and
        salario >= 250000;
        
 select * from emple 
--con "or" decimos que se cumpla una condición o la otra, cualquiera vale
 select apellido, salario, oficio
  from emple
  where oficio = 'DIRECTOR'
        or
        salario > 400000;
--esta forma es igual pera más lenta, no recomendable
  select apellido, salario, oficio
  from emple
  where oficio = 'DIRECTOR'
        or
        salario > 400000;

--between - not between 
 select apellido, salario
  from emple
  where salario between 200000 and 400000;
--seleccionar todo lo que no este entre between  
 select apellido, salario
  from emple
  where salario not between 200000 and 400000; 
  
--tambien podemos seleccionar fehcas
 select apellido, fecha_alt
  from emple
  where fecha_alt not between '01/05/1981' and '01/09/1981'
  order by fecha_alt desc;

--in y not in
--se puede hacer así, pero es mejor hacer con operadores
select apellido, salario, dept_no
 from emple
 where dept_no = 20
       or
       dept_no = 30;
--es preferible hacerlo con operador de lista 
 select apellido, salario, dept_no
  from emple
  where dept_no in (20,30);--es igual que un "or" pero mucho más rápida
 
--in también funciona con fechas y con cadenas
 select apellido, oficio, dept_no
  from emple
  where oficio in ('ANALISTA','VENDEDOR');
--ó con "not in"
 select apellido, oficio, dept_no
  from emple
  where oficio not in ('ANALISTA', 'VENDEDORES');
  
--like y not like
 select apellido, salario
  from emple
  where apellido like 'A%';--se pone % para que te coja todos los caracteres que haya despues de 'A'
--también se puede utilizar "_" así '_A%' para que te todos los que empiecen por 'A' como segunda letra
  select apellido, salario
  from emple
  where apellido like '_A%'; 
--y podemos cambiar el orden del % para elegir todos los que terminen en '...'
 select apellido, salario
  from emple
  where apellido like '%A';

--podemos utilizar el "not like" para no seleccionar la petición concreta.
--además se puede añadir todo tipo de ordenes
select * from notas_alumnos;

select nombre_alumno, nota1, nota2, nota3
 from notas_alumnos
 where nombre_alumno not like 'Beni%'
 order by nombre_alumno asc;
 
--se pueden añadir and, or y not a cualquier sentencia con like
select apellido, salario, oficio
 from emple
 where oficio like '_E%' 
       and
       oficio like '%R';
       
--JOIN con Forey key
select * from emple;
select * from depart;

--esto esta mal!! hece un producto cartesiano, todos con todos
select apellido, salario , loc
 from emple, depart;

--tambien mal, necesitamos decir que dept_no? de emple o de depart??
select apellido, salario, loc
 from emple, depart
 where dept_no = dept_no;

--ahora bien
select apellido, salario, loc
 from emple, depart
 where emple.dept_no = depart.dept_no;  
--tambien bien
select apellido, salario, loc
 from emple e, depart d
 where e.dept_no = d.dept_no; 

select apellido, salario, loc, e.dept_no 
 from emple e, depart d
 where e.dept_no = d.dept_no;  
--ó también bien nombrando dept_no
select apellido, salario, loc, e.dept_no as departamento
 from emple e, depart d
 where e.dept_no = d.dept_no;   
    
select * from user_tables;

select * from alumnos;
select * from notas;

--sacadme los nombres de alum dni y todas las notas de todos los alum
select apenom, a.dni , nota
 from alumnos a, notas n
 where a.dni = n.dni
 order by a.dni desc, nota asc;
 
--DOS MANERAS DE HACER EL PRODUCTO CARTESIANO
select apellido, salario , loc
 from emple, depart;
--esto es más rápido y más aclarativo
select apellido, salario, loc
 from emple
 cross join depart;

--INNER JOIN

select alumnos.apenom, alumnos.dni, nota
 from alumnos
 inner join notas
 on alumnos.dni = notas.dni;
 
--apellido, salario, loc order por salario
select apellido, salario, loc
 from emple
 inner join depart
 on emple.dept_no = depart.dept_no
 order by salario desc;
--apellido, salario, loc order por salario que ganen mas de 200000    
select apellido, salario, loc
 from emple e, depart d
 where e.dept_no = d.dept_no
       and
       salario > 200000
 order by e.dept_no desc;
 
select apellido, salario, loc
 from emple e
 inner join depart d
 on e.dept_no = d.dept_no
 where e.dept_no = d.dept_no
       and
       salario > 200000
 order by e.dept_no desc;
 
--NATURAL JOIN
--SOLO VALE PARA TABLAS CON MISMO NOMBRE
 select apellido, salario, loc
 from emple e
 natural join depart d;
--no ponemos on por que dept_no se llaman igual.
select apellido, salario, loc
 from emple e
 inner join depart d
 on e.dept_no = d.dept_no
 where e.dept_no = d.dept_no
       and
       salario > 200000
 order by e.dept_no desc;
--natural join con caracteriasticas
select apellido, salario, loc
 from emple e
 natural join depart d
 where salario > 200000;
 
select *
from emple
natural join depart;

select *
from emple
inner join depart
on emple.dept_no = depart.dept_no;

--RIGHT JOIN AND LEFT JOIN
select * from emple;
select * from dempart;

--apellidos de los trabajadores que trabajen en el departamento 40
select apellido, loc, d.dept_no
from emple e
inner join depart d
on e.dept_no = d.dept_no;
--where d.dept_no in (40);

select apellido, loc, d.dept_no
from emple e--ESTA ES RIGHT
right join depart d--ESTA ES LEFT
on e.dept_no = d.dept_no;
--(+) ES LO MISMO QUE RIGHT AND LEFT
select apellido, loc, d.dept_no
from emple e, depart d
where e.dept_no(+) = d.dept_no;

--subselect: para no hacer dos consultas utilizamos subselect
select oficio
 from emple
  where apellido='GIL';

select apellido
 from emple
  where oficio='ANALISTA';
--dos consultas
--con subselect
select apellido
 from emple
  where oficio =  (select oficio
                   from emple
                    where apellido='GIL'
                    )--LO QUE ESTA DENTRO DEL () EQUIVALE A ANALISTA, QUE ESTA EN OFICIOS
                    and
                    apellido<>'GIL';

--COMBINAR CONSULTAS 

select apellido, salario, oficio
 from emple
  where (oficio, salario) = (select oficio, salario
                            from emple
                            where apellido='GIL'
                            );
                   --igual a:
select apellido, salario, oficio
 from emple
  where oficio = (select oficio
                 from emple
                 where apellido='GIL'
                 )
                 and
                 salario = (select salario
                           from emple
                           where apellido='GIL'
                           );
--SACAR NOMBRES DE LOS TRABAJADORES QUE TRABAJEN EN CUALQUIERA DE LOS OFICIOS DE LA LOC DE MADRID
--para sacar varios tuplas las subconsultas hay que utilizar el operar IN
select * from emple; 

select * from depart;

select apellido,oficio
 from emple
  where oficio = (select oficio
                 from emple
                 where dept_no = (select dept_no
                                 from depart
                                 where loc='MADRID')
                                 );--ESTO DA EERO POR QUE DA VARIAS FILAS
                --SE HARIA CON IN
select apellido,oficio
 from emple
  where oficio in (select oficio
                  from emple
                  where dept_no = (select dept_no
                                 from depart
                                 where loc='MADRID')
                                 );
                                 
--apellidos de los oficios que sean analistas y vendedores

select apellido
 from emple
  where oficio in ('ANALISTA','VENDEDORES');


--APELLIDO Y SALRIO DE TRABAJADORES QUE TRABAJEN EN MADRID O BARCELONA
select apellido, oficio
 from emple
  where dept_no in (select dept_no
                  from depart
                  where loc in ('MADRID','BARCELONA')
                  );
                  
--ALUMNOS QUE HAYAN SUSPENDIDO ALGUNA ASIGNATURA
select * from alumnos;
select * from notas;
select * from asignaturas;

select apenom, nombre, nota
 from alumnos al
  inner join notas n
   on al.dni = n.dni
    inner join asignaturas asi
     on n.cod = asi.cod
        where n.dni in (select dni
                       from notas
                       where nota < 5
                       );

select nombre, nota
 from asignaturas asi
  inner join notas n
   on asi.cod = n.cod
    where 
      nota > 8;
      
select * from emple;
select * from depart;

--APELLIDOS DE TRABAJADORES QUE TRABAJAEN EN MADRID O BARCELONA--
select apellido
 from emple
  where dept_no = (select dept_no
                    from depart
                    where loc = 'MADRID')
                    or
         dept_no = (select dept_no
                     from depart
                      where loc = 'BARCELONA');
                      
select apellido, dept_no
 from emple
  where dept_no in (select dept_no
                     from depart
                     where loc in ('MADRID','BARCELONA'));
                     
              
select apellido, e.dept_no, dnombre
 from emple e
  inner join depart d
   on e.dept_no = d.dept_no
     where e.dept_no in (select dept_no
                        from depart
                         where loc in ('MADRID','BARCELONA'));
                         
--APELLIDOS Y OFICIOS DE LOS EMPLEADOS DEL DEPARTAMENTO 20 QUE TENGA POR OFICIO ALGUNO DE LOS
--OFICIOS DEL DEPARTAMENTO VENTAS--

    
  select apellido, dnombre
   from emple e
    inner join depart d
     on e.dept_no = d.dept_no
    where oficio in (select oficio
                     from emple
                     where e.dept_no = (select e.dept_no
                                      from depart
                                       where dnombre='VENTAS'
                                       )
                     )
     and e.dept_no=20;
     
--FUNCIONES---

select 1000/4 from dual;--dual esta en memoria cache

select mod (20, 3) from dual; --residuo
select mod (20.1, 3) from dual;

select floor (20.1) as floor, ceil (20.1) as ceil from dual;--redondeo

select round (2.2) from dual;--redondea a entero
                        --el número 0 no apararece y se supone que es un entero

select round (2.67,1) from dual; 
                                 --el numero 1 redondea a decimas
                                 --el número 2 redondea a centesimas
                                 --el número 3 redondea a milesimas
select round (2.4567,1) from dual;
select round (2.4567,2) from dual;
select round (2.4567,3) from dual;

select round (2.6255555555555555)from dual;--redondea hacia arriba
select round (2.6255555555555555, 2)from dual;

select trunc (2.899999999999, 3) from dual;
select trunc (2.89999999999) from dual; --redondea hacia abajo

--fechas

select sysdate from dual;
select sysdate, trunc (sysdate) from dual;--trunc de sysdate para quitar la hora

--con ABS hacemos la expresión positiva
select salario - 400000, abs(salario-400000)
 from emple;
 
--con SQRT hacemos la raiz cuadrada
select sqrt(64)
 from dual;
 
--para potencia POWER
select power(8,2)from dual;

--para contar COUNT

select count(*) total
 from emple
  where dept_no = 20;
  
select count(apellido)
 from emple
  where dept_no = 20;
  
select count(comision)-- count ("lo que sea")cuanta tuplas no sea nulo
 from emple;
 
select count(*)--count  (*) cuenta tuplas con null incluido
 from emple;
 
--DISTINCT cuenta valores no nulos y además distintos

select count(dept_no)
 from emple;
 
select count (distinct dept_no)--cuenta los departamentos distintos que hay, no cuantos hay--                            
 from emple;  
 
--MEDIA--

select avg(salario) as media
 from emple;
                 

--apellido y nombre departamento del que más gana--
select apellido, dnombre, salario
 from emple e
  inner join depart d
   on e.dept_no = d.dept_no
    where salario = (select max(salario)
                      from emple
                       );
      
    --cuantos trabajadores ganan mas de 

select count(*)
 from emple
  where salario > (select avg(salario)
                    from emple
                    );
                    
      --apellidos y localidad de los que ganan mas del doble salarial o menos de la mitad de media salarial
      select apellido, loc
       from emple e
        inner join depart d
         on e.dept_no = d.dept_no
          where salario > (select avg (salario)*2
                           from emple
                           )
                          or
                 salario < (select avg (salario)/2
                            from emple
                            );
                --sin inner join
 select apellido, loc, salario
   from emple e, depart d
    where e.dept_no=d.dept_no
       and
        (salario > (select avg (salario)*2
                   from emple
                   )
                   or
        salario < (select avg (salario)/2
                   from emple
                   ));-- es importante meter el or entre parentesis para que lo haga
                      -- antes que el and

--apellidos localidad y nombre dept de los que ganan mas y menos ganan
 select * from depart; 
 select * from emple;
select apellido, loc, salario, d.dept_no
 from emple e
  inner join depart d
   on e.dept_no = d.dept_no
    where salario = (select max(salario)
                     from emple
                     )
          or
          salario = (select min(salario)
                     from emple
                     );        
 --GREATEST and LEAST (___, ___, ____)
 
 select * from notas_alumnos;  
 --mayor y menor nota de cada alumno
 
 select nombre_alumno , greatest(nvl(nota1,0), nvl(nota2,0), nvl(nota3,0)) as mayor,
                        least(nvl(nota1,0), nvl(nota2,0), nvl(nota3,0)) as menor
      from notas_alumnos; --se pone nvl para los 0 "null"
 
 --CHR "CARACTER"
 select chr(97), chr(65), from dual;
 select ascii('A'), ascii('a') from dual;   
 
 --CONCAT (__, __) 

 select concat ('TU APELLIDO ES: ',APELLIDO)
        as todo
        from emple;
        
 --CONCAT(CONCAT(___, ___),___)
 
 select concat (APELLIDO,CONCAT(' ES ',OFICIO))AS TODO
 from emple;
  --el simbolo "||" se utiliza para concatenar CONCAT         
 select apellido || ' es ' || oficio as todo
  from emple;          

--LOWER "a minisculas" UPPER "a mayusculas"

 select lower (apellido) || ' es ' || lower (oficio) as todo
  from emple;
  
 --INITCAP "pone en mayusculas la primera letra de cada palabra"
 
 select initcap ('hola que tal ')
 from dual;
 
  select initcap (apellido)
   from emple
    where dept_no=30;
    
 --LPAD and RPAD (cadena, tamaño total, tercero opcional completa con: caracter ej.[,*])
  
 select lpad (apellido,10,'*')
 from emple;--el programa no lo interpreta bien.
 
 --RTRIM and LTRIM igual que lpad y rpad pero borran caracteres solo que es el 2 espacio
 --el que es opcional
 select apellido, rtrim (apellido,'s')
 from emple;
 
 
 select * from mistextos;
 
 --quitar los puntos al final de esta tabla
 select titulo, rtrim (titulo,'.')
 from mistextos;

--REPLACE cambia el segundo valor por el tercero
select replace ('blanco y negro', 'o','a') from dual;

select replace ('blanco y negro', 'o','as') from dual;

select replace ('blanco y negro', 'o') from dual;

select replace ('sqlplus', 'sql','123') from dual;


--TRANSLATE (cadena, ___, ____) cambia cualquier valor de la 2 cadena y la sustituye en la 31 cadena y
--después lo sustituye en la 1º cadena.
select translate ('sqlplus', 'sql','123') from dual;
select translate ('abcdefghijk', 'abcdefg','1234567') from dual;


select translate (titulo, 


--SUBSTR (cadena,posicion,nºcaracteres)

select apellido, lower(substr(apellido, 2)) 
from emple;

--INSTR

select instr ('vuelta ciclista a talamanca', 'ta') from dual;

select instr ('vuelta ciclista a talamanca', 'ta',1,1) from dual;

select instr ('vuelta ciclista a talamanca', 'ta',1,2) from dual;

select instr ('vuelta ciclista a talamanca', 'ta',8,1) from dual;

--apellido y posición en la que aparece la letra 'a'

select apellido, instr (apellido, 'A') 
    from emple;

--LENGTH (cadena) numero de caracteres de la columna

select apellido, length (apellido)
  from emple;
  
select * from libreria;

select tema, length(rtrim(tema)) as letras
 from libreria;

select tema, instr(tema, ' ')-1 from libreria;


--FECHAS.....................
select sysdate from dual;

select 'hoy es: '||sysdate from dual;

select concat ('hoy es: ', sysdate)from dual;

select 'hoy es: '||(sysdate +2) from dual;


--ADD_MONTHS(fecha,+-meses)

select fecha_alt, add_months(fecha_alt,12)from emple;

select '11/11/2011', add_months('11/11/2011',12)from dual;

--LASTDATE 

select lastdate ('12/2/2001') from dual;

--LASt_DAY devuelve el ultimo día de la fecha

select last_day ('12/2/2001') from dual;

--calcular la edad

select trunc (months_between (sysdate,'25/05/1984')/12) from dual;


--calcular los trienios de los empleados

select 'trienios de ' || apellido || '---->'|| trunc(months_between (sysdate,fecha_alt)/36) as trienios
 from emple;


--NEXT_DAY te de la fecha de del dia de la fecha siguiente que pongas en la cadena

select next_day(sysdate, 'lunes') from dual;

--EXTRACT extrae el dia, mes o año de la fecha

select extract (day from to_date('11-12-2000')) as "dia"
 from dual;
 select extract (month from to_date('11-12-2000')) as "mes"
 from dual;
 select extract (year from to_date('11-12-2000')) as "año"
 from dual;
 
 --años de alta en la empresa y los apellidos
 
 select extract (year from to_date(fecha_alt)) as "año de", apellido
  from emple e;
 
 --el mes medio de alta de los empleados
 
 select round (avg(extract (month from fecha_alt))) as "media mes de alta"
 from emple;
 
 --quienes se dieren de alta en el mes medio de alta en la empresa

  select  fecha_alt, extract (month from fecha_alt)
   from emple
    where extract (month from fecha_alt) = (select round (avg(extract (month from fecha_alt)))
                                           from emple);
 --quienes se dieron de alta un mes despues de la media de alta en la empresa
   select  fecha_alt, extract (month from fecha_alt)
   from emple
    where extract (month from fecha_alt) = 
                         (select round (avg(extract (month from fecha_alt)))+1
                         from emple);
                         
 --nombre del / de los departamentos que posean 
 --empleados que se dieran de alta cuatro meses despues del mes medio en la empresa
select dnombre
 from depart
  where dept_no in (select dept_no 
                    from emple
                    where extract (month from fecha_alt)= (select round (avg(extract (month from fecha_alt))) as "media mes de");
                    
 
 --DECODE
 
 select apellido, oficio , decode( oficio,
                            'PRESIDENTE',1,
                            'EMPLEADO',2,
                            3) AS DECODIFICADO
                            ,COMISION
                 from emple;
  --CASE
  --falta el case               
  
 --EJERCICIO 
 --MES MEDIO CON TEXTO              
 select case round (avg(extract(month from fecha_alt)))
                   when 1 then 'ENERO'
                   when 1 then 'ENERO'
                  when 1 then 'FEBRERO'
                   when 1 then 'MARZO'
                   when 1 then 'ABRIL'
                    when 1 then 'MAYO'
                    when 1 then 'JUNIO'
                   when 1 then 'JULIO'
                    when 1 then 'AGOSTO'
                    when 1 then 'SEPTIEMBRE'
                   when 1 then 'OCTUBRE'
                  when 1 then 'NOVIEMBRE'
                  when 1 then 'DICIEMBRE'
                    end as "MEDIA ALTA EN MES...."
           from emple;
 
 
  select  fecha_alt, extract (month from fecha_alt)
   from emple
    where extract (month from fecha_alt) = 
                         ))
                         from emple);
                         
 --cuantos empleados se dieron de alta el domingo
 
        
select count(*)
from emple
where to_char(fecha_alt,'DAY') = (select to_char(to_date((round(avg(extract(day from fecha_alt)))),'DD'),'DAY')
                                  from emple);   
                                          
                                          
 -- EXPRESIONES DE SELECT ----
 --GROUP BY E1, E2, ......
 --HAVING C1 
 
 -- EJ. media de los salarios de los departamentos diferentes.
 
 select dept_no, round(avg(salario)) as media
  from emple
  group by dept_no;                                                 

-- ej. calcular la media de los salarios de los oficios     
  
select oficio, round(avg(salario)) as media
 from emple
  group by oficio;
  
-- podemos poner un WHERE y el filtro lo hace antes del GROUP BY --
--media de vendedores y analistas

select oficio, round(avg(salario)) as media
 from emple
 where oficio in ('VENDEDOR' , 'ANALISTA')
  group by oficio; 
  

select oficio, round(avg(salario)) as media
 from emple
 where dept_no in (10, 20)
  group by oficio; 
  
-- media salaria, max, min y total de empleados por departamento--

select dept_no, max(salario) as MAXIMO,
                min(salario) as MINIMO,
                round(avg(salario)) as MEDIA,
                count(*) as TRABAJADORES
 from emple
  group by dept_no
   order by TRABAJADORES;
   
 -- ej. los trabajadores que mas ganan de cada departamento
 
 select dept_no, salario, apellido
  from emple
   where salario in (select max(salario)
                    from emple
                    group by dept_no);
  
  
  -- HAVING C1 (ES COMO WHERE PERO PARA GROUP BY (REQUIERE GROUP BY))--
  
  select dept_no, max(salario), min(salario), count(*)
   from emple
    group by dept_no
     having count (*) > 4; --having permite consulatar a grupos 
                           --where no
                           
 --ej. apellido, localidad y salario de los que ganan mas y menos de cada departamento
 select * from emple;
 select * from depart;
 
 select apellido, loc, salario
 from emple e
 inner join depart d
 on e.dept_no = d.dept_no
 where
  salario in (select max(salario)
                  from emple
                  group by dept_no)
                  or
  salario in (select min(salario)
                  from emple
                  group by dept_no);
                  
--ej. loc y dept de los que mas ganan de oficio empleado
select loc, dept_no
from depart
where dept_no in (select dept_no
                 from emple
                 where salario in (select max(salario)
                                   from emple
                                   where oficio='EMPLEDADO'
                                   )
                  );
                 
-- media salariales de los vendedores del dept 20 y 30
  
 select round(avg(salario)), dept_no
 from emple
 where dept_no in (20,30)
 and oficio='VENDEDOR'
 group by dept_no;
 
-- contar oficios 
select oficio, count(*)
from emple
 group by oficio
 order by count(*) desc;
 
 --cuantos oficios tienen mas de 3 empleados
 select oficio, count(*)
from emple
 group by oficio
 having count(*) > 3
 order by count(*) desc;
 
 --WHERE AND HAVING medias salariales y total empleados de los empleados y analistas ordenadas descent
 select round(avg(salario)), oficio, count(*)
 from emple
 where  oficio in ('ANALISTA', 'EMPLEADO')
 group by oficio
 having count (*) > 3
 order by avg(salario)desc;
 
 --VARIOS GROUP BY
 
 select dept_no, 'oficio es '||oficio,count(*)
 from emple
 group by dept_no, oficio
 order by dept_no;
 
 --media salarial, nombre de dept y loc de dept
 select * from depart;
 
 select round(avg(salario)),dnombre, loc
 from emple e, depart d
  where e.dept_no = d.dept_no
   group by e.dept_no,dnombre, loc;
   
 --dept y total de empleados de aquello dept que tengan mas de 5 empleados
 select * from emple;
 
 select dept_no,count(*)
 from emple
 having count(*) > 5
 group by dept_no;
 
 --oficios con más de tres empleados
 select oficio, count(*)
  from emple
   having count(*) > 3
    group by oficio;
    
 --num dept, nombre loc y total empleados por departamento ordenados por numero de emple
 select e.dept_no, dnombre, loc, count(*) empleados
  from emple e
   inner join depart d
   on e.dept_no = d.dept_no
    group by e.dept_no, dnombre,loc
     order by empleados; 
    

 --
     
  select e.dept_no, dnombre, loc, count(*) empleados
  from emple e
   inner join depart d
   on e.dept_no = d.dept_no
    having count(*) >5
    group by e.dept_no, dnombre,loc
     order by empleados;
   
 --trabajarores que trabajaen en un dept cuya avg salarial sea superior a 270000
 
 select dept_no, apellido, salario
  from emple 
   where dept_no in (select dept_no
                    from emple
                    group by dept_no
                    having (avg(salario))>270000
                    );
            
 --loc de dept donde trabajen en un dept cuyo avg salarial se a superior a 270000
   
 select loc
  from depart
   where dept_no in (select dept_no
                    from emple
                    group by dept_no
                    having (avg(salario))>270000
                    );
                    
 --nombre de dept con mas 4 trabajadores
 
 select dnombre, dept_no
  from depart
   where dept_no in(select dept_no
                     from emple
                     group by dept_no
                     having count(*)>4);
                     
 --numero maximo de emple que hay en algun dept
 
 select max(count(*))
 from emple
 group by dept_no;
 
 --cuantos trabajadores hay en el oficio que mas empleados tiene
 
 select max(count(*))
 from emple
 group by oficio;
 
 --cual es el oficio que mas empleados tiene
 
 select oficio, count(*) empleados
  from emple
   group by oficio
    having count(*) in (select max(count(*))
                        from emple
                        group by oficio); 
                        
 --num de dept , nombre dept y total de emple del que mas empleados tiene
 select e.dept_no, dnombre, count(*)as "el mas numeroso"
  from emple e
   inner join depart d
    on e.dept_no = d.dept_no
     group by e.dept_no, dnombre
      having count(*) in (select max(count(*))
                         from emple
                         group by dept_no);

--oficio con mas trabajadores que no sean ni empleados ni vendedores

 select oficio, count(*)
  from emple
   where oficio not in ('EMPLEADO', 'VENDEDOR')
   group by oficio
    having count(*) in (select max(count(*))
                        from emple
                        where oficio not in ('EMPLEADO', 'VENDEDOR')
                        group by oficio)
                        ; 
 
--CIUDAD CON MAS EMPLEADOS--

select loc 
from depart
where dept_no in (select dept_no 
                  from emple
                  group by dept_no
                  having count(*) = (select max(count(*))
                                     from emple
                                     group by dept_no)
                     );

   -----------------------UNIONES EXTERNAS----------------------
   
   select * from paraleer;
   select * from leidos;
   
   ------------------LEFT JOIN---------------------------------
   
   --sacar codigo, nombre libro y su fecha de lectura
   
   select p.cod_libro, nombre_libro, fecha
   from paraleer p
   inner join leidos l
   on p.cod_libro=l.cod_libro(+);--(+) es = al left join
   
   --la tabla emple tiene una estructura jerarquica en bucle--
   
   select * from emple;
   
   --nombre de los empleados con el mismo jefe que TOVAR
   
   select apellido, dir
   from emple
   where dir in (select dir
                 from emple
                 where apellido='TOVAR');
   
  --trabajadores con más de 2 empleados a su cargo
  
  select apellido
  from emple
  where emp_no in (select dir
                   from emple
                   group by dir
                   having count(*)>2);

 --empleado que tiene a su cargo directo la mayor suma
 
 --nombre del empleado con más gente a su cargo de forma directa--
 select apellido
 from emple
 where emp_no in (select dir --con esta subselect contamos el campo dir
                  from emple
                  group by dir
                  having count(*)=(select max(count(*)) --con esta subselect contamos el maximo de la cuenta
                                   from emple
                                   group by dir)
                  );
   
 --------[CONNECT BY [PRIOR]ATRIBUTO1 = [PRIOR]ATRIBUTO2]  [] = SIGNIFICA OPCIONAL
       --[START WHIT CONDICION1]
       --[GRUOP BY.........]---
       
   select * from emple;
   
   --TODA LA JERQUIA DE LA EMPRESA--
   
   select apellido, emp_no,dir,level as nivel --leves es una seudocolumna solo util con connet
   from emple
   connect by prior emp_no=dir
   start with apellido='REY';
   
   --COLOCACIÓN DE LA JERQUIA
   select upper(lpad(apellido, length(apellido)+6*level)) as organigrama,level
   from emple
   connect by prior emp_no=dir
   start with apellido='REY';
  
 --TODOS LOS QUE DEPENDAN DE JIMENEZ
 
 select lpad(apellido, length(apellido)+6*level),emp_no,dir,level
 from emple
 where apellido<> 'JIMÉNEZ'
 connect by prior emp_no=dir
 start with apellido='JIMÉNEZ';
 
 --TODOS LOS JEFES DE ALONSO
 
 select upper(lpad(apellido, length(apellido)+6*level)) as organigrama,emp_no,dir,level
 from emple
 where apellido <> 'ALONSO'
 connect by emp_no= prior dir
 start with apellido='ALONSO';
 
 --CUANTOS ESCALAFONES AHI--
 select max(level)
 from emple
 connect by prior emp_no=dir
 start with apellido='REY';
 --o---
 select max(level)
 from emple
 connect by  emp_no=prior dir
 start with apellido='ALONSO';
 
 --CUANTOS ESCALAFONES HAY POR DEBAJO DE CEREZO
 select count(distinct level)-1--contamos los niveles -1(el de CEREZO).
 from emple
 connect by prior emp_no=dir
 start with apellido='CEREZO';
 
 --CUANTOS TRABAJADORES HAY DE CADA ESCALAFÓN
 
 select level,count(*)
 from emple
 connect by prior emp_no=dir
 start with apellido='REY'
 group by level
 order by level asc;
 
 --SUMA DE SALARIO DE CADA ESCALAFON
 
 select level,count(*), sum(salario)
 from emple
 connect by prior emp_no=dir
 start with apellido='REY'
 group by level 
 order by level asc;
 
 --CUANTAS COMISIONES NO NULAS HAY EN CADA ESCALAFON
 
 select * from emple;
 
 select level as escalafon, count(comision)
 from emple
 connect by prior emp_no=dir
 start with apellido='REY'
 group by level 
 order by level asc;
 
 --SUMA DE SALARIOS DE ANALISTAS DE CADA ESCALAFON
 
 select level as Escalafón, sum(salario) as "SALARIO ANALISTA"
 from emple
 where oficio = 'ANALISTA'
 connect by prior emp_no=dir
 start with apellido='REY'
 group by level 
 order by level asc;
 
 --SUMA DE SALARIO Y TOTAL TRABAJADORES QUE SEAN OFICIO EMPLEADO DE CADA ESCALAFÓN
  
 select level as "EN EL ESCALAFON",count(*) as hay, sum(salario) as "Y SUMA"
 from emple
 where oficio = 'EMPLEADO'
 connect by prior emp_no=dir
 start with apellido='REY'
 group by level 
 order by level asc;
 
 --TOTAL DE TRABAJADORES POR ESCALAFON, Y DENTRO DE CADA ESCALAFÓN POR OFICIO
 
 select level as escalafon, oficio, count(*)
 from emple
 connect by prior emp_no = dir
 start with apellido = 'REY'
 group by level, oficio
 order by level;
 
 --TOTAL DE TRABAJADORES POR ESCALAFON, Y DENTRO DE CADA ESCALAFÓN POR DPET
     
 select level as escalafon, dept_no, count(*)
 from emple
 connect by prior emp_no = dir
 start with apellido = 'REY'
 group by level, dept_no
 order by level;
  
 --NUMERO DE TRABAJADORES, ESCALAFON Y EL OFICIO DEL ESCALAFÓN CON MÁS TRABAJADORES DE OFICIO EMPLEADO
  
 select count(*), level as escalafon, oficio 
 from emple
 where oficio = 'EMPLEADO'
 connect by prior emp_no = dir
 start with apellido = 'REY'
 group by level, oficio
 having count(*) in (select max(count(*))
                    from emple
                    where oficio = 'EMPLEADO'
                    connect by prior emp_no = dir
                    start with apellido = 'REY'
                    group by level,oficio);

 --NUMERO DE TRABAJADORES, ESCALAFON Y OFICIO DE LOS TRABAJADORES DEL ESCALAFON CON MAS TRABAJADORES POR ESCALAFON DE CADA OFICIO                
                   
 select count(*) as "Nº DE TRABAJADORES", level as escalafon, oficio 
 from emple
 connect by prior emp_no = dir
 start with apellido = 'REY'
 group by level, oficio
 having count(*) in (select max(count(*))
                    from emple
                    connect by prior emp_no = dir
                    start with apellido = 'REY'
                    group by level, oficio);
                    
 --SACAR LA CODIFICACIÓN Y EL TOTAL DE EMPLEADOS DE CADA CATEGORIA
 
 select case level
        when 1 then 'FUKING BOSS'
        when 2 then 'LOS JEFES'
        when 3 then 'LOS TERCEROS'
        when 4 then 'LOS INDIOS'
        else 'NO CUMPUTADO'
        end as cateroria, level, count(*)
        from emple
        connect by prior emp_no = dir
        start with apellido = 'REY'
        group by level
        order by level; 
        --TAMBIEN SE PUEDE HACER CON DECODE
select decode(level,1,'FUKING BOSS',2,'LOS JEFES',3,'LOS TERCEROS',4,'LOS INDIOS');




--CATALOGA EL NUMERO DE EMPLEADOS POR ESCALAFON MENOS DE 3 POCOS, TRES ACETABLE, MAS DE 7 MULTITUD

 select case  
        when count(*) < 3 then 'POCOS'
        when count(*) = 3 then 'ACEPTABLE'
        when count(*) < 7 then 'MULTITUD'
        else 'MULTITUD'
        end as cateroria, level as escalafon , count(*) as "Nº DE TRABAJADORES"
        from emple
        connect by prior emp_no = dir
        start with apellido = 'REY'
        group by level
        order by level; 

--SUMA DE SALARIO Y TOTAL TRABAJADORES Y CATALOGA COMO:
       --< 3000000 ACEPTABLE Y RESTO MUCHO, QUE SEAN EMPLEADOS DE CADA ESCALAFON
       

 
 
 select case
        when sum(salario) <250000 then 'aceptable'
        when sum(salario) <300000 then 'muy aceptable'
        else 'mucho'
        end as catalogación, level as ESCALAFON,count(*) as "Nº DE TRABAJADORES", sum(salario)
        from emple
        where oficio = 'EMPLEADO'
        connect by prior emp_no=dir
        start with apellido='REY'
        group by level;                                    
                    
 --ESCALAFON Y TOTAL TRABAJADORES CON MAYOR NUMERO DE TRABAJADORES
  
 select count(*) as "Nº DE TRABAJADORES", level
 from emple
 connect by prior emp_no=dir
 start with apellido='REY'
 group by level
 having count(*) in (select max(count(*))
                    from emple
                    connect by prior emp_no=dir
                    start with apellido='REY'
                    group by level);
                    
 --NOMBRE DE LOS TRABAJADORES DEL ESCALAFON CON MAYOR NUMERO DE TRABAJADORES
 
 select apellido
 from emple
 where level= (select level
              from emple
              connect by prior emp_no=dir
              start with apellido='REY'
              group by level
              having count(*) in (select max(count(*))
                                 from emple
                                 connect by prior emp_no=dir
                                 start with apellido='REY'
                                 group by level)
              )
connect by prior emp_no=dir
start with apellido='REY';
 
--NOMBRE DEPARTAMENTO Y LOCALIDAD DE LOS TRABAJADORES DEL ESCALAFON CON MAYOR NÚMERO DE TRABAJADORE
select dnombre as "Nombre de departamento", loc as "Localidad"
from depart 
where dept_no in (select dept_no
                 from emple
                 where level = (select level
                               from emple
                               connect by prior emp_no=dir
                               start with apellido='REY'
                               group by level
                               having count(*) in (select max(count(*))
                                                  from emple
                                                  connect by prior emp_no=dir
                                                  start with apellido='REY'
                                                  group by level)
                                )
                 
                 connect by prior emp_no=dir
                 start with apellido='REY'
                 );
 
-----------------------------CONJUNTOS---------------------------------------
--------------SELECT - SELECT CON OPERADORES CONJUNTOS-----------------------
--UNION----------------------------------------------------------------------
SELECT * FROM ALUM;
SELECT * FROM NUEVOS;
SELECT * FROM ANTIGUOS;

--ALUMNOS QUE ESTEN EN ALUMN Y EN NUEVOS
select nombre
from alum
union                --los mezcla "a lo loco", pero no las repite
select nombre
from nuevos;

--UNION ALL---------------------------------------------------------------
select nombre
from alum
union all                --los mezcla "a lo loco", saca todos, incluso los repite
select nombre
from nuevos;
--INTERSECT---------------------------------------------------------------
select nombre
from alum
intersect                --solo saca los que esten en las dos tablas pero que coincidan
select nombre
from antiguos;
--o--
select nombre
from alum                --Un "intersect" es como un "in"                       
where nombre in (select nombre from antiguos);
--MINUS---------------------------------------------------------------------------
select nombre
from alum
minus                --que esten en la primera select y no esten en la otra tabla, los que coinciden no salen
select nombre
from antiguos;
--o--
select nombre
from alum                --Un "minus" es como un "not in" pero más lento                   
where nombre not in (select nombre from antiguos);
--ALUMNOS DE LAS DOS TABLAS DE ALUM Y NUEVOS PERO NO EN ANTIGUOS
(select nombre
from alum
intersect
        select nombre
        from nuevos)
             minus
             select nombre
             from antiguos;
--ALUMNOS DE ALUM Y NUEVOS Y DE ANTIGUOS PERO NO DE NUEVOS
(select nombre
from nuevos
         union
         select nombre
         from antiguos)
                intersect
                select nombre
                from alum;
                
--CON OPERADORES DE LISTAS SERIA.....
select nombre from alum
where nombre in (select nombre from nuevos)
or
      nombre in (select nombre from antiguos);
      
--ALUMNOS DE ANTIGUOS Y ALUM MENOS NUEVOS
(select nombre
from antiguos
       union
       select nombre
       from alum)
              minus
              select nombre
              from nuevos;
--ALUMNOS ANTIGUOS MENOS NUEVOS MAS ALUM
 
(select nombre
from antiguos
       minus
       select nombre
       from nuevos)
              union
              select nombre
              from alum;

--ALUMNOS DE ALUM CON NUEVOS MAS LOS ANTIGUOS
(select nombre
from nuevos
     intersect
     select nombre
     from alum)
          union
          select nombre
          from antiguos;
          
--------------SELECT EXPRESION---------------------------------------------
--solo puede tener un atributo y solo devuelve una tupla
--USUARIO CONECTADO Y LA FECHA
select (select user
        from dual
        )as usuario,
       (select uid                    --solo devuelve un dato
        from dual
        )as identificador,
       sysdate
from dual;

--MEDIA DE SALARIO DE DEPARTAMENTO 20 Y MEDIA DE SALARIO DE LOS VENDEDORES
select(select round(avg(salario),2)
       from emple
       where dept_no=20
       )as "Media del 20",
      (select round(avg(salario),2)
       from emple
       where oficio = 'VENDEDOR'
       )as "Media de VENDEDORES"
from dual;  
--MEDIA DE SALARIO DE DEPARTAMENTO 20 Y MEDIA DE SALARIO DE LOS VENDEDORES Y EL SALARIO DE GIL
select(select round(avg(salario),2)
       from emple
       where dept_no=20
       )as "Media del 20",
      (select round(avg(salario),2)
       from emple
       where oficio = 'VENDEDOR'
       )as "Media de VENDEDORES",
       salario
from emple
where apellido='GIL'; 
--MEDIA DE SALARIO DE DEPARTAMENTO 20 Y MEDIA DE SALARIO DE LOS VENDEDORES Y EL SALARIO DE GIL Y LOC
select(select round(avg(salario),2)
       from emple
       where dept_no=20
       )as "Media del 20",
      (select round(avg(salario),2)
       from emple
       where oficio = 'VENDEDOR'
       )as "Media de VENDEDORES",
       salario, loc
from emple e
inner join depart d
on e.dept_no=d.dept_no
where apellido='GIL';   


--                MIRAR TODO LO DE INSERT

--INSERTAR EMPLEADO 1112 ELNUEVO CON LOS DEMAS DATOS DE GIL, CON SELECT EN VALUES SOLO UN CAMPO
insert into emple
select 666, 'MOYANO', oficio,dir,sysdate,salario,comision,dept_no
from emple
where apellido= 'ARROYO';

SELECT * FROM EMPLE;



--              DELETE
--===============================================================
--DELETE FROM [TABLA]; SE BORRAN LAS TUBLAS PERO LA TABLA SIGUE EXISTIENDO


delete from emple
where apellido='PAQUITO';
--TAMBIEN PODEMOS HACER SUBSELECT, GROUP BY, ETC PARA BORRAR LO QUE QUERAMOS


--                UPDATE
--========================================================   
--UPDATE [TABLA]  
--SET A1 = V1, A2 = V2
--[WHERE ________];    

update emple
 set comision=null
 where comision is not null;
 
--SUBIR UN 10% EL SALARIO A TODOS LOS TRABAJADORES DEL DEPARTAMENTO 20
update emple
set salario = salario + salario * 0.1
where dept_no=20;


SELECT * FROM CENTROS;

--PONER LA DIRECCION DEL CENTRO DE CODIGO 22 A C/MAYOR Y EL LAS PLAZAS A 111

update centros
set direccion = 'C/MAYORAL',
num_plazas = 155
where cod_centro = 22;

--CAMBIAR EL SALARIO A 500000, LA COMISION A NULL Y EL APELLIDO A Sala

update emple
set apellido= initicap(apellido),
comision = null


--         UPDATE CON SUBSELECT
--=====================================================
--PONER A CERO LA COMISION Y SALARIO A LA MITAD EN EL O LOS DEPARTAMENTOS CON MAS EMPLEDOS

update emple40
set comision = 0,
    salario = salario /2
where dept_no in (select dept_no
                 from emple40
                 group by dept_no
                 having count(*) = (select max(count(*))
                                   from emple40
                                   group by dept_no
                                   )
                  );

--CAMBIAR DE JEFE A GIL Y DARLE EL JEFE DE TOBAR. SI COBRA CIMISION ENCREWMETARLE UN 10% SI NO LA COBRA PONERLA 
update emple30
set dir = (select dir from emple
           where apellido = 'TOVAR'),
    comision = nvl(comision,0) + nvl(comision,10000)*0.1
    where apellido='GIL';
    
    --MODIFICACIONES DE LA TABLA EMPLE
    
 SELECT * FROM EMPLE30;
 
 update emple30
 set oficio = 'MAMPORRERO'
 where emp_no = 1222;
 
insert into emple30
select 666, 'SUUCHAAAAR', 'COJONUDO',dir,sysdate,1500000,comision,dept_no
from emple30
where apellido= 'EL VIEJO';
 


SELECT APELLIDO, ROWID FROM EMPLE;











