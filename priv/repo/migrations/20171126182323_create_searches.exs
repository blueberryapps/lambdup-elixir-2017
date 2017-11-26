defmodule ElixirWorkshop2017.Repo.Migrations.CreateSearches do
  use Ecto.Migration

  def change do
    create table(:searches) do

      timestamps()
    end

  end
end
