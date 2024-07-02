defmodule HolaMundo do
  @moduledoc """
  Documentation for `HolaMundo`.
  HolaMundo is a simple module that provides a `hello/0` function that returns
  """

  @doc """
  Hello world.

  ## Examples

      iex> HolaMundo.hello()
      :world

  """
  def hello do
    :world
  end

  @doc """
  Hello name saluda a un nombre.

  ## Examples

      iex> HolaMundo.hello("Mundo")
      "Hello, Mundo!"

  """
  def hello(name) do
    # Mensaje saludo
    "Hello, #{name}!"
  end

end
