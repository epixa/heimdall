defmodule Heimdall.AuthPassword do
  use Heimdall.Web, :model

  alias Comeonin.Bcrypt

  schema "auth_password" do
    field :pass_hash, :string
    field :raw_password, :string, virtual: true
    belongs_to :user, Heimdall.User

    timestamps
  end

  # If we make user_id required, we cannot create user and password in the same
  # changeset. To ensure
  @required_fields ~w(raw_password)
  @optional_fields ~w(pass_hash)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> validate_length(:raw_password, min: 7)
    |> hash_password(:raw_password)
    |> assoc_constraint(:user)
  end

  def hash_password(changeset, password_field) do
    password = get_change(changeset, password_field)
    case password do
      nil -> changeset
      _ -> put_change(changeset, :pass_hash, Bcrypt.hashpwsalt(password))
    end
  end
end
