
# Ejemplo sin GenServer
# Queremos un estado contador que se incremente en 1 cada vez que se le envíe un mensaje.

#defmodule DCalc do
#  def calculadora(contador) do
#    receive do
#      {pid,:+, a,b} -> send(pid, a+b)
#      {pid,:-, a,b} -> send(pid, a-b)
#      {pid,:*, a,b} -> send(pid, a*b)
#      {_,:/, _,0} -> exit("No se puede dividir por cero")
#      {pid,:/, a,b} -> send(pid, a/b)
#    end
#    calculadora(contador)
#  end
#end

defmodule GCalc do
  use GenServer

  def init(param) do
    IO.puts "Inicio GenServer GCalc"
    IO.inspect param
    {:ok, %{conteo: 0}}
  end

  def handle_info(msg, state) do
    IO.puts "Me mandan mensaje #{msg}"
    IO.inspect(state)

    #:noreply, state es lo que se va a pasar la proxima vez que se llame a handle_info

    {:noreply, state}
  end
end

# c("10_GenServer.exs")
# r(GCalc) # Hotswap recarga el módulo en caliente,
# recarga dinamicamente los modulos afectados, sin tener que reiniciar el servidor.
#{:ok, pid} = GenServer.start_link(GCalc,{"hola","buenas"})
#send(pid,:hello)


# Ejercicio 1
#1.- Borra esto de lo de arriba
#def handle_info(msg, state) do
#  IO.puts "Me mandan mensaje #{msg}"
#  IO.inspect(state)
#
#  #:noreply, state es lo que se va a pasar la proxima vez que se llame a handle_info
#
#  {:noreply, state}
#end

#2.- Ejecuta una iex, y con c("10_GenServer.exs") compila el modulo

# 3.- Arranca el servidor con
#{:ok, pid} = GenServer.start_link(GCalc,{"hola","buenas"})

# 4.- Manda un mensaje al servidor con
#send(pid,:hello)

# 5.- Mira la salida del servidor: Muestra error

# 6.- Modifica el servidor para que pueda recibir el mensaje :hello
# Añadie el siguiente código al final del módulo
#def handle_info(msg, state) do
#  IO.puts "Me mandan mensaje #{msg}"
#  IO.inspect(state)
#
#  #:noreply, state es lo que se va a pasar la proxima vez que se llame a handle_info
#
#  {:noreply, state}
#end

# 7.- Recarga el módulo con r(GCalc)

# 8.- Manda un mensaje al servidor con
#send(pid,:hello)

# 9.- Mira la salida del servidor y comprueba que se ha recibido el mensaje

# Conclusiones:
#r(GCalc) recarga el módulo en caliente, recarga dinamicamente los modulos afectados, sin tener que reiniciar el servidor.
