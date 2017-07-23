use Mix.Config

config :garage_door_opener_ui, GarageDoorOpenerUI.Endpoint,
  http: [port: 80],
  url: [host: "localhost", port: 80],
  secret_key_base: "9w9MI64d1L8mjw+tzTmS3qgJTJqYNGJ1dNfn4S/Zm6BbKAmo2vAyVW7CgfI3CpII",
  root: Path.dirname(__DIR__),
  server: true,
  render_errors: [accepts: ~w(html json)],
  pubsub: [name: GarageDoorOpenerUI.PubSub,
           adapter: Phoenix.PubSub.PG2]

config :logger, level: :debug

import_config "network.secret.exs"
