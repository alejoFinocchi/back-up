def procesar_hash(hash, proc)
	Hash[
			hash.map do |key, value| 
			[value, proc.call(key)]
			end
		]
end

puts hash = { 'clave' => 1, :otra_clave => 'valor' }
puts
puts procesar_hash(hash, ->(x) { x.to_s.upcase })