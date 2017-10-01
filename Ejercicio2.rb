# Ejercicio 2: Contando líneas
# Se tiene un peliculas.txt con diversas películas:
# Crear un método que lea el archivo, lo abra y devuelva
# la cantidad de líneas que posee.

def method
	file = File.open("peliculas.txt", "r")
		data = file.readlines
	file.close
	return data.size
end

puts method