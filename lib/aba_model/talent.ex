defmodule AbaModel.Talent do
  use Ecto.Schema
  import Ecto.Changeset
  
  @params_cast [:ability_id, :cooldown, :current, :description, :icon, :level, :mana_cost, :name, :sort, :title]
  @params_req [:name]

  schema "talents" do
    field :ability_id, :string
    field :cooldown, :integer
    field :current, :boolean
    field :description, :string
    field :icon, :string
    field :level, :integer
    field :mana_cost, :integer
    field :name, :string
    field :sort, :integer
    field :title, :string

    many_to_many :players, AbaModel.Player, join_through: AbaModel.PlayerTalent
    many_to_many :heroes, AbaModel.Hero, join_through: AbaModel.HeroTalent
  end
  
  def changeset(map, params \\ %{}) do
    map
    |> cast(params, @params_cast)
    |> validate_required(@params_req)
  end
end