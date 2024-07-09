
defmodule GCalc do
  use GenServer

  # Podemos envolver las llamadas a GenServer.call en funciones
  def add(pid,x,y) do
    GenServer.call(pid,{:add,x,y})
  end

  def init(param) do
    IO.puts "Inicio GenServer GCalc"
    IO.inspect param
    {:ok, %{conteo: 0}}
  end

  #def handle_call(msg, from, state) do
  def handle_call({:add,n,m}, _from, %{conteo: conteo}) do
    IO.puts "-> handle_call(:add, #{n}, #{m})"
    resul = n + m
    {:reply, resul, %{conteo: conteo+ 1}}
  end

  def handle_call({:add_sleep,n,m}, _from, %{conteo: conteo}) do
    IO.puts "-> handle_call(:add_sleep, #{n}, #{m})"
    Process.sleep(2000)
    #Process.sleep(6000)
    IO.puts "Wake up"
    resul = n + m
    {:reply, resul, %{conteo: conteo+ 1}}
  end

  #GenServer.call timewait es de por default 5000 ms
  #GenServer.call(pid,{:add_sleep2,2,3}) #Muestra error
  #GenServer.call(pid,{:add_sleep2,2,3},7000) #No muestra error
  #GenServer.call(pid,{:add_sleep2,2,3},:infinity) #Espera infinitamente
  def handle_call({:add_sleep2,n,m}, _from, %{conteo: conteo}) do
    IO.puts "-> handle_call(:add_sleep, #{n}, #{m})"
    #Process.sleep(2000)
    Process.sleep(6000)
    IO.puts "Wake up"
    resul = n + m
    {:reply, resul, %{conteo: conteo+ 1}}
  end

  #def handle_cast(op,estado)
  def handle_cast(:reset,_state) do
    IO.puts "-> handle_cast(:reset)"
    {:noreply, %{conteo: 0}}
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

end


#c ("12_GenServer.exs")
#r(GCalc)

#{:ok, pid} = GenServer.start_link(GCalc,{"hola","buenas"})
#GenServer.call(pid,{:add,2,3})
#GenServer.call(pid,{:add,5,3})

#GenServer.call(pid,{:sub,2,3}) # Error
#GenServer.call(pid,{:add_sleep2,2,3},6001)


#GenServer.cast(pid, :reset)
