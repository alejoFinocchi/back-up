def procesar_hash(hash, proc)
	Hash[hash.invert.map do |key, value| 
		[key, proc.call(value)]
	end]
end

puts hash = { 'clave' => 1, :otra_clave => 'valor' }
puts
puts procesar_hash(hash, ->(x) { x.to_s.upcase })
