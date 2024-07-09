defmodule Estado do

  def contador() do
    value = Process.get(:valor) || 0
    receive do
      {:get, pid} ->
        send(pid, Process.get(:valor,0))
      {:inc} ->
        Process.put(:valor, value + 1)
      {:dec} ->
        Process.put(:valor, value - 1)
      {:reset} ->
        Process.put(:valor, 0)
    end
    contador()
  end
end



# c("5_concurrencia_dic.exs")

pid = spawn(Estado, :contador, [])

send(pid, {:inc})
send(pid, {:inc})
send(pid, {:inc})

send(pid, {:get, self()})
#IO.inspect flush()
receive do
  respuesta -> IO.puts("Respuesta: #{respuesta}")
after
  5000 -> IO.puts("Timeout: No se recibió respuesta")
end


IO.puts "Diccionario: "
IO.puts "Tener cuidado por que rompe el encapsulamiento, cualquier proceso puede acceder al diccionario"
IO.inspect Process.info(pid)[:dictionary]

IO.inspect Process.info(pid)[:dictionary][:valor]


# Si solo quieres imprimir el valor de ':valor' en el diccionario, asegúrate de manejarlo correctamente:
#case Process.info(pid)[:dictionary] do
#  {:valor, valor} -> IO.puts("Valor: #{valor}")
#  _ -> IO.puts("La clave ':valor' no está presente en el diccionario")
#end
