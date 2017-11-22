defmodule AbaModel.Hero do
  use Ecto.Schema

  schema "heroes" do
    field :attribute_id, :string 
    field :icon_url, :string 
    field :name, :string 
    field :short_name, :string 
    field :release_date, :utc_datetime 
    field :role, :string 
    field :translations, :string 
    field :type, :string 

    # belongs_to :replay, AbaModel.Replay

    has_many :abilities, AbaModel.Ability
    has_many :talents, AbaModel.Talent

    many_to_many :players, AbaModel.Player, join_through: "heroes_players"
    many_to_many :replays, AbaModel.Replay, join_through: "bans_replays"
  end
end