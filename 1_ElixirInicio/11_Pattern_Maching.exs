# El igual es un operador de match en elixir

# la unica manera de resolver el match es que x sea igual a 10
x = 10
IO.inspect(x)

# La unica manera de resolver el match es que x sea igual a 11
x = 5 + 6
IO.inspect(x)

x = {:Hola, :Mundo}
IO.inspect(x)

{a, b} = {:Hola, :Mundo}
IO.inspect(a)
IO.inspect(b)

IO.puts("Ejemplo con {1, a, 3} = {1, 2, 3}")
{1, a, 3} = {1, 2, 3}
IO.inspect("a: #{a}")

IO.puts("Ejemplo con {2, a, 3} = {1, 2, 3}")
IO.puts(" ** (MatchError) no match of right hand side value: {1, 2, 3}")
# {2, a, 3} = {1, 2, 3}
# IO.inspect("a: #{a}")
