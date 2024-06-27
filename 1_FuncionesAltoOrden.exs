
# Funciones de primera clase -> capturar una función en una variable y pasar como parametro

res = String.upcase("hola")
IO.puts(res)

mayusculas = &String.upcase/1
res = mayusculas.("hola")
IO.puts(res)

# Funcion anonima
doble = fn x -> x * 2 end
res = doble.(5)
IO.inspect(res, label: "res")
IO.inspect(doble, label: "Nombre de la funcion anonima")

IO.inspect( apply(doble, [5]), label: "apply(doble, [5])")
#IO.inspect( apply(doble, [5,6,7,8]), label: "apply(doble, [5])")

IO.inspect( apply(&rem/2,[9,2]), label: "apply(&rem/2,[9,2])")

# apply es funcion de alto orden que recibe una funcion y una lista de argumentos
IO.inspect( Enum.reduce([1,2,3], 0, &+/2) )


# Tipos Enum son recorribles
#[:a,:b,:c,:d] |> Enum.each(&IO.inspect/1)
IO.inspect([:a,:b,:c,:d], label: "[:a,:b,:c,:d]")

IO.inspect( Enum.at([:a,:b,:c,:d],2,"no lo encontro"), label: "Enum.at([:a,:b,:c,:d],2,'no lo encontro')")

# Los mapas tambien son recorribles

mapa = %{a: 1, b: 2, c: 3}
IO.inspect(mapa, label: "mapa")
IO.inspect(Enum.at(mapa,1),label: "Enum.at(mapa)")

IO.inspect(( Map.keys(mapa)), label: "Map.keys(mapa)")
IO.inspect( Map.values(mapa), label: "Map.values(mapa)")
IO.inspect( Map.to_list(mapa), label: "Map.to_list(mapa)")
#Enum.map(mapa, fn {k,v} -> IO.inspect(k) end)

IO.puts("---------------------- Funcion filter ----------------------")
# Enum.filter
IO.inspect( Enum.filter([1,2,3,4,5], fn x -> rem(x,2) == 0 end), label: "Enum.filter([1,2,3,4,5], fn x -> rem(x,2) == 0 end)")

IO.inspect( Enum.filter([1,2,3,4,5], fn x -> x < 4 end), label: "Enum.filter([1,2,3,4,5], fn x -> x*x end)")

IO.inspect( Enum.filter( %{a: 1, b: 2, c: 3, d: 4}, fn {_,v} -> v >2 end), label: "Enum.filter( %{a: 1, b: 2, c: 3, d:4}, fn {k,v} -> rem(v,2) == 0 end)")


IO.puts("---------------------- Funcion map ----------------------")

a = [1,2,3,4,5,6,7]
IO.inspect(a, label: "a")
IO.inspect( Enum.map(a, fn x -> x * x end), label: "Enum.map(a, fn x -> x * 2 end)")

b = %{a: 1, b: 2, c: 3, d: 4}
IO.inspect(b, label: "b")
IO.inspect( Enum.map(b, fn {_,v} -> v * v end), label: "Enum.map(b, fn {k,v} -> v * v end)")

IO.inspect( Enum.map(b, fn {_,_} -> true end), label: "Enum.map(b, fn {k,v} -> v * v end)")
IO.inspect( Enum.map(b, fn {k,v} -> {k, v * v} end), label: "Enum.map(b, fn {k,v} -> {k, v * v} end)")

IO.inspect( Enum.map(b, fn {k,v} -> "La clave #{k} = #{v}" end), label: "Enum.map(b, fn {k,v} -> 'La clave k = v' end)")

c = Enum.map(a, fn x -> {x,x*2} end)
IO.inspect(c, label: "c")
IO.inspect( Map.new(c), label: "Map.new(c)")

IO.puts("---------------------- Funcion reduce ----------------------")
# filter :: Enumerado -> Enumerado
# map :: Enumerado -> Enumerado
# reduce :: Enumerado -> valor_inicial -> funcion -> valor_final

#IO.inspect( Enum.reduce([1,2,3,4,5], 0, &+/2), label: "Enum.reduce([1,2,3,4,5], 0, &+/2)")
a = [1,2,3,4,5]
IO.inspect(a, label: "a")
# Enum.reduce ( Enum,acc_inicial, funcion )
#IO.inspect( Enum.reduce(a, 0,fn x, acc-> acc = acc + x end))
IO.inspect( Enum.reduce(a, 0,fn x, acc-> acc + x end))

IO.inspect( Enum.reduce(a, 0,fn x, _-> x end))

IO.inspect( Map.new([{:a, 1},{:b, 2}]), label: "Enum.new([{:a, 1},{:b, 2}])") #Lista de tuplas

map = %{a: 1, b: 2, c: 3}
IO.inspect(map, label: "map")
IO.inspect( Enum.reduce(map,0,fn {_,v},acc -> acc + v end), label: "Enum.reduce(map,0,fn {_,v},acc -> acc + v end)")

IO.puts("---------------------- Ejemplo 1 ----------------------")
lista = ["Hola", "adios", "Hola Mundo"]

IO.inspect(lista, label: "lista")
IO.inspect( Enum.map(lista, &String.length/1), label: "Enum.map(lista, &String.length/1)")

# Quiero Generar un mapa con la longitud de cada string
IO.inspect(Enum.reduce(lista, %{}, fn cad, mapa -> Map.put(mapa,cad,String.last(cad)) end), label: "Generar mapa con la longitud de cada string")

IO.puts("---------------------- Generar un mapa paso a paso ----------------------")
IO.inspect(Enum.reduce(lista, %{}, fn cad, mapa -> IO.inspect( Map.put(mapa,cad,String.last(cad))) end ), label: "Como se ve el mapa")
