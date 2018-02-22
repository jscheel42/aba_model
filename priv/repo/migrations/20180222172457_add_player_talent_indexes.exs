defmodule AbaModel.Repo.Migrations.AddPlayerTalentIndexes do
  use Ecto.Migration

  def change do
    create index(:player_talent, [:level])
    create index(:player_talent, [:player_id])
  end
end
