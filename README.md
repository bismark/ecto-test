# EctoTest

Example project showing a bug with `Ecto.Adapters.SQL.Sandbox` when using
`:shared` mode.

If a child process's first interaction with the repo is a preload with
multiple associations, it will raise an OwnershipError.
