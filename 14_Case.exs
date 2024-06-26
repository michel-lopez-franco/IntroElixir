# utilizar case para verificar o tipo de dado e retornar o valor

# exp = {:ok, "Hola Mundo"}
# exp = {:ok, 100}
exp = nil
IO.inspect(exp)

output =
  case exp do
    {:ok, x} when is_number(x) -> "Es un numero"
    {:ok, value} -> IO.puts("El archivo se creo correctamente #{value}")
    {:error, value} -> IO.puts("El archivo no se pudo crear #{value}")
    _ -> "Matcheo a cualquier cosa"
  end

IO.inspect(output)
