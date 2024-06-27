defmodule Calculon do
  def operar(func) do
    func.(1,2)
  end

end


IO.puts("Funciones Anonimas")
f = fn x,y -> x + y end
IO.puts(Calculon.operar(f))

IO.puts(Calculon.operar(&rem/2))

remantente = &rem/2
IO.puts(Calculon.operar(remantente))

IO.puts("Capturar funcion anonima en variable")
recortar = &String.trim/1
IO.puts(recortar.("  Hola  "))
