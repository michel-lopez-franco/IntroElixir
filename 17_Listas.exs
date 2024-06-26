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
