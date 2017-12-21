defmodule EctoTest.Repo.Migrations.Setup do
  use Ecto.Migration

  def change do
    create table("companies") do
      add :name, :string
    end

    create table("departments") do
      add :name, :string
      add :company_id, references(:companies)
    end

    create table("employees") do
      add :name, :string
      add :department_id, references(:departments)
    end

  end
end
