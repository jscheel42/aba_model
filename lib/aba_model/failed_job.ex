defmodule AbaModel.FailedJob do
  use Ecto.Schema
  import Ecto.Changeset
  
  @params_cast [:connection, :exception, :failed_at, :queue, :payload]
  @params_req [:connection, :exception, :failed_at, :queue, :payload]

  schema "failed_jobs" do
    field :connection, :string
    field :exception, :string
    field :failed_at, :time
    field :queue, :string
    field :payload, :string
  end

  def changeset(map, params \\ %{}) do
    map
    |> cast(params, @params_cast)
    |> validate_required(@params_req)
  end
end