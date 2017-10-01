class Producto

	attr_accessor :name, :t1, :t2, :t3
	def initialize(name, t1, t2, t3)
		@name = name
		@t1 = t1.to_i unless t1 == "NR"
		@t1 = "NR" if t1 == "NR"
		@t2 = t2.to_i unless t2 == "NR"
		@t2 = "NR" if t2 == "NR"
		@t3 = t3.to_i unless t3 == "NR"
		@t3 = "NR" if t3 == "NR"
	end

	def to_s
		"#{@name}, #{@t1}, #{@t2}, #{@t3}"
	end

	def total
		sum = 0
		sum += @t1 unless @t1 == "NR"
		sum += @t2 unless @t2 == "NR"
		sum += @t3 unless @t3 == "NR"
		return sum
	end

	def nr?
		true if @t1 == "NR" || @t2 == "NR" || @t3 == "NR"
	end
end


file = File.open("productos.txt", "r")
	data = file.readlines
file.close

products = []


data.each do |i|
	item = i.split(", ")
	products << Producto.new(item[0].chomp , item[1].chomp, item[2].chomp, item[3].chomp)
end





# # Ejercicio 4: Ejercicio tipo prueba

# Se tiene un archivo con diversos productos, donde la primera columna indica el nombre del producto y el resto de las columnas muestra el stock en distintas tiendas.

# Producto1, 10, 15, 21

# Producto2, 20, 0, 3

# Producto3, 4, 8, 0

# Producto8, 1, 2, NR

# Producto12, NR, 2, NR

# Donde NR significa no registrado.


val = nil

# Se pide:

# Crear un menú con 5 opciones, se debe validar que la opción escogida sea 1, 2, 3, 4, 5 o 6.


while val != 6 # Starts while loop
	if val == 1
		newval = nil
		while newval != "d"
			puts "a) Mostrar la existencia por productos."

			puts "b) Mostrar la existencia total por tienda."

			puts "c) Mostrar la existencia total en todas las tiendas."

			puts "d) Volver al menú principal."

			newval = gets.chomp

			if newval == "a"
				puts products
			elsif newval == "b"
				print "Tienda: "
				newnewval = gets.chomp
                if newnewval == "t1"
                    products.each do |i|
                        puts i.t1
                    end
                elsif newval == "t2"
                    products.each do |i|
                        puts i.t2
                    end
                elsif newval == "t3"
                    products.each do |i|
                        puts i.t3
                    end
                end
			elsif newval == "c"
				puts "________________________________"
				puts "| Tienda 1 | Tienda 2 | Tienda 3|"
				products.each do |i|
					puts "#{i.t1}       | #{i.t2}       | #{i.t3}       |"
				end
			else
				puts "Ese no es un comando existente. Porfavor elija un comando existente."
			end
		end
	elsif val == 2
		tp = nil
		print "Producto: "
		g = gets.chomp.to_s
		puts
		products.each do |i|
			tp = i if i.name == g
		end

		puts tp.total
	elsif val == 3
		products.each do |i|
			puts i if i.nr?
		end
	elsif val == 4
		print "Ingresa un valor: "
		usr_val = gets.to_i
		puts
		products.each do |i|
			puts i if i.total < usr_val
		end
	elsif val == 5
		file = File.open('productos.txt', 'a')
		print "Nombre: "
		newname = gets.chomp
		puts
		print "Stock t1: "
		newt1 = gets.chomp
		print "Stock t2: "
		newt2 = gets.chomp
		print "Stock t3: "
		newt3 = gets.chomp
		products << Producto.new(newname, newt1, newt2, newt3)
		file.write "\n#{products.last}"
		file.close
	else
		puts "Porfavor elija un comando existente!" unless val == nil
	end
	puts "1) Conocer la cantidad de productos existentes."
	puts "2) Ingrese el nombre de un producto y el programa responderá con la cantidad de stock total (suma en las bodegas) de ese producto."
	puts "3) Conocer productos no registrados en cada bodega."
	puts "4) Conocer los productos con una existencia total menor a un valor ingresado por el usuario."
	puts "5) registrar un nuevo producto con su respectivo stock en cada bodega. (Hint: abrir el archivo como append)."
	puts "6) Salir de SuPer Pr0DuCt0s"
	val = gets.chomp.to_i
end
# La opción 1 permite conocer la cantidad de productos existentes. Al seleccionar esta opción, se mostrará un submenú que permitirá:

# puts "a) Mostrar la existencia por productos."

# puts "b) Mostrar la existencia total por tienda."

# puts "c) Mostrar la existencia total en todas las tiendas."

# puts "d) Volver al menú principal."

# Hint: Se debe validar que la opción ingresada sea válida.

# La opción 2 permite que el usuario ingrese el nombre de un producto y el programa responderá con la cantidad de stock total (suma en las bodegas) de ese producto.

# La opción 3 muestra los productos no registrados en cada bodega.

# La opción 4 permite conocer los productos con una existencia total menor a un valor ingresado por el usuario.

# La opción 5 permite registrar un nuevo producto con su respectivo stock en cada bodega. (Hint: abrir el archivo como append).

# Si el usuario ingresa la opción 6 el programa sale, si ingresa cualquier otra opción se debe mostrar que la opción es inválida, y mostrar el menú nuevamente y la opción de elegir.
