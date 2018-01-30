defmodule AbaModel.Player do
  use Ecto.Schema
  import Ecto.Changeset
  
  @params_cast [:battletag_name, :battletag_id, :blizz_id, :hero_level, :party, :silenced, :team, :winner]
  @params_req [:blizz_id]

  schema "players" do
    field :battletag_name, :string
    field :battletag_id, :integer
    field :blizz_id, :integer
    field :hero_level, :integer
    field :party, :integer
    field :silenced, :integer
    field :team, :integer
    field :winner, :boolean

    many_to_many :talents, AbaModel.Talent, join_through: AbaModel.PlayerTalent, on_delete: :delete_all

    belongs_to :hero, AbaModel.Hero
    belongs_to :replay, AbaModel.Replay
    # belongs_to :score, AbaModel.Score

    has_one :score, AbaModel.Score, on_delete: :delete_all
    # has_many :score, AbaModel.Score, foreign_key: :id, references: :id, on_delete: :delete_all

  end

  def changeset(map, params \\ %{}) do
    map
    |> cast(params, @params_cast)
    |> validate_required(@params_req)
  end
end