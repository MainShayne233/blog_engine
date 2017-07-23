defmodule GarageDoorOpenerUI.PageController do
  use GarageDoorOpenerUI.Web, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
