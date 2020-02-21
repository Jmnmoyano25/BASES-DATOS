select * from notas_alumnos
select nombre_alumno, nota2
from notas_alumnos
where nota2 is null;

select * from user_tables;

select apellido, salario + nvl(comision,0) as total, oficio
from emple
where oficio ='VENDEDOR';

--apellidos de los trabajadores que sean analistas o vendedores o que no trabajen en el departamento ni el 20 o el 30

--apellido, salario y localidad de los trabajadores

select * from user_tables;

select apellido, salario, loc 
 from emple e, depart d
  where e.dept_no = d.dept_no;

select apellido, salario,doc
 from emple e
  inner join depart d
   on e.dept_no = d.dept_no;

--ademas sacarme los que ganen mas de 350000

select apellido, salario, loc
 from emple e
  inner join depart d
   on e.dept_no = d.dept_no
    and salario > 350000;
 
 --ó
select apellido, salario, loc
 from emple e
  inner join depart d
   on e.dept_no = d.dept_no
    where salario > 350000;
  --y que trabajen en madrid
  
select apellido, salario, loc
 from emple e
  inner join depart d
   on e.dept_no = d.dept_no
    where salario > 350000
     or loc  = 'MADRID';
--alumnos y notas     
select * from notas_alumnos;

select al.apenom, nota
 from alumnos al
  inner join notas n
   on al.dni = n.dni;
   
   select * from asignaturas;
   select * from notas;
   select * from alumnos;
   
--alumnos, notas y asignaturas 
select apenom, nota, nombre
 from notas n, alumnos al, asignaturas asi
  where al.dni = n.dni
        and
        n.cod = asi.cod;
        
--ó

select apenom, nota, nombre
 from alumnos al
  inner join notas n
   on al.dni = n.dni
    inner join asignaturas asi
     on n.cod = asi.cod
      order by apenom;
--ó con NATURAL JOIN
select apenom, nota, nombre
 from alumnos al
  natural join notas n
    natural join asignaturas asi
      order by apenom;
      
--nombres de alumnos y asignaturas

select apenom, nombre
 from alumnos al
  inner join notas n
   on al.dni = n.dni
    inner join asignaturas asi
     on n.cod = asi.cod
      order by apenom;--NOS HACE FALTA LA TABLA NOTAS POR QUE ALUMNOS Y ASIGNATURAS NO SE RELACIONAN

--los nombres de las asignaturas con un 5

select nota, nombre
 from notas n
  inner join asignaturas asi
   on n.cod = asi.cod
    where nota = 5;

--localidades que trabajen vendedores
select oficio, loc
 from emple e
  inner join depart d
   on e.dept_no = d.dept_no
    where oficio='VENDEDOR';

--oficios y localidades donde trabajen vendedores y directores

select oficio, loc
 from emple e
  inner join depart d
   on e.dept_no = d.dept_no
    where oficio in ('VENDEDOR','DIRECTOR');

--apellido y salarios que ganan mas que cerezo (subselect)
select apellido, salario
 from emple e
  where salario >= (select salario
                    from emple
                    where apellido = 'CEREZO';
                    );
--apellido, salarios y localidad que ganan mas que cerezo (subselect)

select apellido, salario, loc
 from emple e
  inner join depart d
   on e.dept_no = d.dept_no
    where salario > (select salario
                       from emple
                        where apellido = 'CEREZO'
                         );
--ó

select apellido, salario, loc
 from emple e
  natural join depart d
    where salario > (select salario
                       from emple
                        where apellido = 'CEREZO'
                         );   
--ó sin inner join y natural join, IMPORTATNE, hay que poner (

select apellido, salario, loc
 from emple e, depart d
   where e.dept_no = d.dept_no
    and salario > (select salario
                       from emple
                        where apellido = 'CEREZO'
                         ); 

--NOMBRE SALARIO Y OFICICIO QUE COBREN LO MISMO QUE GIL
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

--ALUMNOS QUE TENGAN LAS MISMAS NOTAS 2 Y NOTAS 3 QUE Casas Martínez, Manuel

select * from notas_alumnos;

select nombre_alumno
 from notas_alumnos
  where (nota2, nota3) =(select nota2, nota3
                       from notas_alumnos
                       where nombre_alumno like 'Casa%'
                       );

--EJERCICIOS PROPUESTOS--
--TABLAS EMPLE Y DEPART--
select * from emple;
select * from depart;
--1--
select apellido, oficio
 from emple
  where apellido like 'A%'
        and
        oficio like '%E%';
--2--
select apellido, oficio, loc
 from emple e
  inner join depart d
   on e.dept_no = d.dept_no
      where oficio = 'ANALISTA';
      
--3--
select apellido, salario, oficio, fecha_alt
 from emple
  where oficio = (select oficio
                   from emple
                    where apellido = 'JIMÉNEZ')
         or salario >= (select salario
                        from emple
                        where apellido = 'FERNÁNDEZ') ;
                       
--4--
select apellido, oficio, salario
 from emple
  where dept_no = (select dept_no
                   from emple
                   where apellido = 'FERNÁNDEZ')
                   and
        salario = (select salario
                   from emple
                   where apellido = 'FERNÁNDEZ');
                   --igual pero más correcto y solo con and y ==
 select apellido, oficio, salario
 from emple
  where (dept_no, salario) = (select dept_no, salario
                             from emple
                             where apellido = 'FERNÁNDEZ');                 
                   
                   
--5--
select apellido, oficio
 from emple
  where oficio = (select oficio
                  from emple
                   where apellido = 'JIMÉNEZ');

--TABLA LIBRERIA--
--6--
select * from libreria;
  
select tema, estante, ejemplares
 from libreria
  where ejemplares between 8 and 15;

--7--
select tema, estante, ejemplares
 from libreria
  where estante not between 'B' and 'D';
  
--8--
select tema, ejemplares
 from libreria
  where ejemplares < (select ejemplares
                      from libreria
                       where tema = 'Medicina');

--9--
select tema, ejemplares
 from libreria
  where ejemplares not between 15 and 20;
  
--TABLAS ALUMNOS, ASIGNATRUAS Y NOTAS--
select * from user_tables;
select * from alumnos;
select * from asignaturas;
select * from notas;
--10--
select nombre
 from asignaturas asi
  inner join notas n
   on asi.cod = n.cod
    inner join alumnos al
     on n.dni = al.dni
      where nombre like '%o%o%o%'
       and 
        pobla = 'Madrid';
        
--11--
select apenom
 from alumnos 
   where dni = (select dni
                  from notas
                    where cod)  = (select cod
                                    from asignaturas
                                    where nombre = 'FOL')
                     and nota between 7 and 8;                                
--12--
      


--localidad del que mas gana de la empresa--
select loc
 from depart
  where dept_no = (select dept_no
                    from emple
                     where salario =(select max (salario)
                                     from emple
                                     )
                     );
          
  --
       


       
 

        

    
  
  
