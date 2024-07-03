defmodule Empresa.Writer do

  alias Empresa.Empleado, as: Empleado # alias es local

  #import # importa definiciones de otros modules
  #import Jason # importa todas las definiciones de Jason
  import Jason, only [encode: 1] # importa solo la funcion encode

  #defp to_map(%Empresa.Empleado{nombre: n, posicion: p, sueldo: s}) do
  defp to_map(%Empleado{nombre: n, posicion: p, sueldo: s}) do
    %{"nombre" => n, "posicion" => p, "sueldo" => s}
  end

  defp to_map(_x) do
    nil
  end

  defp to_json(m) do
    #{:ok,json_version} = Jason.encode(m)
    {:ok,json_version} = encode(m)
    json_version
  end

  defp dump(str) do
    File.write("empleados.json", str)
  end

  def write(empleados) do
    empleados
    |> Enum.map(&to_map/1)
    #|> Enum.filter(fn x -> x != nil end)
    |> Enum.filter(fn
      nil -> false
      _ -> true
      end)
    |> to_json()
    |> dump()
  end
end
