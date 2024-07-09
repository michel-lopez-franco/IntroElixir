
defmodule GCalc do
  use GenServer

  # Podemos envolver las llamadas a GenServer.call en funciones
  def add(pid,x,y) do
    GenServer.call(pid,{:add,x,y})
  end

  def init(param) do
    IO.puts "Inicio GenServer GCalc"
    IO.inspect param

    case param do
      {:ok} -> {:ok, %{conteo: 0}}
      {:stop} -> {:stop, "La base de datos no esta disponible"}
      {:ignore} -> :ignore
      {:sleep} ->
        Process.sleep(6000)
        :ignore
        #{:ok, %{conteo: 0}}
      {:otro} -> {:ok, %{conteo: 0},2000} #Espera otro mensaje en 2 segundos
    end
    #{:ok, %{conteo: 0}}
  end

  def terminate(reason, state) do
    IO.puts "Terminando GenServer GCalc"
    IO.inspect reason
    IO.inspect state
  end

  def handle_call({:add,n,m}, _from, %{conteo: conteo}) do
    IO.puts "-> handle_call(:add, #{n}, #{m})"
    resul = n + m
    {:reply, resul, %{conteo: conteo+ 1},3000}
    # El timeout es de 3 segundos, para esperar otro mensaje, o marca error
  end

  def handle_call({:add_sleep,n,m}, _from, %{conteo: conteo}) do
    IO.puts "-> handle_call(:add_sleep, #{n}, #{m})"
    Process.sleep(2000)
    #Process.sleep(6000)
    IO.puts "Wake up"
    resul = n + m
    {:reply, resul, %{conteo: conteo+ 1}}
  end

  def handle_call({:div,n,m}, _from, %{conteo: conteo}) do
    if m == 0 do
      {:stop, "No se puede dividir por 0",conteo}
    else
      {:reply, n / m, %{conteo: conteo + 1}}
    end

  end

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

# handle_info para gestionar mensajes del sistema
# recibe por lo generar es muy manual y no se recomienda
# handle_call si necesitas una respuesta
# handle_cast si no necesitas una respuesta, no sabes si algo salio mal

# handel_call es sincrono
# handle_cast es asincrono

# c("13_GenServer.exs")
# r(GCalc)

#{:ok, pid} = GenServer.start_link(GCalc,{"hola","buenas"})
#{res, pid} = GenServer.start_link(GCalc,{5})

#{res, pid} = GenServer.start_link(GCalc,{:ok})
#{res, pid} = GenServer.start_link(GCalc,{:stop},[timeout: 2000])

#{res, pid} = GenServer.start_link(GCalc,{:sleep})
#{res, pid} = GenServer.start_link(GCalc,{:sleep},[timeout: 2000])
#{res, pid} = GenServer.start_link(GCalc,{:sleep},timeout: 2000)
#Last message: :timeout


#{res, pid} = GenServer.start_link(GCalc,{:ok})
#GCalc.add(pid,2,3)
#Last message: :timeout
