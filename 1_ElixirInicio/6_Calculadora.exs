defmodule Calculadora2 do
  def suma(a,b) do
    a + b
  end

  def resta(a,b) do
    a - b
  end

  def multiplicacion(a,b) do
    a * b
  end

  #Guardas en Elixir
  def division(_a,b) when b == 0  do
    :inf
  end

  def division(a,b) do
    a / b
  end

end
