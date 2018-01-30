defmodule AbaModel.Ban do
  use Ecto.Schema
  import Ecto.Changeset

  @params_cast [:hero_name, :index, :team]
  @params_req [:index, :team]
  
  schema "bans" do
    field :hero_name, :string
    field :index, :integer
    field :team, :integer
    
    belongs_to :hero, AbaModel.Hero
    belongs_to :replay, AbaModel.Replay
  end

  def changeset(ability, params \\ %{}) do
    ability
    |> cast(params, @params_cast)
    |> validate_required(@params_req)
  end
end 