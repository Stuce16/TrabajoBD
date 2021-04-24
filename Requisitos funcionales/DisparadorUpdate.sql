create or replace trigger nomJugador
after update on jugador for each row
begin

update goleador set nombre_jugador= NEW.nombre_jugador;
end;
/