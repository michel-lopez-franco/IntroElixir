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


# c("7_enlazar_procesos.exs")


pid = spawn_link(DCalc, :calculadora, [])

send(pid,{self(),:+ ,2,3})
send(pid,{self(),:+ ,2,3})
send(pid,{self(),:- ,6,3})

IO.inspect(Process.alive?(pid),label: "pid" ) # True porque el proceso sigue vivo
IO.inspect(Process.info(pid)[:links],label: "links" ) # [self()]

IO.inspect send(pid,{self(),:/ ,6,0})
