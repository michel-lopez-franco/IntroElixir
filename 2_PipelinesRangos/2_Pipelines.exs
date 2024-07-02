
# Generar una lista que regrese pares y despues los multiplique por 2

lista = [1,2,3,4,5,6,7,8,9]
IO.inspect(lista, label: "lista")

a = Enum.filter(lista, fn x -> rem(x,2) == 0 end)
IO.inspect(a, label: "Enum.filter(lista, fn x -> rem(x,2) == 0 end)")

b = Enum.map(a, fn x -> x * 2 end)
IO.inspect(b, label: "Enum.map(a, fn x -> x * 2 end)")

c = Enum.reduce(b,0, fn x, acc -> x + acc end)
IO.inspect(c, label: "Enum.reduce(b,0, fn x, acc -> x + acc end)")

# Utilizando pipe operator |>
# pasa a filter siempre como primer parametro

resul = lista |> Enum.filter(fn x -> rem(x,2)== 0 end)

IO.inspect(resul, label: "lista |> Enum.filter(fn x -> rem(x,2)== 0 end)")

IO.puts("Todo anterior reducido")

resul = lista |> Enum.filter(fn x -> rem(x,2)== 0 end) |> Enum.map(fn x -> x * 2 end) |> Enum.reduce(0, fn x, acc -> x + acc end)
IO.puts("lista |> Enum.filter(fn x -> rem(x,2)== 0 end) |> Enum.map(fn x -> x * 2 end) |> Enum.reduce(0, fn x, acc -> x + acc end)")
IO.inspect(resul, label: "resul")


resul = lista |> Enum.filter(fn x -> rem(x,2)== 0 end)
              |> Enum.map(fn x -> x * 2 end)
              |> Enum.reduce(0, fn x, acc -> x + acc end)

IO.puts("lista |> Enum.filter(fn x -> rem(x,2)== 0 end) |> Enum.map(fn x -> x * 2 end) |> Enum.reduce(0, fn x, acc -> x + acc end)")
IO.inspect(resul, label: "resul")

IO.puts("Añadiendo un inspect en el pipe operator")
resul = lista |> Enum.filter(fn x -> rem(x,2)== 0 end)
              |> IO.inspect()
              |> Enum.map(fn x -> x * 2 end)
              |> IO.inspect()
              |> Enum.reduce(0, fn x, acc -> x + acc end)
              |> IO.inspect()


IO.puts("--------------------- Ejemplo 2 ---------------------")

q

IO.puts("--------------------- Ejemplo 2.1 ---------------------")
mimap |> IO.inspect()
      |> Enum.map(fn {_,v} -> v * 10 end)
      |> IO.inspect()

IO.puts("--------------------- Ejemplo 3 ---------------------")
