class Tile 

	def initialize(analized = false)
		@analized = analized
	end

	def setAnalized()
		@analized = true
	end

	def wasNotAnalized?()
		not @analized
	end

end

class Dirty < Tile

	def draw()
		if wasNotAnalized? then
			'/'
		else
			'd'
		end
	end

	def type()
		'd'
	end

end

class Clean < Tile

	def draw()
		if wasNotAnalized? then
			'.'
		else
			'c'
		end
	end

	def type()
		'c'
	end

end
 