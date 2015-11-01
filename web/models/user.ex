defmodule Heimdall.User do
  use Heimdall.Web, :model

  schema "user" do
    field :email, :string
    field :email_verified, :boolean, default: false

    has_one :password, Heimdall.AuthPassword, on_delete: :delete_all

    timestamps
  end

  @required_fields ~w(email password)
  @optional_fields ~w(email_verified)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> unique_constraint(:email)
  end
end
