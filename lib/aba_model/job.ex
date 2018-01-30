defmodule AbaModel.Job do
  use Ecto.Schema
  import Ecto.Changeset
  
  @params_cast [:attempts, :available_at, :created_at, :queue, :payload, :reserved_at]
  @params_req [:attempts, :available_at, :created_at, :queue, :payload]

  schema "jobs" do
    field :attempts, :integer
    field :available_at, :integer
    field :created_at, :integer
    field :queue, :string
    field :payload, :string
    field :reserved_at, :integer
  end

  def changeset(map, params \\ %{}) do
    map
    |> cast(params, @params_cast)
    |> validate_required(@params_req)
  end
end