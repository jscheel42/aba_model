defmodule AbaModel.Replay do
  use Ecto.Schema

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
end