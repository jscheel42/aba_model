defmodule AbaModel.HotsData do
  use Ecto.Schema
  import Ecto.Changeset
  
  @params_cast [:file, :result, :success]
  @params_req [:file]

  schema "hotsdata" do
    field :file, :string
    field :result, :string 
    field :success, :integer 
  end

  def changeset(map, params \\ %{}) do
    map
    |> cast(params, @params_cast)
    |> validate_required(@params_req)
  end
end