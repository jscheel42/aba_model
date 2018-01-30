defmodule AbaModel.Hero do
  use Ecto.Schema
  import Ecto.Changeset
  
  @params_cast [:attribute_id, :icon_url, :name, :short_name, :release_date, :role, :translations, :type]
  @params_req [:name, :short_name]

  schema "heroes" do
    field :attribute_id, :string 
    field :name, :string 
    field :short_name, :string 
    field :release_date, :date 
    field :role, :string 
    field :type, :string 

    has_many :abilities, AbaModel.Ability
    has_many :bans, AbaModel.Ban
    has_many :players, AbaModel.Player
    has_many :translations, AbaModel.HeroTranslation, on_delete: :delete_all

    # many_to_many :players, AbaModel.Player, join_through: "heroes_players"
    # many_to_many :replays, AbaModel.Replay, join_through: "bans_replays"
    many_to_many :talents, AbaModel.Talent, join_through: "hero_talent"
  end

  def changeset(map, params \\ %{}) do
    map
    |> cast(params, @params_cast)
    |> validate_required(@params_req)
  end
end