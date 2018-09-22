# Este script lee una secuencia de no menos de 15 números desde teclado y luego imprime el resultado de la división
# de cada número por su entero inmediato anterior.
# Como primer paso se pide al usuario que indique la cantidad de números que ingresará.
	cantidad = 0
	while cantidad < 15
		puts '¿Cuál es la cantidad de números que ingresará? Debe ser al menos 15'
		cantidad = gets.to_i
	end
	# Luego se almacenan los números
	numeros = 1.upto(cantidad).map do
		puts 'Ingrese un número'
		numero = gets.to_i
	end
	# Y finalmente se imprime cada número dividido por su número entero inmediato anterior
	resultado = numeros.map do |x| 
		begin 
			x / (x - 1) 
		rescue ZeroDivisionError 
			$stderr.puts 'dividiendo por cero'	
			x = nil
		end 
	end
	puts 'El resultado es: %s' % resultado.join(', ')

