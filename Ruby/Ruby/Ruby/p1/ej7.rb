string = 'Hola!'
puts string
puts string.reverse
string = ' string con espacios en blanco '
puts string
puts string.gsub(/\s+/, "")
string.each_byte do |c|
	print c
end 
puts
puts string.gsub('a', '4').gsub('e','3').gsub('i','2').gsub('o','0').gsub('u','6')
