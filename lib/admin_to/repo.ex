defmodule AdminTo.Repo do
  use Ecto.Repo,
    otp_app: :admin_to,
    adapter: Ecto.Adapters.Postgres
end
