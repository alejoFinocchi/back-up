require 'minitest/autorun'
require 'minitest/spec'

def expansor(string)
	if !string.is_a? String 
		raise StandardError, 'La entrada no es un string'
	elsif string.empty?
		raise StandardError, 'El string es vacío'
	elsif !string =~ /\A[a-zA-Z]+\Z/
		raise StandardError, 'El formato del string es incorrecto'
	end
	aux = ''
	arr = ('a'..'z').to_a
	string.each_char do |letra|
		aux = aux + letra*(arr.find_index(letra)+1)
	end
	aux
end

describe 'expansor' do
  # Casos de prueba con situaciones y/o entradas de datos esperadas
  describe 'Casos felices' do
    describe 'cuando la entrada es el string "a"' do
      it 'debe devolver "a"' do
        assert_equal('a', expansor('a'))
      end
    end
    describe 'cuando la entrada es el string "f"' do
      it 'debe devolver "ffffff"' do
        assert_equal('ffffff', expansor('f'))
      end
    end
    describe 'cuando la entrada es el string "escoba"' do
      it 'debe devolver "eeeeessssssssssssssssssscccooooooooooooooobba"' do
        assert_equal('eeeeessssssssssssssssssscccooooooooooooooobba', expansor('escoba'))
      end
    end
  end
  # Casos de pruebas sobre situaciones inesperadas y/o entradas de datos anómalas
  describe 'Casos tristes' do
    describe 'cuando la entrada no es un string' do
      it 'debe disparar una excepción estándar con el mensaje "La entrada no es un string"' do
        begin
          expansor(1)
        rescue StandardError => e
          assert_equal("La entrada no es un string", e.message)
        else
          assert_equal('StandardError', e)
        end
      end
    end
    describe 'cuando la entrada es el string vacío' do
      it 'debe disparar una excepción estándar con el mensaje "El string es vacío"' do
        begin
          expansor('')
        rescue StandardError => e
          assert_equal("El string es vacío", e.message)
        else
          assert_equal('StandardError', e)
        end
      end
    end
    describe 'cuando la entrada es el string "9"' do
      it 'debe disparar un excepción estándar con el mensaje "El formato del string es incorrecto"' do
        begin
          expansor('9')
        rescue StandardError => e
          assert_equal("El formato del string es incorrecto", e.message)
        else
          assert_equal('StandardError', e)
        end
      end        
    end
    describe 'cuando la entrada es el string "*"' do
      it 'debe disparar una excepción estándar con el mensaje "El formato del string es incorrecto"' do
        begin
          expansor('*')
        rescue StandardError => e
          assert_equal("El formato del string es incorrecto", e.message)
        else
          assert_equal('StandardError', e)
        end
      end 
    end
  end
end