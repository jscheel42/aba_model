defmodule AbaModel.Talent do
  use Ecto.Schema
  import Ecto.Changeset
  
  @params_cast [:ability, :cooldown, :description, :icon, :icon_url, :level, :mana_cost, :name, :sort, :title]
  @params_req [:ability, :description, :icon, :icon_url, :level, :name, :sort, :title]

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
  
  def changeset(map, params \\ %{}) do
    map
    |> cast(params, @params_cast)
    |> validate_required(@params_req)
  end
end