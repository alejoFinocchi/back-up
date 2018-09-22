def reemplazar(stringg)
    return stringg.gsub(/[{}]/, '{'=> 'do\n', '}'=> '\nend')
end
// consultar porque salen dos barrass \\

def en_palabras(time)
    times ={ 1 => "una", 2 => "dos", 3=>"tres", 4=>"cuatro", 5=>"cinco", 6=>"seis", 7=>"siete",
    8=>"ocho",9=>"nueve",10=>"diez",11=>"once",12=>"doce"}
    minutes=
    return "Son las " + times[time.hour] + time.min.to_s
end

def contar(oracion, palabra)
    return oracion.downcase.scan(/(?=#{palabra})/).count()
end

def contar_palabra(oracion, palabra)
    return oracion.downcase.scan(/(?=#{palabra})/).count()
end

def longitud(arraypalabras)
	arraycantidad= []
    arraypalabras.each { |palabra|
     arraycantidad.push palabra.count
     } 
    return arrayCantidad
end
