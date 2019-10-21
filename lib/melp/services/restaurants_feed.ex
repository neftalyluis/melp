defmodule Melp.RestaurantsFeed do
  @moduledoc "Retrieves the CSV file from S3 and saves it on the Database"
  @csv_url "https://recruiting-datasets.s3.us-east-2.amazonaws.com/restaurantes.csv"
  alias NimbleCSV.RFC4180, as: CSV

  def download do
    http_call()
    |> parse()
    |> Enum.map(&to_model/1)
  end

  def to_model([uuid, rating, name, site, email, phone, street, city, state, lat, lng]) do
    now = NaiveDateTime.utc_now() |> NaiveDateTime.truncate(:second)

    %{
      id: uuid,
      rating: String.to_integer(rating),
      name: name,
      site: site,
      email: email,
      phone: phone,
      street: street,
      city: city,
      state: state,
      lat: String.to_float(lat),
      lng: String.to_float(lng),
      inserted_at: now,
      updated_at: now
    }
  end

  def parse({:ok, result_body}) do
    CSV.parse_string(result_body)
  end

  def http_call do
    case HTTPoison.get(@csv_url) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        {:ok, body}

      {:ok, %HTTPoison.Response{status_code: 404}} ->
        {:error, "Not found"}

      {:error, %HTTPoison.Error{reason: reason}} ->
        {:error, reason}
    end
  end
end
