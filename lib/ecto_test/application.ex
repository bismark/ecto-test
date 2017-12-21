defmodule EctoTest.Application do
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      EctoTest.Repo
    ]

    opts = [strategy: :one_for_one, name: EctoTest.Supervisor]
    Supervisor.start_link(children, opts)
  end
end

