defmodule Calculadora do

  def suma(a,b) do
    IO.puts("Sumando #{a} + #{b}")
    a + b
  end

end

IO.inspect(Calculadora.suma(1,2))
