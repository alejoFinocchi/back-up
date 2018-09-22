require 'matrix'
require_relative 'matrix_ext.rb'
require_relative 'Tiles.rb'
require_relative 'Agent.rb'

class Board

	def initialize(height, width)
		@height = height
		@width = width
		@board = createRandomBoard()
		@agent = createAndPutAgentRandomly()
	end

	def createRandomBoard()
		Matrix.build(@height, @width) { |row, col| if rand(1..2) == 1 then Dirty.new() else Clean.new() end }
	end

	def createAndPutAgentRandomly()
		row = rand(0..@height-1)
		col = rand(0..@width-1)
		@board[row, col] = Agent.new(row, col, self, @height*@width)
	end

	def printOverLine()
		for col in 1..@width do
		  if col != @width then print "__" else puts "___" end
		end
	end

	def printUnderLine()
		for col in 1..@width do
		  if col != @width then print "‾‾" else puts "‾‾‾" end
		end
	end

	def printInnerLines()
		for row in 0..@height-1 do
			for col in 0..@width-1 do
				if col != @width-1 then 
					print "|#{@board[row,col].draw()}" 
				else 
					puts "|#{@board[row,col].draw()}|" 
				end
			end
		end
	end

	def printBoard ()
		printOverLine()
		printInnerLines()
		printUnderLine()
	end

	def getNextPositions(direction) #Returns the positions of the tile in that direction from the agent, or nil if out of the board
		row, col = @agent.getPos() #Get current agent position
		#Calculate new position
		case direction 
		when "up"
			new_row = row-1
			new_col = col
		when "down"
		  	new_row = row+1
			new_col = col
		when "left"
			new_row = row
		  	new_col = col-1
		else
			new_row = row
		  	new_col = col+1
		end #If new positions are inside the board
		if new_row.between?(0, @height-1) && new_col.between?(0, @width-1) then
			return new_row, new_col
		else
			nil
		end
	end

	def moveAgent(direction)
		new_row, new_col = getNextPositions(direction)
		if not new_row then #If new positions are out of the board, they are nil
			false
		else #If they are not nil, move the agent
			@board[new_row, new_col] = @agent #Move Agent
			@board[*@agent.getPos()] = Clean.new(true) #Clean previous tile, set it as analized
			@agent.updatePos(new_row, new_col) #Tell agent new position
		end
	end

	def getTile(direction) #Returns the tile in that direction from the agent
		new_row, new_col = getNextPositions(direction)
		if not new_row then #If new positions are out of the board, they are nil
			nil
		else
			@board[new_row, new_col] #Returns the instance of that tile
		end
	end

	def clean() #Tell the board to clean itself with its agent
		@agent.printStart()
		puts "Enter delay in sec"
		speed = gets.chomp.to_i
		printBoard()
		while (not @agent.finished?) do
			@agent.work()
			sleep(speed)
			printBoard()
		end
		@agent.printFinish()
	end

	def cleanWithoutPrinting() #Tell the board to clean itself with its agent without printing
		while (not @agent.finished?) do
			@agent.work(true) #Not printing = true
		end
		@agent.getMovements()
	end

end
 