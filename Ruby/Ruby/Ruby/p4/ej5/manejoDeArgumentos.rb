require 'sinatra'

get '/' do
	lista todos los endpoints disponibles (sirve a modo de documentación)
end 
get '/mcm/:a/:b' do
	calcula y presenta el mínimo común múltiplo de los valores numéricos
end
get 'mcd/:a/:b' do
	calcula y presenta el máximo común divisor de los valores numéricos
end
get '/sum/*' do
	calcula la sumatoria de todos los valores numéricos recibidos como parámetro en el splat
end
get '/even/*' do
	presenta la cantidad de números pares que hay entre los valores numéricos recibidos como parámetro en el splat
end
post '/random' do
	rand(1..1000)
end
post '/random/:lower/:upper' do
	rand(params[':lower']..params[':upper'])
end