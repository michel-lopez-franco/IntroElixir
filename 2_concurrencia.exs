defmodule Concurrencia do
  def saludar() do
    receive do
      {pid,x} -> send(pid,"Hola proceso #{inspect pid} tu msj es: #{x} te saluda #{inspect self()}")
      x -> IO.puts("Hola proceso, #{x}") # Si no hubiera puesto IO.puts no se imprimiría nada, el proceso no se conecta con el iex
    end
  end


end


# c("2_concurrencia.exs")

pid = spawn(Concurrencia, :saludar, [])

IO.inspect( Process.alive?(pid) ,label: "Alive")
IO.inspect( Process.info(pid) ,label: "Info")

#send(pid,"hola")
IO.inspect( send(pid,"Hola"), label: "Send")
#Hola, hola # Se imprime en la consola de iex, ya que tiene IO.puts
#"hola" # el valor que devuelve el send

pid = spawn(Concurrencia, :saludar, [])
IO.inspect(pid,label: "PID")
IO.inspect( send(pid,{self(),"Hola"}), label: "Send")

pid = spawn(Concurrencia, :saludar, [])
IO.inspect(pid,label: "PID")
IO.inspect( send(pid,{self(),"Hola"}), label: "Send")

receive do
  x -> IO.puts (x)
end
