def en_palabras(time)
	case time.min
	when (0..10)
		digo(time.hour, 'en punto')
	when (11..20)
		digo(time.hour, 'y cuarto')
	when (21..34)
		digo(time.hour, 'y media')
	when (35..44)
		digo(time.hour+1, 'menos veinticinco')
	when (45..55)
		digo(time.hour+1, 'menos cuarto')
	when (56..59)
		"Casi son las #{time.hour+1}"
	end
end

def digo(hora, minutos_en_palabras)
	"Son las #{hora} #{minutos_en_palabras}"  
end
en_palabras(Time.now)