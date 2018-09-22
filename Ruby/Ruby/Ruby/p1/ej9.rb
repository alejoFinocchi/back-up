def longitud(arr)
	arr.map do |each|
		each.length
	end
end

puts longitud(['TTPS', 'Opción', 'Ruby', 'Cursada 2015'])
