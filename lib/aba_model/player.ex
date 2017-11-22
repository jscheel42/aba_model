defmodule AbaModel.Player do
  use Ecto.Schema

  schema "players" do
    field :battletag, :string
    field :blizz_id, :string
    # field :hero, :string
    field :hero_level, :string
    field :party, :string
    field :silenced, :string
    field :team, :string
    field :winner, :string

    field :score_level, :integer
    field :score_kills, :integer
    field :score_assists, :integer
    field :score_takedowns, :integer
    field :score_deaths, :integer
    field :score_highest_kill_streak, :integer
    field :score_hero_damage, :integer
    field :score_siege_damage, :integer
    field :score_structure_damage, :integer
    field :score_minion_damage, :integer
    field :score_creep_damage, :integer
    field :score_summon_damage, :integer
    field :score_time_cc_enemy_heroes, :integer
    field :score_healing, :integer
    field :score_self_healing, :integer
    field :score_damage_taken, :integer
    field :score_experience_contribution, :integer
    field :score_town_kills, :integer
    field :score_time_spent_dead, :integer
    field :score_merc_camp_captures, :integer
    field :score_watch_tower_captures, :integer
    field :score_meta_experience, :integer

    many_to_many :hero, AbaModel.Hero, join_through: "heroes_players"
    many_to_many :replays, AbaModel.Replay, join_through: "players_replays"
    many_to_many :talents, AbaModel.Talent, join_through: "players_talents"
  end
end