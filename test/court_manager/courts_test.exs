defmodule CourtManager.CourtsTest do
  use CourtManager.DataCase

  alias CourtManager.Courts

  describe "courts" do
    alias CourtManager.Courts.Court

    import CourtManager.CourtsFixtures

    @invalid_attrs %{name: nil, value: nil}

    test "list_courts/0 returns all courts" do
      court = court_fixture()
      assert Courts.list_courts() == [court]
    end

    test "get_court!/1 returns the court with given id" do
      court = court_fixture()
      assert Courts.get_court!(court.id) == court
    end

    test "create_court/1 with valid data creates a court" do
      valid_attrs = %{name: "some name", value: 42}

      assert {:ok, %Court{} = court} = Courts.create_court(valid_attrs)
      assert court.name == "some name"
      assert court.value == 42
    end

    test "create_court/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Courts.create_court(@invalid_attrs)
    end

    test "update_court/2 with valid data updates the court" do
      court = court_fixture()
      update_attrs = %{name: "some updated name", value: 43}

      assert {:ok, %Court{} = court} = Courts.update_court(court, update_attrs)
      assert court.name == "some updated name"
      assert court.value == 43
    end

    test "update_court/2 with invalid data returns error changeset" do
      court = court_fixture()
      assert {:error, %Ecto.Changeset{}} = Courts.update_court(court, @invalid_attrs)
      assert court == Courts.get_court!(court.id)
    end

    test "delete_court/1 deletes the court" do
      court = court_fixture()
      assert {:ok, %Court{}} = Courts.delete_court(court)
      assert_raise Ecto.NoResultsError, fn -> Courts.get_court!(court.id) end
    end

    test "change_court/1 returns a court changeset" do
      court = court_fixture()
      assert %Ecto.Changeset{} = Courts.change_court(court)
    end
  end
end
