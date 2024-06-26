# utilizar case para verificar o tipo de dado e retornar o valor

# exp = File.mkdir("ej1.txt") #crear directorio
archivo = File.touch("ej1.txt")

if archivo == :ok do
  IO.puts("El archivo se creo correctamente")
  File.write("ej1.txt", "Hola Mundo")
else
  IO.puts("El archivo no se pudo crear")
end

# exp = File.read("ej1.txt")
exp = File.read("ej11.txt")
IO.inspect(exp)

output =
  case exp do
    {:ok, value} -> IO.puts("El archivo se creo correctamente #{value}")
    {:error, value} -> IO.puts("El archivo no se pudo crear #{value}")
  end

IO.inspect(output)
