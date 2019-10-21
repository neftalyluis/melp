defmodule MelpWeb.RestaurantController do
  @moduledoc "Restaurants CRUD"

  use MelpWeb, :controller
  alias Melp.{Restaurant, Repo}

  def index(conn, params) do
    page = Restaurant |> Repo.paginate(params)

    render(conn, "index.json", %{
      restaurants: page.entries,
      page_number: page.page_number,
      page_size: page.page_size,
      total_pages: page.total_pages,
      total_entries: page.total_entries
    })
  end

  def show(conn, %{"id" => id}) do
    restaurant = Repo.get!(Restaurant, id)
    render(conn, "show.json", %{restaurant: restaurant})
  end

  def create(conn, params) do
    changeset = Restaurant.changeset(%Restaurant{}, params)

    case Repo.insert(changeset) do
      {:ok, restaurant} ->
        conn
        |> put_status(201)
        |> render("show.json", restaurant: restaurant)

      {:error, %{errors: errors}} ->
        conn
        |> put_status(422)
        |> render(ErrorView, "422.json", %{errors: errors})
    end
  end

  def update(conn, params) do
    updated =
      Repo.get!(Restaurant, params["id"])
      |> Restaurant.changeset(params)
      |> Repo.update()

    case updated do
      {:ok, restaurant} ->
        render(conn, "show.json", restaurant: restaurant)

      {:error, %{errors: errors}} ->
        conn
        |> put_status(422)
        |> render(ErrorView, "422.json", %{errors: errors})
    end
  end

  def delete(conn, %{"id" => id}) do
    restaurant = Repo.get!(Restaurant, id)
    Repo.delete!(restaurant)

    conn
    |> put_status(204)
    |> render(ErrorView, "204.json")
  end
end
