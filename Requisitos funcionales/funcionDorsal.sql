SET SERVEROUTPUT ON
create or replace function dorsalJugador(nombre VARCHAR2)
return number is
nomJug jugador.nombre_jugador%TYPE;
dorsalJug jugador.dorsal%TYPE;
begin
select nombre_jugador into nomJug from jugador where nombre_jugador=nombre;
if nombre=nomJug then
    select dorsal into dorsalJug from jugador where nombre_jugador=nombre;
    return dorsaljug;
else
    return -1;
end if;
end;
/
