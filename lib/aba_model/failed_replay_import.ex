defmodule AbaModel.FailedReplayImport do
  use Ecto.Schema
  import Ecto.Changeset
  
  @params_cast [:message, :replay_id]
  @params_req [:replay_id]

  schema "failed_replay_imports" do
    field :message, :string
    field :replay_id, :integer

    timestamps(type: :utc_datetime, inserted_at: :created_at)
  end

  def changeset(map, params \\ %{}) do
    map
    |> cast(params, @params_cast)
    |> validate_required(@params_req)
  end
end