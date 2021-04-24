SET SERVEROUTPUT ON

create or replace function jugFrancia
return number is
contarNacion jugador.nacionalidad%TYPE;
begin
select count(dni_jugador) into contarNacion from jugador where nacionalidad='Francesa'; 
if contarNacion>0 then
    return contarNacion;
else
    return -1;
end if;
end;
/