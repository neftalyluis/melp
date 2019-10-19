defmodule MelpWeb.Router do
  use MelpWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", MelpWeb do
    pipe_through :api
    resources "/restaurants", RestaurantController
  end
end
