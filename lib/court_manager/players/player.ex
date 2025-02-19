defmodule CourtManager.Players.Player do
  use Ecto.Schema
  import Ecto.Changeset

  schema "players" do
    field :is_gympass, :boolean, default: false
    field :has_played, :boolean, default: false
    field :game_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(player, attrs) do
    player
    |> cast(attrs, [:is_gympass, :has_played, :has_played])
    |> validate_required([:is_gympass, :has_played, :has_played])
  end
end
