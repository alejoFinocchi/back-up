module Reverso
	def di_tcejbo
		self.object_id.reverse!
	end
end

class Fixnum
	def reverse!
		x = self
		y = 0
		while x > 0 do
   			y = y*10
   	 		y = y + (x%10)
    		x = x/10 
    	end
		y    
	end
end

class Object
	include Reverso
end

a="HOLA".freeze
puts a.object_id
puts a.object_id
puts a.di_tcejbo