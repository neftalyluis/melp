defmodule MelpWeb.Router do
  use MelpWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", MelpWeb do
    pipe_through :api
  end
end
