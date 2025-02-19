defmodule CourtManager.Repo.Migrations.CreatePlayers do
  use Ecto.Migration

  def change do
    create table(:players) do
      add :is_gympass, :boolean, default: false, null: false
      add :has_played, :boolean, default: false, null: false
      add :has_played, :boolean, default: false, null: false
      add :game_id, references(:game, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:players, [:game_id])
  end
end
