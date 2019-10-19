defmodule MelpWeb.RestaurantControllerTest do
  use MelpWeb.ConnCase

  describe "#index" do
    it "shows a list of boards", %{conn: conn} do
      conn
      |> get(Routes.restaurant_path(conn, :index))
      |> json_response(200)
    end
  end

  describe "#show" do
    it "shows the threads contained on the board", %{conn: conn} do
      conn
      |> get(Routes.restaurant_path(conn, :show, 1))
      |> json_response(200)
    end
  end
end
