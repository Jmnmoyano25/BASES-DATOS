select * from user_tables;


select * from emple;
select * from depart;

--1 seleccionar de la tabla emple aquellas filas vuyo apellido
-- empiece por "A" y el oficio tenga un "e" en cuaquier posicón

select apellido
from emple
where apellido = "A%"
      and
      oficio = "%E%";

