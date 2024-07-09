# A este modelo de concurrencia se le llama modelo de actores

defmodule Concurrencia do
  def saludar() do
    receive do
      {pid,x} -> send(pid,"Hola proceso #{inspect pid} tu msj es: ->#{x}<- te saluda #{inspect self()}")
      x -> IO.puts("Hola proceso, #{x}") # Si no hubiera puesto IO.puts no se imprimiría nada, el proceso no se conecta con el iex
    end
    saludar()
  end
end



# c("3_concurrencia.exs")

pid = spawn(Concurrencia, :saludar, [])

IO.inspect Process.info(pid)


# En iex -----------> Hacer
# send(pid,{self(),"Hola Michel"})
# send(pid,{self(),"Hola Daris"})
# send(pid,{self(),"Hola Mundo"})

# Process.info(self())

# receive do
#   x -> IO.puts (x)
# end
