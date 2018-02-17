defmodule AbaModel.Repo.Migrations.Init do
  use Ecto.Migration

  def change do
    # Create heroes first because it is referenced in other tables
    create table(:heroes) do
      add :attribute_id, :string, size: 4
      add :name, :string, size: 255, null: false
      add :short_name, :string, size: 32, null: false
      add :release_date, :date
      add :role, :string, size: 32
      add :type, :string, size: 32
    end
    create index(:heroes, [:attribute_id])
    create index(:heroes, [:name])

    create table(:abilities) do
      add :cooldown, :bigint
      add :description, :text
      add :hotkey, :string, size: 8
      add :icon, :string, size: 128
      add :mana_cost, :bigint
      add :name, :string, size: 128, null: false
      add :owner, :string, size: 191
      add :title, :string, size: 128
      add :trait, :boolean, null: false, default: false
      
      add :hero_id, references(:heroes, on_update: :restrict, on_delete: :restrict), null: false
    end
    create unique_index(:abilities, [:hero_id, :name])

    create table(:maps) do
      add :name, :string, size: 255, null: false
    end
    create index(:maps, [:name])

    PlayersGameTypeEnum.create_type
    create table(:replays) do      
      add :filename, :string, size: 36, null: false
      add :fingerprint, :string, size: 36, null: false
      add :fingerprint_old, :string, size: 32, null: false
      add :game_type, :replays_game_type
      add :game_date, :timestamptz
      add :game_length, :smallint
      add :game_version, :string, size: 32
      add :processed, :smallint, default: 0, null: false
      add :region, :smallint
      add :size, :integer, null: false

      add :game_map_id, references(:maps, on_update: :restrict, on_delete: :restrict)
      timestamps(type: :timestamptz, inserted_at: :created_at)
    end
    create unique_index(:replays, [:filename])
    create unique_index(:replays, [:fingerprint])
    create index(:replays, [:fingerprint_old])
    create index(:replays, [:game_date])
    create index(:replays, [:game_map_id])
    create index(:replays, [:game_type])
    create index(:replays, [:processed])

    create table(:bans) do
      add :hero_name, :string, size: 4
      add :index, :smallint, null: false
      add :team, :smallint, null: false

      add :hero_id, references(:heroes, on_update: :restrict, on_delete: :restrict)
      add :replay_id, references(:replays, on_update: :restrict, on_delete: :delete_all), null: false
    end
    create unique_index(:bans, [:replay_id, :team, :index])
    create index(:bans, [:hero_name])

    create table(:hero_translations) do
      add :name, :string, size: 255, null: false

      add :hero_id, references(:heroes, on_update: :restrict, on_delete: :delete_all), null: false
    end
    create index(:hero_translations, [:hero_id])
    create unique_index(:hero_translations, [:name])

    create table(:hotsdata) do
      add :file, :string, size: 100, null: false
      add :result, :string, size: 32
      add :success, :smallint
    end

    create table(:hotslogs_uploads) do
      add :result, :string, size: 32
      add :status, :string, size: 32
      
      add :replay_id, references(:replays, on_update: :restrict, on_delete: :delete_all), null: false
      timestamps(type: :timestamptz, inserted_at: :created_at)
    end
    create index(:hotslogs_uploads, [:replay_id])
    create index(:hotslogs_uploads, [:status])

    create table(:map_translations) do
      add :name, :string, size: 255, null: false

      add :map_id, references(:maps, on_update: :restrict, on_delete: :delete_all), null: false
    end
    create unique_index(:map_translations, [:name])
    create index(:map_translations, [:map_id])

    create table(:players) do      
      add :battletag_name, :string, size: 32
      add :battletag_id, :bigint
      add :blizz_id, :bigint, null: false
      add :hero_level, :smallint
      add :party, :smallint
      add :silenced, :smallint
      add :team, :smallint
      add :winner, :boolean
      
      add :hero_id, references(:heroes, on_update: :restrict, on_delete: :restrict)
      add :replay_id, references(:replays, on_update: :restrict, on_delete: :delete_all ), null: false
    end
    create unique_index(:players, [:replay_id, :blizz_id])
    create index(:players, [:battletag_name])
    create index(:players, [:hero_id])
    create index(:players, [:replay_id])
    
    create table(:scores) do      
      add :level, :bigint
      add :kills, :bigint
      add :assists, :bigint
      add :takedowns, :bigint
      add :deaths, :bigint
      add :highest_kill_streak, :bigint
      add :hero_damage, :bigint
      add :siege_damage, :bigint
      add :structure_damage, :bigint
      add :minion_damage, :bigint
      add :creep_damage, :bigint
      add :summon_damage, :bigint
      add :time_cc_enemy_heroes, :bigint
      add :healing, :bigint
      add :self_healing, :bigint
      add :damage_taken, :bigint
      add :experience_contribution, :bigint
      add :town_kills, :bigint
      add :time_spent_dead, :bigint
      add :merc_camp_captures, :bigint
      add :watch_tower_captures, :bigint
      add :meta_experience, :bigint
      
      add :player_id, references(:players, on_update: :restrict, on_delete: :delete_all)
    end
    create unique_index(:scores, [:player_id])
    
    create table(:talents) do      
      add :ability_id, :string, size: 128
      add :cooldown, :bigint
      add :description, :text
      add :icon, :string, size: 128
      add :level, :smallint
      add :mana_cost, :bigint
      add :name, :string, size: 128, null: false
      add :sort, :smallint
      add :title, :string, size: 128
    end
    create unique_index(:talents, [:name])

    ### Many to many tables ###
    # create table(:hero_talent, primary_key: false) do
    create table(:hero_talent) do
      add :hero_id, references(:heroes, on_update: :restrict, on_delete: :restrict), null: false
      add :talent_id, references(:talents, on_update: :restrict, on_delete: :restrict), null: false
    end
    create unique_index(:hero_talent, [:hero_id, :talent_id], name: "hero_talent_hero_id_talent_id_index")
    # execute """
    #   ALTER TABLE hero_talent ADD CONSTRAINT hero_talent_primary PRIMARY KEY USING INDEX hero_talent_hero_id_talent_id_index;
    # """
    create index(:hero_talent, [:talent_id])

    # execute """
    #   ALTER TABLE hero_talent ADD table_constraint_using_index PRIMARY KEY USING INDEX hero_talent_hero_id_talent_id_index;
    # """
    
    # create table(:player_talent, primary_key: false) do
    create table(:player_talent) do
      add :level, :smallint

      add :player_id, references(:players, on_update: :restrict, on_delete: :delete_all), null: false
      add :talent_id, references(:talents, on_update: :restrict, on_delete: :restrict), null: false
    end
    create unique_index(:player_talent, [:player_id, :level], name: "player_talent_player_id_level_index")
    # execute """
    #   ALTER TABLE player_talent ADD CONSTRAINT player_talent_primary PRIMARY KEY USING INDEX player_talent_player_id_level_index;
    # """
    create index(:player_talent, [:talent_id])

  end
end
