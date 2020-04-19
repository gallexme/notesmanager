defmodule Manage.Repo.Migrations.CreateEntries do
  use Ecto.Migration

  def change do
    create table(:entries, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :note, :string
      add :date, :naive_datetime
      add :tags, {:array, :string}

      timestamps()
    end

  end
end
