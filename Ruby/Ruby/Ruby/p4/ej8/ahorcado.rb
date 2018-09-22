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

	def self.initAllStatusHash(words)
		status = {}
		words.each do |key, value|
			status["#{key}"] = self.initStatusHash(value.size)
		end
		status
	end

	def self.initStatusHash(wordSize)
		{	
		attemptsLeft: 10, 
		attemptsFailed: 0, 
		guessedLetters: self.generateEmptyProgress(wordSize), 
		usedLetters: [] 
		}
	end

	def self.generateEmptyProgress(size)
		emptyProgress = []
		(1..size).each { emptyProgress << '_' }
		emptyProgress
	end

	def self.fillProgress(letter, word, guessedLetters)
		(0..word.size-1).each do |i|
			if(letter == word[i]) 
				guessedLetters[i] = letter 
			end
		end
		guessedLetters
	end

	def self.win?(word, guessedLetters)
		(word.chars - guessedLetters.chars).empty?
	end

	def self.addVictory(id)
		tmp = ''
		file = File.open("words.txt", "r") do |file|
			  file.each_line do |line|
			    arr = line.split(",")
			    if arr[0] == id.to_s
			    	arr[2] = arr[2].to_i + 1
			    	tmp << arr.join(',')
			    else
			    	tmp << line
			    end
			  end
		end
		file.close
		file = File.open("words.txt", "w") do |file|
			file << tmp
		end
		file.close
	end

end