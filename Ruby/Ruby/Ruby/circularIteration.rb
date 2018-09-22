n = 7
i = 0
puts 'Press any key to continue or x to finish'
while c = gets.chomp != 'x'
	puts
	puts "(#{i}+1) % #{n} = #{i = (i+1) % n}"
end