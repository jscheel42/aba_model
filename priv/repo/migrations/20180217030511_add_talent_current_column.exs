defmodule AbaModel.Repo.Migrations.AddTalentCurrentColumn do
  use Ecto.Migration

  def change do
    alter table(:talents) do
      add :current, :boolean
    end
    create index(:talents, [:current])
  end
end
