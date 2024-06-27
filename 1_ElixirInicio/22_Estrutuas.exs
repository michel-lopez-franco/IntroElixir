

defmodule Perfil do
  defstruct [:nombre, :edad, :pais, :comida, pais: "Mexico"]

  def crear_perfiles do
    perfil = %Perfil{nombre: "Michel", edad: 18, pais: "Mexico", comida: "Verduras"}
    IO.inspect(perfil)

    perfil2 = %Perfil{nombre: "Daris", edad: 18, pais: "Mexico", comida: "Verduras"}
    IO.inspect(perfil2)

    perfil2_mod = %Perfil{perfil2 | comida: "Pizza"} #actualizar keys que ya existen
    IO.inspect(perfil2_mod)

    IO.inspect(perfil2.__struct__ )
  end
end

Perfil.crear_perfiles()
