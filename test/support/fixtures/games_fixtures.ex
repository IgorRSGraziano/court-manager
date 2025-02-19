defmodule CourtManager.GamesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `CourtManager.Games` context.
  """

  @doc """
  Generate a game.
  """
  def game_fixture(attrs \\ %{}) do
    {:ok, game} =
      attrs
      |> Enum.into(%{
        date: ~D[2025-02-18]
      })
      |> CourtManager.Games.create_game()

    game
  end
end
