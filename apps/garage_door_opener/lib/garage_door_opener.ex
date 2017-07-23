defmodule GarageDoorOpener do
  use Application
  alias ElixirALE.GPIO

  @interface :eth0
  @pin 18
  @on_duration 1000

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    {:ok, door_opener_pid} = GPIO.start_link(@pin, :output)
    Process.register(door_opener_pid, :door_opener)

    children = [
      supervisor(Phoenix.PubSub.PG2, [Nerves.PubSub, [poolsize: 1]]),
      worker(Task, [fn -> start_network() end], restart: :transient)
    ]

    opts = [strategy: :one_for_one, name: GarageDoorOpener.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def start_network do
    Nerves.Networking.setup @interface
  end


  def handle_press do
    GPIO.write(:door_opener, 1)
    :timer.sleep(@on_duration)
    GPIO.write(:door_opener, 0)
  end
end
