defmodule AbaModel.Map do
  use Ecto.Schema
  import Ecto.Changeset

  @params_cast [:name, :translations]
  @params_req [:name, :translations]

  schema "maps" do
    field :name, :string
    field :translations, {:array, :string}
  end

  def changeset(map, params \\ %{}) do
    map
    |> cast(params, @params_cast)
    |> validate_required(@params_req)
  end
end