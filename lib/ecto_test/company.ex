defmodule EctoTest.Company do

  use Ecto.Schema

  schema "companies" do
    field :name
    has_many :departments, EctoTest.Department
  end

end
