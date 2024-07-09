defmodule Concurrencia do

  def saludar(nombre) do
    IO.puts "Hola, #{nombre}"
  end

  def infinit, do: infinit

  def intro() do
    IO.puts "Hola, soy un proceso en iex"
    IO.puts "Ejecutando un proceso en paralelo"
    pid = spawn(Concurrencia,:saludar,["Michel"])
    pid
  end

  def concurrenciainfinito() do
    IO.puts "Hola, soy un proceso en iex"
    IO.puts "Ejecutando un proceso en paralelo"
    pid = spawn(Concurrencia,:infinit,[])
    pid

  end
end

#c("1_concurrencia.exs")

#pid = Concurrencia.intro

#Concurrencia.infinit() # Se queda en un bucle infinito

pid2 = Concurrencia.concurrenciainfinito()
Process.alive?(pid2)
Process.info(pid2)
IO.inspect self()
# lansamos 100 procesos en paralelo
#1..100 |> Enum.each(fn _ -> spawn(Concurrencia, :saludar, ["Michel"]) end)
#1..100 |> Enum.each(fn _ -> spawn(Concurrencia, :infinit, []) end)
