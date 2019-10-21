defmodule Melp.Repo do
  use Ecto.Repo,
    otp_app: :melp,
    adapter: Ecto.Adapters.Postgres

  use Scrivener, page_size: 10
end
