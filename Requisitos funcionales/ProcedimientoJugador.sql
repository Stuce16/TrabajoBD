SET SERVEROUTPUT ON

create or replace procedure infoJugador (dni char) is
dniJug jugador.dni_jugador%TYPE;
nombreJug jugador.nombre_jugador%TYPE;
dorsalJug jugador.dorsal%TYPE;
nacionJug jugador.nacionalidad%TYPE;
posicionJug jugador.posicion%TYPE;
equipoJug jugador.nombre_equipo%TYPE;
begin
select dni_jugador into dniJug from jugador where dni_jugador=dni;
select nombre_jugador into nombreJug from jugador where dni_jugador=dni;
select dorsal into dorsalJug from jugador where dni_jugador=dni;
select nacionalidad into nacionJug from jugador where dni_jugador=dni;
select posicion into posicionJug from jugador where dni_jugador=dni;
select nombre_equipo into equipoJug from jugador where dni_jugador=dni;
if dniJug= dni then
DBMS_OUTPUT.PUT_LINE('Nombre: ' || nombreJug || '. DNI: ' || dniJug ||'. Dorsal: '||dorsalJug||'. Nacionalidad: '|| nacionJug|| '. Posicion: '|| posicionJug||'. Equipo: '||equipoJug);
else
raise noEncontrado;
end if;
exception
when noEncontrado then
DBMS_OUTPUT.PUT_LINE('Jugador no encontrado');
end;
/
