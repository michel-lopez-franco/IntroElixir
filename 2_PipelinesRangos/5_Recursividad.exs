defmodule RecursionListas do
  def sumar([]), do: 0
  def sumar([head | tail]), do: head + sumar(tail)

  def dobles([]), do: []

  def dobles([head | tail]) do
    IO.inspect(head, label: "head")
    IO.inspect(tail,label: "tail")
    lista = [head * 2 | dobles(tail)]
    IO.inspect(lista, label: "lista")
    lista
  end

  def pares([]), do: []
  def pares([head | tail]) when rem(head, 2) == 0, do: [head | pares(tail)]
  def pares([_head | tail]), do: pares(tail)


  def suma2([], acc), do: acc
  def suma2([head | tail], acc), do: suma2(tail, head + acc)
  def suma2(lista), do: suma2(lista, 0)
end


#IO.puts RecursionListas.sumar([1, 2, 3, 4, 5]) # 15

#IO.puts RecursionListas.dobles([1, 2, 3, 4, 5]) # [2, 4, 6, 8, 10]
#IO.inspect(RecursionListas.dobles([]))

#IO.inspect(RecursionListas.dobles([1]))

#IO.puts('-------------------')
#IO.inspect(RecursionListas.dobles([1,2]))

#IO.puts('-------------------')
#IO.inspect(RecursionListas.dobles([1,2,3,4,5]))

IO.puts('-------------------')
IO.inspect(RecursionListas.pares([1,2,3,4,5,6,7,8,9,10])) # [2, 4, 6, 8, 10]

IO.puts('-------------------')
IO.inspect(RecursionListas.suma2([1,2,3,4,5], 0)) # 15
IO.inspect(RecursionListas.suma2([1,2,3,4,5], 6)) # 21
IO.inspect(RecursionListas.suma2([1,2,3,4,5])) # 15
