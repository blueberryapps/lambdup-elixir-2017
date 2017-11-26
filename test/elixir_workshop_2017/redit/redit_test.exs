defmodule ElixirWorkshop2017.ReditTest do
  use ElixirWorkshop2017.DataCase

  alias ElixirWorkshop2017.Redit

  describe "searches" do
    alias ElixirWorkshop2017.Redit.Search

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def search_fixture(attrs \\ %{}) do
      {:ok, search} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Redit.create_search()

      search
    end

    test "list_searches/0 returns all searches" do
      search = search_fixture()
      assert Redit.list_searches() == [search]
    end

    test "get_search!/1 returns the search with given id" do
      search = search_fixture()
      assert Redit.get_search!(search.id) == search
    end

    test "create_search/1 with valid data creates a search" do
      assert {:ok, %Search{} = search} = Redit.create_search(@valid_attrs)
    end

    test "create_search/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Redit.create_search(@invalid_attrs)
    end

    test "update_search/2 with valid data updates the search" do
      search = search_fixture()
      assert {:ok, search} = Redit.update_search(search, @update_attrs)
      assert %Search{} = search
    end

    test "update_search/2 with invalid data returns error changeset" do
      search = search_fixture()
      assert {:error, %Ecto.Changeset{}} = Redit.update_search(search, @invalid_attrs)
      assert search == Redit.get_search!(search.id)
    end

    test "delete_search/1 deletes the search" do
      search = search_fixture()
      assert {:ok, %Search{}} = Redit.delete_search(search)
      assert_raise Ecto.NoResultsError, fn -> Redit.get_search!(search.id) end
    end

    test "change_search/1 returns a search changeset" do
      search = search_fixture()
      assert %Ecto.Changeset{} = Redit.change_search(search)
    end
  end
end
