defmodule CourtManager.Repo.Migrations.CreateCourts do
  use Ecto.Migration

  def change do
    create table(:courts) do
      add :name, :string
      add :value, :integer

      timestamps(type: :utc_datetime)
    end
  end
end
