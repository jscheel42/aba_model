defmodule AbaModel.HotslogsUpload do
  use Ecto.Schema
  import Ecto.Changeset
  
  @params_cast [:file, :result, :success]
  @params_req [:file]

  schema "hotslogs_uploads" do
    # field :created_at, :time
    field :result, :string 
    field :status, :string 
    # field :updated_at, :time

    timestamps(type: :utc_datetime, inserted_at: :created_at)

    belongs_to :replay, AbaModel.Replay
  end

  def changeset(map, params \\ %{}) do
    map
    |> cast(params, @params_cast)
    |> validate_required(@params_req)
  end
end