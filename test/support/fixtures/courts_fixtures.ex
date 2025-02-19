defmodule CourtManager.CourtsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `CourtManager.Courts` context.
  """

  @doc """
  Generate a court.
  """
  def court_fixture(attrs \\ %{}) do
    {:ok, court} =
      attrs
      |> Enum.into(%{
        name: "some name",
        value: 42
      })
      |> CourtManager.Courts.create_court()

    court
  end
end
