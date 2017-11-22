defmodule AbaModel.Talent do
  use Ecto.Schema

  schema "talents" do
    field :ability, :string
    field :cooldown, :integer
    field :description, :string
    field :icon, :string
    field :icon_url, :string
    field :level, :integer
    field :mana_cost, :integer
    field :name, :string
    field :sort, :integer
    field :title, :string

    belongs_to :hero, AbaModel.Hero
    many_to_many :players, AbaModel.Player, join_through: "players_talents"
  end
end