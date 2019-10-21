defmodule MelpWeb.RestaurantControllerTest do
  use MelpWeb.ConnCase

  alias Melp.{Repo, Restaurant}

  @create_attrs %{
    rating: 1,
    name: "some name",
    site: "test.com",
    email: "test@test.com",
    phone: "+123412341234",
    street: "testststs",
    city: "teststststs",
    state: "tststststs",
    lat: 12.12312341234,
    lng: 12.123412341234
  }

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "#index" do
    setup [:create_restaurant]

    it "shows a list of boards", %{conn: conn, restaurant: %Restaurant{id: id} = restaurant} do
      conn
      |> get(Routes.restaurant_path(conn, :index))
      |> json_response(200)
    end
  end

  describe "#show" do
    setup [:create_restaurant]

    it "shows the threads contained on the board", %{
      conn: conn,
      restaurant: %Restaurant{id: id} = restaurant
    } do
      conn
      |> get(Routes.restaurant_path(conn, :show, id))
      |> json_response(200)
    end
  end

  def fixture(:restaurant) do
    changeset = Restaurant.changeset(%Restaurant{}, @create_attrs)
    {:ok, restaurant} = Repo.insert(changeset)
    restaurant
  end

  defp create_restaurant(_) do
    restaurant = fixture(:restaurant)
    {:ok, restaurant: restaurant}
  end
end
