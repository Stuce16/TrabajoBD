SET SERVEROUTPUT ON

create or replace procedure infoEquipo (nombre VARCHAR2) is
nombreEquipo equipo.nombre_equipo%TYPE;
presiEquipo equipo.presidente%TYPE;
estadioEquipo equipo.estadio%TYPE;
fundacionEquipo equipo.estadio%TYPE;
nombreEntrenador entrenador.nombre_entrenador%TYPE;
begin

select nombre_equipo into nombreEquipo from equipo where nombre_equipo=nombre;
select presidente into presiEquipo from equipo where nombre_equipo=nombre;
select estadio into estadioEquipo from equipo where nombre_equipo=nombre;
select fundacion into fundacionEquipo from equipo where nombre_equipo=nombre;
select nombre_entrenador into nombreEntrenador from entrenador where nombre_equipo=nombre;

if nombreEquipo=nombre then
    DBMS_OUTPUT.PUT_LINE('Nombre: '|| nombreequipo||'. Presidente: '|| presiEquipo||'. Estadio: '||estadioEquipo||'. Entrenador: '||nombreEntrenador||'. Año de fundacion: '||fundacionEquipo);
else
    raise noExisteEquipo;
end if;

exception
when noExisteEquipo then
    DBMS_OUTPUT.PUT_LINE('Equipo no encontrado');
end;
/