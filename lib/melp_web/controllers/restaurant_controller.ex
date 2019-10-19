defmodule MelpWeb.RestaurantController do
  @moduledoc "Restaurants CRUD"

  use MelpWeb, :controller

  def index(conn, _params) do
    render(conn, "index.json", pages: ["lel"])
  end

  def show(conn, _params) do
    render(conn, "index.json", pages: ["lel"])
  end

  def create(conn, _params) do
    render(conn, "index.json", pages: ["lel"])
  end

  def update(conn, _params) do
    render(conn, "index.json", pages: ["lel"])
  end

  def delete(conn, _params) do
    render(conn, "index.json", pages: ["lel"])
  end
end
