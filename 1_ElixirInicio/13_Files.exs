# Funciones puras
# Para que una función sea pura, no debe tener efectos secundarios
# Siempre que se llame con los mismos argumentos, debe devolver el mismo resultado

# => "HOLA"
IO.inspect(String.upcase("hola"))
IO.inspect(String.upcase("hola"))
IO.inspect(String.upcase("hola"))
IO.inspect(String.upcase("hola"))

# Funciones impuras
# Con el mundo real archivos redes
# No se garantiza que siempre devuelva el mismo resultado
# El mundo real no es puro y puede fallar
IO.inspect(File.cwd())
IO.puts("Intento de crear el archivo ej1.txt")
op = File.mkdir("ej1.txt")

if File.exists?("ej1.txt") do
  IO.puts("El archivo existe")
  File.rm("ej1.txt")
  IO.puts("El archivo se elimino")
else
  IO.puts("El archivo no existe")
end

if op == :ok do
  IO.puts("El archivo se creo correctamente")
else
  IO.puts("El archivo no se pudo crear")
end

File.write("hola.txt", "Hola Mundo")
File.close("hola.txt")
IO.puts("Se escribio en el archivo hola.txt")
IO.inspect(File.read("hola.txt"))

IO.puts("Cuando no se lee bien el archivo")
IO.inspect(File.read("holaasdfasd.txt"))

File.rm("ej1.txt")
