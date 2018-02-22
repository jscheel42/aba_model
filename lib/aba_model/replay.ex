defmodule AbaModel.Replay do
  use Ecto.Schema
  import Ecto.Changeset
  
  @params_cast [:filename, :fingerprint, :fingerprint_old, :game_type, :game_date, :game_length, :game_version, :processed, :region, :size]
  @params_req [:filename, :fingerprint, :processed, :size]

  schema "replays" do
    # field :api_replay_id, :integer # this is 'id' in the model at https://hotsapi.net/docs but we want to have this + default id field
    # field :api_status_code, :integer
    field :filename, :string
    field :fingerprint, :string
    field :fingerprint_old, :string
    field :game_type, PlayersGameTypeEnum
    field :game_date, :utc_datetime
    field :game_length, :integer
    field :game_version, :string
    field :processed, :integer, default: 0
    field :region, :integer
    field :size, :integer
    # field :url, :string

    timestamps(type: :utc_datetime, inserted_at: :created_at)

    belongs_to :game_map, AbaModel.Map, foreign_key: :game_map_id

    has_many :bans, AbaModel.Ban
    has_many :hotslogs_uploads, AbaModel.HotslogsUpload, on_delete: :delete_all
    has_many :players, AbaModel.Player, on_delete: :delete_all

    # many_to_many :players, AbaModel.Player, join_through: "players_replays", on_delete: :delete_all
  end

  def changeset(map, params \\ %{}) do
    map
    |> cast(params, @params_cast)
    |> validate_required(@params_req)
  end
end