defmodule CourtManager.PlayersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `CourtManager.Players` context.
  """

  @doc """
  Generate a player.
  """
  def player_fixture(attrs \\ %{}) do
    {:ok, player} =
      attrs
      |> Enum.into(%{
        has_played: true,
        has_played: true,
        is_gympass: true
      })
      |> CourtManager.Players.create_player()

    player
  end
end
