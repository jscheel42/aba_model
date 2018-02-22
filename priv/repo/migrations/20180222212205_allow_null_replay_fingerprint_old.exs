defmodule AbaModel.Repo.Migrations.AllowNullReplayFingerprintOld do
  use Ecto.Migration

  def change do
    alter table(:replays) do
      modify :fingerprint_old, :string, size: 32, null: true
    end
  end
end
