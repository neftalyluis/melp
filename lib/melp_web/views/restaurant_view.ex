defmodule MelpWeb.RestaurantView do
  use MelpWeb, :view

  def render("index.json", %{pages: pages}) do
    %{data: render_many(pages, MelpWeb.RestaurantView, "page.json")}
  end

  def render("page.json", _page) do
    %{hello: "world"}
  end
end
