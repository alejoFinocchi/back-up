def longitud(*params)
	params.map {|each| puts "#{each.to_s}=>#{each.to_s.length}"}
end

longitud(9, Time.now, 'Hola', {un: 'hash'}, :ruby)
