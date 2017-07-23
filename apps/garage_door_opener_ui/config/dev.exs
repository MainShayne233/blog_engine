use Mix.Config


config :garage_door_opener_ui, GarageDoorOpenerUI.Endpoint,
  http: [port: 4000],
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  watchers: []



config :garage_door_opener_ui, GarageDoorOpenerUI.Endpoint,
  live_reload: [
    patterns: [
      ~r{priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$},
      ~r{priv/gettext/.*(po)$},
      ~r{web/views/.*(ex)$},
      ~r{web/templates/.*(eex)$}
    ]
  ]


config :logger, :console, format: "[$level] $message\n"


config :phoenix, :stacktrace_depth, 20
