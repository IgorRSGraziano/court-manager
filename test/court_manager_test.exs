defmodule CourtManagerTest do
  use ExUnit.Case
  doctest CourtManager

  test "greets the world" do
    assert CourtManager.hello() == :world
  end
end
