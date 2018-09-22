require_relative "Board.rb"

class Agent

	def initialize(row, col, board, total_tiles)
		@row = row
		@col = col
		@board = board
		@directions = ["up", "down", "left", "right"]
		@total_tiles = total_tiles
		@movements = 0
		@analized_tiles = 1
		@next_mov = nil
		@last_move = nil
	end

	def draw()
		'A'
	end

	def getPos()
		return @row, @col
	end

	def updatePos(row, col)
		@row = row
		@col = col
	end

	def getMovements()
		@movements
	end

	def printStart()
		puts("Starting...")
		puts("c = clean tiles")
		puts("d = dirty tiles")
		puts(". = not analized clean tiles")
		puts("/ = not analized dirty tiles")
		puts("A = cleaning agent")
		puts("Total tiles = #{@total_tiles}")
	end

	def printFinish()
		puts("Finished")
		puts("Total tiles = #{@total_tiles}")
		puts("Movements made: #{@movements}")
		@movements
	end

	def work(notPrinting = false) 
		#Check bordering tiles
		enters = 0 #To calculate how many enters should I add to make de board stays in the same place in the terminal
		@directions.shuffle! #Randomize order
	    @directions.reject{ |dir| dir == getOppositeDirection(@last_move) }.each do |dir| #Iterate all directions except the one that he came from
	    	@looking_direction = dir
	    	looking_tile = @board.getTile(@looking_direction)

	    	print "Cheking #{@looking_direction} tile: " unless notPrinting

	    	if not looking_tile then #If getTile returns nil
	    		puts "Won't go there, I'd fall form the board" unless notPrinting
	    		enters += 1
	    		#No more board
	    	elsif looking_tile.type() == 'd' then #If that tile is dirty, lets go there
	    		puts "Its dirty" unless notPrinting
	    		enters += 1
	    		@next_mov = @looking_direction
	    		if looking_tile.wasNotAnalized? then @analized_tiles += 1 end #No need to set analized, because it will create a clean new one already analized
	    		break #Gets out of this loop to perform the movement
	    	elsif looking_tile.type() == 'c' then
	    		puts "Its clean" unless notPrinting
	    		enters += 1
	    		@next_mov = @looking_direction #Set possible next move
	    		if looking_tile.wasNotAnalized? then 
	    			@analized_tiles += 1
	    			looking_tile.setAnalized()
	    		end
	    	end
	    end

	    puts "So let's go #{@next_mov}" unless notPrinting

	    for i in enters..2 do puts("") end #Print the missing enters

	    #Movement
	    @board.moveAgent(@next_mov) #Move to the dirty tile and clean it
	    @movements += 1
	    @last_move = @next_mov
	end

	def getOppositeDirection(direction)
		case direction 
		when "up"
			"down"
		when "down"
		  	"up"
		when "left"
			"right"
		when "right"
			"left"
		else
			nil
		end 
	end

	def finished?
		@analized_tiles == @total_tiles
	end
end