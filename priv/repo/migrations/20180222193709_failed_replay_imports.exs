defmodule AbaModel.Repo.Migrations.FailedReplayImports do
  use Ecto.Migration

  def change do
    create table(:failed_replay_imports) do      
      add :replay_id, :bigint, null: false
      add :message, :text
      timestamps(type: :timestamptz, inserted_at: :created_at)
    end
    create index(:failed_replay_imports, [:replay_id])
  end
end
