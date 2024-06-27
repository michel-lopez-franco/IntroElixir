defmodule MiRango do

  def rango(0,0), do: [0]

  def rango(i,n) when i < n do
    c_rango([i],n)
  end

  def c_rango(lista,n) do
    num = List.last(lista) + 1
    IO.inspect(num, label: "num")
    if num == n do
      lista ++ [n]
    else
      c_rango(lista ++ [num],n)
    end

  end

end

IO.puts("Rango de 0 a 10")
IO.inspect(MiRango.rango(0,10))

IO.inspect(MiRango.rango(0,0))
