defmodule AbaModel.HeroTalent do
  use Ecto.Schema
  import Ecto.Changeset
  
  @params_cast []
  @params_req []

  # @primary_key false
  # @primary_key {:hero_talent_primary, :binary_id, autogenerate: true}

  schema "hero_talent" do
    belongs_to :hero, AbaModel.Hero
    belongs_to :talent, AbaModel.Talent
  end

  def changeset(map, params \\ %{}) do
    map
    |> cast(params, @params_cast)
    |> validate_required(@params_req)
  end
end