defmodule CourtManager.Repo.Migrations.CreateGames do
  use Ecto.Migration

  def change do
    create table(:games) do
      add :date, :date
      add :court_id, references(:courts, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:games, [:court_id])
  end
end
