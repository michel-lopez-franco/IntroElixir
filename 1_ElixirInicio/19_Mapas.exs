# otro tipo estructura asociativa como diccionario
# Mapa en Elixir, es una colección de pares clave-valor
# Es una estructura compuesta, donde la clave es única

IO.puts("Mapa en Elixir")
IO.inspect(%{})

# Crear un mapa
IO.puts("Crear un mapa")
map1 = %{:dia => "Lunes"}
# kv = { :dia, "Martes"} # Tupla
kv = [dia: "Martes"]
IO.inspect(map1)
IO.inspect(kv)
IO.puts("Hay diferenia?")
IO.inspect(map1[:dia])
IO.inspect(kv[:dia])

# En una keyword list se puede tener claves duplicadas
# En un mapa no se puede tener claves duplicadas
# En los keyword list solo se aceptan átomos como claves
# En los mapas se pueden usar cualquier tipo de dato como clave
# En los mapas se pueden usar cualquier tipo de dato como valor

# warning: key 1 will be overridden in map
map2 = %{
  1 => ~c"lunes",
  2 => ~c"martes",
  3 => ~c"miercoles",
  4 => ~c"jueves",
  5 => ~c"viernes",
  1 => ~c"sabado",
  7 => ~c"domingo"
}

kv2 = ["1": ~c"cinco"]
IO.inspect(map2)
IO.inspect(map2[1])
IO.inspect(kv2)

IO.puts("En una keyword list se puede tener claves duplicadas")

map3 = %{:dia1 => ~c"lunes", :dia2 => ~c"martes", "dia4" => ~c"miercoles"}

IO.inspect(map3.dia1)
# ** (KeyError) key :dia3 not found in: %{
# IO.inspect( map3.dia3)
# ** (KeyError) key :dia4 not found in:
# IO.inspect( map3."dia4")
IO.inspect(map3["dia4"])

IO.puts("----------------------Modificando un valor----------------------")
# kv3 = [ "dia4": "viernes" ] # Error la clave debe ser un átomo
kv3 = [dia4: "viernes", dia5: "sabado"]

# map3["dia4"] = "jueves" #warning: key 1 will be overridden in map
IO.inspect(map3["dia4"])

IO.inspect(kv3[:dia4])

# kv3["dia4"] = "sabado" # ** (CompileError) 19_Mapas.exs:53: cannot invoke remote function Access.get/2 inside a match
# IO.inspect( kv3["dia4"] ) #** (ArgumentError) the Access calls for keywords expect the key to be an atom, got: "dia4"

IO.puts("----------------------Diferencias----------------------")

# map3["dia4"] = nil #** (CompileError) 19_Mapas.exs:58: cannot invoke remote function Access.get/2 inside a match
# IO.inspect( map3["dia4"] )

# las keywords son listas y estan ordenadas [1,2,3] != [2,1,3]
# Los mapas no estan ordenados %{1 => 'uno', 2 => 'dos'} == %{2 => 'dos', 1 => 'uno'}

IO.inspect([1, 2, 3] == [2, 1, 3])
IO.inspect(%{1 => ~c"uno", 2 => ~c"dos"} == %{2 => ~c"dos", 1 => ~c"uno"})

IO.puts("----------------------Patten Maching----------------------")
mapa1 = %{a: 1, b: 2, c: 3}

# %{} = mapa1 # OK
# cadena ="%{} = mapa1"
# cadena ="%{a: 1} = mapa1"
# cadena ="%{a: 1, b: 2} = mapa1"
# cadena ="%{a: 1, b: 2, c: 3} = mapa1"

# cadena ="%{a: 1, b: 3} = mapa1" #** (MatchError) no match of right hand side value: %{a: 1, b: 2, c: 3}
cadena = "%{a: 1, b: 2, c: x} = mapa1"

# {resultado, _binding} = Code.eval_string(cadena,[mapa1: mapa1])
resultado = Code.eval_string(cadena, mapa1: mapa1)

IO.inspect(resultado)

# case resultado do
#  {:ok, valor} -> IO.puts("Coincidencia exitosa: #{inspect(valor)}")
#  {:error, _} -> IO.puts("No hubo coincidencia")
#
#  bar -> IO.puts("No hubo coincidencia")
#         IO.puts("Resultado #{inspect(bar)}") #y Binding: #{_binding}")
# end
# IO.inspect(resultado)

IO.puts("----------------------Ejemplo patter match----------------------")

datos = %{nombre: "Juan", edad: 30, ciudad: "Lima"}

case datos do
  %{nombre: nombre, edad: edad} ->
    IO.puts("Nombre: #{nombre}, Edad: #{edad}")

  %{nombre: nombre, edad: edad, ciudad: ciudad} ->
    IO.puts("Nombre: #{nombre}, Edad: #{edad}, Ciudad: #{ciudad}")

  _ ->
    IO.puts("No se pudo obtener los datos")
end

%{ciudad: queciudad, edad: queedad} = datos
IO.inspect(queciudad)
IO.inspect(queedad)
IO.puts("Ojo, El orden de las claves no importa")

# %{edad: queedad, ciudad: queciudad} = [edad: 30, ciudad: "Lima"] #** (MatchError) no match of right hand side value: [edad: 30, ciudad: "Lima"]
# [ciudad: queciudad,edad: queedad ] = [edad: 30, ciudad: "Lima"] #** (MatchError) no match of right hand side value: [edad: 30, ciudad: "Lima"]
# {queciudad,queedad}= [edad: 30, ciudad: "Lima"] #** (MatchError) no match of right hand side value: [edad: 30, ciudad: "Lima"]

# [queciudad,queedad]= [edad: 30, ciudad: "Lima"] # :Ok
# :Ok
[edad: queedad, ciudad: queciudad] = [edad: 30, ciudad: "Lima"]
IO.inspect(queciudad)
IO.inspect(queedad)

IO.puts("----------------------Operador pin----------------------")
IO.puts("El operador pin ^ se usa para hacer referencia a una variable")
IO.puts("y no a un nuevo valor")

x = 5
IO.inspect(x)
^x = 5
IO.inspect(x)
x = 15
IO.inspect(x)

[x, y, z] = [10, 5, 0]
IO.inspect([x, y, z])

[x, ^y, z] = [15, 5, 20]
# [x, ^y, z] = [15, 15, 20] #** (MatchError) no match of right hand side value: [15, 15, 20]
IO.inspect([x, y, z])
