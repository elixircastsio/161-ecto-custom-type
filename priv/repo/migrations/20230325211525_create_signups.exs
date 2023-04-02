defmodule Teacher.Repo.Migrations.CreateSignups do
  use Ecto.Migration

  def change do
    create table(:signups) do
      add :email, :string

      timestamps()
    end
  end
end
