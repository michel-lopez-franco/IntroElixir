defmodule Ejemplos2 do
  def area(:base), do: 10

  def arearectangulo(base: base, altura: altura) do
    base * altura
  end

  def areaEquilatero(%{altura: altura, base: base}) do
    base * altura
  end
end

IO.inspect(Ejemplos2.area(:base))
IO.inspect(Ejemplos2.arearectangulo(base: 2, altura: 3))
IO.inspect(Ejemplos2.areaEquilatero(%{base: 2, altura: 3}))
