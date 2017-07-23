defmodule GarageDoorOpenerUI.Router do
  use GarageDoorOpenerUI.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", GarageDoorOpenerUI do
    pipe_through :browser
    
    get "/", PageController, :index
  end

  scope "/api", GarageDoorOpenerUI do
    pipe_through :api

    scope "/garage_door" do
      get "/press", GarageDoorController, :press
    end
  end
end
