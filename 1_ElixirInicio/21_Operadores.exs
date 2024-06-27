# %{a: 1, b: 2, c: 3}
kv = [a: 1, b: 2] ++ [c: 3]
IO.inspect(kv)

# ** (ArgumentError) argument error
# maps = %{a: 1, b: 2} ++ %{c: 3}
maps = Map.merge(%{a: 1, b: 2}, %{c: 3})
IO.inspect(maps)

# Gana lo de la derecha
maps = Map.merge(%{a: 1, b: 2}, %{c: 3, a: 4})
IO.inspect(maps)

Map.put(maps, :a, 8) # Genera una copia
IO.inspect(maps)

val = Map.get(maps, :a) # 4
IO.inspect(val)

val = Map.get(maps, :d, "No existe") # "No existe"
IO.inspect(val)

val = Map.get(maps, :d) # nil
IO.inspect(val)

val = maps[:a] # 4
IO.inspect(val)

val = maps[:d] # nil
IO.inspect(val)

maps2 = Map.delete(maps, :a) # Genera una copia
IO.inspect(maps)
IO.inspect(maps2)


persona = %{nombre: "Michel", edad: 18, pais: "Mexico", comida: "Verduras"}
IO.inspect(persona)

persona2 = %{persona | comida: "Pizza"} #actualizar keys que ya existen
IO.inspect(persona2)

# Estructuras asociativas
IO.inspect("----------------------Estructuras asociativas---------------------- ")
# Un mapa con 4 keys
perfil = %{nombre: "Michel", edad: 18, pais: "Mexico", comida: "Verduras"}

perfil2 = Map.put(perfil, :saludo, "Hola Mundo") # Genera una copia
IO.inspect(perfil)
IO.inspect(perfil2)
