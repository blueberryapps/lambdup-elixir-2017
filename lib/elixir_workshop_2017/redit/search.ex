defmodule ElixirWorkshop2017.Redit.Search do
  use Ecto.Schema
  import Ecto.Changeset
  alias ElixirWorkshop2017.Redit.Search


  schema "searches" do

    timestamps()
  end

  @doc false
  def changeset(%Search{} = search, attrs) do
    search
    |> cast(attrs, [])
    |> validate_required([])
  end
end
