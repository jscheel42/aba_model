defmodule AbaModel.MapTranslation do
  use Ecto.Schema
  import Ecto.Changeset

  @params_cast [:name]
  @params_req [:name]

  schema "map_translations" do
    field :name, :string

    belongs_to :map, AbaModel.Map
  end

  def changeset(map, params \\ %{}) do
    map
    |> cast(params, @params_cast)
    |> validate_required(@params_req)
  end
end