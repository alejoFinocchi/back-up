def da_nil? 
	yield.nil?
end

puts da_nil? { }
puts da_nil? do
	'Algo distinto de nil'
end