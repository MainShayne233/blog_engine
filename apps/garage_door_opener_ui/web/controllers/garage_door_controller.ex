defmodule GarageDoorOpenerUI.GarageDoorController do
  use GarageDoorOpenerUI.Web, :controller

  def press(conn, _params) do
    GarageDoorOpener.handle_press()
    json(conn, "success")
  end
end
