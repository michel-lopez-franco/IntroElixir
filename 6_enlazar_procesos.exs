defmodule DCalc do

  def calculadora do
    receive do
      {pid,:+, a,b} -> send(pid, a+b)
      {pid,:-, a,b} -> send(pid, a-b)
      {pid,:*, a,b} -> send(pid, a*b)
      {_,:/, _,0} -> exit("No se puede dividir por cero")
      {pid,:/, a,b} -> send(pid, a/b)
    end
    calculadora()

  end

end


# c("6_enlazar_procesos.exs")

pid = spawn(DCalc, :calculadora, [])

send(pid,{self(),:+ ,2,3})
send(pid,{self(),:+ ,2,3})
send(pid,{self(),:- ,6,3})
send(pid,{self(),:/ ,6,3})
#flush()
IO.puts "Proceso pid: #{inspect(pid)}"
IO.puts "No se muestra el mensaje de error!!! solo muere el proceso y no se maneja el error"
IO.inspect send(pid,{self(),:/ ,6,0})
# arroja un error que no hemos manejado

IO.inspect(Process.alive?(pid),label: "pid" ) # False porque el proceso terminó


pid2 = spawn(DCalc, :calculadora, [])
IO.inspect(Process.alive?(pid2),label: "pid2")

Process.link(pid2) # Enlazamos el proceso con el pid
#Process.unlink(pid2) # Desconectamos el proceso con el pid

IO.inspect send(pid2,{self(),:/ ,6,0})

# Ojooo: No se ejecuta esta linea mas la OTP inicia otro proceso!!!
IO.puts "No se ejecuta esta linea mas la OTP inicia otro proceso!!!"
IO.inspect(Process.alive?(pid2),label: "pid2")


#iex(20)> send(pid,{self(),:/ ,6,0})
#{#PID<0.106.0>, :/, 6, 0}
#** (EXIT from #PID<0.106.0>) shell process exited with reason: "No se puede dividir por cero"

#Interactive Elixir (1.12.2) - press Ctrl+C to exit (type h() ENTER for help)

# La otp lanza una iex nueva por que el proceso pid2 se detuvo
