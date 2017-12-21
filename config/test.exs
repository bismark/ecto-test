use Mix.Config

config :ecto_test, EctoTest.Repo,
  pool: Ecto.Adapters.SQL.Sandbox

