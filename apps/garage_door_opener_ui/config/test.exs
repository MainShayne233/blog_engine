use Mix.Config


config :garage_door_opener_ui, GarageDoorOpenerUI.Endpoint,
  http: [port: 4001],
  server: false


config :logger, level: :warn
