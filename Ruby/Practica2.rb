#Ejercicio 1
def ordenar_arreglo(arreglo)
    arreglo.sort! 
end

#Ejercicio 2
def ordenar(*params)
    arreglo = []
    params.each do | p |
       arreglo.push(p) 
    end
    return arreglo.sort! 
end

#Ejercicio 3

class Array
   def ordenar
     self.sort!
  end
end
    
#Ejercicio 4

def longitud (*params)
    hash= Hash.new
    params.each do | p |
        hash[p.to_s] = p.to_s.length
    end
    return hash
end

def cuanto_falta(time=nil)
    if (time == nil)
        return Time.new()
    else
        return time - Time.now
    end
end