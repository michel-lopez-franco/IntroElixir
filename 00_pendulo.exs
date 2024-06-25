defmodule Pendulum do
  defstruct angle: 0.0,
            angular_velocity: 0.0,
            length: 1.0,
            gravity: 9.8,
            damping: 0.05

  def new(length \\ 1.0, initial_angle \\ :math.pi/4) do
    %Pendulum{length: length, angle: initial_angle}
  end

  def update(pendulum, dt) do
    acceleration = -pendulum.gravity / pendulum.length * :math.sin(pendulum.angle) - pendulum.damping * pendulum.angular_velocity

    %Pendulum{
      pendulum
      | angular_velocity: pendulum.angular_velocity + acceleration * dt,
        angle: pendulum.angle + pendulum.angular_velocity * dt
    }
  end

  def run(pendulum, dt, steps) do
    Enum.reduce(1..steps, pendulum, fn _, p -> update(p, dt) end)
  end
end

p = Pendulum.new(1.5, :math.pi/3)  # Crear un péndulo
p = Pendulum.run(p, 0.01, 1000)    # Simular 1000 pasos con dt = 0.01
IO.inspect(p)                       # Ver el estado final del péndulo
# %Pendulum{angle: 0.0, angular_velocity: 0.0, damping: 0.05, gravity: 9.8, length: 1.5}
