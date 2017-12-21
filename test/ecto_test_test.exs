defmodule EctoTestTest do
  use ExUnit.Case

  alias EctoTest.Repo
  alias EctoTest.Company
  alias EctoTest.Department
  alias EctoTest.Employee

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Repo)
    Ecto.Adapters.SQL.Sandbox.mode(Repo, {:shared, self()})

    company = Repo.insert!(%Company{name: "Acme Co"})
    department = Repo.insert!(%Department{name: "billing", company_id: company.id})
    Repo.insert!(%Employee{name: "Bob", department_id: department.id})

    {:ok, department: department}
  end

  test "success", %{department: %Department{id: id}} do
    Task.async(fn ->
      department = Repo.get(Department, id) |> Repo.preload([company: [], employees: []])
      IO.inspect department
    end)
      |> Task.await
  end

  test "fail", %{department: department} do
    Task.async(fn ->
      department = Repo.preload(department, [company: [], employees: []])
      IO.inspect department
    end)
      |> Task.await
  end

end
