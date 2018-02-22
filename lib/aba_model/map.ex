defmodule AbaModel.Map do
  use Ecto.Schema
  import Ecto.Changeset

  @params_cast [:name]
  @params_req [:name]

  schema "maps" do
    field :name, :string

    has_many :translations, AbaModel.MapTranslation, on_delete: :delete_all
    has_many :replays, AbaModel.Replay, foreign_key: :game_map_id
  end

  def changeset(map, params \\ %{}) do
    map
    |> cast(params, @params_cast)
    |> validate_required(@params_req)
  end
end