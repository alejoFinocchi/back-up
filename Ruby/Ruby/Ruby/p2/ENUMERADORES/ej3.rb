class Array
	def randomly 
		if block_given? 
			self.shuffle.collect {|elem| yield elem}
		else
			self.shuffle.collect
		end
	end
end

array=[1,2,3,4,5,6,7,8,9]
puts 'Llamo a randomize con el arreglo y un bloque(100*elem)'
puts array.randomly {|elem| 100*elem}
puts 'Llamo a randomize con el arreglo sin blque, pidiendole next 3 veces'
puts array.randomly.next
puts array.randomly.next
puts array.randomly.next