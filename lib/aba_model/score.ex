defmodule AbaModel.Score do
  use Ecto.Schema
  import Ecto.Changeset
  
  @params_cast [:level, :kills, :assists, :takedowns, :deaths, :highest_kill_streak, :hero_damage, :siege_damage, :structure_damage, :minion_damage, :creep_damage, :summon_damage, :time_cc_enemy_heroes, :healing, :self_healing, :damage_taken, :experience_contribution, :town_kills, :time_spent_dead, :merc_camp_captures, :watch_tower_captures, :meta_experience]
  @params_req []

  schema "scores" do
    field :level, :integer
    field :kills, :integer
    field :assists, :integer
    field :takedowns, :integer
    field :deaths, :integer
    field :highest_kill_streak, :integer
    field :hero_damage, :integer
    field :siege_damage, :integer
    field :structure_damage, :integer
    field :minion_damage, :integer
    field :creep_damage, :integer
    field :summon_damage, :integer
    field :time_cc_enemy_heroes, :integer
    field :healing, :integer
    field :self_healing, :integer
    field :damage_taken, :integer
    field :experience_contribution, :integer
    field :town_kills, :integer
    field :time_spent_dead, :integer
    field :merc_camp_captures, :integer
    field :watch_tower_captures, :integer
    field :meta_experience, :integer

    belongs_to :player, AbaModel.Player

    # MANUAL DB MODS
    # ALTER TABLE scores ADD COLUMN player_id bigint;
    # UPDATE scores SET player_id = id;
    # CREATE INDEX ON scores (player_id);

    # belongs_to :player, AbaModel.Player, foreign_key: :id, references: :id

    # has_one :player, AbaModel.Player, on_delete: :delete_all
    # has_many :players, AbaModel.Player, on_delete: :delete_all

  end
  
  def changeset(map, params \\ %{}) do
    map
    |> cast(params, @params_cast)
    |> validate_required(@params_req)
  end
end