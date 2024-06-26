defmodule Recursivo do

  def factorial(0), do: 1

  def factorial(n), do: n * factorial(n - 1)

end


IO.puts(Recursivo.factorial(5))
IO.puts(Recursivo.factorial(0))
