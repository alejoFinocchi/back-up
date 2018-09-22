class Taller
def probar(objeto)
 objeto.arrancar
end
end

class Vehiculo
	def arrancar(llave)
		raise NotImplementedError
	end
end

class Auto < Vehiculo
	def initialize
		@frenoDeMano = false
		@CajaDeCambios = N
	end
	def arrancar
		if !frenoDeMano and CajaDeCambios==N
			true
	end
	def ponerFrenoDeMano
		frenoDeMano = true
	end
	def sacarFrenoDeMano
		frenoDeMano = false
	end
	def subirCambio
		if CajaDeCambios = N 
			CajaDeCambios = 1
		else
			if CajaDeCambios < 6
			CajaDeCambios++
	end
	def bajarCambio
		if CajaDeCambios = 1
			CajaDeCambios = N 
		else
			if CajaDeCambios > 1
			CajaDeCambios--
	end
end

class Moto < Vehiculo
	def initialize
		@frenoDeMano = false
		@CajaDeCambios = N
	end
end

class Lancha < Vehiculo

end
