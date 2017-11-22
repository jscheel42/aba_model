defmodule AbaModel.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    # import Supervisor.Spec # Suggested at https://hexdocs.pm/ecto/getting-started.html ?
    # List all child processes to be supervised
    children = [
      AbaModel.Repo
      # Starts a worker by calling: AbaModel.Worker.start_link(arg)
      # {AbaModel.Worker, arg},
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: AbaModel.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
