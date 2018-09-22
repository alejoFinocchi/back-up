def contar(cadena, cadena2)
	cadena.downcase.scan(cadena2.downcase).length
end

puts contar("La casa de la esquina tiene la puerta roja y la ventana blanca.", "la")