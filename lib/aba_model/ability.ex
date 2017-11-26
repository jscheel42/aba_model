defmodule AbaModel.Ability do
  use Ecto.Schema
  import Ecto.Changeset

  @params_cast [:cooldown, :description, :hotkey, :icon, :mana_cost, :name, :owner, :title, :trait]
  @params_req [:cooldown, :description, :name, :owner, :title, :trait]
  
  schema "abilities" do
    field :cooldown, :integer
    field :description, :string
    field :hotkey, :string
    field :icon, :string
    field :mana_cost, :integer
    field :name, :string
    field :owner, :string
    field :title, :string
    field :trait, :boolean
    
    belongs_to :hero, AbaModel.Hero
  end

  def changeset(ability, params \\ %{}) do
    ability
    |> cast(params, @params_cast)
    |> validate_required(@params_req)
  end
end 