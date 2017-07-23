use Mix.Releases.Config,
    default_release: :default,
    default_environment: :dev


environment :dev do
  set cookie: :"vadqfI4Lbw)9tbiCfZ9b67,M?M%b?mtZsz/^1][/S<6WIY$3n|g!GKt:;y{gL~Nb"
end

environment :prod do
  set cookie: :"vadqfI4Lbw)9tbiCfZ9b67,M?M%b?mtZsz/^1][/S<6WIY$3n|g!GKt:;y{gL~Nb"
end


release :garage_door_opener do
  set version: current_version(:garage_door_opener)
  if System.get_env("NERVES_SYSTEM") do
    set dev_mode: false
    set include_src: false
    set include_erts: System.get_env("ERL_LIB_DIR")
    set include_system_libs: System.get_env("ERL_SYSTEM_LIB_DIR")
    set vm_args: "rel/vm.args"
  end
end

