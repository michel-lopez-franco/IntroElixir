
defmodule GCalc do
  use GenServer

  def init(param) do
    IO.puts "Inicio GenServer GCalc"
    IO.inspect param
    {:ok, %{conteo: 0}}
  end

  def handle_info(:hello, %{conteo: conteo}) do
    IO.puts "Me mandan mensaje :hello"
    IO.puts "Ha sido llamado #{conteo} veces"

    {:noreply, %{conteo: conteo + 1}}
  end

  def handle_info(:world, %{conteo: conteo}) do
    IO.puts "Me mandan mensaje :world"
    IO.puts "Ha sido llamado #{conteo} veces"

    {:noreply, %{conteo: conteo - 1}}
  end


  def handle_info(msg, %{conteo: conteo}) do
    IO.puts "Me mandan mensaje #{msg}"
    IO.puts "Ha sido llamado #{conteo} veces"

    {:noreply, %{conteo: conteo + 1}}
  end

end



# c("11_GenServer.exs")
#r(GCalc) # Recarga el módulo en caliente,

#{:ok, pid} = GenServer.start_link(GCalc,{"hola","buenas"})
#send(pid,:hello)
#send(pid,:world)
#send(pid,"hola")
