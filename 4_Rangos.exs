


n = 1..15
IO.inspect(Enum.to_list(n))


n = 1..30
IO.inspect( n )

1..15 |> Enum.to_list |> IO.inspect


1..30 |> Enum.sum() |> IO.inspect

1..30 |> Enum.map(&(&1 * 2)) |> IO.inspect

1..30 |> Enum.filter(&(&1 > 10)) |> IO.inspect

1..30 |> Enum.reduce(0, &(&1 + &2)) |> IO.inspect

1..30 |> Enum.reduce(0, fn x,acc -> x+acc end) |> IO.inspect

# Son coleccion idlers de elementos
# No sueltan hasta que procesa la lista completa

# en lugar de Enumerados existen las lazy enumerables
IO.puts("Lazy Enumerables")
res = 1..10 |> Stream.map(&IO.inspect/1)
IO.inspect(res)

# Regresa Streams que son vagos que no se procesan aun
res = 1..10 |> Stream.map(&IO.inspect/1) |> Enum.to_list
IO.inspect(res)

IO.puts("----------------------- Enumerables vs Streams -----------------------")

IO.puts("Nota: No imprime por pantalla todos los numeros")

IO.puts("Con Enum")
res = 1..100 |> Enum.map(&IO.inspect/1) |> Enum.take(5)
IO.inspect(res)

IO.puts("Con Stream")
res = 1..100 |> Stream.map(&IO.inspect/1) |> Enum.take(5)
IO.inspect(res)


# Se hubieran procesado todos los elementos
