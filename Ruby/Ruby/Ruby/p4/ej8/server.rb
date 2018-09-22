require 'bundler'
Bundler.require

require_relative 'templates'
require_relative 'ahorcado'
require_relative 'check_only_letter'

#RACK

use CheckOnlyLetter

#VARIABLES
words = Ahorcado.getWordsHash
status = Ahorcado.initAllStatusHash(words)
saved = {}

#RUTAS
get '/' do
	Templates.renderStatic('index')
end

post '/' do
	id = rand(1..words.size)
	redirect to("/partida/#{id}")
end

get '/partida/:id' do
	id = params[:id]
	word = words[id]
	wordSize = word.length.to_s
	st = status[id]

	args = [
		wordSize, 
		st[:attemptsLeft].to_s, 
		st[:attemptsFailed].to_s, 
		st[:guessedLetters].join(' '), 
		st[:usedLetters].join(","), 
		id.to_s
	]
	if Ahorcado.win?(word, st[:guessedLetters].join())
		Ahorcado.addVictory(id) unless saved[id]
		saved[id] = true
		Templates.render('won', [id])
	else
		Templates.render('game', args)
	end
end

put '/partida/:id' do
	id = params[:id]
	letter = params[:attempt]
	word = words[id]
	st = status[id]

	if (st[:guessedLetters] + st[:usedLetters]).include? letter
		Templates.render('msg', ['Ya se us&oacute; esa letra.'])
	elsif st[:attemptsLeft] > 0
		if word.include? letter 
			st[:guessedLetters] = Ahorcado.fillProgress(letter, word, st[:guessedLetters])
		else
			st[:usedLetters] << letter
			st[:attemptsFailed] += 1
			st[:attemptsLeft] -= 1
		end
		redirect to("/partida/#{id}")
	else
		Templates.render('msg', ['Se acabaron los intentos.'])
	end
end

get '/partida/:id/reset' do
	id = params[:id]
	word = words[id]

	saved[id] = false
	status[id] = Ahorcado.initStatusHash(word.size)
	redirect to("/partida/#{id}")
end