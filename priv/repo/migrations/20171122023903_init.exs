defmodule AbaModel.Repo.Migrations.Init do
  use Ecto.Migration

  def change do
    # Create heroes first because it is referenced in other tables
    create table(:heroes) do
      add :attribute_id, :string 
      add :icon_url, :string 
      add :name, :string 
      add :short_name, :string 
      add :release_date, :string 
      add :role, :string 
      add :translations, {:array, :string}
      add :type, :string
    end

    create table(:abilities) do
      add :owner, :string
      add :name, :string
      add :title, :string
      add :description, :text
      add :icon, :string
      add :hotkey, :string
      add :cooldown, :integer
      add :mana_cost, :integer
      add :trait, :boolean

      add :hero_id, references(:heroes)
    end

    create table(:maps) do
      add :name, :string
      add :translations, {:array, :string}
    end

    create table(:players) do
      add :battletag, :string
      add :blizz_id, :string
      add :hero_level, :string
      add :party, :string
      add :silenced, :string
      add :team, :string
      add :winner, :string

      add :score_level, :integer
      add :score_kills, :integer
      add :score_assists, :integer
      add :score_takedowns, :integer
      add :score_deaths, :integer
      add :score_highest_kill_streak, :integer
      add :score_hero_damage, :integer
      add :score_siege_damage, :integer
      add :score_structure_damage, :integer
      add :score_minion_damage, :integer
      add :score_creep_damage, :integer
      add :score_summon_damage, :integer
      add :score_time_cc_enemy_heroes, :integer
      add :score_healing, :integer
      add :score_self_healing, :integer
      add :score_damage_taken, :integer
      add :score_experience_contribution, :integer
      add :score_town_kills, :integer
      add :score_time_spent_dead, :integer
      add :score_merc_camp_captures, :integer
      add :score_watch_tower_captures, :integer
      add :score_meta_experience, :integer
    end

    create table(:replays) do
      add :api_id, :integer # this is 'id' in the model at https://hotsapi.net/docs but we want to have this + default id field
      add :filename, :string
      add :fingerprint, :string
      add :game_type, :string
      add :game_date, :string
      add :game_length, :integer
      add :game_map, :string
      add :game_version, :string
      add :region, :integer
      add :size, :integer
      add :url, :string
    end

    create table(:talents) do
      add :ability, :string
      add :cooldown, :integer
      add :description, :text
      add :icon, :string
      add :icon_url, :string
      add :level, :integer
      add :mana_cost, :integer
      add :name, :string
      add :sort, :integer
      add :title, :string

      add :hero_id, references(:heroes)
    end

    create table(:players_talents) do
      add :player_id, references(:players)
      add :talent_id, references(:talents)
    end
    create unique_index(:players_talents, [:player_id, :talent_id])

    create table(:players_replays) do
      add :player_id, references(:players)
      add :replay_id, references(:replays)
    end
    create unique_index(:players_replays, [:player_id, :replay_id])

    create table(:bans_replays) do
      add :hero_id, references(:heroes)
      add :replay_id, references(:replays)
    end
    create unique_index(:bans_replays, [:hero_id, :replay_id])

    create table(:heroes_players) do
      add :hero_id, references(:heroes)
      add :player_id, references(:players)
    end
    create unique_index(:heroes_players, [:hero_id, :player_id])
  end
end
