defmodule CourtManager.Courts.Court do
  use Ecto.Schema
  import Ecto.Changeset

  schema "courts" do
    field :name, :string
    field :value, :integer

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(court, attrs) do
    court
    |> cast(attrs, [:name, :value])
    |> validate_required([:name, :value])
  end
end
