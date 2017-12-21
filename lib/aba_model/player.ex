defmodule AbaModel.Player do
  use Ecto.Schema
  import Ecto.Changeset
  
  @params_cast [:battletag, :blizz_id, :hero_level, :party, :silenced, :team, :winner, :score_level, :score_kills, :score_assists, :score_takedowns, :score_deaths, :score_highest_kill_streak, :score_hero_damage, :score_siege_damage, :score_structure_damage, :score_minion_damage, :score_creep_damage, :score_summon_damage, :score_time_cc_enemy_heroes, :score_healing, :score_self_healing, :score_damage_taken, :score_experience_contribution, :score_town_kills, :score_time_spent_dead, :score_merc_camp_captures, :score_watch_tower_captures, :score_meta_experience]
  @params_req [:battletag, :blizz_id, :hero_level, :winner]

  schema "players" do
    field :api_replay_id, :integer # this is 'id' in the REPLAY model at https://hotsapi.net/docs, used here to identify unique player entries   
    field :battletag, :string
    field :blizz_id, :integer
    # field :hero, :string
    field :hero_level, :integer
    field :party, :integer
    field :silenced, :boolean
    field :talent1, :string
    field :talent4, :string
    field :talent7, :string
    field :talent10, :string
    field :talent13, :string
    field :talent16, :string
    field :talent20, :string
    field :team, :integer
    field :winner, :boolean

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
    # many_to_many :talents, AbaModel.Talent, join_through: "players_talents"
  end

  def changeset(map, params \\ %{}) do
    map
    |> cast(params, @params_cast)
    |> validate_required(@params_req)
  end
end