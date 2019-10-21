defmodule Melp.Restaurant do
  @moduledoc "Model to handle Restaurants"

  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @required_fields [:rating, :name, :site, :email, :phone, :street, :city, :state, :lat, :lng]


  schema "restaurants" do
    field :rating, :integer
    field :name, :string
    field :site, :string
    field :email, :string
    field :phone, :string
    field :street, :string
    field :city, :string
    field :state, :string
    field :lat, :float
    field :lng, :float

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, @required_fields)
    |> validate_required(@required_fields)
  end
end
