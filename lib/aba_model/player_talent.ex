defmodule AbaModel.PlayerTalent do
  use Ecto.Schema
  import Ecto.Changeset
  
  @params_cast [:level]
  @params_req [:level]

  # @primary_key false
  # @primary_key {:player_talent_primary, :binary_id, autogenerate: true}

  schema "player_talent" do
    field :level, :integer

    belongs_to :player, AbaModel.Player
    belongs_to :talent, AbaModel.Talent
  end

  def changeset(map, params \\ %{}) do
    map
    |> cast(params, @params_cast)
    |> validate_required(@params_req)
  end
end