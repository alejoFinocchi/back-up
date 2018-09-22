def cuanto_falta? time = Time.now
	time.min - Time.now.min 
end

puts cuanto_falta? Time.new(2016, 12, 31, 23, 59, 59)

puts cuanto_falta?
