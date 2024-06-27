# %{a: 1, b: 2, c: 3}
kv = [a: 1, b: 2] ++ [c: 3]
IO.inspect(kv)

# ** (ArgumentError) argument error
# maps = %{a: 1, b: 2} ++ %{c: 3}
maps = Map.merge(%{a: 1, b: 2}, %{c: 3})
IO.inspect(maps)

# GAna lo de la derecha
maps = Map.merge(%{a: 1, b: 2}, %{c: 3, a: 4})
IO.inspect(maps)
