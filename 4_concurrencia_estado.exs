defmodule Estado do

  def contador(), do: contador(0)

  defp contador(value) do

    new_value = receive do
      {:get, pid} ->
        send(pid,value)
        value
      {:inc} ->
        value + 1
      {:dec} ->
        value - 1
      {:reset} ->
        0
    end
    contador (new_value)
  end


end


# c("4_concurrencia_estado.exs")

#pid = spawn(Estado, :contador, [])
#send(pid,{:get,self()})
#flush()

#send(pid,{:inc})
#send(pid,{:inc})
#send(pid,{:inc})
#send(pid,{:inc})
#send(pid,{:inc})
#send(pid,{:inc})
#send(pid,{:get,self()})
