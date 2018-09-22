require_relative "Board.rb"


loop do
	puts "Enter height"
	height = gets.chomp.to_i
	puts "Enter width"
	width = gets.chomp.to_i
	puts "Enter number of runs"
	n = gets.chomp.to_i
	tot = 0
	max = 0
	min = 999999
	for i in 1..n do
		@board = Board.new(height, width)
		movements = @board.cleanWithoutPrinting()
		if movements < min then min = movements end
		if movements > max then max = movements end
		tot += movements
	end

	puts("Number of tiles: #{height*width}")
	puts("Average of movements in 100 runs with #{height}x#{width}: #{tot/n}")
	puts("Min of 100 runs with #{height}x#{width}: #{min}")
	puts("Max of 100 runs with #{height}x#{width}: #{max}")

	puts("Continue? x key to quit")
	key = gets.chomp
	break if key == 'x' 
end