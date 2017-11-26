defmodule AbaModel.Replay do
  use Ecto.Schema
  import Ecto.Changeset
  
  @params_cast [:api_id, :filename, :fingerprint, :game_type, :game_date, :game_length, :game_map, :game_version, :region, :size, :url]
  @params_req [:api_id, :filename, :fingerprint, :game_type, :game_date, :game_length, :game_map, :game_version, :region, :size, :url]

  schema "replays" do
    field :api_id, :integer # this is 'id' in the model at https://hotsapi.net/docs but we want to have this + default id field
    field :filename, :string
    field :fingerprint, :string
    field :game_type, :string
    field :game_date, :string
    field :game_length, :integer
    field :game_map, :string
    field :game_version, :string
    field :region, :integer
    field :size, :integer
    field :url, :string

    many_to_many :players, AbaModel.Player, join_through: "players_replays"
    many_to_many :bans, AbaModel.Hero, join_through: "bans_replays"
  end

  def changeset(map, params \\ %{}) do
    map
    |> cast(params, @params_cast)
    |> validate_required(@params_req)
  end
end