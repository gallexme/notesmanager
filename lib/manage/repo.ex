defmodule Manage.Repo do
  use Ecto.Repo,
    otp_app: :manage,
    adapter: Ecto.Adapters.Postgres
end
