defmodule AbaModel.Hero do
  use Ecto.Schema
  import Ecto.Changeset
  
  @params_cast [:attribute_id, :icon_url, :name, :short_name, :release_date, :role, :translations, :type]
  @params_req [:attribute_id, :icon_url, :name, :short_name, :release_date, :role, :translations, :type]

  schema "heroes" do
    field :attribute_id, :string 
    field :icon_url, :string 
    field :name, :string 
    field :short_name, :string 
    field :release_date, :string 
    field :role, :string 
    field :translations, {:array, :string}
    field :type, :string 

    has_many :abilities, AbaModel.Ability
    has_many :talents, AbaModel.Talent

    many_to_many :players, AbaModel.Player, join_through: "heroes_players"
    many_to_many :replays, AbaModel.Replay, join_through: "bans_replays"
  end

  def changeset(map, params \\ %{}) do
    map
    |> cast(params, @params_cast)
    |> validate_required(@params_req)
  end
end