# Tipos de datos compuestos
x = 10
y = 10
z = 25

# Tuplas
punto = {x, y, z}
IO.inspect(punto)
punto2 = {:hola, 5, "mundo", 5.25}
IO.inspect(punto2)

cocres = fn a, b -> {div(a, b), rem(a, b)} end

IO.inspect(cocres.(8, 3))
IO.inspect(cocres.(10, 5))

# tuplas son inmutables {}
tmp = Tuple.append({4, 0}, 2)
IO.inspect(tmp)
x = {4, 2}
y = Tuple.append(x, {1, 5})
IO.inspect(x)
IO.inspect(y)

IO.puts("Algunas funciones interesantes para trabajar con Tuplas")
# Kernel.elem/2
IO.inspect(elem({1, 2, 3}, 2))
IO.inspect(elem(x, 1))
# Genera una copia

# Listas
# Listas son inmutables
# Listas son enlazadas
# Listas son de longitud variable
