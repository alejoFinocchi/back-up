# Tira un dado virtual de 6 caras
def tirar_dado
 rand 1..6
end
# Mueve la ficha de un jugador tantos casilleros como indique el dado en un tablero virtual de 40 posiciones.
# Si no se recibe la cantidad de casilleros, aprovecho el valor por defecto para ese parámetro para evitar tener que
# llamar a #tirar_dado dentro del cuerpo del método.
def mover_ficha(fichas, jugador, finalizado, casilleros = tirar_dado)
 fichas[jugador] += casilleros
 if fichas[jugador] >  40 and !finalizado 
   puts "Ganó #{jugador}!!"
   true
 else
   puts "#{jugador} ahora está en el casillero #{fichas[jugador]}"
 end
end
posiciones = { azul: 0, rojo: 0, verde: 0 }
finalizado = false
while !finalizado
	puts
 [:azul, :rojo, :verde].shuffle.each do |jugador|
   finalizado = mover_ficha(posiciones, jugador, finalizado)
 end
end