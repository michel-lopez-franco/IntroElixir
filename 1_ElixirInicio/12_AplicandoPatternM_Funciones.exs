defmodule Ejemplos1 do
  def sum(x) when is_tuple(x) do
    if length(Tuple.to_list(x)) == 2 do
      elem(x, 0) + elem(x, 1)
    else
      Tuple.sum(x)
    end
  end

  def sum(a, b) do
    a + b
  end

  def rest(_a, 0) do
    "No permitios restar 0"
  end

  def rest(_a, b) when b < 0 do
    "No permitimos restar negativos"
  end

  def rest(a, b) do
    a - b
  end

  def div(_a, b) when b == 0 do
    :inf
  end

  def div(a, b) when is_number(a) and is_number(b) do
    a / b
  end

  def div(_a, _b) do
    :invalid
  end

  def print1({:ok, x}) do
    IO.puts("Todo fue bien. El valor es #{x}")
  end

  def print1({:error, x}) do
    IO.puts("Hubo un error. El valor es #{x}")
  end
end

IO.puts("Ejemplo con sum(1, 2)")
IO.inspect(Ejemplos1.sum(1, 2))

IO.puts("Ejemplo con rest(1, 2)")
IO.inspect(Ejemplos1.rest(1, 2))

IO.puts("Ejemplo con rest(1, 0)")
IO.inspect(Ejemplos1.rest(1, 0))

IO.puts("Ejemplo con rest(1, -2)")
IO.inspect(Ejemplos1.rest(1, -2))

IO.puts("Ejemplo con div(1, \"cadena\")")
IO.inspect(Ejemplos1.div(1, "cadena"))

IO.puts("Pasar una tupla a la función suma")
IO.inspect(Ejemplos1.sum({1, 2, 3}))

IO.puts("Pasar una tupla a la función suma {1,2,3,4,5}")
IO.inspect(Ejemplos1.sum({1, 2, 3, 4, 5}))

IO.puts("Invocar a print1 con {:ok, 10}")
Ejemplos1.print1({:ok, 10})

IO.puts("Invocar a print1 con {:error, 10}")
Ejemplos1.print1({:error, 10})
