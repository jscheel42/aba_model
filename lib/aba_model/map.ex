defmodule AbaModel.Map do
  use Ecto.Schema

  schema "maps" do
    field :name, :string
    field :translations, {:array, :string}
  end
end