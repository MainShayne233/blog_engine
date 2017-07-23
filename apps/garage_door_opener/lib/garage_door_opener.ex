defmodule GarageDoorOpener do
  use Application
  alias ElixirALE.GPIO

  @interface    :wlan0
  @network_opts Application.get_env(:garage_door_opener, :wlan0)
  @pin          18
  @on_duration  1000


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
    Nerves.InterimWiFi.setup(@interface, @network_opts)
  end


  def handle_press do
    open_door()
    :timer.sleep(@on_duration)
    close_door()
  end


  defp open_door,  do: GPIO.write(:door_opener, 1)
  defp close_door, do: GPIO.write(:door_opener, 0)
end
