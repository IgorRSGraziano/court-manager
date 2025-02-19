defmodule CourtManager.Repo do
  use Ecto.Repo,
    otp_app: :court_manager,
    adapter: Ecto.Adapters.Postgres
end
