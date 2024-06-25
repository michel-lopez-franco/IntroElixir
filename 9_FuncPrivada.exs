defmodule Impuestos do
  def calcular(ingreso) do
    impuesto = calcular_impuesto(ingreso)
    IO.puts("El impuesto a pagar es: #{impuesto}")
  end

  # Funcion privada
  defp calcular_impuesto(ingreso) do
    cond do
      ingreso < 1000 -> 0
      ingreso < 2000 -> ingreso * 0.05
      ingreso < 3000 -> ingreso * 0.1
      true -> ingreso * 0.15
    end
  end
end


Impuestos.calcular(500)
Impuestos.calcular(1100)
Impuestos.calcular(2100)
Impuestos.calcular(3100)
