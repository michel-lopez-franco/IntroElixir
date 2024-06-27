defmodule Recursivo do
  def factorial(0), do: 1

  def factorial(n) do
    n * factorial(n - 1)
  end
end

IO.inspect(Recursivo.factorial(5))
IO.inspect(Recursivo.factorial(1000))
