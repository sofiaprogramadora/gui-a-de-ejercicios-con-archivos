# # Ejercicio 3: Contando palabras

# Crear un método que reciba el archivo peliculas.txt, lo abra y cuente la cantidad total de palabras. El método debe devolver este valor.

def method
	file = File.open("peliculas.txt", "r")
		data = file.readlines
	file.close
	num = 0
	data.each do |i|
		arr = i.split(" ")
		num += arr.size
	end

	return num
end

# Crear un método similar para que además reciba -como argumento- un string. En este caso el método debe contar únicamente las apariciones de ese string en el archivo.

def method2(str)
	file = File.open("peliculas.txt", "r")
		data = file.readlines
	file.close
	num = 0
	data.each do |i|
		arr = i.split(" ")
		arr.each do |ii|
			num += 1 if ii == str
		end
	end

	return num
end

puts method
puts method2("Jedi")