defmodule Teacher.Newsletter.Signup do
  use Ecto.Schema
  import Ecto.Changeset

  schema "signups" do
    field :email, :string

    timestamps()
  end

  @doc false
  def changeset(signup, attrs) do
    signup
    |> cast(attrs, [:email])
    |> validate_required([:email])
  end
end
