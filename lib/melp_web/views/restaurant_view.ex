defmodule MelpWeb.RestaurantView do
  use MelpWeb, :view

  def render("index.json", %{
        restaurants: restaurants,
        page_number: page_number,
        page_size: page_size,
        total_pages: total_pages,
        total_entries: total_entries
      }) do
    %{
      restaurants: render_many(restaurants, MelpWeb.RestaurantView, "restaurant.json"),
      page_number: page_number,
      page_size: page_size,
      total_pages: total_pages,
      total_entries: total_entries
    }
  end

  def render("show.json", %{restaurant: restaurant}) do
    %{restaurant: render_one(restaurant, MelpWeb.RestaurantView, "restaurant.json")}
  end

  def render("restaurant.json", %{restaurant: restaurant}) do
    %{
      id: restaurant.id,
      rating: restaurant.rating,
      name: restaurant.name,
      site: restaurant.site,
      email: restaurant.email,
      phone: restaurant.phone,
      street: restaurant.street,
      city: restaurant.city,
      state: restaurant.state,
      lat: restaurant.lat,
      lng: restaurant.lng
    }
  end
end
