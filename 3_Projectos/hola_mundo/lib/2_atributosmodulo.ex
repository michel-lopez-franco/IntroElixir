defmodule AtributoModulo do
  @moduledoc """
  Documentation for `AtributoModulo`.
  AtributoModulo is a simple module that provides a `hello/0` function that returns
  """

  @doc """
  Hello world.

  ## Examples

      iex> AtributoModulo.hello()
      :world

  """
  @vsn 1 # Versión del módulo
  @mundo :Mundo # Variable de módulo -> es un atributo de modulo
  @gravedad 9.8 # Es un atributo de modulo

  @mapa %{host: "localhost", puerto: 4000} # Es un atributo de modulo

  def hello do
    :world
  end

  @doc """
  Hello name saluda a un nombre.

  ## Examples

      iex> AtributoModulo.hello("Mundo")
      "Hello, Mundo!"

  """
  def hello(name) do
    # Mensaje saludo
    "Hello, #{name}!"
  end

  def hola2 do
    @mundo
  end

  def hola3 do
    # Al compilar Sustituye por Map.put(%{host: "localhost", puerto: 4000}, :cargado, true )
    Map.put(@mapa, :cargado, true )
    Map.put(mapa2(), :cargado, true ) # Hace una llamada a la función mapa2
  end

  def mapa2 do
    %{host: "localhost", puerto: 4000}
  end

  # Anotaciones pueden actualizase en tiempo de ejecución

  @lista []
  def uno, do: IO.inspect(@lista)

  @lista [2 | @lista]
  def dos, do: IO.inspect(@lista)

  @lista [3 | @lista]
  def tres, do: IO.inspect(@lista)

end
