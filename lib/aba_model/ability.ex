defmodule AbaModel.Ability do
  use Ecto.Schema

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

  # def changeset(ability, params \\ %{}) do
  #   ability
  #   |> Ecto.Changeset.cast(params, [:cooldown, :description, :hotkey, :icon, :mana_cost, :name, :owner, :title, :trait])
  #   |> Ecto.Changeset.validate_required([:hotkey, :name])
  # end
end