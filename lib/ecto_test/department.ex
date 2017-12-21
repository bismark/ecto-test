defmodule EctoTest.Department do

  use Ecto.Schema

  schema "departments" do
    field :name
    has_many :employees, EctoTest.Employee
    belongs_to :company, EctoTest.Company
  end

end
