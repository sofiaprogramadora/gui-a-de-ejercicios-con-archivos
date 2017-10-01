# Ejercicio 1: Escribiendo un archivo básico



# Crear un método que reciba dos strings, este método creará un archivo index.html y pondrá como párrafo cada uno de los strings recibidos.

def method1(str1, str2)
file = File.open("index.html", "w")
	file.print "<p>#{str1}</p>\n<p>#{str2}</p>"
file.close
return nil
end

# Crear un método similar al anterior, que además pueda recibir un arreglo. Si el arreglo no está vacío, agregar debajo de los párrafos una lista ordenada con cada uno de los elementos.

def method2(str1, str2, arr = [])
file = File.open("index.html", "w")
	file.puts "<p>#{str1}</p>\n<p>#{str2}</p>"
	if arr.class == Array && !arr.empty?
		file.puts "<ul>"
		arr.each do |i|
			file.puts "\t<li>#{i}</li>"
		end
		file.puts "</ul>"
	end
file.close
return nil
end

# Crear un tercer método que además pueda recibir un color. Agregar color de fondo a los párrafos.


def method3(str1, str2, arr = [], col = "none")
file = File.open("index.html", "w")
	file.puts "<p style=\"background-color: #{col};\">#{str1}</p>\n<p style=\"background-color: #{col};\">#{str2}</p>"
	if arr.class == Array && !arr.empty?
		file.puts "<ul>"
		arr.each do |i|
			file.puts "\t<li>#{i}</li>"
		end
		file.puts "</ul>"
	end
file.close
return nil
end

# El retorno de los métodos debe devolver nil.

a = method3("Hi world", "Hi Again", [4, 4])