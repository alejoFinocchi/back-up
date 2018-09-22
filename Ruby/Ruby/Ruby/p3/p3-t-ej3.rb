require 'minitest/autorun'
require 'minitest/spec'
require '../p1/ej4.rb'
require '../p1/ej5.rb'

describe '#en_palabras' do
	describe 'cuando el minuto esta entre 0 y 10' do
		it 'devuelve en punto' do
			t=Time.new(2016, 02, 24, 10, 01, 0)
			assert_equal('Son las 10 en punto', en_palabras(t))
		end
	end
	describe 'cuando el minuto esta entre 11 y 20' do
		it 'devuelve y cuarto' do
			t=Time.new(2016, 02, 24, 10, 12, 0)
			assert_equal('Son las 10 y cuarto', en_palabras(t))
		end
	end
	describe 'cuando el minuto esta entre 21 y 34' do
		it 'devuelve y media' do
			t=Time.new(2016, 02, 24, 10, 22, 0)
			assert_equal('Son las 10 y media', en_palabras(t))
		end
	end
	describe 'cuando el minuto esta entre 35 y 44' do
		it 'devuelve menos veinticinco' do
			t=Time.new(2016, 02, 24, 10, 38, 0)
			assert_equal('Son las 11 menos veinticinco', en_palabras(t))
		end
	end
	describe 'cuando el minuto esta entre 45 y 55' do
		it 'devuelve menos cuarto' do
			t=Time.new(2016, 02, 24, 10, 46, 0)
			assert_equal('Son las 11 menos cuarto', en_palabras(t))
		end
	end
	describe 'cuando el minuto esta entre 56 y 59' do
		it 'devuelve casi las' do
			t=Time.new(2016, 02, 24, 10, 57, 0)
			assert_equal('Casi son las 11', en_palabras(t))
		end
	end	
end

describe '#contar' do
	before do
		@primero = 'La casa de la esquina tiene la puerta roja y la ventana blanca.'
	end
	describe 'cuando el 2do string esta en el 1ro' do
		it 'devuelve la cantidad de apariciones' do
			assert_equal(5,contar(@primero, "la"))
		end
	end
	describe 'cuando el 2do string no esta en el 1ro' do
		it 'devuelve 0' do
			assert_equal(0,contar(@primero, "dsadsa"))
		end
	end
end