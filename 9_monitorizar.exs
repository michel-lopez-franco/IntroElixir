# Calculadora distribuida con monitorización
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


# c("9_monitorizar.exs")

#{pid,ref} = spawn_monitor(DCalc, :calculadora, [])

pid = spawn(DCalc, :calculadora, [])
ref = Process.monitor(pid)
#Process.demonitor(ref)

# Cuando el proceso falle manda un mensaje a la cola de mensajes del monitor.

send(pid, {self(),:+,2,3})
send(pid, {self(),:+,2,3})
# flush()
IO.inspect Process.alive?(pid), label: "pid"
send(pid, {self(),:/,2,3})
# flush()

send(pid, {self(),:/,2,0})
IO.inspect Process.alive?(pid), label: "pid"

#flush()
# Vemos el mensaje que nos manda el proceso.
#{:DOWN, #Reference<0.737514220.1579941892.10275>, :process, #PID<0.115.0>,
# :noproc}

#{ :DOWN, ref, :process, pid, :noproc }
# Vemos que el proceso ha muerto.
