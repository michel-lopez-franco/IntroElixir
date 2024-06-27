# Tuplas
IO.puts("Tuplas")
a = {1, 2, 3, 4, 5}
IO.inspect(a)
IO.inspect(elem(a, 2))

# Listas
IO.puts("Listas")
a = [1, 2, 3, 4, 5]
IO.inspect(a)
IO.inspect(hd(a))
IO.inspect(tl(a))
IO.inspect(Enum.at(a, 2))

# Listas
base = []
IO.inspect(base)
cabesa = 1
IO.inspect([cabesa | base])
uno = [cabesa | base]
IO.inspect(uno)

dos = [2 | uno]
IO.inspect(dos)

tres = [3 | dos]
IO.inspect(tres)

cuatro = [tres | 4]
IO.inspect(cuatro)
IO.inspect(hd(cuatro))
IO.inspect(tl(cuatro))

[cabesa1, cabeza2 | cola] = [1, 2, 3, 4, 5, 6]
IO.inspect(cabesa1)
IO.inspect(cabeza2)
IO.inspect(cola)

[ cabesa2 | [cola1,cola2]] = [1,2,3]
IO.inspect(cabesa2)
IO.inspect(cola1)
IO.inspect(cola2)

[ cabesa2 | [cola1 |cola2]] = [1,2,3,4,5,6]
IO.inspect(cabesa2)
IO.inspect(cola1)
IO.inspect(cola2)

x = [1,2,3,4]
y = [3,4,5,6]

IO.puts("x ++ y")
IO.inspect(x ++ y)
IO.puts("x -- y")
IO.inspect(x -- y)

IO.puts("funcion at")
x = ["a","b","c","d","e"]
IO.puts( Enum.at(x,2) )

IO.puts("funcion insert_at")
IO.inspect( List.insert_at(x, 2, "z") )
IO.inspect( List.insert_at(x, 2, ["Hola","Mundo"]) )
IO.inspect( List.delete(x, 2) )
IO.inspect( x -- ["d"] )

IO.inspect( length(x))
IO.inspect( length([]))
#IO.inspect( length(nil))

IO.inspect( List.flatten([1,2,3,[4,5,6],[7,8,9]]) )
IO.inspect( List.flatten( [1,2,3,[4,5,6],[7,8,9], [10,11,12],[13,14,15]]) )

IO.inspect( {[1,2,3],[4,5,6]})
IO.inspect( [{1,2,3},{4,5,6}])

IO.puts("Keyword Lists")
IO.inspect( [a: 1, b: 2, c: 3] )
kwlist0 = [a: 1, b: 2, c: 3]
kwlist = [ {:hola,5},{:mundo,5}]

IO.inspect( kwlist )
IO.inspect( kwlist[:hola] )
IO.inspect( kwlist0[:a] )

IO.inspect( "Concatenacion " )
IO.inspect( kwlist ++ kwlist0 )
IO.inspect( kwlist ++ [a: 6, hola: 8] )

kwlist1 = kwlist ++ [a: 6, hola: 8]
IO.inspect( kwlist1[:hola] )


i = &IO.inspect/1
i.("Regresar un keyword list")
edad = 25

mensaje = if edad >= 18 do
  "Mayor de edad"
else
  "Menor de edad"
end

IO.inspect(mensaje)

mensaje = if edad >= 18, do: "Mayor de edad2", else: "Menor de edad2"

IO.inspect(mensaje)
