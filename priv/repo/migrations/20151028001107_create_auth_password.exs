defmodule Heimdall.Repo.Migrations.CreateAuthPassword do
  use Ecto.Migration

  def change do
    create table(:auth_password) do
      add :pass_hash, :string, null: false
      add :user_id, references(:user, on_delete: :delete_all), null: false

      timestamps
    end
    create unique_index(:auth_password, [:user_id])

  end
end
