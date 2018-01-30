defmodule AbaModel.HeroTranslation do
  use Ecto.Schema
  import Ecto.Changeset
  
  @params_cast [:name]
  @params_req [:name]

  schema "hero_translations" do
    field :name, :string 

    belongs_to :hero, AbaModel.Hero
  end

  def changeset(map, params \\ %{}) do
    map
    |> cast(params, @params_cast)
    |> validate_required(@params_req)
  end
end