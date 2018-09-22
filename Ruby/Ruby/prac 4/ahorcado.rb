class Ahorcado

	def self.getWordsHash
		wordsHash = {}
		file = File.open("words.txt", "r") do |file|
			  file.each_line do |line|
			  	arr = line.split(",")
			  wordsHash[arr[0]] = arr[1]
			end
		end
		file.close
		wordsHash
	end
end