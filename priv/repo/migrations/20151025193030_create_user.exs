defmodule Heimdall.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:user) do
      add :email, :string, null: false
      add :email_verified, :boolean, default: false

      timestamps
    end
    create unique_index(:user, [:email])

  end
end
