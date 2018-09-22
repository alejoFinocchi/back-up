require 'bundler'
Bundler.require

require_relative 'ahorcado'

words = Ahorcado.getWordsHash
#status = Ahorcado.initAllStatusHash(words)

get '/' do
	erb:index
end

post '/' do
	id= 1
	redirect to("/partida/#{id}")
end


get '/partida/:id' do
	args= {}
	erb:game, locals => {:args => args}
end