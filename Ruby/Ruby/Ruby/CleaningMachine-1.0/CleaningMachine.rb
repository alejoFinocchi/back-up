require_relative "Board.rb"

#Creates board and tells it to clean itself
puts "Enter height"
height = gets.chomp.to_i
puts "Enter width"
width = gets.chomp.to_i
@board = Board.new(height, width)
@board.clean()