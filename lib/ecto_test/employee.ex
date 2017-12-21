defmodule EctoTest.Employee do

  use Ecto.Schema

  schema "employees" do
    field :name
    belongs_to :department, EctoTest.Department
  end

end

