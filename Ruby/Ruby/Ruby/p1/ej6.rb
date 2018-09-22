def contar(cadena, cadena2)
	cadena.downcase.split(' ').count(cadena2.downcase)
end

puts contar("La casa de la esquina tiene la puerta roja y la ventana blanca.", "la")